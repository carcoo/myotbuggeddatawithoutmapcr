function onSay(player, words, param)
    local itemType = ItemType(param)
 
    if itemType:getId() == 0 then
        itemType = ItemType(tonumber(param))
        if itemType:getName() == '' then
            player:sendCancelMessage("There is no item with that id or name.")
            return false
        end
    end
    if player:getAutoLootItem(itemType:getId()) then
        player:sendCancelMessage("You're already autolooting this item.")
        return false
    end
 
    player:addAutoLootItem(itemType:getId())
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You're now auto looting " .. itemType:getName())
    return false
end