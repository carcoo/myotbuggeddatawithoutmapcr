
local effects = {
    {position = Position(2104, 2100, 7), text = '8~500', effect = 49},
    {position = Position(2096, 2100, 7), text = '500~1k', effect = 49},
    {position = Position(2104, 2104, 7), text = '1k~2k', effect = 49},
    {position = Position(2096, 2104, 7), text = '2k~3k', effect = 49},
    {position = Position(2104, 2108, 7), text = '3k~5k', effect = 49},
    {position = Position(2096, 2108, 7), text = '5k~8k', effect = 49},
    {position = Position(2104, 2112, 7), text = '8k~12k', effect = 49},
    {position = Position(2096, 2112, 7), text = '12k~16k', effect = 49},
    {position = Position(2104, 2116, 7), text = '16k~20k', effect = 49},
    {position = Position(2096, 2116, 7), text = '20k~25k', effect = 49},
    {position = Position(2104, 2120, 7), text = '25k~50k', effect = 49},
    {position = Position(2096, 2120, 7), text = '50k~75k', effect = 49},
    {position = Position(2104, 2124, 7), text = '75k~100k', effect = 49},
    {position = Position(2096, 2124, 7), text = '100k~125k', effect = 49},
    {position = Position(2104, 2128, 7), text = '125k~150k', effect = 49},
    {position = Position(2096, 2128, 7), text = '150k~200k', effect = 49},
    {position = Position(2104, 2132, 7), text = '200k~250k', effect = 49},
    {position = Position(2096, 2132, 7), text = '250k~300k', effect = 49},
    {position = Position(2104, 2140, 6), text = '300k~350k', effect = 49},
    {position = Position(2096, 2140, 6), text = '350k~400k', effect = 49},
    {position = Position(1005, 995, 7), text = 'Trainers', effect = 11},
    {position = Position(1004, 995, 7), text = 'Donations', effect = 11},
    {position = Position(1003, 995, 7), text = 'WarZone', effect = 11},
    {position = Position(997, 995, 7), text = 'Depot', effect = 11},
    {position = Position(996, 995, 7), text = 'Towns', effect = 11},
    {position = Position(995, 995, 7), text = 'Events', effect = 11},
    {position = Position(1007, 1001, 7), text = 'Quests', effect = 11},
    {position = Position(1007, 1000, 7), text = 'HuntingArea', effect = 11},
    {position = Position(993, 1000, 7), text = 'Bosses', effect = 11},
    {position = Position(993, 1001, 7), text = 'TeamBosses', effect = 11},
    {position = Position(1000, 994, 6), text = 'VipArea', effect = 11},
    {position = Position(1001, 996, 6), text = 'Vip Gate', effect = 11},
    {position = Position(999, 996, 6), text = 'SVip Gate', effect = 11},
    {position = Position(1000, 1007, 6), text = 'Crafting', effect = 11},
    {position = Position(1283, 1019, 7), text = 'Carlin', effect = 11},
    {position = Position(1287, 1019, 7), text = 'Metallic', effect = 11},
    {position = Position(1005, 994, 6), text = 'Dungeons', effect = 11},
    {position = Position(1006, 994, 6), text = 'TeamHunts', effect = 11},
    {position = Position(994, 994, 6), text = 'outfits', effect = 11},
    {position = Position(995, 994, 6), text = 'Mounts', effect = 11},
    {position = Position(993, 999, 5), text = 'Single', effect = 11},
    {position = Position(993, 1000, 5), text = 'Team', effect = 11},
    {position = Position(1092, 857, 7), text = '100k~150k', effect = 11},
    {position = Position(1095, 860, 7), text = '150k~200k', effect = 11},
    {position = Position(1089, 860, 7), text = '200k~250k', effect = 11},
    {position = Position(1092, 863, 7), text = '250k+', effect = 11},
    {position = Position(1000, 1006, 5), text = 'Task-PTs EXC', effect = 11},
    {position = Position(997, 1000, 4), text = '30PTs', effect = 57},
    {position = Position(1004, 1000, 4), text = '50PTs', effect = 57},
    {position = Position(997, 1002, 4), text = '150PTs', effect = 57},
    {position = Position(1004, 1002, 4), text = '100PTs', effect = 57},
    {position = Position(1000, 1002, 7), text = 'MERRY-XMAS!', effect = 30},
    {position = Position(1057, 859, 7), text = '300k D2-S', effect = 48},
    {position = Position(1060, 856, 7), text = '150k D1-S', effect = 48},
    {position = Position(1060, 862, 7), text = '150k D1-G', effect = 48},
    {position = Position(1063, 859, 7), text = '300k D2-G', effect = 48},
}
 
function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
 