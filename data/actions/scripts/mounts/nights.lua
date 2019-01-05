function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 23806 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 85)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Nightstinger Mount!")
						        item:remove(1)
        end
        return TRUE
end
