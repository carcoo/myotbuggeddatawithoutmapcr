local t = {
	54232	, {
	[12120025] = {2159, 100, "Congratulations, you have achieved one of four goals! You have been awarded with 100 Golden Nuggets!", 1},
	[12120085] = {9971, 100, "Congratulations, you have achieved two of four goals! You have been awarded with 100 Golden Ingots!", 2},
	[12100229] = {5785, 1, "Congratulations, you have achieved three of four goals! You have been awarded with a V.I.P Medal!", 3},
	[30000000] = {12610, 1, "Congratulations, you have achieved all four goals! You have been awarded with Millionary Sword!", 4}
	}
}
function onAdvance(player, skill, oldlevel, newlevel)
		for level, v in pairs(t[2]) do
			if oldlevel < level and player:getLevel() >= level and player:getStorageValue(t[1]) < v[4] then
				player:addItem(v[1], v[2])
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, v[3])
				player:setStorageValue(t[1], v[4])
			end
		end
	player:save(true) 
	return true
end
