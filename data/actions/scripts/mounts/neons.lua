function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 12410 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 99)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Neon Sparkid Mount!")
						        item:remove(1)
        end
        return TRUE
end
