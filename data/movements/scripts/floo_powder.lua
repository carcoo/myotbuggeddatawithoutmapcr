function onStepIn(player, item, position, fromPosition)
 
local index = nil
for i = 1, #floo_powder.teleport_spots do
    if floo_powder.teleport_spots[i].uid == item.uid then
        index = i
        break
    end
end
 
    if index == nil then
        print("Error::Cannot find the tile Unique ID in your config table.")
        return true
    end
   
    if player:getStorageValue(floo_powder.teleport_spots[index].storage) < 1 then
        player:setStorageValue(floo_powder.teleport_spots[index].storage, 1)
        player:say(floo_powder.unlockMsg..floo_powder.teleport_spots[index].name.."!", TALKTYPE_MONSTER_SAY)
    end
end
 