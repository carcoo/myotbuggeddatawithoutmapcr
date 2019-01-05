function onThink(interval, lastExecution)
    local MESSAGE = {
	"Welcome to the greatest RPG High Exp Server!",
	"Visit now our website and know everything new: http://carcooizx.zapto.org",
	"PLEASE READ AND COMMENT AND TELL ALL YOUR FRIENDS THE LINK IF YOU HAVE ANY PROBLEM JUST GO THERE: carcooizx.zapto.org/forum",
	"Anti-Bot system have been fixed you don't have to close the channel anymore keep it openned and you will recieve the question normally.",
	"IF YOU GOT STUCKED YOU CAN GO TO MANAGE ACCOUNT ON WEBSITE AND TELEPORT YOUR SELF TO TEMPLE",
	"If you want to donate by paypal just go to this link : http://carcooizx.zapto.org/buypoints.php",
    }
    Game.broadcastMessage(MESSAGE[math.random(1, #MESSAGE)], 22) 
    return true
end