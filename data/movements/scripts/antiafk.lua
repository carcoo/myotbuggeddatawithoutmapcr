local config = {
    storage = 99999, -- storage
    timeToRemoveMin = 180, -- minutes min
    timeToRemoveMax = 190, -- minutes max
    timeToResolve = 15, -- seconds
}
 
local event = 0
local event2 = 0
 
function onStepIn(creature, item, frompos, item2, topos)
    timeToRemove = math.random(config.timeToRemoveMin, config.timeToRemoveMax)
   
    doPlayerPopupFYI(creature, "[AFK Trainer]:\n\nYou now have ".. timeToRemove .." minutes to train without disturbance.\n\nYou are noted that botting is illegal.")
       
    setPlayerStorageValue(creature, config.storage, 1)
    event = addEvent(_doTeleportThing, timeToRemove * 60 * 1000, creature:getId())
	end
 
function onStepOut(creature, item, frompos, item2, topos)
    if(getPlayerStorageValue(creature, config.storage) == 1) then
        doPlayerPopupFYI(creature, "Your training session has ended.")

       
        setPlayerStorageValue(creature, config.storage, -1)     
        stopEvent(event)
        stopEvent(event2)
    end
end
 
function _doTeleportThing(cid)
    if(getPlayerStorageValue(cid, config.storage) == 1) then
        doPlayerPopupFYI(cid, "[AFK Trainer]:\n\nStep off and on the tile to continue training.\nYou have ".. config.timeToResolve .." seconds to complete this request.")
        event2 = addEvent(expireTime, config.timeToResolve * 1000, cid)
		end
end
		
 
function expireTime(cid)
    local player = Player(cid)
    if not player then
        return
    end
    if(isPlayer(cid) == TRUE) then
        setPlayerStorageValue(cid, config.storage, -1)
        doRemoveCreature(cid)
    end
end