local conditions = {CONDITION_POISON,
                    CONDITION_FIRE,
                    CONDITION_ENERGY,
                    CONDITION_PARALYZE,
                    CONDITION_DRUNK,
                    CONDITION_DROWN,
                    CONDITION_FREEZING,
                    CONDITION_DAZZLED,
                    CONDITION_PARALYZE,
                    CONDITION_CURSED
                }
 
function onThink(player, interval)
local tile = Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)
    if tile then
        for _, condition in ipairs(conditions) do
            if(player:getCondition(condition)) then
                player:removeCondition(condition)
            end
        end  
    end
end