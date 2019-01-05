dofile('data/firestorm_event.lua')
function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GAMEMASTER then
		return false
	end

resetfsVariables()
if Game.getStorageValue(fsStartedGlobalStorage) < 1 then
  local teleport = doCreateItem(1387,1,fsCreateTeleportPosition)
  if teleport then
   doSetItemActionId(teleport, 5499)
  doSendMagicEffect(fsCreateTeleportPosition, CONST_ME_TELEPORT)
end
local r_tp = Tile(fsCreateTeleportPosition):getItemById(1387)
addEvent(function() r_tp:remove() getTileItemById(fsCreateTeleportPosition, 1387) end, 60 * 1000)
addEvent(function() doSendMagicEffect(fsCreateTeleportPosition, CONST_ME_TELEPORT) end, 60 * 1000)
  end
  Game.setStorageValue(fsStartedGlobalStorage,1)
  print('firestorm Event has started & waiting for players to join! Min: '.. fsMinPlayers ..'/'.. fsMaxPlayers ..'.')
  Game.broadcastMessage('The firestorm Event has started! You have '.. fsWaitMinutes ..' minutes to join!', MESSAGE_EVENT_ADVANCE)
  addEvent(startfirestorm, fsWaitMinutes * 60 * 1000)
        return true
        end
 