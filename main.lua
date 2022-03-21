local inspect = require("inspect")
local WeakAura = require("WeakAura")
local IO = require("IO")

math.randomseed(os.time())

local function CreateWeakAuraMenu()
    io.write(
        "choose a type of weakaura to create:\n" ..
        "(1) cooldown only\n" ..
        "(2) aura only\n" ..
        "(3) cooldown and aura\n" ..
        "(4) totem cooldown and duration\n" ..
        "(5) cooldown and spell channel\n\n" ..
        "enter your choice: ")
    io.flush()
    local choice = tonumber(io.read())
    io.flush()
    if choice == 1 then
        io.write("enter the spell name: ")
        io.flush()
        local cooldownName = io.read()
        io.flush()
        io.write("\n" .. IO:TableToString(WeakAura:CooldownOnly(cooldownName)) .. "\n\n")
        io.flush()
    elseif choice == 2 then
        io.write("enter the aura name: ")
        io.flush()
        local auraName = io.read()
        io.flush()
        io.write("enter the target (\"player\" or \"group\"):\n")
        io.flush()
        local target = io.read()
        io.flush()
        io.write("enter the fallback icon id: ")
        io.flush()
        local fallbackIcon = tonumber(io.read())
        io.flush()
        io.write("\n" .. IO:TableToString(WeakAura:AuraOnly(auraName, target, fallbackIcon)) .. "\n\n")
        io.flush()
    elseif choice == 3 then
        io.write("enter the spell name: ")
        io.flush()
        local cooldownName = io.read()
        io.flush()
        io.write("enter the aura name (defaults to same): ")
        io.flush()
        local auraName = io.read()
        auraName = (auraName == nil or auraName == "") and cooldownName or auraName
        io.flush()
        io.write("\n" .. IO:TableToString(WeakAura:CooldownAndAura(cooldownName, auraName)) .. "\n\n")
        io.flush()
    elseif choice == 4 then
        io.write("enter the totem name: ")
        io.flush()
        local totemName = io.read()
        io.flush()
        io.write("\n" .. IO:TableToString(WeakAura:TotemCooldownAndDuration(totemName)) .. "\n\n")
        io.flush()
    elseif choice == 5 then
        io.write("enter the spell name: ")
        io.flush()
        local cooldownName = io.read()
        io.flush()
        io.write("\n" .. IO:TableToString(WeakAura:CooldownAndChannel(cooldownName)) .. "\n\n")
        io.flush()
    else
        io.write("invalid choice!\n\n")
        io.flush()
    end
end

local function DecodeStringMenu()
    io.write("enter a weakaura string to decode: ")
    io.flush()
    local wa = io.read()
    io.flush()
    io.write("\n" .. inspect(IO:StringToTable(wa)) .. "\n\n")
    io.flush()
end

local function MainMenu()
    io.write(
        "what would you like to do?\n" ..
        "(1) create a weakaura\n" ..
        "(2) decode a weakaura string\n" ..
        "(3) exit\n\n" ..
        "enter your choice: ")
    io.flush()
    local choice = tonumber(io.read())
    io.flush()
    if choice == 1 then
        CreateWeakAuraMenu()
    elseif choice == 2 then
        DecodeStringMenu()
    elseif choice == 3 then
        io.write("exiting...\n")
        io.flush()
        return 1
    else
        io.write("invalid choice!\n\n")
        io.flush()
    end
    return nil
end

local result = nil
while result == nil do
    result = MainMenu()
end