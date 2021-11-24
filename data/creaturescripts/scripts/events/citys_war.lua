-- Sistema de Guild War Sem Intervencoes
-- Criado por: Luke Skywalker
-- 07/04/2015
-- Versão 6.3 16/04/2016
-- Favor nao postar nem compartilhar este codigo
-- Favor manter os comentarios quando foi utilizar o codigo

function onLogin(cid)
	if getPlayerStorageValue(cid, WarConfigs.WarUrgentExit) == 1 then
		doPlayerWarUrgentExit(cid)
	end
	registerCreatureEvent(cid, "War_Cytis_Death")
	return true
end

function onLogout(cid)
	if getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) == 1 then
		doPlayerSendCancel(cid, "You can not log out at war.")
		return false
	end
	return true
end

function onDeath(cid, deathList)
	deathInWarAntientrosa(cid)
	return true
end