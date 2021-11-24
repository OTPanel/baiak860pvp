--[[
	Script: Exemplo de Quest
	Autor: MySticaL
	Email: matadormatou275@gmail.com
]]

	function onUse(cid, item, frompos, item2, topos) -- Não mecha.


storage = 95951 -- Storage a cada quest que for criada aumente um numero da storage pra qnd vc pegar o baú de outra quest ñ aparecer que vc já fez.
item = 9971 -- Id do item ira ganhar.
quantidade = 50 -- Quantidade ira ganhar.
level = 1 -- Level que precisa pra fazer.

	if getPlayerLevel(cid) >= level and getPlayerStorageValue(cid,storage) == -1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você recebeu o acesso para entrar na sala de recompensas!") -- Mensagem que aparecera quando ganhar o item.
doPlayerAddItem(cid, item, quantidade) -- Não mecha.
setPlayerStorageValue(cid,storage,1) -- Não mecha.

elseif getPlayerLevel(cid) <= level then -- Não mecha
doPlayerSendTextMessage(cid,25,"Você precisa ser level 1 ou mais.") -- Mensagem que ira aparecer se o player tiver menos level que o necessario.

elseif getPlayerStorageValue(cid,storage) >= 1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você já tem acesso a sala.") -- Quando tentar pegar mais de uma vez o baú.
end
return true
end