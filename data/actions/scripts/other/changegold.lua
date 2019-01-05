local ITEM_SCARAB_COIN = 2159
local ITEM_GOLD_INGOT = 9971
local ITEM_GOLD_BAR = 15515
local config = {
	[ITEM_GOLD_COIN] = {changeTo = ITEM_PLATINUM_COIN},
	[ITEM_PLATINUM_COIN] = {changeBack = ITEM_GOLD_COIN, changeTo = ITEM_CRYSTAL_COIN},
	[ITEM_CRYSTAL_COIN] = {changeBack = ITEM_PLATINUM_COIN, changeTo = ITEM_SCARAB_COIN},
	[ITEM_SCARAB_COIN] = {changeBack = ITEM_CRYSTAL_COIN, changeTo = ITEM_GOLD_INGOT},
	[ITEM_GOLD_INGOT] = {changeBack = ITEM_SCARAB_COIN, changeTo = ITEM_GOLD_BAR},
	[ITEM_GOLD_BAR] = {changeBack = ITEM_GOLD_INGOT}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local coin = config[item:getId()]
	if coin.changeTo and item.type == 100 then
		item:remove()
		player:addItem(coin.changeTo, 1)
	elseif coin.changeBack then
		item:remove(1)
		player:addItem(coin.changeBack, 100)
	else
		return false
	end
	return true
end
