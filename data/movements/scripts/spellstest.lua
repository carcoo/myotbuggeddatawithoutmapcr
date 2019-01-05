function onStepIn(cid, item, position, fromPosition)
    local player = Player(cid)
    if not player then
        return true
    end
 
    local spellms = 'Extreme Vis'
    local spellrp = 'Extreme San'
    local spellek = 'Extreme Annihilation'
    local spelled = 'Extreme Frigo'
    if player:hasLearnedSpell(spellms) then
        player:say('You already learned this spell! Dont you?', TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(3)
        return true
    elseif player:hasLearnedSpell(spellrp) then
        player:say('You already learned this spell! Dont you?!', TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(3)
        return true
     elseif player:hasLearnedSpell(spellek) then
        player:say('You already learned this spell! Dont you?!', TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(3)
        return true
    elseif player:hasLearnedSpell(spelled) then
        player:say('You already learned this spell! Dont you?!', TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(3)
        return true       
    end
    if (getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5) then
       player:learnSpell(spellms)
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have learned ' .. spellms .. ' Spell!')
       player:getPosition():sendMagicEffect(172)
    elseif (getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7) then
       player:learnSpell(spellrp)
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have learned ' .. spellrp .. ' Spell!')
       player:getPosition():sendMagicEffect(172)
    return true
    elseif (getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8) then
       player:learnSpell(spellek)
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have learned ' .. spellek .. ' Spell!')
       player:getPosition():sendMagicEffect(172)
    return true
    elseif (getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6) then
       player:learnSpell(spelled)
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have learned ' .. spelled .. ' Spell!')
       player:getPosition():sendMagicEffect(172)
    return true    
end
end
 
