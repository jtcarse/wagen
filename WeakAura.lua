local WeakAura = {}

local bytetoB64 = {
    [0] = "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "(",
    ")"
}

local function GenerateUniqueID()
    -- generates a unique random 11 digit number in ba  se64
    local s = {}
    for i = 1, 11 do table.insert(s, bytetoB64[math.random(0, 63)]) end
    return table.concat(s)
end

function WeakAura:CooldownOnly(cooldownName)
    -- for spells that just have cooldowns
    if cooldownName == nil then
        print("arg `cooldownName` was nil")
        return
    end
    return {
        d = {
            actions = {finish = {}, init = {}, start = {}},
            alpha = 1,
            anchorFrameType = "SCREEN",
            anchorPoint = "CENTER",
            animation = {
                finish = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                main = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                start = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                }
            },
            authorOptions = {},
            color = {1, 1, 1, 1},
            conditions = {
                {
                    changes = {{property = "desaturate"}},
                    check = {trigger = 1, value = 0, variable = "onCooldown"}
                }
            },
            config = {},
            cooldown = true,
            cooldownEdge = true,
            cooldownSwipe = true,
            cooldownTextDisabled = false,
            desaturate = true,
            frameStrata = 1,
            height = 40,
            icon = true,
            iconSource = -1,
            id = tostring(cooldownName),
            information = {},
            internalVersion = 50,
            inverse = true,
            keepAspectRatio = false,
            load = {
                class = {multi = {}},
                size = {multi = {}},
                spec = {multi = {}},
                talent = {multi = {}}
            },
            regionType = "icon",
            selfPoint = "CENTER",
            subRegions = {
                {type = "subbackground"}, {
                    anchorXOffset = 0,
                    anchorYOffset = 0,
                    rotateText = "NONE",
                    text_anchorPoint = "INNER_BOTTOMRIGHT",
                    text_automaticWidth = "Auto",
                    text_color = {1, 1, 1, 1},
                    text_fixedWidth = 64,
                    text_font = "Friz Quadrata TT",
                    text_fontSize = 12,
                    text_fontType = "OUTLINE",
                    text_justify = "CENTER",
                    text_selfPoint = "AUTO",
                    text_shadowColor = {0, 0, 0, 1},
                    text_shadowXOffset = 0,
                    text_shadowYOffset = 0,
                    text_text = "%s",
                    text_text_format_s_format = "none",
                    text_visible = true,
                    text_wordWrap = "WordWrap",
                    type = "subtext"
                }, {
                    glow = false,
                    glowBorder = false,
                    glowColor = {1, 1, 1, 1},
                    glowFrequency = 0.25,
                    glowLength = 10,
                    glowLines = 8,
                    glowScale = 1,
                    glowThickness = 1,
                    glowType = "buttonOverlay",
                    glowXOffset = 0,
                    glowYOffset = 0,
                    type = "subglow",
                    useGlowColor = false
                }
            },
            tocversion = 90200,
            triggers = {
                {
                    trigger = {
                        debuffType = "HELPFUL",
                        event = "Cooldown Progress (Spell)",
                        genericShowOn = "showAlways",
                        names = {},
                        realSpellName = tostring(cooldownName),
                        spellIds = {},
                        spellName = tostring(cooldownName),
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        track = "auto",
                        type = "spell",
                        unit = "player",
                        use_exact_spellName = false,
                        use_genericShowOn = true,
                        use_spellName = true,
                        use_track = true
                    },
                    untrigger = {}
                },
                activeTriggerMode = -10
            },
            uid = GenerateUniqueID(),
            width = 40,
            xOffset = 0,
            yOffset = 0,
            zoom = 0
        },
        m = "d",
        s = "3.7.13",
        v = 1421
    }
end

function WeakAura:AuraOnly(auraName, target, fallbackIcon)
    -- for procs (e.g. clearcasting)
    if auraName == nil then
        print("arg `auraName` was nil")
        return
    end
    if not (target == "player" or target == "group") then
        print("arg `target` was not `player` or `group`")
        return
    end
    if fallbackIcon == nil then
        print("arg `fallbackIcon` was nil")
        return
    end
    return {
        d = {
            actions = {finish = {}, init = {}, start = {}},
            alpha = 1,
            anchorFrameType = "SCREEN",
            anchorPoint = "CENTER",
            animation = {
                finish = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                main = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                start = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                }
            },
            authorOptions = {},
            color = {1, 1, 1, 1},
            conditions = {
                {
                    changes = {
                        {property = "desaturate"},
                        {property = "sub.3.glow", value = true}
                    },
                    check = {trigger = 1, value = 1, variable = "buffed"}
                }
            },
            config = {},
            cooldown = true,
            cooldownEdge = true,
            cooldownSwipe = true,
            cooldownTextDisabled = true,
            desaturate = true,
            displayIcon = tonumber(fallbackIcon),
            frameStrata = 1,
            height = 40,
            icon = true,
            iconSource = 0,
            id = tostring(auraName),
            information = {},
            internalVersion = 50,
            inverse = false,
            keepAspectRatio = false,
            load = {
                class = {multi = {}},
                size = {multi = {}},
                spec = {multi = {}},
                talent = {multi = {}}
            },
            regionType = "icon",
            selfPoint = "CENTER",
            subRegions = {
                {type = "subbackground"}, {
                    anchorXOffset = 0,
                    anchorYOffset = 0,
                    rotateText = "NONE",
                    text_anchorPoint = "INNER_BOTTOMRIGHT",
                    text_automaticWidth = "Auto",
                    text_color = {1, 1, 1, 1},
                    text_fixedWidth = 64,
                    text_font = "Friz Quadrata TT",
                    text_fontSize = 12,
                    text_fontType = "OUTLINE",
                    text_justify = "CENTER",
                    text_selfPoint = "AUTO",
                    text_shadowColor = {0, 0, 0, 1},
                    text_shadowXOffset = 0,
                    text_shadowYOffset = 0,
                    text_text = "%s",
                    text_text_format_s_format = "none",
                    text_visible = true,
                    text_wordWrap = "WordWrap",
                    type = "subtext"
                }, {
                    glow = false,
                    glowBorder = false,
                    glowColor = {1, 1, 1, 1},
                    glowFrequency = 0.25,
                    glowLength = 10,
                    glowLines = 8,
                    glowScale = 1,
                    glowThickness = 2,
                    glowType = "buttonOverlay",
                    glowXOffset = 0,
                    glowYOffset = 0,
                    type = "subglow",
                    useGlowColor = false
                }
            },
            tocversion = 90200,
            triggers = {
                {
                    trigger = {
                        auranames = {tostring(auraName)},
                        debuffType = "HELPFUL",
                        event = "Health",
                        matchesShowOn = "showAlways",
                        names = {},
                        spellIds = {},
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        type = "aura2",
                        unit = tostring(target),
                        useName = true
                    },
                    untrigger = {}
                },
                activeTriggerMode = -10
            },
            uid = GenerateUniqueID(),
            width = 40,
            xOffset = 0,
            yOffset = 0,
            zoom = 0
        },
        m = "d",
        s = "3.7.13",
        v = 1421
    }
end

function WeakAura:CooldownAndAura(cooldownName, auraName)
    -- for spells that give you an aura
    if cooldownName == nil then
        print("arg `cooldownName` was nil")
        return
    end
    if auraName == nil then
        print("arg `auraName` was nil")
        return
    end
    return {
        d = {
            actions = {finish = {}, init = {}, start = {}},
            alpha = 1,
            anchorFrameType = "SCREEN",
            anchorPoint = "CENTER",
            animation = {
                finish = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                main = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                start = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                }
            },
            authorOptions = {},
            color = {1, 1, 1, 1},
            conditions = {
                {
                    changes = {
                        {property = "desaturate"},
                        {property = "sub.3.glow", value = true}
                    },
                    check = {trigger = 1, value = 1, variable = "show"}
                }, {
                    changes = {{property = "desaturate"}},
                    check = {trigger = 2, value = 0, variable = "onCooldown"}
                }
            },
            config = {},
            cooldown = true,
            cooldownEdge = true,
            cooldownSwipe = true,
            cooldownTextDisabled = false,
            desaturate = true,
            frameStrata = 1,
            height = 40,
            icon = true,
            iconSource = -1,
            id = tostring(cooldownName),
            information = {},
            internalVersion = 50,
            inverse = true,
            keepAspectRatio = false,
            load = {
                class = {multi = {}},
                size = {multi = {}},
                spec = {multi = {}},
                talent = {multi = {}}
            },
            regionType = "icon",
            selfPoint = "CENTER",
            subRegions = {
                {type = "subbackground"}, {
                    anchorXOffset = 0,
                    anchorYOffset = 0,
                    rotateText = "NONE",
                    text_anchorPoint = "INNER_BOTTOMRIGHT",
                    text_automaticWidth = "Auto",
                    text_color = {1, 1, 1, 1},
                    text_fixedWidth = 64,
                    text_font = "Friz Quadrata TT",
                    text_fontSize = 12,
                    text_fontType = "OUTLINE",
                    text_justify = "CENTER",
                    text_selfPoint = "AUTO",
                    text_shadowColor = {0, 0, 0, 1},
                    text_shadowXOffset = 0,
                    text_shadowYOffset = 0,
                    text_text = "%s",
                    text_text_format_s_format = "none",
                    text_visible = true,
                    text_wordWrap = "WordWrap",
                    type = "subtext"
                }, {
                    glow = false,
                    glowBorder = false,
                    glowColor = {1, 1, 1, 1},
                    glowFrequency = 0.25,
                    glowLength = 10,
                    glowLines = 8,
                    glowScale = 1,
                    glowThickness = 1,
                    glowType = "buttonOverlay",
                    glowXOffset = 0,
                    glowYOffset = 0,
                    type = "subglow",
                    useGlowColor = false
                }
            },
            tocversion = 90200,
            triggers = {
                {
                    trigger = {
                        auranames = {tostring(auraName)},
                        debuffType = "HELPFUL",
                        event = "Health",
                        matchesShowOn = "showOnActive",
                        names = {},
                        spellIds = {},
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        type = "aura2",
                        unit = "player",
                        useName = true
                    },
                    untrigger = {}
                },
                {
                    trigger = {
                        debuffType = "HELPFUL",
                        event = "Cooldown Progress (Spell)",
                        genericShowOn = "showAlways",
                        names = {},
                        realSpellName = tostring(cooldownName),
                        spellIds = {},
                        spellName = tostring(cooldownName),
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        type = "spell",
                        unit = "player",
                        use_exact_spellName = false,
                        use_genericShowOn = true,
                        use_spellName = true,
                        use_track = true
                    },
                    untrigger = {}
                },
                activeTriggerMode = -10,
                disjunctive = "any"
            },
            uid = GenerateUniqueID(),
            width = 40,
            xOffset = 0,
            yOffset = 0,
            zoom = 0
        },
        m = "d",
        s = "3.7.13",
        v = 1421
    }
end

function WeakAura:TotemCooldownAndDuration(totemName)
    -- for "totems" (e.g. cloudburst, efflorescence, probably demo summons)
    if totemName == nil then
        print("arg `totemName` was nil")
        return
    end
    return {
        d = {
            actions = {finish = {}, init = {}, start = {}},
            alpha = 1,
            anchorFrameType = "SCREEN",
            anchorPoint = "CENTER",
            animation = {
                finish = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                main = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                start = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                }
            },
            authorOptions = {},
            color = {1, 1, 1, 1},
            conditions = {
                {
                    changes = {{property = "desaturate"}},
                    check = {
                        checks = {
                            {
                                op = "==",
                                trigger = 1,
                                value = 0,
                                variable = "show"
                            }
                        },
                        trigger = 1,
                        value = 0,
                        variable = "show"
                    }
                }
            },
            config = {},
            cooldown = true,
            cooldownEdge = true,
            cooldownSwipe = true,
            cooldownTextDisabled = false,
            desaturate = true,
            frameStrata = 1,
            height = 40,
            icon = true,
            iconSource = -1,
            id = tostring(totemName),
            information = {},
            internalVersion = 50,
            inverse = false,
            keepAspectRatio = false,
            load = {
                class = {multi = {}},
                size = {multi = {}},
                spec = {multi = {}},
                talent = {multi = {}}
            },
            regionType = "icon",
            selfPoint = "CENTER",
            subRegions = {
                {type = "subbackground"}, {
                    anchorXOffset = 0,
                    anchorYOffset = 0,
                    rotateText = "NONE",
                    text_anchorPoint = "INNER_BOTTOMRIGHT",
                    text_automaticWidth = "Auto",
                    text_color = {1, 1, 1, 1},
                    text_fixedWidth = 64,
                    text_font = "Friz Quadrata TT",
                    text_fontSize = 12,
                    text_fontType = "OUTLINE",
                    text_justify = "CENTER",
                    text_selfPoint = "AUTO",
                    text_shadowColor = {0, 0, 0, 1},
                    text_shadowXOffset = 0,
                    text_shadowYOffset = 0,
                    text_text = "%s",
                    text_text_format_s_format = "none",
                    text_visible = true,
                    text_wordWrap = "WordWrap",
                    type = "subtext"
                }, {
                    glow = false,
                    glowBorder = false,
                    glowColor = {1, 1, 1, 1},
                    glowFrequency = 0.25,
                    glowLength = 10,
                    glowLines = 8,
                    glowScale = 1,
                    glowThickness = 1,
                    glowType = "buttonOverlay",
                    glowXOffset = 0,
                    glowYOffset = 0,
                    type = "subglow",
                    useGlowColor = false
                }
            },
            tocversion = 90200,
            triggers = {
                {
                    trigger = {
                        debuffType = "HELPFUL",
                        event = "Totem",
                        genericShowOn = "showOnCooldown",
                        names = {},
                        realSpellName = 0,
                        spellIds = {},
                        spellName = 0,
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        totemName = tostring(totemName),
                        type = "spell",
                        unit = "player",
                        use_genericShowOn = true,
                        use_spellName = true,
                        use_totemName = true,
                        use_track = true
                    },
                    untrigger = {}
                },
                {
                    trigger = {
                        debuffType = "HELPFUL",
                        event = "Cooldown Progress (Spell)",
                        genericShowOn = "showAlways",
                        realSpellName = tostring(totemName),
                        spellName = tostring(totemName),
                        type = "spell",
                        unit = "player",
                        use_exact_spellName = false,
                        use_genericShowOn = true,
                        use_spellName = true,
                        use_track = true
                    },
                    untrigger = {}
                },
                activeTriggerMode = -10,
                disjunctive = "any"
            },
            uid = GenerateUniqueID(),
            width = 40,
            xOffset = 0,
            yOffset = 0,
            zoom = 0
        },
        m = "d",
        s = "3.7.13",
        v = 1421
    }
end

function WeakAura:CooldownAndChannel(cooldownName)
    -- for spells that channel when cast
    if cooldownName == nil then
        print("arg `cooldownName` was nil")
        return
    end
    return {
        d = {
            actions = {finish = {}, init = {}, start = {}},
            alpha = 1,
            anchorFrameType = "SCREEN",
            anchorPoint = "CENTER",
            animation = {
                finish = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                main = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                },
                start = {
                    duration_type = "seconds",
                    easeStrength = 3,
                    easeType = "none",
                    type = "none"
                }
            },
            authorOptions = {},
            color = {1, 1, 1, 1},
            conditions = {
                {
                    changes = {
                        {property = "desaturate"},
                        {property = "sub.3.glow", value = true}
                    },
                    check = {trigger = 1, value = 1, variable = "show"}
                }, {
                    changes = {{property = "desaturate"}},
                    check = {
                        checks = {
                            {trigger = 2, value = 0, variable = "onCooldown"}
                        },
                        trigger = 2,
                        value = 0,
                        variable = "onCooldown"
                    }
                }
            },
            config = {},
            cooldown = true,
            cooldownEdge = true,
            cooldownSwipe = true,
            cooldownTextDisabled = false,
            desaturate = true,
            frameStrata = 1,
            height = 40,
            icon = true,
            iconSource = -1,
            id = tostring(cooldownName),
            information = {},
            internalVersion = 50,
            inverse = true,
            keepAspectRatio = false,
            load = {
                class = {multi = {}},
                size = {multi = {}},
                spec = {multi = {}},
                talent = {multi = {}}
            },
            regionType = "icon",
            selfPoint = "CENTER",
            subRegions = {
                {type = "subbackground"}, {
                    anchorXOffset = 0,
                    anchorYOffset = 0,
                    rotateText = "NONE",
                    text_anchorPoint = "INNER_BOTTOMRIGHT",
                    text_automaticWidth = "Auto",
                    text_color = {1, 1, 1, 1},
                    text_fixedWidth = 64,
                    text_font = "Friz Quadrata TT",
                    text_fontSize = 12,
                    text_fontType = "OUTLINE",
                    text_justify = "CENTER",
                    text_selfPoint = "AUTO",
                    text_shadowColor = {0, 0, 0, 1},
                    text_shadowXOffset = 0,
                    text_shadowYOffset = 0,
                    text_text = "%s",
                    text_text_format_s_format = "none",
                    text_visible = true,
                    text_wordWrap = "WordWrap",
                    type = "subtext"
                }, {
                    glow = false,
                    glowBorder = false,
                    glowColor = {1, 1, 1, 1},
                    glowFrequency = 0.25,
                    glowLength = 10,
                    glowLines = 8,
                    glowScale = 1,
                    glowThickness = 1,
                    glowType = "buttonOverlay",
                    glowXOffset = 0,
                    glowYOffset = 0,
                    type = "subglow",
                    useGlowColor = false
                }
            },
            tocversion = 90200,
            triggers = {
                {
                    trigger = {
                        debuffType = "HELPFUL",
                        event = "Cast",
                        genericShowOn = "showOnCooldown",
                        names = {},
                        realSpellName = tostring(cooldownName),
                        spellId = tostring(cooldownName),
                        spellIds = {},
                        spellName = tostring(cooldownName),
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        type = "unit",
                        unit = "player",
                        use_absorbHealMode = true,
                        use_absorbMode = true,
                        use_genericShowOn = true,
                        use_spellId = true,
                        use_spellName = true,
                        use_track = true,
                        use_unit = true
                    },
                    untrigger = {}
                },
                {
                    trigger = {
                        debuffType = "HELPFUL",
                        event = "Cooldown Progress (Spell)",
                        genericShowOn = "showAlways",
                        names = {},
                        realSpellName = tostring(cooldownName),
                        spellIds = {},
                        spellName = tostring(cooldownName),
                        subeventPrefix = "SPELL",
                        subeventSuffix = "_CAST_START",
                        type = "spell",
                        unit = "player",
                        use_exact_spellName = false,
                        use_genericShowOn = true,
                        use_spellName = true,
                        use_track = true
                    },
                    untrigger = {}
                },
                activeTriggerMode = -10,
                disjunctive = "any"
            },
            uid = GenerateUniqueID(),
            width = 40,
            xOffset = 0,
            yOffset = 0,
            zoom = 0
        },
        m = "d",
        s = "3.7.13",
        v = 1421
    }
end

return WeakAura
