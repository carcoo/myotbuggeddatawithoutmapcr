function onSay(player, words, param)
	local storage = 54073 -- Make sure to select non-used storage. This is used to prevent SQL load attacks.
	local cooldown = 5 -- in seconds.

	if player:getStorageValue(storage) <= os.time() then
		player:setStorageValue(storage, os.time() + cooldown)
    if words == "!deposit" then
        t = string.split(param, ",")
       
        amount = t[1]
        if amount ~= "all" then
       
        amount = tonumber(t[1])
       
        if amount > 0 then
            if player:removeMoney(amount) then
            local old_balance = getPlayerBalance(player)
                doPlayerSetBalance(player, getPlayerBalance(player) + amount)
                doPlayerPopupFYI(player, "[old balance]: "..old_balance.."\n[new balance]: "..getPlayerBalance(player))
            else
                player:sendCancelMessage("You do not have this much gold.")
            return false
            end
        end
        else
            player_gold = player:getMoney()
           
            if player_gold > 0 then
            local old_balance = getPlayerBalance(player)
                player:removeMoney(player_gold)
                doPlayerSetBalance(player, player_gold + old_balance)
                doPlayerPopupFYI(player, "[old balance]: "..old_balance.."\n[new balance]: "..getPlayerBalance(player))
            else
                player:sendCancelMessage("You do not have any gold to deposit.")
            return false
            end
        end
       
    elseif words == "!withdraw" then
   
        t = string.split(param, ",")
       
        amount = tonumber(t[1])
        if amount <= 0 then
            player:sendCancelMessage("You must type a number value to withdraw.")
        return false
        end
       
        if amount > 500000000000 then
            player:sendCancelMessage("You cannot withdraw more then 100 Billion gold.")
        return false
        end
       
        if getPlayerBalance(player) < amount then
            player:sendCancelMessage("You do not have this much gold!")
        return false
        end
       
       
        if doPlayerSetBalance(player, getPlayerBalance(player) - amount) then
            player:addMoney(amount)
            doPlayerPopupFYI(player, "[balance]: "..getPlayerBalance(player))
        end
       
    elseif words == "!balance" then
        doPlayerPopupFYI(player, "[balance]: "..getPlayerBalance(player))
       
    elseif words == "!transfer" then
   
        t = string.split(param, ",")
       
        target = Player(t[1])
        amount = tonumber(t[2])
       
        if not t[1] or not t[2] then
            player:sendCancelMessage("Type: !transfer player, amount")
        return false
        end
       
        if not target then
            player:sendCancelMessage("Player must be online.")
        return false
        end
       
        if target:getName() == player:getName() then
            player:sendCancelMessage("You cannot tranfer gold to yourself.")
        return false
        end
       
        if amount <= 0 then
            player:sendCancelMessage("You must transfer 1 or more gold.")
        return false
        end
       
        if getPlayerBalance(player) < amount then
            player:sendCancelMessage("You do not have this much gold.")
        return false
        end
       
        doPlayerSetBalance(player, getPlayerBalance(player) - amount)
        doPlayerSetBalance(target, getPlayerBalance(target) + amount)
        doPlayerPopupFYI(player, "You have added gold to his balance.")
       
    end
		else
		player:sendCancelMessage("Can only be executed once every " .. cooldown .. " seconds. Remaining cooldown: " .. player:getStorageValue(storage) - os.time())
     end   
    return false
end