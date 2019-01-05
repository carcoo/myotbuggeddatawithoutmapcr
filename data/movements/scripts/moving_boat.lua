function onStepOut(creature, item, position, fromPosition)
 
    if not creature:isPlayer() then return true end
    if creature:getCondition(CONDITION_INFIGHT) ~= nil then
        local function removeFight(cid)
            local player = Player(cid)
            if (not mbc.isOnBoat(cid)) and player:getStorageValue(mbc.storage) < 1 then
                player:removeCondition(CONDITION_INFIGHT)
            end
        end
        addEvent(removeFight, mbc.speed, creature:getId())
    end
    return true
end