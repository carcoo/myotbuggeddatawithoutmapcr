woe = {
    eventName = "[WOE]",
    timeDelay = 1, -- minutes before event starts
    bcMsg = " is starting in ",
    doors = {
        {name = "Castle Gate", id = 6891, pos = {x = 1224, y = 909, z = 7} },
        {name = "Castle Gate", id = 6891, pos = {x = 1193, y = 909, z = 7} },
        {name = "Castle Gate", id = 6891, pos = {x = 1205, y = 920, z = 7} },
        {name = "Castle Gate", id = 6891, pos = {x = 1213, y = 920, z = 7} },
        {name = "Castle Gate", id = 6891, pos = {x = 1209, y = 923, z = 7} }
    },
    actionid = 33542, -- for the doors
    crystal = {id = 18459, name="Emperium", pos = {x = 1209, y = 918, z = 6} },
    castle = {x = 1209, y = 913, z = 6}, -- just has to be one of the housetiles of the castle
    days = {
    ["Saturday"] = 23
	},
 
    queueEvent = function(x)
        x = x - 1
        if x > 0 then
            broadcastMessage(woe.eventName..woe.bcMsg..x..(x > 1 and "minutes!" or "minute!"), MESSAGE_EVENT_ADVANCE)
            addEvent(woe.queueEvent, x * 60 * 1000, x)
        else
            woe.startEvent()
        end
    end,
 
    startEvent = function()
        for k,v in pairs(woe.doors) do
            local item = Tile(v.pos):getItemById(v.id)
            if item ~= nil then
                item:remove()
                Game.createMonster(v.name, v.pos, false, true)
            else
                print("WOE GATE POSITION INVALID OR MISSING [x:"..v.pos.x.." | y:"..v.pos.y.." | z:"..v.pos.z.."]")
            end
        end
        local c = woe.crystal
        local item = Tile(c.pos):getItemById(c.id)
        if item ~= nil then
            item:remove()
            Game.createMonster(c.name, c.pos, false, true)
        else
            print("WOE CRYSTAL POSITION INVALID OR MISSING [x:"..c.pos.x.." | y:"..c.pos.y.." | z:"..c.pos.z.."]")
        end
    end,
 
}