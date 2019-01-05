function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 21452 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 50)
                doPlayerAddMount(cid, 71)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Glooth Glider Mount!")
						        item:remove(1)
        end
        return TRUE
end