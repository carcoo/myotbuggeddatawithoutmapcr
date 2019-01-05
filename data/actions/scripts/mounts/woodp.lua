function onUse(cid, item, fromPosition, itemEx, toPosition)

        if item.itemid == 20127 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 54)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Woodland Prince Mount!")
						        item:remove(1)
        end
        return TRUE
end
