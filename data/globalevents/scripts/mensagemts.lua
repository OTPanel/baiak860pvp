local msgs = {
	
	[1] = "[RealBaiak], Comandos �teis:\nAuto Loot: !autoloot\nReparar Fire Walker: !repairfirewalker\nReparar Soft: !repairsoft\nVender pontos: !sellpoints\nSaber quanto tempo de double exp: !doubleexp\nDar creu em um jogador: Creu",
	[2] = "[RealBaiak], Informa��o: O Npc Viajante se encontra no barco ao sudeste da PvP city.\nBom Jogo",
	[3] = "[RealBaiak], Comandos b�sicos:\nDodge System: !dodge\nCritical System: !critical\nRemover Skull: !removeskull\nCast system: !cast\nVer lista de spells: !spells\nPara mais comandos digite !commands\nBom Jogo!!",
	[4] = "[RealBaiak], Para ver quem est� matando quem, abra o canal Mortes (Ctrl + O)",
	[5] = "[Aviso de Seguran�a] NUNCA digite sua senha em sites que n�o sejam o OFICIAL e nem crie contas com a mesma senha em outros servidores. Site oficial: www.RealBaiak.com/",
	[6] = "[SEGURAN�A] Cadastre um E-Mail verdadeiro em sua conta do site e gere sua Recovery Key - N�o seja hackeado! Site oficial: www.RealBaiak.com/",
	[7] = "[RealBaiak], Para informa��es sobre os eventos e os sistemas do servidor, acesse nosso site: www.RealBaiak.com",
	[8] = "[DoublePoints] Promo��o Double Points Ativa em Doa��es acima de R$:20,00 e Triple Poins acima de R$:100,00! Adquira os melhores items no shop!",
	[9] = "[RealBaiak] Ao dominar o RealCastle a guild vencedora ganha um boost de 30% a mais de experience.",
	[10] = "[RealBaiak] O servidor conta com um sistema de mining, quanto mais MC, mais dinheiro voc� pode fazer! http://RealBaiak.com/?subtopic=miningsystem.",
}

function onThink(interval, lastExecution, thinkInterval)
	local type = math.random(1,2) == 1 and MESSAGE_EVENT_ADVANCE or MESSAGE_STATUS_WARNING
	doBroadcastMessage(msgs[math.random(1,#msgs)], type)
	return true
end
