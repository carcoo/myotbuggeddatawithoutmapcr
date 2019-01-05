local config = {
		[1] = {
				--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
				items = {{2190, 1}, {2195, 1}, {2488, 1}, {2487, 1}, {2491, 1}, {2519, 1}},
				--container rope, shovel, mana potion
				container = {{2120, 1}, {2554, 1}, {2160, 20}, {2159, 10}, {2276, 1}, {2273, 1}},
		},
		[2] = {
				--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
				items = {{2182, 1}, {2195, 1}, {2488, 1}, {2487, 1}, {2491, 1}, {2519, 1}, {2276, 1}, {2273, 1}},
				--container rope, shovel, mana potion
				container = {{2120, 1}, {2160, 20}, {2554, 1}, {2276, 1}, {2273, 1}, {2159, 10}},
		},
		[3] = {
				--equipment dwrven shield, 5 spear, ranger's cloak, ranger legs scarf, legion helmet
				items = {{2389, 1}, {2195, 1}, {2488, 1}, {2487, 1}, {2491, 1}, {2519, 1}},
				--container rope, shovel, health potion, bow, 50 arrow
				container = {{2120, 1}, {2554, 1}, {2160, 20}, {2276, 1}, {2273, 1}, {2159, 10}},
		},
		[4] = {
				--equipment dwarven shield, steel axe, brass armor, brass helmet, brass legs scarf
				items = {{8601, 1}, {2195, 1}, {2488, 1}, {2487, 1}, {2491, 1}, {2519, 1}},
				--container jagged sword, daramian mace, rope, shovel, health potion
				container = {{8602, 1}, {2439, 1}, {2160, 20}, {2276, 1}, {2273, 1}, {2159, 10}}
		}
}

function onLogin(cid)
	local player = Player(cid)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end
