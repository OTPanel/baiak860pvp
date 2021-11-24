local msgs = {
	
	[1] = "[RealBaiak], Comandos úteis:\nAuto Loot: !autoloot\nReparar Fire Walker: !repairfirewalker\nReparar Soft: !repairsoft\nVender pontos: !sellpoints\nSaber quanto tempo de double exp: !doubleexp\nDar creu em um jogador: Creu",
	[2] = "[RealBaiak], Informação: O Npc Viajante se encontra no barco ao sudeste da PvP city.\nBom Jogo",
	[3] = "[RealBaiak], Comandos básicos:\nDodge System: !dodge\nCritical System: !critical\nRemover Skull: !removeskull\nCast system: !cast\nVer lista de spells: !spells\nPara mais comandos digite !commands\nBom Jogo!!",
	[4] = "[RealBaiak], Para ver quem está matando quem, abra o canal Mortes (Ctrl + O)",
	[5] = "[Aviso de Segurança] NUNCA digite sua senha em sites que não sejam o OFICIAL e nem crie contas com a mesma senha em outros servidores. Site oficial: www.RealBaiak.com/",
	[6] = "[SEGURANÇA] Cadastre um E-Mail verdadeiro em sua conta do site e gere sua Recovery Key - Não seja hackeado! Site oficial: www.RealBaiak.com/",
	[7] = "[RealBaiak], Para informações sobre os eventos e os sistemas do servidor, acesse nosso site: www.RealBaiak.com",
	[8] = "[DoublePoints] Promoção Double Points Ativa em Doações acima de R$:20,00 e Triple Poins acima de R$:100,00! Adquira os melhores items no shop!",
	[9] = "[RealBaiak] Ao dominar o RealCastle a guild vencedora ganha um boost de 30% a mais de experience.",
	[10] = "[RealBaiak] O servidor conta com um sistema de mining, quanto mais MC, mais dinheiro você pode fazer! http://RealBaiak.com/?subtopic=miningsystem.",
}

function onThink(interval, lastExecution, thinkInterval)
	local type = math.random(1,2) == 1 and MESSAGE_EVENT_ADVANCE or MESSAGE_STATUS_WARNING
	doBroadcastMessage(msgs[math.random(1,#msgs)], type)
	return true
end
