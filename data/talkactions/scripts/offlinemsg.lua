-- table.length(t, c[, l])
function table.length(t, c, l)
    local v = false
    if t and type(t) == "table" then
        if c then
            local n = table.maxn(t)
            -- return just the size
            if c == "size" then
                return n
            end
            -- return the original table
            if c == "table" then
                return t
            end
            -- comparisons
            -- less than
            if c == "<" then
                v = n < l
            -- less than or equal to
            elseif c == "<=" then
                v = n <= l
            -- greater than
            elseif c == ">" then
                v = n > l
            -- greater than or equal to
            elseif c == ">=" then
                v = n >= l
            -- equal to
            elseif c == "==" then
                v = n == l
            -- not equal
            elseif c == "~=" then
                v = n ~= l
            end
        end
    end
    return v
end
 
local maxMessageLenght = 1500
local deleteMessageAsRead = false
function onSay(cid, words, param, channel)
    local msg = getPlayerMessages(getCreatureName(cid))
    if words == "!msg" then
    if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Use: !msg [Your MSG] ; [NAME]")
        return FALSE
    end
        param = string.explode(param, ";")
        if table.length(param, "<", 2) then
            return doPlayerSendCancel(cid, "No player specified.")
        end
        if param[2]:lower() == getCreatureName(cid):lower() then
            return doPlayerSendCancel(cid, "You cannot send messages to yourself.")
        end
        if string.len(param[1]) > maxMessageLenght then
            return doPlayerSendCancel(cid, "Message is too long, only " .. maxMessageLenght .. " characters are admitted.")
        end
        if (playerExists(param[2])) and getPlayerMessagesLenght(param[2]) >= 10000 then
            return doPlayerSendCancel(cid, "You cannot send more messages to " .. param[2] .. " until he/she clean his/her inbox.")
        end
        if doPlayerAddMessage(param[2], param[1], cid) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Message successfully sended to " .. param[2] .. ".")
        else
            doPlayerSendCancel(cid, "Player with that name does not exists.")
        end
    elseif words == "!read" then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Reading " .. table.length(msg, "size") .. " message(s)" .. (not deleteMessageAsRead and getPlayerMessagesLenght(getCreatureName(cid)) >= 10000 and ", your inbox is full, you should delete messages or you won't receive more messages" or "") .. ".")
        if table.length(msg, ">", 0) then
            for i = 1, table.length(msg, "size") do
                local t = string.explode(msg[i], senderSep)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Message from " .. t[2] .. " at " .. (t[3] or "No Date") .. " > " .. t[1])
            end
        end
        if deleteMessageAsRead and table.length(msg, ">", 0) then
            if doPlayerRemoveMessages(getCreatureName(cid)) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The following message(s) have been deleted.")
            end
        end
    elseif words == "!delete" then
        local limit = (tonumber(param) and tonumber(param) > 0 and table.length(msg, "<=", tonumber(param)) and tonumber(param) or table.length(msg, "size"))
        if doPlayerRemoveMessages(getCreatureName(cid), limit) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have deleted " .. limit .. " message(s).")
        end
    end
    return false
end