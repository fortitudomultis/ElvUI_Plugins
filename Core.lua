local E, L, V, P, G = unpack(ElvUI) -- Import ElvUI Engine
local UF = E:GetModule('UnitFrames')

-- Define the Tag Logic
E.Tags.Methods['smarthealth'] = function(unit)
    if UnitIsDead(unit) then return L["DEAD"] end
    if UnitIsGhost(unit) then return L["GHOST"] end

    local cur = UnitHealth(unit)
    local max = UnitHealthMax(unit)

    if cur == max or max == 0 then
        return E:ShortValue(cur)
    else
        local percent = (cur / max) * 100
        return string.format("%.1f%%", percent)
    end
end

-- Define the Events that trigger an update
E.Tags.Events['smarthealth'] = "UNIT_HEALTH UNIT_MAXHEALTH UNIT_NAME_UPDATE"

print("|cff1784d1SmartHealth Tag|r loaded! Use |cff00ff00[smarthealth]|r in your ElvUI settings.")