function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if (getPlayerVocation(player) == 4 or getPlayerVocation(player) == 8) then
	doPlayerSendCancel(player, "You are not allowed to use manaShield")
	return true
	end
	local storage = 86283 -- Make sure to select non-used storage. This is used to prevent SQL load attacks.
	local cooldown = 3 -- in seconds.

	if player:getStorageValue(storage) <= os.time() then
		player:setStorageValue(storage, os.time() + cooldown)
 
    if (getPlayerSlotItem(player, CONST_SLOT_RING).itemid ~= item.itemid) then
        return player:sendCancelMessage("You must wear the ring")
    end
	
            if(player:getCondition(CONDITION_MANASHIELD)) then
                player:removeCondition(CONDITION_MANASHIELD)
        player:say("OFF!", TALKTYPE_MONSTER_SAY)
    else
	local mana = Condition(CONDITION_MANASHIELD)
    mana:setParameter(CONDITION_PARAM_TICKS, 86400000)
	   player:addCondition(mana)
        player:say("ON!", TALKTYPE_MONSTER_SAY)
    end
		else
		player:sendCancelMessage("Can only be executed once every " .. cooldown .. " seconds. Remaining cooldown: " .. player:getStorageValue(storage) - os.time())
     end   
    return true
end