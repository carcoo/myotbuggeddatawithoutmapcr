function onSay(player, words, param)
  if player:getGroup():getAccess() then
    saveServer()
  Game.broadcastMessage('Server have been saved successfully', MESSAGE_STATUS_WARNING)
  end
return true
end