local cfg = {
    upgrade = {
        message  = 'Upgraded!',
        talkType = TALKTYPE_MONSTER_SAY,
        effect   = CONST_ME_FIREWORK_RED
    },
 
    fail = {
        message  = 'Upgrade Failed.',
        talkType = TALKTYPE_MONSTER_SAY,
        effect   = CONST_ME_POFF
    }
}
 
local gear = {
    [24714] = {tier = 1, upgraderType = 'key', chance = 5,
        items = {
            [15408] = 18398,
            [15489] = 18399,
            [15490] = 18400,
            [15410] = 24742,
            [15411] = 18401
        }
    }
}
 
local function shit(v, cfgu, cfgf, upgid)
    if v then
        return cfgu.message, cfgu.talkType, cfgu.effect, upgid
    else
        return cfgf.message, cfgf.talkType, cfgf.effect, 0
    end
end
 
local cfgu, cfgf  = cfg.upgrade, cfg.fail
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player == target then
        return true
    end
    local pos   = (toPosition.x == 65535) and player:getPosition() or toPosition
    local tmp   = gear[item.itemid]
    local upgid = tmp and tmp.items[target.itemid]
    local name  = (target.type > 1) and target:getPluralName() or (target:getArticle() ~= '') and (string.format('%s %s', target:getArticle(), target:getName())) or target:getName()
    local v     = (math.random(100) <= tmp.chance)
    if not upgid then
        player:sendCancelMessage(string.format('You are unable to upgrade %s with a tier %d %s.', (name == '') and 'this' or name, tmp.tier, tmp.upgraderType))
        pos:sendMagicEffect(CONST_ME_POFF)
        return true
    end
    if target.type > 1 then
        player:sendCancelMessage(string.format('You may only upgrade %s 1 at a time.', name))
        pos:sendMagicEffect(CONST_ME_POFF)
        return true
    end
    local message, talktype, effect, trans = shit(v, cfgu, cfgf, upgid)
    pos:sendMagicEffect(effect)
    player:say(message, talktype)
    target:transform(trans)
    item:remove(1)
    return true
end