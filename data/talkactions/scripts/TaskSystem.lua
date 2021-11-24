function onSay(cid, words, param, channel)
	local stt = ""
	local task, index = TaskSystem:getCurrentTask(cid)
	if task then
    	stt = "Seja bem vindo à sua página de informações de Task\n\nAtualmente você está fazendo uma task de: ".. task.name .."\n\nVocê matou ".. TaskSystem:getKills(cid, task.storage) .." de ".. task.count .." monstros\n\nOs monstros que contam são: ".. table.concat(task.creatures, ", ") .."\n\nO prêmio por completar esta task é: ".. TaskSystem:getRewardString(index) .."\n\nVocê já completou ".. TaskSystem:getCompletedTasks(cid) .." de ".. #TaskSystem.list .." tasks, complete todas para ganhar um súper prêmio!"
    else
    	stt = "Seja bem vindo à sua página de informações de Task\n\nAtualmente você não está fazendo nenhuma task\n\nVocê já completou ".. TaskSystem:getCompletedTasks(cid) .." de ".. #TaskSystem.list .." tasks, complete todas para ganhar um súper prêmio!"
    end     
    doShowTextDialog(cid, 8977, stt)
    return true
end
