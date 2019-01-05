function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 12411 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 73)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Black Stag Mount!")
						        item:remove(1)
        end
        return TRUE
end
