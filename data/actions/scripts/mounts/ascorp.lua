function onUse(cid, item, fromPosition, itemEx, toPosition)

        if item.itemid == 6558 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 36)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved Armoured Scorpion Mount!")
						        item:remove(1)
        end
        return TRUE
end
