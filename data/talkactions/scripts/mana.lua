local price_aol = 10000

function onSay(player, words, param)
	
	if player:getMoney() >= price_aol then
		player:removeMoney(price_aol)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		player:addItem(2276, 1)	
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You dont have enought money.")
	end
	
end