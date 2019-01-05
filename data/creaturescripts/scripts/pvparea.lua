function onPrepareDeath(player, killer)
local tile = Tile(player:getPosition()):hasFlag(TILESTATE_PVPZONE)
    if tile then
        player:teleportTo(player:getTown():getTemplePosition())
        player:addHealth(player:getMaxHealth() - 200)
		end
    return false
end