local spells = {
	[6087] = "Mega Energy",
	[6088] = "Mega Swords",
	[6089] = "Mega Frigo",
	[6090] = "Mega San",
}
function onUse(cid, item, frompos, itemEx, topos)
	if(spells[item.itemid]) then
		if(not(PlayerLearnedInstantSpell(cid, spells[item.itemid]))) then
			PlayerCanLearnInstantSpell(cid, spells[item.itemid])
			doSendMagicEffect(getCreaturePosition(cid), 6)
			doPlayerSendTextMessage(cid, 20, "You have successfully learned " .. spells[item.itemid])
			doRemoveItem(cid, item.uid, 1)
		else
			doPlayerSendCancel(cid, "You already know this spell.")
			doSendMagicEffect(getPlayerPosition(cid), 34)
		end
	end
	return true
end