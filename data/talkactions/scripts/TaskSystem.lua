function onSay(cid, words, param, channel)
	local stt = ""
	local task, index = TaskSystem:getCurrentTask(cid)
	if task then
    	stt = "Seja bem vindo � sua p�gina de informa��es de Task\n\nAtualmente voc� est� fazendo uma task de: ".. task.name .."\n\nVoc� matou ".. TaskSystem:getKills(cid, task.storage) .." de ".. task.count .." monstros\n\nOs monstros que contam s�o: ".. table.concat(task.creatures, ", ") .."\n\nO pr�mio por completar esta task �: ".. TaskSystem:getRewardString(index) .."\n\nVoc� j� completou ".. TaskSystem:getCompletedTasks(cid) .." de ".. #TaskSystem.list .." tasks, complete todas para ganhar um s�per pr�mio!"
    else
    	stt = "Seja bem vindo � sua p�gina de informa��es de Task\n\nAtualmente voc� n�o est� fazendo nenhuma task\n\nVoc� j� completou ".. TaskSystem:getCompletedTasks(cid) .." de ".. #TaskSystem.list .." tasks, complete todas para ganhar um s�per pr�mio!"
    end     
    doShowTextDialog(cid, 8977, stt)
    return true
end
