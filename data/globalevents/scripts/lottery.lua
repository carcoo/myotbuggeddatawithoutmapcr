local config = {
    interval = "2 hours",
    rewards = {[2160] = 3, [2159] = 1, [24774] = 1},
    -- [itemid] = count; [2160] = 50 - it gives 50 crystal coins
    website = false
}
 
function onThink(interval)
    local players = {}
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() then
            table.insert(players, player)
        end
    end
 
    local c = #players
    if c <= 0 then
        return true
    end
 
    local winner  = players[math.random(#players)]
 
    local items = {}
    for itemid, count in pairs(config.rewards) do
        items[#items + 1] = itemid
    end
 
    local itemid = items[math.random(1, #items)]
    local amount = config.rewards[itemid]
    winner:addItem(itemid, amount)
 
    local it   = ItemType(itemid)
    local name = ""
    if amount == 1 then
        name = it:getArticle() .. " " .. it:getName()
    else
        name = amount .. " " .. it:getPluralName()
    end
 
    broadcastMessage("[LOTTERY SYSTEM] " .. winner:getName() .. " won " .. name .. "! Congratulations! (Next lottery in " .. config.interval .. ")")
 
    return true
end