local config = {
     ['rat'] = {amount = 250, storage = 21900, startstorage = 45551, startvalue = 2},
     ['rotworm'] = {amount = 500, storage = 21901, startstorage = 45551, startvalue = 2},
     ['dragon lord'] = {amount = 25, storage = 21902, startstorage = 45551, startvalue = 4}
}
function onKill(player, target)
     local monster = config[target:getName():lower()]
     if target:isPlayer() or not monster or target:getMaster() then
         return true
     end
     local stor = player:getStorageValue(monster.storage)+1
     if stor < monster.amount and player:getStorageValue(monster.startstorage) >= monster.startvalue then
         player:setStorageValue(monster.storage, stor)
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[Crafting Task]: '..(stor +1)..' of '..monster.amount..' '..target:getName()..'s killed.')
     end
     if (stor +1) == monster.amount then
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations, you have killed '..(stor +1)..' '..target:getName()..'s and completed the '..target:getName()..'s mission.')
         player:setStorageValue(monster.storage, stor +1)
     end
     return true
end