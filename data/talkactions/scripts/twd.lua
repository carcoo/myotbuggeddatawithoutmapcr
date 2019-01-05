function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GAMEMASTER then
		return false
	end
	
  local teleport = doCreateItem(1387,1,Position(1428, 1008, 7))
  if teleport then
   doSetItemActionId(teleport, 5666)
  doSendMagicEffect(Position(1428, 1008, 7), CONST_ME_TELEPORT)
end
  
local r_tp = Tile(Position(1428, 1008, 7)):getItemById(1387)
addEvent(function() r_tp:remove() getTileItemById(Position(1428, 1008, 7), 1387) end, 300 * 1000)
addEvent(function() doSendMagicEffect(Position(1428, 1008, 7), CONST_ME_TELEPORT) end, 300 * 1000)
  Game.broadcastMessage('The Tower of defense Event has started! You have 5 minutes to join!', MESSAGE_EVENT_ADVANCE)
    return true
     end