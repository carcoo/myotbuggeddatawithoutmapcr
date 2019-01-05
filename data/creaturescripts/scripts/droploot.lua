ITEM_AMULETOFSKULL = 26131
ITEM_AMULETOFFOREVER = 25423

local onDropItems = function(player, corpse, magicEffect)
    if not corpse then
        return
    end
    for i = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(i)
        if item then
            if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) or math.random(item:isContainer() and 100 or 1000) <= player:getLossPercent() then
                if not item:moveTo(corpse) then
                    item:remove()
                end
            end
        end
    end
end

function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    if getPlayerFlagValue(player, PlayerFlag_NotGenerateLoot) or player:getVocation():getId() == VOCATION_NONE then
        return true
    end

    local onDropSuccess = true
    local amulet = player:getSlotItem(CONST_SLOT_NECKLACE)
    if amulet then
        if amulet.itemid == ITEM_AMULETOFFOREVER and not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
            onDropSuccess = false
            player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
            player:say('Forever Amulet!', TALKTYPE_MONSTER_SAY)
        elseif amulet.itemid == ITEM_AMULETOFSKULL then
            onDropSuccess = false
            player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
            player:say('Skull Amulet!', TALKTYPE_MONSTER_SAY)
        elseif amulet.itemid == ITEM_AMULETOFLOSS and not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
            local isPlayer = false
            if killer then
                if killer:isPlayer() then
                    isPlayer = true
                else
                    local master = killer:getMaster()
                    if master and master:isPlayer() then
                        isPlayer = true
                    end
                end
            end
 
            if not isPlayer or not player:hasBlessing(6) then
                player:removeItem(ITEM_AMULETOFLOSS, 1, -1, false)
            end
            onDropSuccess = false
        end
    end

    if onDropSuccess then
        onDropItems(player, corpse)
    end
 
    if not player:getSlotItem(CONST_SLOT_BACKPACK) then
        player:addItem(ITEM_BAG, 1, false, CONST_SLOT_BACKPACK)
    end
    return true
end