dofile('data/lib/lib.lua')
dofile('data/lib/lib.lua')
dofile('data/lib/crafting.lua')
-- dofile('data/lib/floo_powder.lua')
dofile('data/sp.lua')
dofile('data/lib/quest_chests.lua')

STORAGEVALUE_PROMOTION = 30018

ropeSpots = {384, 418, 8278, 8592, 13189, 14435, 14436, 15635, 19518}

doors = {[1209] = 1211, [1210] = 1211, [1212] = 1214, [1213] = 1214, [1219] = 1220, [1221] = 1222, [1231] = 1233, [1232] = 1233, [1234] = 1236, [1235] = 1236, [1237] = 1238, [1239] = 1240, [1249] = 1251, [1250] = 1251, [1252] = 1254, [1253] = 1254, [1539] = 1540, [1541] = 1542, [3535] = 3537, [3536] = 3537, [3538] = 3539, [3544] = 3546, [3545] = 3546, [3547] = 3548, [4913] = 4915, [4914] = 4915, [4916] = 4918, [4917] = 4918, [5082] = 5083, [5084] = 5085, [5098] = 5100, [5099] = 5100, [5101] = 5102, [5107] = 5109, [5108] = 5109, [5110] = 5111, [5116] = 5118, [5117] = 5118, [5119] = 5120, [5125] = 5127, [5126] = 5127, [5128] = 5129, [5134] = 5136, [5135] = 5136, [5137] = 5139, [5138] = 5139, [5140] = 5142, [5141] = 5142, [5143] = 5145, [5144] = 5145, [5278] = 5280, [5279] = 5280, [5281] = 5283, [5282] = 5283, [5284] = 5285, [5286] = 5287, [5515] = 5516, [5517] = 5518, [5732] = 5734, [5733] = 5734, [5735] = 5737, [5736] = 5737, [6192] = 6194, [6193] = 6194, [6195] = 6197, [6196] = 6197, [6198] = 6199, [6200] = 6201, [6249] = 6251, [6250] = 6251, [6252] = 6254, [6253] = 6254, [6255] = 6256, [6257] = 6258, [6795] = 6796, [6797] = 6798, [6799] = 6800, [6801] = 6802, [6891] = 6893, [6892] = 6893, [6894] = 6895, [6900] = 6902, [6901] = 6902, [6903] = 6904, [7033] = 7035, [7034] = 7035, [7036] = 7037, [7042] = 7044, [7043] = 7044, [7045] = 7046, [7054] = 7055, [7056] = 7057, [8541] = 8543, [8542] = 8543, [8544] = 8546, [8545] = 8546, [8547] = 8548, [8549] = 8550, [9165] = 9167, [9166] = 9167, [9168] = 9170, [9169] = 9170, [9171] = 9172, [9173] = 9174, [9267] = 9269, [9268] = 9269, [9270] = 9272, [9271] = 9272, [9273] = 9274, [9275] = 9276, [10276] = 10277, [10274] = 10275, [10268] = 10270, [10269] = 10270, [10271] = 10273, [10272] = 10273, [10471] = 10472, [10480] = 10481, [10477] = 10479, [10478] = 10479, [10468] = 10470, [10469] = 10470, [10775] = 10777, [10776] = 10777, [12092] = 12094, [12093] = 12094, [12188] = 12190, [12189] = 12190, [19840] = 19842, [19841] = 19842, [19843] = 19844, [19980] = 19982, [19981] = 19982, [19983] = 19984, [20273] = 20275, [20274] = 20275, [20276] = 20277, [17235] = 17236, [18208] = 18209, [13022] = 13023, [10784] = 10786, [10785] = 10786, [12099] = 12101, [12100] = 12101, [12197] = 12199, [12198] = 12199, [19849] = 19851, [19850] = 19851, [19852] = 19853, [19989] = 19991, [19990] = 19991, [19992] = 19993, [20282] = 20284, [20283] = 20284, [20285] = 20286, [17237] = 17238, [13020] = 13021, [10780] = 10781, [12095] = 12096, [12195] = 12196, [19845] = 19846, [19985] = 19986, [20278] = 20279, [10789] = 10790, [12102] = 12103, [12204] = 12205, [19854] = 19855, [19994] = 19995, [20287] = 20288, [10782] = 10783, [12097] = 12098, [12193] = 12194, [19847] = 19848, [19987] = 19988, [20280] = 20281, [10791] = 10792, [12104] = 12105, [12202] = 12203, [19856] = 19857, [19996] = 19997, [20289] = 20290}
verticalOpenDoors = {1211, 1220, 1224, 1228, 1233, 1238, 1242, 1246, 1251, 1256, 1260, 1540, 3546, 3548, 3550, 3552, 4915, 5083, 5109, 5111, 5113, 5115, 5127, 5129, 5131, 5133, 5142, 5145, 5283, 5285, 5289, 5293, 5516, 5737, 5749, 6194, 6199, 6203, 6207, 6251, 6256, 6260, 6264, 6798, 6802, 6902, 6904, 6906, 6908, 7044, 7046, 7048, 7050, 7055, 8543, 8548, 8552, 8556, 9167, 9172, 9269, 9274, 9274, 9269, 9278, 9282, 10270, 10275, 10279, 10283, 10479, 10481, 10485, 10483, 10786, 12101, 12199, 19851, 19853, 19991, 19993, 20284, 20286, 17238, 13021, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997, 20290}
horizontalOpenDoors = {1214, 1222, 1226, 1230, 1236, 1240, 1244, 1248, 1254, 1258, 1262, 1542, 3537, 3539, 3541, 3543, 4918, 5085, 5100, 5102, 5104, 5106, 5118, 5120, 5122, 5124, 5136, 5139, 5280, 5287, 5291, 5295, 5518, 5734, 5746, 6197, 6201, 6205, 6209, 6254, 6258, 6262, 6266, 6796, 6800, 6893, 6895, 6897, 6899, 7035, 7037, 7039, 7041, 7057, 8546, 8550, 8554, 8558, 9170, 9174, 9272, 9276, 9280, 9284, 10273, 10277, 10281, 10285, 10470, 10472, 10476, 10474, 10777, 12094, 12190, 19842, 19844, 19982, 19984, 20275, 20277, 17236, 18209, 13023, 10781, 12096, 12196, 19846, 19986, 20279, 10783, 12098, 12194, 19848, 19988, 20281}
openSpecialDoors = {1224, 1226, 1228, 1230, 1242, 1244, 1246, 1248, 1256, 1258, 1260, 1262, 3541, 3543, 3550, 3552, 5104, 5106, 5113, 5115, 5122, 5124, 5131, 5133, 5289, 5291, 5293, 5295, 6203, 6205, 6207, 6209, 6260, 6262, 6264, 6266, 6897, 6899, 6906, 6908, 7039, 7041, 7048, 7050, 8552, 8554, 8556, 8558, 9176, 9178, 9180, 9182, 9278, 9280, 9282, 9284, 10279, 10281, 10283, 10285, 10474, 10476, 10483, 10485, 10781, 12096, 12196, 19846, 19986, 20279, 10783, 12098, 12194, 19848, 19988, 20281, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997, 20290}
questDoors = {1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202, 6204, 6259, 6261, 6898, 6907, 7040, 7049, 8551, 8553, 9175, 9177, 9277, 9279, 10278, 10280, 10475, 10484, 10782, 10791, 12097, 12104, 12193, 12202, 19847, 19856, 19987, 19996, 20280, 20289}
levelDoors = {1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263, 6265, 6896, 6905, 7038, 7047, 8555, 8557, 9179, 9181, 9281, 9283, 10282, 10284, 10473, 10482, 10780, 10789, 10780, 12095, 12102, 12204, 12195, 19845, 19854, 19985, 19994, 20278, 20287}
keys = {2086, 2087, 2088, 2089, 2090, 2091, 2092, 10032}

string.diff = function(diff)
    local format = {
        {'day', diff / 60 / 60 / 24},
        {'hour', diff / 60 / 60 % 24},
        {'minute', diff / 60 % 60},
        {'second', diff % 60}
    }
 
    local out = {}
    for k, t in ipairs(format) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    local ret = table.concat(out)
    if ret:len() < 16 and ret:find('second') then
        local a, b = ret:find(' and ')
        ret = ret:sub(b+1)
    end
    return ret
end

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

function getFormattedWorldTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

if not nextUseStaminaTime then
	nextUseStaminaTime = {}
end

function getItemNameById(itemid)
	return getItemDescriptionsById(itemid).name
end
function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end
 
function string.trim(str)
    -- Function by Colandus
    return (str:gsub("^%s*(.-)%s*$", "%1"))
end
 
function string.explode(str, sep, limit)
    -- Function by Colandus
    if limit and type(limit) ~= 'number' then
        error("string.explode: limit must be a number", 2)
    end
    -- lets make sure str is a string
    if type(str) ~= "string" then
        return
    end
    if #sep == 0 or #str == 0 then
        return
    end
    local pos, i, t = 1, 1, {}
    for s, e in function() return str:find(sep, pos) end do
        table.insert(t, str:sub(pos, s-1):trim())
        pos = e + 1
        i = i + 1
        if limit and i == limit then break end
    end
    table.insert(t, str:sub(pos):trim())
    return t
end

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

function getFormattedWorldTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

if nextUseStaminaTime == nil then
	nextUseStaminaTime = {}
end
-- AutoLoot config
    AUTO_LOOT_MAX_ITEMS = 5
 
    -- Reserved storage
    AUTOLOOT_STORAGE_START = 10000
    AUTOLOOT_STORAGE_END = AUTOLOOT_STORAGE_START + AUTO_LOOT_MAX_ITEMS
-- AutoLoot config end
function capAll(str)
    local newStr = ""; wordSeparate = string.gmatch(str, "([^%s]+)")
    for v in wordSeparate do
        v = v:gsub("^%l", string.upper)
        if newStr ~= "" then
            newStr = newStr.." "..v
        else
            newStr = v
        end
    end
    return newStr
end
PROPOSED_STATUS = 1
MARRIED_STATUS = 2
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502
 
function getPlayerSpouse(id)
    local resultQuery = db.storeQuery("SELECT `marriage_spouse` FROM `players` WHERE `id` = " .. db.escapeString(id))
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "marriage_spouse")
        result.free(resultQuery)
        return ret
    end
    return -1
end
 
function setPlayerSpouse(id, val)
    db.query("UPDATE `players` SET `marriage_spouse` = " .. val .. " WHERE `id` = " .. id)
end
 
function getPlayerMarriageStatus(id)
    local resultQuery = db.storeQuery("SELECT `marriage_status` FROM `players` WHERE `id` = " .. db.escapeString(id))
    if resultQuery ~= false then
        local ret = result.getDataInt(resultQuery, "marriage_status")
        result.free(resultQuery)
        return ret
    end
    return -1
end
 
function setPlayerMarriageStatus(id, val)
    db.query("UPDATE `players` SET `marriage_status` = " .. val .. " WHERE `id` = " .. id)
end
 
function Player:getMarriageDescription(thing)
    local descr = ""
    if getPlayerMarriageStatus(thing:getGuid()) == MARRIED_STATUS then
        playerSpouse = getPlayerSpouse(thing:getGuid())
        if self == thing then
            descr = descr .. " You are "
        elseif thing:getSex() == PLAYERSEX_FEMALE then
            descr = descr .. " She is "
        else
            descr = descr .. " He is "
        end
        descr = descr .. "married to " .. getPlayerNameById(playerSpouse) .. '.'
    end
    return descr
end

CreatureArena = {}
PLAYER_LASTARENA = {}
 
Arena = {}
setmetatable(Arena, {__call =
    function(_, name, position, exit, radius, rewardpos)
        return setmetatable({name = name, position = position, exit = exit, currentwave = 1, rewardpos = rewardpos or exit, radius = radius, waves = {}, playertable = {}}, {__index = Arena})
    end})
 
Wave = {}
setmetatable(Wave, {__call =
    function(_, monsters)
        return setmetatable({monsters = monsters}, {__index = Wave})
    end})
 
 
 
local function getBaseVocation(vocation)
    while vocation:getDemotion() do
        vocation = vocation:getDemotion()
    end
    return vocation
end
 
function Arena:addPlayerPosition(position, level, vocation)
    table.insert(self.playertable, {position, level, vocation})
    return true
end
 
function Arena:setRewardCallback(callback)
    self.rewardcallback = callback
end
 
function Arena:setCheckCallback(callback)
    self.checkcallback = callback
end
 
function Arena:setSpawnCallback(callback)
    self.spawncallback = callback
end
 
function Arena:setWaveclearCallback(callback)
    self.waveclearcallback = callback
end
 
function Arena:setJokerdeathCallback(callback)
    self.jokerdeathcallback = callback
end
 
function Arena:setStartCallback(callback)
    self.startcallback = callback
end
 
function Arena:setThinkCallback(callback, interval)
    if type(callback) == "function" then
        self.think = callback
        self.thinkinterval = interval or 2000
    end
end
 
function Arena:onThink()
    if self.think and self.thinking then
        self.think(self, self.thinkinterval)
        self.thinkevent = addEvent(Arena.onThink, self.thinkinterval, self)
    end
end
 
function Arena:addWaves(x, ...)
    if x then
        table.insert(self.waves, x)
        return self:addWaves(...)
    end
end
 
function Arena:getPlayersInside()
    local specs = Game.getSpectators(self.position, false, true, self.radius, self.radius, self.radius, self.radius)
    return specs
end
 
function Arena:removeCreatures()
    local specs = Game.getSpectators(self.position, false, false, self.radius, self.radius, self.radius, self.radius)
    for i = 1, #specs do
        if specs[i]:isMonster() then
            specs[i]:remove()
        elseif specs[i]:isPlayer() then
            specs[i]:teleportTo(self.exit)
        end
    end
end
 
function Arena:getMonstersInside()
    local ret = {}
    local specs = Game.getSpectators(self.position, false, false, self.radius, self.radius, self.radius, self.radius)
    for i = 1, #specs do
        if specs[i]:isMonster() and not specs[i]:getMaster() then
            table.insert(ret, specs[i])
        end
    end
 
    return ret
end
 
function Arena:setJokerCreature(name)
    self.joker = name
end
 
function Arena:jokerDeath()
    if self.jokerdeathcallback then
        local players = self:getPlayersInside()
        for i = 1, #players do
            self.jokerdeathcallback(players[i], self.currentwave, self)
        end
    end
    addEvent(Arena.spawnWave, self.delay or 1000, self)
end
 
function Arena:setDelayWaves(t)
    self.delay = t
end
 
function Arena:setDelayEnd(t)
    self.endtime = t
end
 
function Arena:reset()
    self.currentwave = 1
    self.started = false
    self.thinking = false
    stopEvent(self.thinkevent)
    self:removeCreatures()
end
 
function Arena:isActive()
    local players = self:getPlayersInside()
    if self.started and #players > 0 then
        return true
    else
        self:reset()
    end
 
    return false
end
 
function Arena:spawnJoker()
    local pos = self.position
    local radius = self.radius
 
    local creature = Game.createMonster(self.joker, Position(math.random(pos.x-radius, pos.x+radius), math.random(pos.y-radius, pos.y+radius), pos.z), false, false)
    if creature then
        CreatureArena[creature:getId()] = self
        creature:registerEvent("JokerDeath")
    else
        self:spawnJoker()
    end
end
 
function Arena:finish()
    local players = self:getPlayersInside()
    for i = 1, #players do
        players[i]:teleportTo(self.rewardpos)
        if self.rewardcallback then
            self.rewardcallback(players[i], self)
        end
    end
 
    self:reset()
end
 
function Arena:spawnWave()
    local wave = self.waves[self.currentwave]
    if wave then
        if self.spawncallback then
            local players = self:getPlayersInside()
            for i = 1, #players do
                self.spawncallback(players[i], self.currentwave, self)
            end
        end
 
        wave:spawn(self)
    end
end
 
function Arena:startWave()
    local wave = self.waves[self.currentwave]
 
    if not wave then
        return self:finish()
    end
 
    if self.joker then
        self:spawnJoker()
    else
        addEvent(Arena.spawnWave, self.delay or 1000, self)
    end
end
 
function Arena:start(aplayer)
    if #self.playertable > 0 then
        local group = {}
        for i = 1, #self.playertable do
            local tile = Tile(self.playertable[i][1])
            if tile then
                local player = tile:getTopCreature()
                if player and player:isPlayer() then
                    local minlevel = self.playertable[i][2] or 0
                    local vocation = self.playertable[i][3]
                    if player:getLevel() >= minlevel then
                        if not vocation or getBaseVocation(player:getVocation()) == vocation then
                            if self.checkcallback and not self.checkcallback(player) then
                                return false
                            end
 
                            table.insert(group, player)
                        else
                            aplayer:sendCancelMessage(player:getName() .. " needs to be " .. vocation:getName() .. ".")
                            return false
                        end
                    else
                        aplayer:sendCancelMessage(player:getName() .. " needs to be level " .. minlevel)
                        return false
                    end
                else
                    aplayer:sendCancelMessage("No players in the required positions.")
                    return false
                end
            end
        end
 
        if #group == #self.playertable then
            self.started = true
            for i = 1, #group do
                group[i]:teleportTo(self.position)
                PLAYER_LASTARENA[group[i]:getGuid()] = self
 
                if self.startcallback then
                    self.startcallback(group[i], self)
                end
            end
 
            if self.think then
                self.thinking = true
                self:onThink()
            end
 
            self:startWave()
            return true
        else
            aplayer:sendCancelMessage("No players in the required positions.")
            return false
        end
    else
        print("Arena with no player position.")
    end
 
    return false
end
 
function Arena:useLever(player)
    if self:isActive() then
        player:sendCancelMessage("Someone is already inside the arena, please wait.")
        return false
    else
        return self:start(player)
    end
end
 
function Arena:monsterDeath()
    local monsters = self:getMonstersInside()
    if #monsters == 1 then
        if self.waveclearcallback then
            local players = self:getPlayersInside()
            for i = 1, #players do
                self.waveclearcallback(players[i], self.currentwave, self)
            end
        end
 
        self.currentwave = self.currentwave+1
        self:startWave()
    end
end
 
function Wave:spawn(arena)
    local pos = arena.position
    local radius = arena.radius
 
    for name, amount in pairs(self.monsters) do
        for i = 1, amount do
            local creature = Game.createMonster(name, Position(math.random(pos.x-radius, pos.x+radius), math.random(pos.y-radius, pos.y+radius), pos.z), false, false)
            if creature then
                CreatureArena[creature:getId()] = arena
                creature:registerEvent("ArenaEvent")
            end
        end
    end
end
 
function Player:isInsideArena(arena)
    local players = arena:getPlayersInside()
    return isInArray(players, self)
end
 
function Player:getLastArena()
    return PLAYER_LASTARENA[self:getGuid()]
end

messageSep = "<msgSep>" --used on database
senderSep = "<sendSep>" --used on database
 
function getPlayerMessages(name)
    local query = db.storeQuery("SELECT `messages` FROM `players` WHERE `name` = " .. db.escapeString(name))
    local messages = {}
    local x = nil
    if query ~= -1 then
        x = (result.getDataString(query, 'messages'))
        x = string.explode(x, messageSep)
        -- does x contain a value and if it does is that value a table?
        if x and type(x) == "table" then
            -- if x is a table but has nothing in it then the for loop won't even execute
            for i = 1, table.maxn(x) do
                table.insert(messages, x[i])
            end
        end
    end
    return messages
end

function doPlayerAddMessage(name, message, sender)
    local query = db.storeQuery("SELECT `messages` FROM `players` WHERE `name` = " .. db.escapeString(name))
    if query ~= -1 then
        local m = (result.getDataString(query, 'messages'))
        m = m .. (m ~= "" and messageSep or "") .. message .. senderSep .. getCreatureName(sender) .. senderSep .. os.date()
        local newquery = db.query("UPDATE `players` SET `messages` = " .. db.escapeString(m) .. " WHERE `name` = " .. db.escapeString(name))
        if not newquery then
            return false
        end
    else
        return false
    end
    return true
end
 
function doPlayerRemoveMessages(name, limit)
    local query = db.storeQuery("SELECT `messages` FROM `players` WHERE `name` = " .. db.escapeString(name))
    local messages = {}
    local x, y
    local t, tt = "", ""
    if query ~= -1 then
        x, y = (result.getDataString(query, 'messages')), (result.getDataString(query, 'messages'))
        x = string.explode(x, messageSep)
        for i = 1, limit do
            t = t .. x[i]
        end
 
        tt = string.sub(y, string.len(t) + (string.len(messageSep) * limit) + 1, string.len(y))
        local newquery = db.query("UPDATE `players` SET `messages` = " .. db.escapeString(tt) .. " WHERE `name` = " .. db.escapeString(name))
        if not newquery then
            return false
        end
    end
    return true
end
 
function getPlayerMessagesLenght(name)
    local query = db.storeQuery("SELECT `messages` FROM `players` WHERE `name` = " .. db.escapeString(name))
    if query ~= -1 then
        return string.len(result.getDataString(query, 'messages'))
    end
    return -1
end

function playerExists(name)
   return (getPlayerGUIDByName(name) ~= 0)
end

 function getItemAttack(uid) return ItemType(getThing(uid).itemid):getAttack() end
   function getItemDefense(uid) return ItemType(getThing(uid).itemid):getDefense() end
   function getItemArmor(uid) return ItemType(getThing(uid).itemid):getArmor() end
   function getItemWeaponType(uid) return ItemType(getThing(uid).itemid):getWeaponType() end
   function isArmor(uid) if (getItemArmor(uid) ~= 0 and getItemWeaponType(uid) == 0) then return true else return false end end
   function isWeapon(uid) return (getItemWeaponType(uid) > 0 and getItemWeaponType(uid) ~= 4) end
   function isShield(uid) return getItemWeaponType(uid) == 4 end
   function isBow(uid) return (getItemWeaponType(uid) == 5 and (not ItemType(getThing(uid).itemid):isStackable())) end
   
