    function onLogin(cid)
	local msg = getPlayerMessages(getCreatureName(cid))
    if table.maxn(msg) > 0 then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have " .. table.maxn(msg) .. " new message(s) say !read to read them.")
    end
	return true
	end