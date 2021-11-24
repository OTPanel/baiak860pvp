local config = {
    items = { -- {position = posição_do_item, itemid = id_do_item},
        {position = {x = 526, y = 616, z = 6}, itemid = 5803}, -- arbalest paladin
        {position = {x = 526, y = 606, z = 6}, itemid = 8601}, -- steel axe kina
        {position = {x = 521, y = 611, z = 6}, itemid = 2349}, -- blue note
		{position = {x = 531, y = 611, z = 6}, itemid = 2112}  -- teddy bear
        --etc
    },
    players = {
        {position = {x = 526, y = 615, z = 6}, toPos = {x = 2291, y = 1156, z = 13}, vocation = {3, 7}},   --{position = posi?_do_jogador, toPos = posi?_final, vocation = ID_das_voca?s},
        {position = {x = 526, y = 607, z = 6}, toPos = {x = 2292, y = 1156, z = 13}, vocation = {4, 8}},
        {position = {x = 522, y = 611, z = 6}, toPos = {x = 2291, y = 1157, z = 13}, vocation = {2, 6}},
		{position = {x = 530, y = 611, z = 6}, toPos = {x = 2292, y = 1157, z = 13}, vocation = {1, 5}}
        --etc
    }
}
 
function onUse(cid)
    local items, quest_players = {}, {}
    for _, item in pairs(config.items) do
        local position_item = getTileItemById(item.position, item.itemid).uid
        if position_item > 0 then
            table.insert(items, position_item)
        else
            return doPlayerSendCancel(cid, "Certifique-se de que todos os itens estão posicionados corretamente.")
        end
    end
    for _, player in pairs(config.players) do
        local pid = getTopCreature(player.position).uid
        if isPlayer(pid) and isInArray(player.vocation, getPlayerVocation(pid)) then
            table.insert(quest_players, pid)
        else
            return doPlayerSendCancel(cid, "Estão faltando jogadores ou estão em suas posições erradas.")
        end
    end
    for i = 1, #items do
        doRemoveItem(items[i])
    end
    for i = 1, #quest_players do
        doPlayerSendTextMessage(quest_players[i], MESSAGE_INFO_DESCR, "Congratulations!!")
        doTeleportThing(quest_players[i], config.players[i].toPos)
		doSendMagicEffect(config.players[i].toPos,CONST_ME_TELEPORT)
    end
    return true
end
 