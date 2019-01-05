function onThink(Interval)

        local players = Game.getPlayers()
        if #players == 0 then
            return true
        end
		
        for _, player in pairs(players) do
            if not player:getIsLoot() then
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            player:setStorageValue(i, 0)
			end
        end
end
return true
end