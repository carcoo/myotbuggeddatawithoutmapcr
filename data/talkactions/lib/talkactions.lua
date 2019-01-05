local function getTableSize(t)
    local s = 0
    for k, v in pairs(t) do
        s = s + 1
    end
    return s
end
 
function getFileKeywords(file, keywords, requireAll)
    local ret = {}
    if not io.open(file) then
        print('[ERROR - getFileKeywords] File does not exist.')
        return false
    else
        io.close()
    end
    for line in io.lines(file) do
        local matched = {}
        for i = 1, #keywords do
            local keyword = keywords[i].keyword
            if line:find(keyword ..'="(.-)"') then
                matched[keywords[i].index] = line:match(keyword .. '="(.-)"')
            end
        end
        local sizeMatched = getTableSize(matched)
        if requireAll and (sizeMatched == #keywords) then
            table.insert(ret, matched)
        elseif not requireAll and sizeMatched > 0 then
            table.insert(ret, matched)
        end
    end
    return ret
end