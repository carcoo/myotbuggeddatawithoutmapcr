local fight = createConditionObject(CONDITION_INFIGHT)
setConditionParam(fight, CONDITION_PARAM_TICKS, -1)
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getCondition(CONDITION_INFIGHT) ~= nil then
        return player:sendCancelMessage("You can't travel while in combat.")
    else
        player:addCondition(fight)
    end
    player:teleportTo(toPosition)
    return true
end