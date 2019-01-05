function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 12670 then
            local pPos = getPlayerPosition(cid)
            doSendMagicEffect(pPos, 30)
                doPlayerAddMount(cid, 21)
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You Have Recieved King Scorpion Mount!")
						        item:remove(1)
        end
        return TRUE
end
