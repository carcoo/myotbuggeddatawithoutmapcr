local rareItems = {11259, 6527, 25427, 25521, 24777}
local WORLD_CHAT = 3  -- channel id here
 
local function scanRareItems(cid, pos)
    local player = Player(cid)
    local name = player:getName()
    local corpse = Tile(pos):getTopDownItem()
    if not corpse or not corpse:isContainer() then
        return
    end
	if ItemType(corpse:getId()):isContainer() then
    for i = corpse:getSize()-1, 0, -1 do
        local item = corpse:getItem(i)
        if isInArray(rareItems, item:getId()) then
            local count = item:getCount()
            local string = ("%s has looted %s %s!"):format(name, count > 1 and count or item:getArticle(), count > 1 and item:getPluralName() or item:getName())
            Game.broadcastMessage(string, MESSAGE_EVENT_ADVANCE)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ("you have looted %s %s!"):format(count > 1 and count or item:getArticle(), count > 1 and item:getPluralName() or item:getName()))
            player:sendChannelMessage(nil, string, TALKTYPE_CHANNEL_R1, WORLD_CHAT)
        end
    end
end
return true
end
 
function onKill(creature, target)
    if creature:isPlayer() and target:isMonster() then
        addEvent(scanRareItems, 0, creature:getId(), target:getPosition())
    end
    return true
end