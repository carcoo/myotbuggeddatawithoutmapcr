local config = {
    rate = 1.6, -- 4x More Experience
    time = 5, -- Hours of Exp Time
    storage = 20011
}
local function endExpRate(cid)
    if isPlayer(cid) == TRUE then
        doPlayerSetRate(cid, SKILL__LEVEL, 1) -- config.lua rate
        setPlayerStorageValue(cid, config.storage, -1)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Your extra experience time has ended.")
    end
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if(getPlayerStorageValue(cid, config.storage) < 0) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your extra experience rate is now: " .. config.rate .. ". It will last for ".. config.time .." hours.")
        doPlayerSetRate(cid, SKILL__LEVEL, config.rate)
        setPlayerStorageValue(cid, config.storage, os.time() + config.time * 3600)
        addEvent(endExpRate, config.time * 3600 * 1000, cid)
        doRemoveItem(item.uid, 1)
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You still have extra experience time left.")
    end
    return TRUE
end