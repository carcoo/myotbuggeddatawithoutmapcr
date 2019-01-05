mbc = { -- moving boat config
    water = {4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4664, 4665, 4666},
    borders = {
        [4644] = "south",
        [4645] = "west",
        [4646] = "north",
        [4647] = "east",
    },
    boats = {
        horizontal = {3592,3594,3596},
        vertical = {3587,3589,3591}
    },
    speed = 200,
    storage = 36901,
    actionid = 6900,
 
    isOnBoat = function(cid)
        local player = Player(cid)
 
        if player:getStorageValue(mbc.storage) > 0 then
            return false
        end
 
        local check = 0
        local tile = Tile(player:getPosition())
 
        if tile:getItems() == nil or tile:getGround() == nil then
            return false
        end
        if isInArray(mbc.water, tile:getGround():getId()) then
            check = check + 1
        end
        for k,v in pairs(tile:getItems()) do
            if mbc["borders"][v:getId()] ~= nil then
                check = check + 1
            end
            if v:getId() == mbc.boats.horizontal[2] or v:getId() == mbc.boats.vertical[2] then
                check = check + 1
            end
            if check == 2 then
                player:setStorageValue(mbc.storage, 1)
                local function setStorage(cid, key, value)
                    Player(cid):setStorageValue(key,value)
                end
                addEvent(setStorage, mbc.speed, cid, mbc.storage, 0)
                return true
            end
        end
 
        return false
    end,
 
    createBoat = function(pos, boat)
 
        local i = 1
        if boat[1] == mbc.boats.vertical[1] then
            for y = pos.y-1,pos.y+1 do
                local p = {x = pos.x, y = y, z = pos.z}
                local create = Game.createItem(boat[i], 1, p)
                if i == 2 then create:setActionId(mbc.actionid) end
                i = i + 1
            end
        else
            for x = pos.x-1,pos.x+1 do
                local p = {x = x, y = pos.y, z = pos.z}
                local create = Game.createItem(boat[i], 1, p)
                if i == 2 then create:setActionId(mbc.actionid) end
                i = i + 1
            end
        end
 
    end,
 
    removeBoat = function(pos)
 
        local t = Tile(pos)
        local ho = mbc.boats.horizontal
        local ve = mbc.boats.vertical
 
        if t:getItemById(ve[2]) ~= nil then
            for y = pos.y-1,pos.y+1 do
                p = {x = pos.x, y = y, z = pos.z}
                if Tile(p) ~= nil then
                    for k,v in pairs(ve) do
                        local item = (Tile(p):getItemById(v) ~= nil and Tile(p):getItemById(v) or nil)
                        if item ~= nil then
                            item:remove()
                        end
                    end
                end
            end
        elseif t:getItemById(ho[2]) ~= nil then
            for x = pos.x-1,pos.x+1 do
                p = {x = x, y = pos.y, z = pos.z}
                if Tile(p) ~= nil then
                    for k,v in pairs(ho) do
                        local item = Tile(p):getItemById(v)
                        if item ~= nil then
                            item:remove()
                        end
                    end
                end
            end
        end
    end,
 
    isBorder = function(pos, id)
        local b = mbc["borders"]
        local check = 0
        local function checkForBorder(tile, itemid)
            local border = false
            for k,v in pairs(tile:getItems()) do
                if b[v:getId()] ~= nil then
                    border = true
                end
                if v:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) and b[v:getId()] == nil then
                    return 0
                end
            end
            if border then
                return 1
            end
            return 0
        end
 
        if b[id] == "north" then
            for x = pos.x-1,pos.x+1 do
                local p = {x = x, y = pos.y, z = pos.z}
                local tile = Tile(p)
                if tile ~= nil and tile:getItems() ~= nil then
                    check = check + checkForBorder(tile, id)
                end
            end
        elseif b[id] == "east" then
            for y = pos.y-1,pos.y+1 do
                local p = {x = pos.x, y = y, z = pos.z}
                local tile = Tile(p)
                if tile ~= nil and tile:getItems() ~= nil then
                    check = check + checkForBorder(tile, id)
                end
            end
        elseif b[id] == "south" then
            for x = pos.x-1,pos.x+1 do
                local p = {x = x, y = pos.y, z = pos.z}
                local tile = Tile(p)
                if tile ~= nil and tile:getItems() ~= nil then
                    check = check + checkForBorder(tile, id)
                end
            end
        elseif b[id] == "west" then
            for y = pos.y-1,pos.y+1 do
                local p = {x = pos.x, y = y, z = pos.z}
                local tile = Tile(p)
                if tile ~= nil and tile:getItems() ~= nil then
                    check = check + checkForBorder(tile, id)
                end
            end
        end
        if check == 3 then
            return true
        end
        return false
    end,
 
    moveBoat = function(cid, dir, pos)
        local player = Player(cid)
        local b = nil -- boat
 
        local nextPos = {
            [1] = {{x = pos.x, y = pos.y-1, z = pos.z}, {x = pos.x, y = pos.y-2, z = pos.z}, 3587},
            [2] = {{x = pos.x+1, y = pos.y, z = pos.z}, {x = pos.x+2, y = pos.y, z = pos.z}, 3596},
            [3] = {{x = pos.x, y = pos.y+1, z = pos.z}, {x = pos.x, y = pos.y+2, z = pos.z}, 3591},
            [4] = {{x = pos.x-1, y = pos.y, z = pos.z}, {x = pos.x-2, y = pos.y, z = pos.z}, 3592}
        }
       
        local np = nextPos[dir+1]
        local tile = Tile(np[1])
        local tile_2 = Tile(np[2])
        local isBorder = false
 
        if tile ~= nil and tile:getItems() ~= nil then
            for k,v in pairs(tile:getItems()) do
                if mbc["borders"][v:getId()] ~= nil then
                    if mbc.isBorder(np[1], v:getId()) then
                        isBorder = true
                        if dir%2 == 0 then
                            b = mbc.boats.horizontal
                        else
                            b = mbc.boats.vertical
                        end
                    else
                        return
                    end
                    break
                elseif v:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) or v:getId() ~= np[3] then
                    return
                end
            end
        end
 
        if tile_2 ~= nil and tile_2:getItems() ~= nil and (not isBorder) then
            for k,v in pairs(tile_2:getItems()) do
                if mbc["borders"][v:getId()] ~= nil then
                    if mbc.isBorder(np[2], v:getId()) then
                        isBorder = true
                        break
                    else
                        return
                    end
                elseif v:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) or (isInArray(mbc.boats.horizontal, v:getId())) or (isInArray(mbc.boats.vertical, v:getId())) then
                    return
                end
            end
        end
 
        if b == nil then
            if dir%2 == 0 then
                b = mbc.boats.vertical
            else
                b = mbc.boats.horizontal
            end
        end
 
        if tile ~= nil and (isInArray(mbc.water, tile:getGround():getId()) or isBorder) then
            mbc.removeBoat(pos)
            player:teleportTo(np[1])
            mbc.createBoat(np[1], b)
        end
 
    end,
}