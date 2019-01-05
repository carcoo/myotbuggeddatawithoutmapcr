 
local cooldown = Condition(CONDITION_SPELLCOOLDOWN)
cooldown:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
cooldown:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_YELLOW_RINGS)
cooldown:setParameter(CONDITION_PARAM_TICKS, 5000)
 
function onSay(cid, words, param)
    local player = Player(cid)
    local spellid = tonumber(param)
    cooldown:setParameter(CONDITION_PARAM_SUBID, spellid)
    player:addCondition(cooldown)
    return false
end
 