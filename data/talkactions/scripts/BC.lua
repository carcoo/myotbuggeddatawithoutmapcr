 
local MESSAGE_TYPES = {
   ["advance"] = MESSAGE_EVENT_ADVANCE,
   ["event"] = MESSAGE_EVENT_DEFAULT,
   ["white"] = MESSAGE_EVENT_DEFAULT,
   ["orange"] = MESSAGE_STATUS_CONSOLE_ORANGE,
   ["info"] = MESSAGE_INFO_DESCR,
   ["green"] = MESSAGE_INFO_DESCR,
   ["small"] = MESSAGE_STATUS_SMALL,
   ["blue"] = MESSAGE_STATUS_CONSOLE_BLUE,
   ["red"] = MESSAGE_STATUS_CONSOLE_RED,
   ["warning"] = MESSAGE_STATUS_WARNING,
   ["status"] = MESSAGE_STATUS_DEFAULT
}
 
function onSay(cid, words, param, channel)
     local p = Player(cid)
     if param == '' then
         return p:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
     end
 
     local t = string.explode(param, ",", 1)
     if t[2] and MESSAGE_TYPES[t[1]:lower()] then
         broadcastMessage(t[2], MESSAGE_TYPES[t[1]:lower()])
     else
         broadcastMessage(param)
     end
     return true
end