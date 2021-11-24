local config = {
    keys = {
	    ["war"] = {msg = " est� procurando por uma guerra", info = "Procurar por uma guerra."},
	    ["invite"] = {msg = " est� procurando por membros", info = "Procurar por membros para sua guilda."},
	},
    needMoney = {on = true, price = 15000}, -- Ativar custo para usar comando.
    broadcast = true,    -- Ativar mensagem livre, exemplo: /guild mensagem livre
    storage = 43095,     -- S� altere caso seja necess�rio
    permission = {3, 2}, -- Permiss�es: 3 = Leader, 2 = Vice-Leader, 1 = Member
    cooldown = 5         -- Em minutos.
}

function onSay(cid, words, param)
    local key, inf = config.keys[param], ''
    for wa, kon in pairs(config.keys) do
        inf = inf ..words.. " " ..wa.. " - " .. kon.info .."\n"
    end
	
    if config.broadcast then
        inf = inf .. words .. " mensagem - Mensagem livre."
    end
	
    if config.needMoney.on == true then
        inf = inf .. "\n\nPre�o: " .. config.needMoney.price
    end

    if not isInArray(config.permission, getPlayerGuildLevel(cid)) then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� n�o tem permiss�o para usar esse comando.") and true
    elseif (param == "") then
        return doPlayerPopupFYI(cid, "Comandos:\n" ..inf) and true
    elseif getPlayerStorageValue(cid, config.storage) > os.time() then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. math.ceil(getPlayerStorageValue(cid, config.storage) - os.time()) .." segundos para usar novamente.") and true
    elseif config.needMoney.on == true then
        if doPlayerRemoveMoney(cid, config.needMoney.price) == false then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� n�o tem ".. config.needMoney.price .." gold coins.")
        end
    end
	
    if key then
        doBroadcastMessage("O Lider [".. getCreatureName(cid) .."] da guild [".. getPlayerGuildName(cid) .."]".. key.msg ..".")
        setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown * 60)
    elseif not key and config.broadcast == true then
        doBroadcastMessage("Lider [".. getCreatureName(cid) .."] da Guild (".. getPlayerGuildName(cid) .."): "..  param) 
        setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown * 60)
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Comando inv�lido, digite apenas '.. words ..' para ver a lista de comandos.')
    end
   return true
end