 
function onSay(player, words, param)
   
    if not player:getGroup():getAccess() then
        return true
    end
 
    if player:getAccountType() < ACCOUNT_TYPE_GAMEMASTER then
        return false
    end
 
    if zombieArena:openEvent() then
        zombieArena:autoStart()
    end
 
    return true
end
 