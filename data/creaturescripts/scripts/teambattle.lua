dofile("data/lib/teambattle.lua")

function onLogin(player)
	if player:getStorageValue(team_battle.stor_team) > -1 then
		player:setStorageValue(team_battle.stor_team, -1)
	end

	local v = team_battle.team_a[player:getName()]
	if v and (#v > 0) then
		player:addItem(v[1], v[2])
		player:openChannel(team_battle.channel)
        player:sendChannelMessage('', team_battle.msg_bonus:format(team_battle.reward[2],ItemType(team_battle.reward[1]):getName()), 14, team_battle.channel)
		team_battle.team_a[player:getName()] = nil
	end
	v = team_battle.team_b[player:getName()]
	if v and (#v > 0) then
		player:addItem(v[1], v[2])
		player:openChannel(team_battle.channel)
        player:sendChannelMessage('', team_battle.msg_bonus:format(team_battle.reward[2],ItemType(team_battle.reward[1]):getName()), 14, team_battle.channel)
		team_battle.team_b[player:getName()] = nil
	end
	return true
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not team_battle.isEnemy(creature, attacker) then
		return false
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

function onPrepareDeath(creature, killer)	
	local loseTeam = team_battle.getData(creature, 'team')
	if killer:isPlayer() ~= nil then
		local winTeam = (team_battle.getData(killer, 'team') == 1) and team_battle.team_a_frags or team_battle.team_b_frags
		killer:setTarget(0)
		setGlobalStorageValue(winTeam, getGlobalStorageValue(winTeam) + 1)
		team_battle.broadcast(team_battle.msg_kill:format(killer:getName(), creature:getName(), getGlobalStorageValue(team_battle.team_a_frags), getGlobalStorageValue(team_battle.team_b_frags)), 14)
		creature:sendChannelMessage('', team_battle.msg_defeat:format(killer:getName() .. ' just killed you'), 14, team_battle.channel)
	else
		creature:sendChannelMessage('', team_battle.msg_defeat:format('You just died'), 14, team_battle.channel)
	end
	team_battle.onEnd(creature)
	if #team_battle.getTeamPlayers(loseTeam) == 0 then
		team_battle.finish()
	end	
	return false
end