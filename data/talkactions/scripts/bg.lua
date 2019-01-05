	local minRequireGuildLevel = 3 -- 3 is leader
	local guildMessageType = MESSAGE_EVENT_ADVANCE
	local guildTitleMessage = '* Guild Broadcast *\n'

	function onSay(player, words, param)

	local guild = player:getGuild()
	if not guild then
		player:sendCancelMessage('Sorry, you no have guild.')
		return false
	end

	local guildLvl = player:getGuildLevel()
	if guildLvl < minRequireGuildLevel then
		player:sendCancelMessage('Sorry, you no have guild level required.')
		return false
	end

	local message = param or ''
	if message == '' then
		player:sendCancelMessage('Sorry, this message is empty.')
		return false
	end

	local members = guild:getMembersOnline()
	if #members > 0 then
		for _, member in pairs(members) do
			member:sendTextMessage(guildMessageType, guildTitleMessage .. player:getName()..' ['..player:getLevel()..']:\n' .. message)
		end
	end

	return false
	end