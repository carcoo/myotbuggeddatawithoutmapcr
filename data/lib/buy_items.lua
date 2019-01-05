function Player:sendShopWindow(potions)
    local function buttonCallback(button, choice)  
    -- Modal Window Functionallity
        -- Variables
        local count = 0
        local price = 0
        local potion = potions[choice.id]
     
        -- This checks to make sure the choice ID is true. If not return error
        if not potion then
            print("Something went wrong with choice id: " .. choice.id)
            return false
        end
       
    -- Button funcctionallity
        -- If the player selects buy 100 set count and price for 100 potions.
        if button.text == "Buy 1" then
            count = 1
            price = potion.price1
           
        -- If the player selects buy 10 set count and price for 100 potions.
        elseif button.text == "Buy 10" then
            count = 10
            price = potion.price10
			
		elseif button.text == "Details" then
        local item = potion.p
        local details = potion.note
		details = details.."\n- "

            self:showTextDialog(item, details)
            self:sendShopWindow(potions)
        else
       
        -- If the window returns something else or if somthing funny happens return error.
            print("Something went wrong with button: " .. button.text)
            return false
        end
     -- Player checks
        -- Check if player has enough money. If not return moneyMsg.
        if self:getMoney() < price then
            self:say(potions.moneyMsg, TALKTYPE_MONSTER_SAY)
            return false
        end
     
        -- Check if player has enough capacity If not return capacityMsg if true add item to player.
        local potionEx = Game.createItem(potion.itemID, count)
        if self:addItemEx(potionEx, false) ~= RETURNVALUE_NOERROR then
            self:getPosition():sendMagicEffect(CONST_ME_POFF)
            self:say(potions.capacityMsg, TALKTYPE_MONSTER_SAY)
            return true
        end
     
        -- If player passes checks remove money, send buyMsg and resend window.
        self:removeMoney(price)
        self:sendTextMessage(MESSAGE_EVENT_ADVANCE, potions.buyMsg .. count .. "x ".. potion.potion .."s")
        self:sendShopWindow(potions)
    end
	    local function buttonCallback1(button, choice)  
        local potion = potions[choice.id]
 		if button.text == "Details" then
        local item = potion.potion
        local details = potion.note
		details = details.."\n "

            self:showTextDialog(item, details)
            self:sendShopWindow(potions)
			end
		end
    -- Modal window design
    local window = ModalWindow {
        title = potions.titleMsg, -- Title of the modal window
        message = potions.mainMsg, -- The message to be displayed on the modal window
    }
   
    -- Add buttons to the window (Note: if you change the names of these you must change the functions in the modal window functionallity!)
    window:addButton("Buy 1", buttonCallback)
    window:addButton("Buy 10", buttonCallback)
    window:addButton("Cancel")
    window:addButton("Details", buttonCallback1)
   
    -- Set what button is pressed when the player presses enter or escape
    window:setDefaultEnterButton("Buy 1")
    window:setDefaultEscapeButton("Cancel")
   
    -- Add choices from the action script
    for i = 1, #potions do
        local o = potions[i].potion
        local choice = window:addChoice(o)
        choice.id = i
    end
   
    -- Send the window to player
    window:sendToPlayer(self)
end