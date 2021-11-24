WarConfigs =
{
	WarFirstGuildPos = {
	{x = 32489, y = 32648, z = 7},
	{x = 32472, y = 32411, z = 7},
	{x = 32876, y = 32271, z = 6},
	{x = 32585, y = 32238, z = 7},
	{x = 32915, y = 32139, z = 6},
	{x = 32304, y = 32351, z = 6},
	{x = 32468, y = 32856, z = 7},
	{x = 33190, y = 32316, z = 6}
	},
	WarSecondGuildPos = {
	{x = 32431, y = 32580, z = 6},
	{x = 32522, y = 32448, z = 6},
	{x = 32949, y = 32307, z = 6},
	{x = 32660, y = 32266, z = 6},
	{x = 32841, y = 32111, z = 7},
	{x = 32253, y = 32311, z = 7},
	{x = 32410, y = 32788, z = 6},
	{x = 33118, y = 32278, z = 6}
	},

	WarCitys = {"thais", "carlin", "edron", "darashia", "darashiab", "carlinb", "thaisb", "edronb"},
	WarMinLevel = 100,
	WarMaxFrontLine = 4,
	WarGuildLeaderMinLevel = 100,
	WarMinPlayers = 1,
	WarMinPlayersInGuild = 1,
	WarNeedDiferentIps = 1,
	WarLimitTime = 3 * 60 * 60,
	WarAcceptTime = 5 * 60,
	WarWaitTimeToCancel = 0 * 60,
	WarLossExpPercent = 10,
	WarLossSkillsPercent = 0,
	-- Global Storages
	["WarArenaStorage"] = {72000, 72001, 72002, 72003, 72004, 72005, 72006, 72007},
	["WarAcceptTimeArena"] = {73010, 73011, 73012, 73013, 73014, 73015, 73016, 73017},
	["WarFirstGuildID"] = {74020, 74021, 74022, 74023, 74024, 74025, 74026, 74027},
	["WarSecondGuildID"] = {75030, 75031, 75032, 75033, 75034, 75035, 75036, 75037},
	["WarMaxPlayerValue"] = {76040, 76041, 76042, 76043, 76044, 76045, 76046, 76047},
	["WarFirstTeamPlayerCount"] = {77050, 77051, 77052, 77053, 77054, 77055, 77056, 77057},
	["WarSecondTeamPlayerCount"] = {78060, 78061, 78062, 78063, 78064, 78065, 78066, 78067},
	["WarFragsToFinish"] = {79070, 79071, 79072, 79073, 79074, 79075, 79076, 79077},
	["WarUltimateExplosion"] = {80080, 80081, 80082, 80083, 80084, 80085, 80086, 80087},
	["WarAreaRunes"] = {81090, 81091, 81092, 81093, 81094, 81095, 81096, 81097},
	["WarFirstTeamPlayerDeathsCount"] = {82100, 82101, 82102, 82103, 82104, 82105, 82106, 82107},
	["WarSecondTeamPlayerDeathsCount"] = {83110, 83111, 83112, 83113, 83114, 83115, 83116, 83117},
	["WarMinutesInactive"] = {84120, 84121, 84122, 84123, 84124, 84125, 84126, 84127},
	["WarTeamInactive"] = {85130, 85131, 85132, 85133, 85134, 85135, 85136, 85137},
	["WarCanceledCity"] = {86140, 86141, 86142, 86143, 86144, 86145, 86146, 86147},
	["WarDontSSAMight"] = {725080, 725081, 725082, 725083, 725084, 725085, 725086, 725087},
	["WarLimitFrontLine"] = {735040, 735041, 735042, 735043, 735044, 735045, 735046, 735047},
	["WarFirstTeamFrontCount"] = {745040, 745041, 745042, 745043, 745044, 745045, 745046, 745047},
	["WarSecondTeamFrontCount"] = {755040, 755041, 755042, 755043, 755044, 755045, 755046, 755047},
	-- Players Storages
	WarPlayerJoined = 73000,
	WarUrgentExit = 73002,
	WarUEDisabled = 73003,
	WarAreaRunesDisabled = 73004,
	WarSSAMight = 732015,
	WarFrontLine = 732020
}

function getHavePlayersInGuildByGuildID(GuildID)
	local RanksIDS = {}
	Query1 = db.getResult("SELECT `id` FROM `guild_ranks` WHERE guild_id = '".. GuildID .."'")
	if(Query1:getID() == -1) then
		return 0
	end
	for i = 1, Query1:getRows() do
		table.insert(RanksIDS, Query1:getDataInt("id"))
		Query1:next()
	end
	Query1:free()
	Query2 = db.getResult("SELECT `account_id` FROM `players` WHERE `rank_id` IN (".. table.concat(RanksIDS, ', ') ..") AND `level` >= ".. WarConfigs.WarMinLevel .."")
	if(Query2:getID() == -1) then
		return 0
	end
	local Result = Query2:getRows()
	Query2:free()
	return Result
end

function getGuildNameByID(GuildID)
	Query = db.getResult("SELECT `name` FROM `guilds` WHERE id = '".. GuildID .."'")
	if(Query:getID() == -1) then
		return nil
	end
	local Result = Query:getDataString("name")
	Query:free()
	return Result
end

function seachGuildInStorages(FirstGuildID, SecondGuildID)
	for i = 1, #WarConfigs["WarFirstGuildID"] do
		if getGlobalStorageValue(WarConfigs["WarFirstGuildID"][i]) > 0 then
			if FirstGuildID == getGlobalStorageValue(WarConfigs["WarFirstGuildID"][i]) and SecondGuildID == getGlobalStorageValue(WarConfigs["WarSecondGuildID"][i]) then
				return i
			end
		end
	end
	return false
end

function getCountPlayesHaveInWar(EntryID)
	return {getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerCount"][EntryID]), getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerCount"][EntryID])}
end

function getOnlineGuildMembers(GuildID, RankIDS)
	if not RankIDS then
		RankIDS = {1, 2, 3}
	end
	local GuildMembers = {}
	for _, pid in pairs(getPlayersOnline()) do
		if getPlayerGuildId(pid) == GuildID then
			if isInArray(RankIDS, getPlayerGuildLevel(pid)) then
				table.insert(GuildMembers, pid)
			end
		end
	end
	return GuildMembers
end

function checkWarCitysIps(GuildID)
	local IPS = {}
	for i, pid in ipairs(getOnlineGuildMembers(GuildID)) do
		local PlayerIP = getPlayerIp(pid)
		if #IPS > 0 then
			for k = 1, #IPS do
				if PlayerIP == IPS[k] then
					AddIPList = false
					break
				end
				AddIPList = true
			end
			if AddIPList then
				table.insert(IPS, PlayerIP)
			end
		else
			table.insert(IPS, PlayerIP)
		end
	end
	if WarConfigs.WarNeedDiferentIps > #IPS then
		return false
	else
		return true
	end
end

function resetArenaAllStats(EntryID)
	local Configs = {"WarArenaStorage", "WarAcceptTimeArena", "WarFirstGuildID", "WarSecondGuildID", "WarMaxPlayerValue", "WarFirstTeamPlayerCount", "WarSecondTeamPlayerCount", "WarFragsToFinish", "WarUltimateExplosion", "WarAreaRunes", "WarFirstTeamPlayerDeathsCount", "WarSecondTeamPlayerDeathsCount", "WarMinutesInactive", "WarTeamInactive", "WarCanceledCity", "WarDontSSAMight", "WarLimitFrontLine", "WarFirstTeamFrontCount", "WarSecondTeamFrontCount"}
	for i = 1, #Configs do
		setGlobalStorageValue(WarConfigs[Configs[i]][EntryID], 0)
	end
end

function resetAllCityWarStats()
	for i = 1, #WarConfigs["WarArenaStorage"] do
		resetArenaAllStats(i)
	end
end

function warBroadcastGuild(GuildID, MSGTYPE, MSG, GuildRankIDs)
	for _, pid in pairs(getOnlineGuildMembers(GuildID, GuildRankIDs)) do
		doPlayerSendTextMessage(pid, MSGTYPE, MSG)
	end
end

function checkActiveWarInGuildAndEntryID(GuildID)
	for i = 1, #WarConfigs["WarArenaStorage"] do
		if getGlobalStorageValue(WarConfigs["WarArenaStorage"][i]) > 0 then
			if getGlobalStorageValue(WarConfigs["WarFirstGuildID"][i]) == GuildID then
				return {i, 1}
			elseif getGlobalStorageValue(WarConfigs["WarSecondGuildID"][i]) == GuildID then
				return {i, 2}
			end
		end
	end
	return false
end

function checkActiveWarInGuild(GuildID)
	for i = 1, #WarConfigs["WarArenaStorage"] do
		if getGlobalStorageValue(WarConfigs["WarArenaStorage"][i]) > 0 then
			if getGlobalStorageValue(WarConfigs["WarFirstGuildID"][i]) == GuildID or getGlobalStorageValue(WarConfigs["WarSecondGuildID"][i]) == GuildID then
				return true
			end
		end
	end
	return false
end

function checkActiveInviteInGuild(GuildID)
	for i = 1, #WarConfigs["WarAcceptTimeArena"] do
		if getGlobalStorageValue(WarConfigs["WarAcceptTimeArena"][i]) > os.time() then
			if getGlobalStorageValue(WarConfigs["WarFirstGuildID"][i]) == GuildID then
				return true
			end
		end
	end
	return false
end

function warSetOptions(EntryID, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, Param9, Param10)
	if not ResetStats then
		ResetStats = false
	end
	setGlobalStorageValue(WarConfigs["WarArenaStorage"][EntryID], Param1)
	setGlobalStorageValue(WarConfigs["WarAcceptTimeArena"][EntryID], Param2)
	setGlobalStorageValue(WarConfigs["WarFragsToFinish"][EntryID], Param3)
	if Param4 == "disabled" then
		setGlobalStorageValue(WarConfigs["WarUltimateExplosion"][EntryID], 1)
	end
	if Param5 == "disabled" then
		setGlobalStorageValue(WarConfigs["WarAreaRunes"][EntryID], 1)
	end
	if Param6 == "enabled" then
		setGlobalStorageValue(WarConfigs["WarDontSSAMight"][EntryID], 1)
	end
	setGlobalStorageValue(WarConfigs["WarMaxPlayerValue"][EntryID], Param7)
	if Param8 == "enabled" then
		setGlobalStorageValue(WarConfigs["WarLimitFrontLine"][EntryID], 1)
	end
	setGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID], Param9)
	setGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID], Param10)
end

function checkInvitationsAccepted()
	for i = 1, #WarConfigs["WarArenaStorage"] do
		if getGlobalStorageValue(WarConfigs["WarArenaStorage"][i]) == 0 and getGlobalStorageValue(WarConfigs["WarAcceptTimeArena"][i]) < os.time() then
			resetArenaAllStats(i)
		end
	end
end

function removeStoragesToShutDown()
	for _, pid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(pid, WarConfigs.WarPlayerJoined) == 1 then
			doPlayerSetStorageValue(pid, WarConfigs.WarPlayerJoined)
			doPlayerSetStorageValue(pid, WarConfigs.WarSSAMight)
			doPlayerSetStorageValue(pid, WarConfigs.WarUEDisabled)
			doPlayerSetStorageValue(pid, WarConfigs.WarAreaRunesDisabled)
			doPlayerSetStorageValue(pid, WarConfigs.WarUrgentExit, 1)
		end
	end
end

function checkToEnterWarArena(TeamID, EntryID)
	if getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerCount"][EntryID]) < getGlobalStorageValue(WarConfigs["WarMaxPlayerValue"][EntryID]) and TeamID == 1 or getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerCount"][EntryID]) < getGlobalStorageValue(WarConfigs["WarMaxPlayerValue"][EntryID]) and TeamID == 2 then
		return true
	else
		return false
	end
end

function checkFrontLine(cid, TeamID, EntryID)
	if getGlobalStorageValue(WarConfigs["WarLimitFrontLine"][EntryID]) < 1 or isInArray({1, 2, 5, 6}, getPlayerVocation(cid)) then
		return true
	else
		if getGlobalStorageValue(WarConfigs["WarFirstTeamFrontCount"][EntryID]) <= WarConfigs.WarMaxFrontLine and TeamID == 1 or getGlobalStorageValue(WarConfigs["WarSecondTeamFrontCount"][EntryID]) <= WarConfigs.WarMaxFrontLine and TeamID == 2 then
			return true
		else
			return false
		end	
	end
end

function doAddPlayersCountInArena(TeamID, EntryID)
	if TeamID == 1 then
		setGlobalStorageValue(WarConfigs["WarFirstTeamPlayerCount"][EntryID], getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerCount"][EntryID]) + 1)
	else
		setGlobalStorageValue(WarConfigs["WarSecondTeamPlayerCount"][EntryID], getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerCount"][EntryID]) + 1)
	end
end

function doRemovePlayersCountInArena(TeamID, EntryID)
	if TeamID == 1 then
		setGlobalStorageValue(WarConfigs["WarFirstTeamPlayerCount"][EntryID], getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerCount"][EntryID]) - 1)
	else
		setGlobalStorageValue(WarConfigs["WarSecondTeamPlayerCount"][EntryID], getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerCount"][EntryID]) - 1)
	end
end

function doAddFrontCountInArena(TeamID, EntryID)
	if TeamID == 1 then
		setGlobalStorageValue(WarConfigs["WarFirstTeamFrontCount"][EntryID], getGlobalStorageValue(WarConfigs["WarFirstTeamFrontCount"][EntryID]) + 1)
	else
		setGlobalStorageValue(WarConfigs["WarSecondTeamFrontCount"][EntryID], getGlobalStorageValue(WarConfigs["WarSecondTeamFrontCount"][EntryID]) + 1)
	end
end

function doRemoveFrontCountInArena(TeamID, EntryID)
	if TeamID == 1 then
		setGlobalStorageValue(WarConfigs["WarFirstTeamFrontCount"][EntryID], getGlobalStorageValue(WarConfigs["WarFirstTeamFrontCount"][EntryID]) - 1)
	else
		setGlobalStorageValue(WarConfigs["WarSecondTeamFrontCount"][EntryID], getGlobalStorageValue(WarConfigs["WarSecondTeamFrontCount"][EntryID]) - 1)
	end
end

function sendWarFinishResults(EntryID)
	if getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) < getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) then
		warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Seu time ganhou e matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) ..", o time inimigo matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) ..".")
		warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Seu time perdeu e matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) ..", o time inimigo matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) ..".")
	elseif getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) > getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) then
		warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Seu time ganhou e matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) ..", o time inimigo matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) ..".")
		warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Seu time perdeu e matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) ..", o time inimigo matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) ..".")
	else
		warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Nenhuma equipe ganhou esta guerra, porque houve um empate, sua equipe matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) .." tempo, e o Advers·rio AlianÁa morto ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) .." times.")
		warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Nenhuma equipe ganhou esta guerra, porque houve um empate, sua equipe mato ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) .." tempo, e o Advers·rio AlianÁa morto ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) .." times.")
	end
end

function executeFinishWar(EntryID, ForTime)
	if getGlobalStorageValue(WarConfigs["WarArenaStorage"][EntryID]) ~= 0 then
		if not ForTime then
			ForTime = false
		end
		if ForTime then
			if getGlobalStorageValue(WarConfigs["WarArenaStorage"][EntryID]) > os.time() then
				return true
			end
		end
		for _, pid in pairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid, WarConfigs.WarPlayerJoined) == 1 then
				if getPlayerGuildId(pid) == getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]) or getPlayerGuildId(pid) == getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]) then
					doPlayerSetStorageValue(pid, WarConfigs.WarPlayerJoined)
					doPlayerSetStorageValue(pid, WarConfigs.WarSSAMight)
					doPlayerSetStorageValue(pid, WarConfigs.WarUEDisabled)
					doPlayerSetStorageValue(pid, WarConfigs.WarAreaRunesDisabled)
					doPlayerSetPzLocked(pid, false)
					if getCreatureSkullType(pid) == 3 then
						doCreatureSetSkullType(pid, 0)
					end
					doSendMagicEffect(getCreaturePosition(pid), CONST_ME_POFF)
					doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
					doSendMagicEffect(getTownTemplePosition(getPlayerTown(pid)), CONST_ME_TELEPORT)
				end
			end
		end
		sendWarFinishResults(EntryID)
		resetArenaAllStats(EntryID)
	end
end

function doInitWar(EntryID)
	setGlobalStorageValue(WarConfigs["WarArenaStorage"][EntryID], WarConfigs.WarLimitTime + os.time())
	warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Sua AlianÁa ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID])) .." est· em guerra, Para participar neste tipo de guerra, digite !citywar go ou /citywar go")
	warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_INFO_DESCR, "Sua AlianÁa ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID])) .." est· em guerra, Para participar neste tipo de guerra, digite !citywar go ou /citywar go")
	addEvent(executeFinishWar, WarConfigs.WarLimitTime * 1000, EntryID, true)
end

function checkActiveWars()
	for i = 1, #WarConfigs["WarArenaStorage"] do
		if getGlobalStorageValue(WarConfigs["WarArenaStorage"][i]) ~= 0 then
			ArenaOnline = getCountPlayesHaveInWar(i)
			if getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) == 0 then
				if ArenaOnline[1] == 0 and ArenaOnline[2] == 0 then
					setGlobalStorageValue(WarConfigs["WarTeamInactive"][i], 3)
					setGlobalStorageValue(WarConfigs["WarMinutesInactive"][i], getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) + 1)
				elseif ArenaOnline[1] == 0 and ArenaOnline[2] > 0 then
					setGlobalStorageValue(WarConfigs["WarTeamInactive"][i], 1)
					setGlobalStorageValue(WarConfigs["WarMinutesInactive"][i], getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) + 1)
				elseif ArenaOnline[1] > 0 and ArenaOnline[2] == 0 then
					setGlobalStorageValue(WarConfigs["WarTeamInactive"][i], 2)
					setGlobalStorageValue(WarConfigs["WarMinutesInactive"][i], getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) + 1)
				end
			elseif getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) == 5 and getGlobalStorageValue(WarConfigs["WarTeamInactive"][i]) == 3 then
				executeFinishWar(i)
			elseif getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) > 0 and getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) < 10 then
				setGlobalStorageValue(WarConfigs["WarMinutesInactive"][i], getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) + 1)
			elseif getGlobalStorageValue(WarConfigs["WarMinutesInactive"][i]) == 10 then
				executeFinishWar(i)
			end
		end
	end
end

function deathInWarAntientrosa(cid)
	if getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) == 1 then
		doPlayerSetStorageValue(cid, WarConfigs.WarPlayerJoined)
		doPlayerSetStorageValue(cid, WarConfigs.WarUEDisabled)
		doPlayerSetStorageValue(cid, WarConfigs.WarSSAMight)
		doPlayerSetStorageValue(cid, WarConfigs.WarAreaRunesDisabled)
		--doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, WarConfigs.WarLossExpPercent)
		--doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, WarConfigs.WarLossSkillsPercent * 10)
		GetGuildAndEntryID = checkActiveWarInGuildAndEntryID(getPlayerGuildId(cid))
		EntryID = GetGuildAndEntryID[1]
		GuildTeam = GetGuildAndEntryID[2]
		doRemovePlayersCountInArena(GuildTeam, EntryID)
		if getGlobalStorageValue(WarConfigs["WarLimitFrontLine"][EntryID]) == 1 and isInArray({3, 4, 7, 8}, getPlayerVocation(cid)) then
			doRemoveFrontCountInArena(GuildTeam, EntryID)
		end
		if GuildTeam == 1 then
			setGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID], getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) + 1)
			warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_STATUS_CONSOLE_RED, "Outro membro de sua guild foi morto, os resultados atuais ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) .." jogadores, ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) .." jogador.")
			warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_STATUS_CONSOLE_BLUE, "Outro participante contra foi morto, os resultados atuais ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) .." jogadores, ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) .." jogadores.")
		else
			setGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID], getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) + 1)
			warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_STATUS_CONSOLE_BLUE, "Outro participante contra foi morto, os resultados atuais ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) .." jogadores, ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) .." jogadores.")
			warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_STATUS_CONSOLE_RED, "Outro participante da sua AlianÁa foi morto, os resultados atuais ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) .." jogadores, ".. getGuildNameByID(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID])) .." matou ".. getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) .." jogadores.")
		end
		if getGlobalStorageValue(WarConfigs["WarFirstTeamPlayerDeathsCount"][EntryID]) == getGlobalStorageValue(WarConfigs["WarFragsToFinish"][EntryID]) or getGlobalStorageValue(WarConfigs["WarSecondTeamPlayerDeathsCount"][EntryID]) == getGlobalStorageValue(WarConfigs["WarFragsToFinish"][EntryID]) then
			executeFinishWar(EntryID)
		end
	end
	return true
end

function doPlayerWarUrgentExit(cid)
	doPlayerSetStorageValue(cid, WarConfigs.WarPlayerJoined)
	doPlayerSetStorageValue(cid, WarConfigs.WarUrgentExit)
	doPlayerSetStorageValue(cid, WarConfigs.WarUEDisabled)
	doPlayerSetStorageValue(cid, WarConfigs.WarSSAMight)
	doPlayerSetStorageValue(cid, WarConfigs.WarAreaRunesDisabled)
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	doSendMagicEffect(getTownTemplePosition(getPlayerTown(cid)), CONST_ME_TELEPORT)
end

function doPlayerExitArena(cid)
	if getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) == 1 then
		doPlayerSetStorageValue(cid, WarConfigs.WarPlayerJoined)
		doPlayerSetStorageValue(cid, WarConfigs.WarUEDisabled)
		doPlayerSetStorageValue(cid, WarConfigs.WarSSAMight)
		doPlayerSetStorageValue(cid, WarConfigs.WarAreaRunesDisabled)
		GetGuildAndEntryID = checkActiveWarInGuildAndEntryID(getPlayerGuildId(cid))
		if not GetGuildAndEntryID then
			doPlayerWarUrgentExit(cid)
		end
		EntryID = GetGuildAndEntryID[1]
		GuildTeam = GetGuildAndEntryID[2]
		doRemovePlayersCountInArena(GuildTeam, EntryID)
		if getGlobalStorageValue(WarConfigs["WarLimitFrontLine"][EntryID]) == 1 and isInArray({3, 4, 7, 8}, getPlayerVocation(cid)) then
			doRemoveFrontCountInArena(GuildTeam, EntryID)
		end
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		doSendMagicEffect(getTownTemplePosition(getPlayerTown(cid)), CONST_ME_TELEPORT)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce Voltou para o templo!")
	else
		doPlayerWarUrgentExit(cid)
	end
end

function doTeleportToArena(cid, TeamID, EntryID)
	local frontLineVocations = {3, 4, 7, 8}
	if getGlobalStorageValue(WarConfigs["WarUltimateExplosion"][EntryID]) == 1 then
		doPlayerSetStorageValue(cid, WarConfigs.WarUEDisabled, 1)
	end
	if getGlobalStorageValue(WarConfigs["WarAreaRunes"][EntryID]) == 1 then
		doPlayerSetStorageValue(cid, WarConfigs.WarAreaRunesDisabled, 1)
	end
	if getGlobalStorageValue(WarConfigs["WarDontSSAMight"][EntryID]) == 1 then
		doPlayerSetStorageValue(cid, WarConfigs.WarSSAMight, 1)
	end
	if getGlobalStorageValue(WarConfigs["WarLimitFrontLine"][EntryID]) == 1 and isInArray(frontLineVocations, getPlayerVocation(cid)) then
		doAddFrontCountInArena(TeamID, EntryID)
	end
	doPlayerSetStorageValue(cid, WarConfigs.WarPlayerJoined, 1)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	doAddPlayersCountInArena(TeamID, EntryID)
	if getGlobalStorageValue(WarConfigs["WarTeamInactive"][EntryID]) == 3 then
		setGlobalStorageValue(WarConfigs["WarMinutesInactive"][EntryID], 0)
		setGlobalStorageValue(WarConfigs["WarTeamInactive"][EntryID], 0)
	end
	if TeamID == 1 then
		if getGlobalStorageValue(WarConfigs["WarTeamInactive"][EntryID]) == 1 then
			setGlobalStorageValue(WarConfigs["WarMinutesInactive"][EntryID], 0)
			setGlobalStorageValue(WarConfigs["WarTeamInactive"][EntryID], 0)
		end
		doTeleportThing(cid, WarConfigs.WarFirstGuildPos[EntryID])
		doSendMagicEffect(WarConfigs.WarFirstGuildPos[EntryID], CONST_ME_TELEPORT)
	else
		if getGlobalStorageValue(WarConfigs["WarTeamInactive"][EntryID]) == 2 then
			setGlobalStorageValue(WarConfigs["WarMinutesInactive"][EntryID], 0)
			setGlobalStorageValue(WarConfigs["WarTeamInactive"][EntryID], 0)
		end
		doTeleportThing(cid, WarConfigs.WarSecondGuildPos[EntryID])
		doSendMagicEffect(WarConfigs.WarSecondGuildPos[EntryID], CONST_ME_TELEPORT)
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce est· participando do ant entrosa, Equipe RealBaiak te deseja boa sorte.")
end

function executeEnterArena(cid, TeamID, EntryID)
	if not checkToEnterWarArena(TeamID, EntryID) then
		doPlayerSendCancel(cid, "Sua equipe est· cheio no momento tente novamente mais tarde.")
	elseif not checkFrontLine(cid, TeamID, EntryID) then
		doPlayerSendCancel(cid, "Sua equipe est· cheia de Front Line, tente novamente mais tarde.")
	else
		doTeleportToArena(cid, TeamID, EntryID)
	end
end

function executeCancelWarCity(PlayerName, EntryID, First, Minutes)
	if not Minutes then
		Minutes = WarConfigs.WarWaitTimeToCancel / 60
	end
	if First then
		setGlobalStorageValue(WarConfigs["WarCanceledCity"][EntryID], 1)
	end
	if getGlobalStorageValue(WarConfigs["WarArenaStorage"][EntryID]) ~= 0 and getGlobalStorageValue(WarConfigs["WarCanceledCity"][EntryID]) == 1 then
		if Minutes > 0 then
			warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarFirstGuildID"][EntryID]), MESSAGE_EVENT_ADVANCE, "A guerra foi cancelada por ".. PlayerName ..", e ser√° encerrada em ".. Minutes .." minutos")
			warBroadcastGuild(getGlobalStorageValue(WarConfigs["WarSecondGuildID"][EntryID]), MESSAGE_EVENT_ADVANCE, "A guerra foi cancelada por ".. PlayerName ..", e ser√° encerrada em ".. Minutes .." minutos")
			addEvent(executeCancelWarCity, 60 * 1000, PlayerName, EntryID, false, Minutes - 1)
		else
			executeFinishWar(EntryID)
		end
	end
end