function onJoin(player)
    if not player then
        return true
    end
 
    if not ANTI_BOT_SYSTEM.cache.players[player:getId()] or ANTI_BOT_SYSTEM.cache.players[player:getId()].verified == false then
        player:popupFYI('You can\'t open this channel.')
        return false
    end
 
    addEvent(function() player:sendChannelMessage("", string.format(ANTI_BOT_SYSTEM.messages.channel_enter.msg, ANTI_BOT_SYSTEM.config.timeToAnswer), ANTI_BOT_SYSTEM.messages.channel_enter.type, ANTI_BOT_SYSTEM.config.channelId) end, 300)
    addEvent(function()
            local random = math.random(#ANTI_BOT_SYSTEM.questions)
            player:sendChannelMessage("", ANTI_BOT_SYSTEM.questions[random].question, TALKTYPE_CHANNEL_R1, ANTI_BOT_SYSTEM.config.channelId)
            ANTI_BOT_SYSTEM.cache.question = random
        end, 2000)
    addEvent(vericationBot, ANTI_BOT_SYSTEM.config.timeToAnswer * 1000, player:getId())
    return true
end
 
function onLeave(player)
    if not player then
        return true
    end
 
    if ANTI_BOT_SYSTEM.cache.players[player:getId()] then
        player:openChannel(ANTI_BOT_SYSTEM.config.channelId)
        addEvent(function() player:sendChannelMessage("", ANTI_BOT_SYSTEM.messages.channel_close.msg, ANTI_BOT_SYSTEM.messages.channel_close.type, ANTI_BOT_SYSTEM.config.channelId) end, 300)
    end
end
function onSpeak(player, type, message)
    player:sendChannelMessage(player:getName(), message, TALKTYPE_CHANNEL_Y, ANTI_BOT_SYSTEM.config.channelId)
 
    if message ~= ANTI_BOT_SYSTEM.questions[ANTI_BOT_SYSTEM.cache.question].answer then
	   player:say('Incorrect Answer',TALKTYPE_MONSTER_SAY)
       addEvent(function() player:sendChannelMessage("", ANTI_BOT_SYSTEM.messages.wrong_answer.msg, ANTI_BOT_SYSTEM.messages.wrong_answer.type, ANTI_BOT_SYSTEM.config.channelId) end, 300)
    else
	    player:say('Correct Answer',TALKTYPE_MONSTER_SAY)
        addEvent(function() player:sendChannelMessage("", ANTI_BOT_SYSTEM.messages.correct_answer.msg, ANTI_BOT_SYSTEM.messages.correct_answer.type, ANTI_BOT_SYSTEM.config.channelId) end, 300)
        ANTI_BOT_SYSTEM.cache.players[player:getId()] = nil
        addEvent(function() player:closeChannel(ANTI_BOT_SYSTEM.config.channelId) end, 1000)
    end
    return false
end