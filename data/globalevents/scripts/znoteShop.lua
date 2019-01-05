function onThink(interval, lastExecution)
    local players = Game.getPlayers()
    if #players == 0 then -- 0 players online, no need to execute the script
        return true
    end
 
    local player
    for i = 1, #players do
        player = players[i]
        local orderQuery = db.storeQuery('SELECT `id`, `type`, `itemid`, `count` FROM `znote_shop_orders` WHERE `account_id` = '.. player:getAccountId() ..' LIMIT 1;')
        if orderQuery then --Lets check if the players online have orderd something from the shop
            local orderId = result.getDataInt(orderQuery, 'id')
            local orderType = result.getDataInt(orderQuery, 'type')
            local orderItemId = result.getDataInt(orderQuery, 'itemid')
            local orderCount = result.getDataInt(orderQuery, 'count')
            result.free(orderQuery)
 
            if orderType == 1 then
                if player:addItemEx(Game.createItem(orderItemId, orderCount or 1)) ~= RETURNVALUE_NOERROR or
                    player:getFreeCapacity() < ItemType(orderItemId):getWeight(orderCount or 1) then --Lets check if player have slot or cape left. Else send to player inbox
 
                    local parcel = player:getInbox():addItem(2596, 1, false, 1)
                    if not parcel then --If not being able to create parcel we stop the script and retry again.
                        print('[ERROR Znote Shop Globalevents] = Error on creating a parcel.')
                        return true
                    end
 
                    local letter = parcel:addItem(2598, 1, false, 1)
                    letter:setAttribute(ITEM_ATTRIBUTE_TEXT, 'You have received your shop item. Thanks for donating.')
                    parcel:addItem(orderItemId, orderCount or 1, false, 1)
                end
 
                db.query('DELETE FROM `znote_shop_orders` WHERE `id` = '.. orderId ..';')
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'Congratulations! You have received '.. orderCount ..'x '.. ItemType(orderItemId):getName() ..'!')
            end
            if orderType == 7 then
                if player:addItemEx(Game.createItem(orderItemId, orderCount or 1)) ~= RETURNVALUE_NOERROR or
                    player:getFreeCapacity() < ItemType(orderItemId):getWeight(orderCount or 1) then --Lets check if player have slot or cape left. Else send to player inbox
 
                    local parcel = player:getInbox():addItem(2596, 1, false, 1)
                    if not parcel then --If not being able to create parcel we stop the script and retry again.
                        print('[ERROR Znote Shop Globalevents] = Error on creating a parcel.')
                        return true
                    end
 
                    local letter = parcel:addItem(2598, 1, false, 1)
                    letter:setAttribute(ITEM_ATTRIBUTE_TEXT, 'You have received your shop item. Thanks for donating.')
                    parcel:addItem(orderItemId, orderCount or 1, false, 1)
                end
 
                db.query('DELETE FROM `znote_shop_orders` WHERE `id` = '.. orderId ..';')
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'Congratulations! You have received '.. orderCount ..'x '.. ItemType(orderItemId):getName() ..'!')
            end
        end
    end
    return true
end