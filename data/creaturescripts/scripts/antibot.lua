ANTI_BOT_SYSTEM = {
    config = {
        minMonstersToCheck = 250, -- O sistema irÃ¡ escolher aleatoriamente um nÃºmero de monstros entre esses dois valores para verificar.
        maxMonstersToCheck = 400,
        channelId = 11, -- Id do channel que serÃ¡ aberto para realizar a verificaÃ§Ã£o.
        timeToAnswer = 120, -- Quanto tempo em segundos o jogador tem para responder a verificaÃ§Ã£o.
        monstersForNotCheck = {'rat', 'bug', 'tiger'}, -- Monstros que nÃ£o serÃ£o verificados pelo sistema.
        notations = 5, -- Quantas notificaÃ§Ãµes o jogador pode receber antes de ser banido.
        banDays = 1, -- Quantidade de dias o personagem vai ficar banido por utilizar bot.
        storageForNotations = 13749, -- Storage onde ficarÃ¡ salvo as notations.
        storageForOpenChat = 13240, -- Storage que permitira o chat ser aberto. (Aconselho nÃ£o mudar).
    },
    questions = {
        [1] = {question = '5+2=?', answer = '7'},
        [2] = {question = '6+10=?', answer = '16'},
        [3] = {question = '10+2=?', answer = '12'},
        [4] = {question = '4+2=?', answer = '6'},
        [5] = {question = '7+10=?', answer = '17'},
        [6] = {question = '10+13=?', answer = '23'},
        [7] = {question = '9+2=?', answer = '11'},
        [8] = {question = '10+10=?', answer = '20'},
        [9] = {question = '1+1=?', answer = '2'},
        [10] = {question = '4+18=?', answer = '22'},
        [11] = {question = '6+6=?', answer = '12'},
        [12] = {question = '6+9=?', answer = '15'},
        [13] = {question = '7+1=?', answer = '8'},
        [14] = {question = '21+13=?', answer = '34'},
        [15] = {question = 'say antibot', answer = 'antibot'},
        [16] = {question = 'write 1234', answer = '1234'},
        [17] = {question = 'write 5342', answer = '5342'},
        [18] = {question = 'write 9531', answer = '9531'},
    },
    cache = {
        players = {
        },
        question = 0,
    },
    messages = {
        reason = {msg = 'Botting.'},
        notation = {msg = 'You have been penalized and received a notation. Remember that after receiving 5 notations you will be banned. You currently have %d notations.', type = MESSAGE_EVENT_ADVANCE},
        attention = {msg = '[Anti-Bot] Warning! you have only %d seconds to respond the the Anti-Bot check.', type = TALKTYPE_CHANNEL_O},
        channel_enter = {msg = '[Anti-Bot] You are on suspicion of using unauthorized applications.\nPlease confirm the following verification, you have %d seconds to do this.', type = TALKTYPE_CHANNEL_O},
        channel_close = {msg = '[Anti-Bot] For your safety, it is not possible to close this channel before checking. Please answer what you have been asked to do so that you will not be penalized.', type = TALKTYPE_CHANNEL_O},
        wrong_answer = {msg = '[Anti-Bot] Wrong answer, please try again.', type = TALKTYPE_CHANNEL_O},
        correct_answer = {msg = '[Anti-Bot] You answered correctly, thank you and have fun! You can close this channel.', type = TALKTYPE_CHANNEL_O},
        unconfirmed = {msg = 'You did not perform the Anti-Bot check correctly, so you have been penalized. This channel can be closed.', type = TALKTYPE_CHANNEL_O},
    }
}
 
function vericationBot(cid)
    local player = Player(cid)
    local timeNow = os.time()
    if not player then
        return true
    end
 
    if not ANTI_BOT_SYSTEM.cache.players[player:getId()] or ANTI_BOT_SYSTEM.cache.players[player:getId()].verified == false then
        return true
    else
        player:sendChannelMessage("", ANTI_BOT_SYSTEM.messages.unconfirmed.msg, ANTI_BOT_SYSTEM.messages.unconfirmed.type, ANTI_BOT_SYSTEM.config.channelId)
        ANTI_BOT_SYSTEM.cache.players[player:getId()] = nil
        if player:getStorageValue(ANTI_BOT_SYSTEM.config.storageForNotations) < ANTI_BOT_SYSTEM.config.notations then
            if player:getStorageValue(ANTI_BOT_SYSTEM.config.storageForNotations) ~= -1 then
                player:setStorageValue(ANTI_BOT_SYSTEM.config.storageForNotations, math.max(player:getStorageValue(ANTI_BOT_SYSTEM.config.storageForNotations) + 1))
            else
                player:setStorageValue(ANTI_BOT_SYSTEM.config.storageForNotations, 1)
            end
            player:teleportTo(player:getTown():getTemplePosition())
            player:sendTextMessage(ANTI_BOT_SYSTEM.messages.notation.type, string.format(ANTI_BOT_SYSTEM.messages.notation.msg, math.max(player:getStorageValue(ANTI_BOT_SYSTEM.config.storageForNotations))))
        else
            player:teleportTo(player:getTown():getTemplePosition())
            db.query("INSERT INTO `account_bans` (`account_id`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES (" ..getAccountNumberByPlayerName(player:getName())..", "..db.escapeString(ANTI_BOT_SYSTEM.messages.reason.msg)..", "..timeNow..", "..timeNow + (ANTI_BOT_SYSTEM.config.banDays * 86400) ..", 1)")
            player:remove()
        end
    end
    return true
end
 
function onKill(creature, target)
    -- local targetMonster = target:getMonster()
    local player = creature:getPlayer()
    local random = math.random(ANTI_BOT_SYSTEM.config.minMonstersToCheck, ANTI_BOT_SYSTEM.config.maxMonstersToCheck)
    if not target:isMonster() or isSummon(target) then
        return true
    end
    if isInArray(ANTI_BOT_SYSTEM.config.monstersForNotCheck, target:getName():lower()) then
        return true
    end
    if not ANTI_BOT_SYSTEM.cache.players[player:getId()] then
        ANTI_BOT_SYSTEM.cache.players[player:getId()] = {count = 1, verified = false}
    else
        if ANTI_BOT_SYSTEM.cache.players[player:getId()].count >= random then
            ANTI_BOT_SYSTEM.cache.players[player:getId()] = {count = math.max(ANTI_BOT_SYSTEM.cache.players[player:getId()].count), verified = true}
            player:openChannel(ANTI_BOT_SYSTEM.config.channelId)
            player:getPosition():sendMagicEffect(69)
			player:say('ANTI-BOT CHECKER!!', TALKTYPE_MONSTER_SAY)
        else
            ANTI_BOT_SYSTEM.cache.players[player:getId()] = {count = math.max(ANTI_BOT_SYSTEM.cache.players[player:getId()].count) + 1, verified = false}
        end
    end
 
    return true
end
