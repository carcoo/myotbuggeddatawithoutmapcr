dofile("data/lib/teambattle.lua")

function onSay(player, words, param)
	if words == '!teambattle start' then
		if not player:getGroup():getAccess() then
			return true
		end

		if player:getAccountType() < ACCOUNT_TYPE_GOD then
			return false
		end

		if getGlobalStorageValue(team_battle.status) > -1 then
			player:sendCancelMessage('Team Battle is already running.')
			return false
		else
			setGlobalStorageValue(team_battle.status, 0)
			for n = 0, team_battle.start_time-1 do
				addEvent(broadcastMessage, n*60*1000, team_battle.msg_call:format(team_battle.start_time-n .. ' minute' .. (team_battle.start_time-n > 1 and 's' or '')), MESSAGE_EVENT_ADVANCE)
			end
			addEvent(team_battle.start, team_battle.start_time*60*1000)
		end
    elseif words == '!teambattle' then
		if getGlobalStorageValue(team_battle.status) == 1 then
			player:sendCancelMessage('Team Battle has already started.')
			return false
		elseif getGlobalStorageValue(team_battle.status) == -1 then
			player:sendCancelMessage('Team Battle is not currently running.')
			return false
		else
			if not getTileInfo(player:getPosition()).protection then
				player:sendCancelMessage('You may only join the event while being on protection zone.')
				return false
			end
									
			if player:getPosition():isInRange(team_battle.wait_room.from, team_battle.wait_room.to) then
				player:sendCancelMessage('You are already in the Team Battle.')
				return false
			end
				
			if player:getLevel() < team_battle.player_level then
				player:sendCancelMessage('You need to be at least of level ' .. team_battle.player_level .. ' to join the Team Battle.')
				return false
			end
					
			if team_battle.ip_check and team_battle.hasDuplicateIP(player) then
				player:sendCancelMessage('You cannot join the Team Battle with someone else having your same IP.')
				return false
			end

            local count = 0
            for i, counted in ipairs(Game.getPlayers()) do
                if counted:getPosition():isInRange(team_battle.wait_room.from, team_battle.wait_room.to) then
                    count = count + 1
                end
            end

            if count >= team_battle.max_players then
                player:sendCancelMessage('The Team Battle Event is already full.')
                return false
            end

			player:openChannel(team_battle.channel)
			team_battle.teleport(player, team_battle.wait_room.from, team_battle.wait_room.to)
			team_battle.broadcast(team_battle.msg_join:format(player:getName()), 8)
		end
	elseif words == '!teambattle cancel' then
		if not player:getGroup():getAccess() then
			return true
		end

		if player:getAccountType() < ACCOUNT_TYPE_GOD then
			return false
		end
					
		if getGlobalStorageValue(team_battle.status) == -1 then
			player:sendCancelMessage('Team Battle is not currently running.')
			return false
		elseif getGlobalStorageValue(team_battle.status) == 0 then
			team_battle.cancel()
			return false
		else
			stopEvent(team_battle.event)
			setGlobalStorageValue(team_battle.status, -1)
			for _, player in ipairs(Game.getPlayers()) do
				if player:getPosition():isInRange(team_battle.wait_room.from, team_battle.wait_room.to) or
					player:getPosition():isInRange(team_battle.arena.from, team_battle.arena.to) then
					team_battle.unregister(player)
					team_battle.heal(player)
					player:removeCondition(CONDITION_OUTFIT)
					player:teleportTo(player:getTown():getTemplePosition())
				end
			end                
		end                
	end
	return false             
end