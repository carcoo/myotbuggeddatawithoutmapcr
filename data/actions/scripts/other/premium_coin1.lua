local function doPlayerAddPremiumPoints(cid, count)
        db.query('UPDATE znote_accounts SET points = points+'.. count ..' WHERE account_id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = 54078 -- Make sure to select non-used storage. This is used to prevent SQL load attacks.
	local cooldown = 15 -- in seconds.

	if getPlayerStorageValue(cid, storage) <= os.time() then
	   setPlayerStorageValue(cid, storage, os.time() + cooldown)
    doPlayerAddPremiumPoints(cid, 100)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have recived 100 premium points to your account.")
    doSendMagicEffect(getCreaturePosition(cid), 28)
    doRemoveItem(item.uid,1)
		else
		doPlayerSendCancel(cid, "Can only be executed once every " .. cooldown .. " seconds. Remaining cooldown: " .. getPlayerStorageValue(cid, storage) - os.time())
     end   
    return true
end
 