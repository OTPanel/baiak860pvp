-- Sistema de Guild War Sem Intervencoes
-- Criado por: Luke Skywalker
-- 07/04/2015
-- Versão 6.0 02/05/2015
-- Favor nao postar nem compartilhar este codigo
-- Favor manter os comentarios quando foi utilizar o codigo

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doPlayerExitArena(cid)
     doPlayerSendTextMessage(cid, 27, "You have been teleported back to temple.")	
	end
    return