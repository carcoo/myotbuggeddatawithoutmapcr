function onSay(player ,words, param)
    local data = {
        mana = {
            min = player:getMana(),
            max = player:getMaxMana()
        },
        health = {
            min = player:getHealth(),
            max = player:getMaxHealth()
        }
    }
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,  "Player Mana: ( " .. (data.mana.min).." / "..(data.mana.max).." )")
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,  "Player Health: ( " .. (data.health.min).." / "..(data.health.max).." )")

    return false
end