function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 12637 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 52)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Winter King Mount!")
						        item:remove(1)
        end
        return TRUE
end
