 
function onThink(interval, lastExecution)
 
    if zombieArena:openEvent() then
        zombieArena:autoStart()
    end
 
    return true
end
 
 