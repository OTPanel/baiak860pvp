	function executeSaveServer()
	doSaveServer()
	doCleanMap()
    return true
end

function onThink(interval, lastExecution, thinkInterval)
    doBroadcastMessage("O mapa ficara limpo em 15 segundos, cuidado pode haver freeze!", 22)
    addEvent(executeSaveServer, 15000)
    return true
end
