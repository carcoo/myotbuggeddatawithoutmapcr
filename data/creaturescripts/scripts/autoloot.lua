local function scanContainer(cid, position)
    local player = Player(cid)
    if not player then
        return
    end
    local corpse = Tile(position):getTopDownItem()
    if not corpse or not corpse:isContainer() then
        return
    end
	if player:getIsLoot() == false then
	return true
	end
    if corpse:getType():isCorpse() and corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == cid then
        for a = corpse:getSize() - 1, 0, -1 do
            local containerItem = corpse:getItem(a)
            if containerItem then
                for b = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
                    if player:getStorageValue(b) == containerItem:getId() then
                        containerItem:moveTo(player)
						player:sendChannelMessage(Player:getName(), "You have Auto-looted ".. containerItem:getCount() .."x ".. containerItem:getName() ..".", TALKTYPE_CHANNEL_O, 9)
                    end              
                end
                if isItemStackable(containerItem:getId()) then
                    if  containerItem:getId() == 2148 then
                        containerItem:remove()
                        doPlayerSetBalance(player, getPlayerBalance(player) + containerItem:getCount())
                    end
                    if containerItem:getId() == 2152 then
                        containerItem:remove()
                        doPlayerSetBalance(player, getPlayerBalance(player) + (containerItem:getCount() * 100))
                    end
                    if containerItem:getId() == 2160 then
                        containerItem:remove()
                        doPlayerSetBalance(player, getPlayerBalance(player) + (containerItem:getCount() * 10000))
                    end
                    if containerItem:getId() == 2159 then
                        containerItem:remove()
                        doPlayerSetBalance(player, getPlayerBalance(player) + (containerItem:getCount() * 1000000))
                    end
                    if containerItem:getId() == 9971 then
                        containerItem:remove()
                        doPlayerSetBalance(player:getName(), getPlayerBalance(player) + (containerItem:getCount() * 100000000))
                    end
                    if containerItem:getId() == 15515 then
                        containerItem:remove()
                        doPlayerSetBalance(player:getName(), getPlayerBalance(player) + (containerItem:getCount() * 10000000000))
                    end
                end
            end
        end
    end
end
 
function onKill(player, target)
    if not target:isMonster() then
        return true
    end
 
    addEvent(scanContainer, 100, player:getId(), target:getPosition())
    return true
end