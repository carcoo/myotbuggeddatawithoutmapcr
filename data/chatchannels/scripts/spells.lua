local CHANNEL_CHARACTER = 4
local tier =
    {
        [0] = "[ Apprentice ]",
        [1] = "[ Journeyman ]",
        [2] = "[ Adept ]",
        [3] = "[ Expert ]",
        [4] = "[ Master ]",
        [5] = "[ Grandmaster ]"
    }
 
local function listSpells(player)
    local count = getPlayerInstantSpellCount(player)
    local text = ""
    local t = {}
    for i = 0, count - 1 do
        local spell = getPlayerInstantSpellInfo(player, i)
        if spell.level ~= 0 then
            if spell.manapercent > 0 then
                spell.mana = spell.manapercent .. "%"
            end
            t[#t+1] = spell
        end
    end
    table.sort(t, function(a, b) return a.level < b.level end)
    local prevLevel = -1
    for i, spell in ipairs(t) do
        local line = ""
        if prevLevel ~= spell.level then
            if i ~= 1 then
                line = "\n"
            end
            line = line .. "\nSpells for Level " .. spell.level .. "\n"
            prevLevel = spell.level
            player:sendChannelMessage(cid, line, TALKTYPE_CHANNEL_O, CHANNEL_CHARACTER)
        end
        if player:getStorageValue(SPELL_WORDS[spell.words]) > 0 then
            local index = player:getStorageValue(SPELL_WORDS[spell.words])
            text =  "  " .. spell.words .. " " .. tier[index] .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
        else
            text = "  " .. spell.words .. " " .. tier[0] .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
        end
        player:sendChannelMessage(cid, text, TALKTYPE_CHANNEL_Y, CHANNEL_CHARACTER)
    end
 
end
 
function onJoin(player)
    addEvent(listSpells, 100, player)
    return true
end
 
function onSpeak(player, type, message)
    player:sendCancelMessage("You may not speak in this chat.")
    return false
end