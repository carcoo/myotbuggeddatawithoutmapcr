local myFile = "data/talkactions/player.xml"
 
local useAccess = true --true / false
 
function onSay(cid, words, param, channel)
    local commands, acc, myAcc, x = {}, {}, getPlayerAccess(cid), 0
    local text = "<--Commands-->"
    if (io.open(myFile, "r") ~= nil) then
        for line in io.lines(myFile) do
            if (line:match('<talkaction ')) then
                if useAccess then
                    local access = 0
                    if (line:find('access=".*".*')) then
                        a = string.match(line, 'access=".*".*')
                        access = string.sub(a, string.find(a, '="') + 2, string.find(a, '" ') - 1)
                    end
                    table.insert(acc, tonumber(access))
                end
                if (line:find('words=".*".*')) then
                    line = string.match(line, 'words=".*".*')
                    word = string.sub(line, string.find(line, '="') + 2, string.find(line, '" ') - 1)
                    table.insert(commands, word)
                end
            end
        end
        for _i, i in ipairs(commands) do
            if useAccess then
                if myAcc >= acc[_i] then
                    text = text .. "\n" .. "" .. x + 1 .. ".- ".. i ..""
                    x = x + 1
                end
            else
                text = text .. "\n" .. "" .. x + 1 .. ".- ".. i ..""
                x = x + 1
            end
        end
        if useAccess then text = text .. "\n\nYour Access = " .. myAcc .. "" end
        text = text .. "\n\n" .. "Total " .. x .. " Commands."
        doShowTextDialog(cid, 9932, text)
    else
        error("File: \"" .. myFile .. "\" not found, please check directory or file.")
    end
    return false
end