floo_powder = {
    tileID = 25262,
    unlockMsg = "You have unlocked ",
-- Window Configuration
    titleMsg = "Teleport System",
    mainMsg = "Select a location to be teleported too.\n\nYou are currently at:\n",
-- End Window Configuration
 
-- Teleport Spots
    teleport_spots = {
        [1] = {
            name = "Thais Depot", -- Name of the spot (What is shown in the window)
            storage = 10001, -- This storage tells the system what spots are unlocked
            uid = 2291, -- The unique ID of the teleport spot "This is more for your records really.. "
            direction = DIRECTION_SOUTH, -- This is the direction your player will face when he is teleported to another pad IT MUST BE CAPITALS!
            description = "The Thais Depot",
        },
     
        [2] = {
            name = "Harry Potter",
            storage = 10023,
            uid = 2311,
            direction = DIRECTION_SOUTH,
            description = "Shops!",
        },
    },
}
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    for j = 1, #floo_powder.teleport_spots do
        if floo_powder.teleport_spots[j].uid == items then
            target = floo_powder.teleport_spots[j].uid
         return true
        end
    end
local tile = Tile(item:getPosition())
local items = tile:getItems()
local spot = nil
    if items then
        for i = 1, #items do
            if items[i]:getId() == floo_powder.tileID then
                local spot = items[i]:getUniqueId()
                if player:isPlayer() then
                    player:sendFlooPowderWindow(spot, target)
                    return true
                else
                    player:say("Maybe I should get in the fireplace first..", TALKTYPE_MONSTER_SAY)
                end
            end
        end
    end
end