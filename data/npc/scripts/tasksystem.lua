local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function onPlayerCloseChannel(cid) npcHandler:onPlayerCloseChannel(cid) end

npcHandler:addModule(FocusModule:new())

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
local player = Player(cid)
local msg = msg:lower()
local currTimed = (player:getStorageValue(time_daySto) - os.time())
local currHoursd = math.floor(currTimed / 3600)
local currMinutesd = math.floor((currTimed - (3600 * currHoursd)) / 60)
local currTimen = (player:getStorageValue(task_sto_time) - os.time())
local currHoursn = math.floor(currTimen / 3600)
local currMinutesn = math.floor((currTimen - (3600 * currHoursn)) / 60)
------------------------------------------------------------------
if npcHandler.topic[cid] == 0 and msg == 'normal' then
	npcHandler:say("Great. Which monster task would you like to do ?", cid)
	npcHandler.topic[cid] = 1
elseif npcHandler.topic[cid] == 1 then
	if player:getStorageValue(task_sto_time) < os.time() then
		if player:getStorageValue(task_storage) == -1 then 
			for mon, l in ipairs(task_monsters) do
				if msg == l.name then
					npcHandler:say("Okay, you're now doing the {"..l.name:gsub("^%l", string.upper).."} task,  you need to kill "..l.amount.." of them. Good luck!", cid)
					player:setStorageValue(task_storage, mon)
					player:setStorageValue(l.storage, 0)
					npcHandler.topic[cid] = 0
					npcHandler:releaseFocus(cid)
					break
				elseif mon == #task_monsters then
					npcHandler:say("Sorry but we don't have this task.", cid)
					npcHandler.topic[cid] = 0
					npcHandler:releaseFocus(cid)
				end
			end
		else
			npcHandler:say("You're already doing a task. You can only do one at a time. Say {!task} to see information about your current task.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end
	else
		npcHandler:say("I'm not allowed to give you any task because you have abandoned the previous one. Wait for the {" .. currHoursn .. "} hours and {".. currMinutesn .."} minutes of punishment to end.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
elseif npcHandler.topic[cid] == 0 and msg == 'daily' then
	if player:getStorageValue(time_daySto) < os.time() then
		npcHandler:say("Remember, it is of great importance that the daily tasks are done. Now tell me, which monster task would you like to do? ", cid)
		npcHandler.topic[cid] = 2
	else
		npcHandler:say('You have done your daily task today, you must wait {' .. currHoursd .. '} hours and {'.. currMinutesd ..'} minutes to do it again.', cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
elseif npcHandler.topic[cid] == 2 then
	if player:getStorageValue(task_sto_time) < os.time() then
		if player:getStorageValue(taskd_storage) == -1 then 
			for mon, l in ipairs(task_daily) do 
				if msg == l.name then
					npcHandler:say("Very well, you're now doing the daily {"..l.name:gsub("^%l", string.upper).."} task, you need to kill "..l.amount.." of them. Good luck!", cid)
					player:setStorageValue(taskd_storage, mon)
					player:setStorageValue(l.storage, 0)
					npcHandler.topic[cid] = 0
					npcHandler:releaseFocus(cid)
					break
				elseif mon == #task_daily then
					npcHandler:say("Sorry we don't have this daily task.", cid)
					npcHandler.topic[cid] = 0
					npcHandler:releaseFocus(cid)
				end
			end
		else
			npcHandler:say("You're already doing a daily task. You can only do one per day. Say {!task} to see information about your current task.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end
	else
		npcHandler:say("I'm not allowed to give you any task because you have abandoned the previous one. Wait for the {" .. currHoursn .. "} hours and {".. currMinutesn .."} minutes of punishment to end.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
elseif msg == 'receive' then
	if npcHandler.topic[cid] == 0 then
		npcHandler:say("What kind of task did you finish, {normal} or {daily} ?", cid)
		npcHandler.topic[cid] = 3
	end
elseif npcHandler.topic[cid] == 3 then
	if msgcontains(msg, 'normal') then
	local ret_t = getTaskInfos(player)
		if ret_t then
			if player:getStorageValue(ret_t.storage) == ret_t.amount then
				local pt1 = ret_t.pointsTask[1]
				local pt2 = ret_t.pointsTask[2]
				local txt = 'Thanks for finishing the task, your awards are: '..(pt1 > 1 and pt1..' task points' or pt1 <= 1 and pt1..' task point')..' and '..(pt2 > 1 and pt2..' rank points' or pt2 <= 1 and pt2..' rank point')..', '
				if #getItemsFromTable(ret_t.items) > 0 then
					txt = txt..'in addition to winning: '..getItemsFromTable(ret_t.items)..', '
				for g = 1, #ret_t.items do
					player:addItem(ret_t.items[g].id, ret_t.items[g].count)
				end
				end

				local exp = ret_t.exp
					txt = txt..'I will also give you '..exp..' experience, '
					player:addExperience(exp)

				taskPoints_add(player, pt1)
				taskRank_add(player, pt2)
				player:setStorageValue(ret_t.storage, -1)
				player:setStorageValue(task_storage, -1)
				npcHandler:say(txt..'thanks again and see you again!', cid)
				npcHandler.topic[cid] = 0
				npcHandler:releaseFocus(cid)
			else
				npcHandler:say('You have not finished your current task yet. You will receive it when you finish.', cid)
				npcHandler.topic[cid] = 0
				npcHandler:releaseFocus(cid)
			end
		else
			npcHandler:say("You aren't doing any tasks.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 3 and msg == 'daily' then
		if player:getStorageValue(time_daySto)-os.time() <= 0 then
		local ret_td = getTaskDailyInfo(player)
			if ret_td then
				if getTaskDailyInfo(player) then
					if player:getStorageValue(getTaskDailyInfo(player).storage) == getTaskDailyInfo(player).amount then
					local pt1 = getTaskDailyInfo(player).pointsTask[1]
					local pt2 = getTaskDailyInfo(player).pointsTask[2]
					local txt = 'Thanks for finishing the task, your awards are: '..(pt1 > 1 and pt1..' task points' or pt1 <= 1 and pt1..' task point')..' e '..(pt2 > 1 and pt2..' rank points' or pt2 <= 1 and pt2..' rank point')..', '
						if #getTaskDailyInfo(player).items > 0 then
							txt = txt..'in addition to winning: '..getItemsFromTable(getTaskDailyInfo(player).items)..', '
						for g = 1, #getTaskDailyInfo(player).items do
							player:addItem(getTaskDailyInfo(player).items[g].id, getTaskDailyInfo(player).items[g].count)
						end
						end
						local exp = getTaskDailyInfo(player).exp
						if exp > 0 then
							txt = txt..'I will also give you '..exp..' experience, '
							player:addExperience(exp)
						end
						npcHandler:say(txt..' thanks again and see you again!', cid)
						taskPoints_add(player, pt1)
						taskRank_add(player, pt2)
						player:setStorageValue(getTaskDailyInfo(player).storage, -1)
						player:setStorageValue(taskd_storage, -1)
						player:setStorageValue(time_daySto, 1*60*60*24+os.time())
						npcHandler.topic[cid] = 0
						npcHandler:releaseFocus(cid)
					else
						npcHandler:say('You have not finished your current task yet. You will receive it when you finish.', cid)
						npcHandler.topic[cid] = 0
						npcHandler:releaseFocus(cid)
					end
				else
					npcHandler:say("You aren't doing any tasks.", cid)
					npcHandler.topic[cid] = 0
					npcHandler:releaseFocus(cid)
				end
			end
		else
			npcHandler:say("You've done a daily task, wait {" .. currHoursd .. "} hours and {".. currMinutesd .."} minutes to do another one again.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end
	end

elseif msg == 'abandon' then
	if npcHandler.topic[cid] == 0 then
		npcHandler:say("Aff, what kind of task do you want to quit, {normal} or {daily}?", cid)
		npcHandler.topic[cid] = 4
	end
elseif npcHandler.topic[cid] == 4 and msgcontains(msg, 'normal') then
	local ret_t = getTaskInfos(player)
	if ret_t then
		npcHandler:say('Unfortunate this situation, had faith that you would bring me this task done, but I was wrong. As punishment will be '.. task_time ..' hours without being able to do any task.', cid)
		player:setStorageValue(task_sto_time, os.time()+task_time*60*60)
		player:setStorageValue(ret_t.storage, -1)
		player:setStorageValue(task_storage, -1)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	else
		npcHandler:say("You're not doing any task to be able to abandon it.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
elseif npcHandler.topic[cid] == 4 and msg == 'daily' then
	local ret_td = getTaskDailyInfo(player)
	if ret_td then
		npcHandler:say('Unfortunate this situation, had faith that you would bring me this task done, but I was wrong. As punishment will be '.. task_time ..' hours without being able to do any task.', cid)
		player:setStorageValue(task_sto_time, os.time()+task_time*60*60)
		player:setStorageValue(ret_td.storage, -1)
		player:setStorageValue(taskd_storage, -1)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	else
		npcHandler:say("You're not doing any daily tasks to be able to abandon it.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
elseif msg == "normal task list" then
	local text = " Normal Tasks \n\n"
		for _, d in pairs(task_monsters) do
			text = text .." "..d.name.." \n Amount : ["..(player:getStorageValue(d.storage) + 1).."/"..d.amount.."]:\n Awards : "..(#d.items > 1 and getItemsFromTable(d.items).." - " or "")..""..d.exp.." experience \n\n"
		end

		player:popupFYI("" .. text)
		npcHandler:say("Here is the list of normal tasks.", cid)
elseif msg == "daily task list" then
	local text = " Tasks Dailys \n\n"
		for _, d in pairs(task_daily) do
			text = text .." "..d.name.."  Amount : ["..(player:getStorageValue(d.storage) + 1).."/"..d.amount.."]:\n Awards : "..(#d.items > 1 and getItemsFromTable(d.items).." - " or "")..""..d.exp.." experience \n\n"
		end

		player:popupFYI("" .. text)
		npcHandler:say("Here is the daily tasks list.", cid)
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)