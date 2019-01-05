task_monsters = {
   [1] = {name = "ogres", mons_list = {"ogre brute", "ogre savage"},  storage = 70001, amount = 4000, exp = 23250000000, pointsTask = {15, 15}, items = {{id = 9971, count = 5}, {id = 12411, count = 1}}},
   [2] = {name = "crystal golem", mons_list = {"crystal golem", "Crystal Golem"}, storage = 70002, amount = 5500, exp = 11212500000, pointsTask = {12, 12}, items = {{id = 9971, count = 5}, {id = 12637, count = 1}}},
   [3] = {name = "raging mage", mons_list = {"raging mage", "Raging Mage"}, storage = 70003, amount = 3500, exp = 8675000000, pointsTask = {8, 8}, items = {{id = 9971, count = 5}, {id = 12670, count = 1}}},
   [4] = {name = "metal gargoyle", mons_list = {"metal gargoyle", "Metal Gargoyle"}, storage = 70004, amount = 4000, exp = 6675000000, pointsTask = {7, 7}, items = {{id = 9971, count = 5}, {id = 12670, count = 1}}},
   [5] = {name = "lost", mons_list = {"lost husher", "lost basher"}, storage = 70010, amount = 4000, exp = 6675000000, pointsTask = {5, 5}, items = {{id = 9971, count = 2}}},
   [6] = {name = "kongra", mons_list = {"kongra", "kongra"}, storage = 70011, amount = 4000, exp = 6675000000, pointsTask = {3, 3}, items = {{id = 9971, count = 1}}},
   [7] = {name = "moohtant", mons_list = {"moohtant", "mooh'tah warrior"}, storage = 70012, amount = 4500, exp = 46500000000, pointsTask = {20, 20}, items = {{id = 9971, count = 7}, {id = 23806, count = 1}}},
}

task_daily = {
   [1] = {name = "draptor", mons_list = {"draptor", "draptor"}, storage = 70005, amount = 150, exp = 30000000, pointsTask = {1, 1}, items = {{id = 10518, count = 1}, {id = 2159, count = 20}}},
   [2] = {name = "kongra", mons_list = {"kongra", "kongra"}, storage = 70006, amount = 200, exp = 80000000, pointsTask = {2, 2}, items = {{id = 10521, count = 1}, {id = 2159, count = 40}}},
   [3] = {name = "lizard chosen", mons_list = {"lizard chosen", "lizard chosen"}, storage = 70007, amount = 250, exp = 153750000, pointsTask = {3, 3}, items = {{id = 10522, count = 1}, {id = 2159, count = 80}}},
   [4] = {name = "crystal golem", mons_list = {"crystal golem", "crystal golem"}, storage = 70008, amount = 300, exp = 373750000, pointsTask = {4, 4}, items = {{id = 9971, count = 1}, {id = 2159, count = 20}}},
   [5] = {name = "ogres", mons_list = {"ogre brute", "ogre savage"}, storage = 70009, amount = 400, exp = 775000000, pointsTask = {5, 5}, items = {{id = 9971, count = 1}, {id = 2159, count = 50}}}
}

task_storage = 35020 -- storage que verifica se está fazendo alguma task e ver qual task é - task normal
task_points = 35021 -- storage que retorna a quantidade de pontos task que o player tem.
task_sto_time = 35022 -- storage de delay para não poder fazer a task novamente caso ela for abandonada.
task_time = 12 -- tempo em horas em que o player ficará sem fazer a task como punição
task_rank = 35023 -- storage do rank task
taskd_storage = 35024 -- storage que verifica se está fazendo alguma task e ver qual task é - task daily
time_daySto = 35025 -- storage do tempo da task daily, no caso para verificar e add 24 horas para fazer novamente a task daily

local ranks_task = {
[{1, 20}] = "Newbie", 
[{21, 50}] = "Elite",
[{51, 100}] = "Master",
[{101, 200}] = "Destroyer",		
[{201, math.huge}] = "Juggernaut"
}

local RankSequence = {
["Newbie"] = 1,
["Elite"] = 2,
["Master"] = 3,
["Destroyer"] = 4,
["Juggernaut"] = 5,
}

function rankIsEqualOrHigher(myRank, RankCheck)
	local ret_1 = RankSequence[myRank]
	local ret_2 = RankSequence[RankCheck]
	return ret_1 >= ret_2
end

function getTaskInfos(player)
	local player = Player(player)
	return task_monsters[player:getStorageValue(task_storage)] or false
end

function getTaskDailyInfo(player)
	local player = Player(player)
	return task_daily[player:getStorageValue(taskd_storage)] or false
end


function taskPoints_get(player)
	local player = Player(player)
	if player:getStorageValue(task_points) == -1 then
		return 0 
	end
	return player:getStorageValue(task_points)
end

function taskPoints_add(player, count)
	local player = Player(player)
	return player:setStorageValue(task_points, taskPoints_get(player) + count)
end

function taskPoints_remove(player, count)
	local player = Player(player)
	return player:setStorageValue(task_points, taskPoints_get(player) - count)
end

function taskRank_get(player)
	local player = Player(player)
	if player:getStorageValue(task_rank) == -1 then
		return 1 
	end
	return player:getStorageValue(task_rank)
end

function taskRank_add(player, count)
	local player = Player(player)
	return player:setStorageValue(task_rank, taskRank_get(player) + count)
end

function getRankTask(player)
	local pontos = taskRank_get(player)
	local ret
	for _, z in pairs(ranks_task) do
		if pontos >= _[1] and pontos <= _[2] then
			ret = z
		end
	end
	return ret
end

function getItemsFromTable(itemtable)
     local text = ""
     for v = 1, #itemtable do
         count, info = itemtable[v].count, ItemType(itemtable[v].id)
         local ret = ", "
         if v == 1 then
             ret = ""
         elseif v == #itemtable then
             ret = " - "
         end
         text = text .. ret
         text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
     end
     return text
end