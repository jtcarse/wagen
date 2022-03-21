local IO = {}

local LibSerialize = require("LibSerialize")
local LibDeflate = require("LibDeflate")

local time = os.time

local configForDeflate = {level = 9}
local configForLS = {errorOnUnserializableType = false}
local compressedTablesCache = {}

local B64tobyte = {
    a = 0,
    b = 1,
    c = 2,
    d = 3,
    e = 4,
    f = 5,
    g = 6,
    h = 7,
    i = 8,
    j = 9,
    k = 10,
    l = 11,
    m = 12,
    n = 13,
    o = 14,
    p = 15,
    q = 16,
    r = 17,
    s = 18,
    t = 19,
    u = 20,
    v = 21,
    w = 22,
    x = 23,
    y = 24,
    z = 25,
    A = 26,
    B = 27,
    C = 28,
    D = 29,
    E = 30,
    F = 31,
    G = 32,
    H = 33,
    I = 34,
    J = 35,
    K = 36,
    L = 37,
    M = 38,
    N = 39,
    O = 40,
    P = 41,
    Q = 42,
    R = 43,
    S = 44,
    T = 45,
    U = 46,
    V = 47,
    W = 48,
    X = 49,
    Y = 50,
    Z = 51,
    ["0"] = 52,
    ["1"] = 53,
    ["2"] = 54,
    ["3"] = 55,
    ["4"] = 56,
    ["5"] = 57,
    ["6"] = 58,
    ["7"] = 59,
    ["8"] = 60,
    ["9"] = 61,
    ["("] = 62,
    [")"] = 63
}

local decodeB64Table = {}

function decodeB64(str)
  local bit8 = decodeB64Table;
  local decoded_size = 0;
  local ch;
  local i = 1;
  local bitfield_len = 0;
  local bitfield = 0;
  local l = #str;
  while true do
    if bitfield_len >= 8 then
      decoded_size = decoded_size + 1;
      bit8[decoded_size] = string_char(bit_band(bitfield, 255));
      bitfield = bit_rshift(bitfield, 8);
      bitfield_len = bitfield_len - 8;
    end
    ch = B64tobyte[str:sub(i, i)];
    bitfield = bitfield + bit_lshift(ch or 0, bitfield_len);
    bitfield_len = bitfield_len + 6;
    if i > l then
      break;
    end
    i = i + 1;
  end
  return table.concat(bit8, "", 1, decoded_size)
end

function IO:TableToString(inTable, forChat)
    -- stolen from WA
    local forChat = forChat or true
    local serialized = LibSerialize:SerializeEx(configForLS, inTable)
    local compressed
    -- get from / add to cache
    if compressedTablesCache[serialized] then
        compressed = compressedTablesCache[serialized].compressed
        compressedTablesCache[serialized].lastAccess = time()
    else
        compressed = LibDeflate:CompressDeflate(serialized, configForDeflate)
        compressedTablesCache[serialized] = {
            compressed = compressed,
            lastAccess = time()
        }
    end
    -- remove cache items after 5 minutes
    for k, v in pairs(compressedTablesCache) do
        if v.lastAccess < (time() - 300) then
            compressedTablesCache[k] = nil
        end
    end
    local encoded = "!WA:2!"
    if (forChat) then
        encoded = encoded .. LibDeflate:EncodeForPrint(compressed)
    else
        encoded = encoded .. LibDeflate:EncodeForWoWAddonChannel(compressed)
    end
    return encoded
end

function IO:StringToTable(inString, fromChat)
    -- stolen from WA
    local fromChat = fromChat or true
    -- encoding format:
    -- version 0: simple b64 string, compressed with LC and serialized with AS
    -- version 1: b64 string prepended with "!", compressed with LD and serialized with AS
    -- version 2+: b64 string prepended with !WA:N! (where N is encode version)
    --   compressed with LD and serialized with LS
    local _, _, encodeVersion, encoded = inString:find("^(!WA:%d+!)(.+)$")
    if encodeVersion then
        encodeVersion = tonumber(encodeVersion:match("%d+"))
    else
        encoded, encodeVersion = inString:gsub("^%!", "")
    end

    local decoded
    if (fromChat) then
        if encodeVersion > 0 then
            decoded = LibDeflate:DecodeForPrint(encoded)
        else
            decoded = decodeB64(encoded)
        end
    else
        decoded = LibDeflate:DecodeForWoWAddonChannel(encoded)
    end

    if not decoded then return "Error decoding." end

    local decompressed, errorMsg = nil, "unknown compression method"
    if encodeVersion > 0 then
        decompressed = LibDeflate:DecompressDeflate(decoded)
    else
        decompressed, errorMsg = Compresser:Decompress(decoded)
    end
    if not (decompressed) then return "Error decompressing: " .. errorMsg end

    local success, deserialized
    if encodeVersion < 2 then
        success, deserialized = Serializer:Deserialize(decompressed)
    else
        success, deserialized = LibSerialize:Deserialize(decompressed)
    end
    if not (success) then return "Error deserializing " .. deserialized end
    return deserialized
end

return IO