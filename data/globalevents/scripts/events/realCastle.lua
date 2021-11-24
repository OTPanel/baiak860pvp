function onTime()
	realCastle.open()
	doBroadcastMessage("[Real Castle] O acesso a Area de dominar do castelo esta liberado até as 22:00. Boa sorte a todas as guilds!")
	for i = 1, 4 do
		addEvent(doBroadcastMessage, 60000 * i, "[Real Castle] O acesso a Area de dominar do castelo esta liberado até as 22:00. Boa sorte a todas as guilds!")
	end
	return true
end
