local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local npcName = getCreatureName(getNpcId())
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) NpcSystem.parseParameters(npcHandler, cid); npcHandler:onCreatureSay(cid, type, msg) end
function onPlayerCloseChannel(cid) npcHandler:onPlayerCloseChannel(cid) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local currentTask, index = TaskSystem:getCurrentTask(cid)
	if currentTask then
		if TaskSystem:hasCompleted(cid, index) then
			npcHandler:setMessage(MESSAGE_GREET, "Olá "..getCreatureName(cid)..", parece que você completou a tak de ".. currentTask.name .."! Você quer receber seu {premio} agora?", cid)
		else
			npcHandler:setMessage(MESSAGE_GREET, "Olá "..getCreatureName(cid)..", como está indo sua task de ".. currentTask.name .."? Pelo que estou vendo você já matou [".. TaskSystem:getKills(cid, currentTask.storage) .."/".. currentTask.count .."] deles, mas se quiser você pode {desistir} para começar uma nova task.", cid)
  		end
  	else
  		npcHandler:setMessage(MESSAGE_GREET, "Olá "..getCreatureName(cid)..", você quer começar uma {task}? Cada uma te dá premios em exp, dinheiro e itens e se você completar todas ganha um super premio no final! Você já completou ".. TaskSystem:getCompletedTasks(cid) .." de ".. #TaskSystem.list .." tasks.", cid)
  	end
  	talkState[cid] = 1
  	return true
end

local function farewellCallback(cid)
  	npcHandler:setMessage(MESSAGE_FAREWELL, "Até mais, "..getCreatureName(cid).."! Continue completando tasks para ficar mais forte!")
  	return true
end
 
local function creatureSayCallback(cid, type, msg)
  	if not npcHandler:isFocused(cid) then
    	return false
  	end

	msg = string.lower(msg) 

	if isInArray({"task"}, msg) and talkState[cid] == 1 then
		if not TaskSystem:isInTask(cid) then
			npcHandler:say("As tasks disponíveis são: {".. TaskSystem:getTasksList() .."}. Qual você deseja fazer?", cid)
			talkState[cid] = 2
		else
			npcHandler:say("Você já está fazendo uma task... Se quiser começar outra você deve completar sua task atual ou {desistir} dela.", cid)
		end

	elseif talkState[cid] == 2 then
		local task, index = TaskSystem:getTaskByName(msg)
		if task then
			if not TaskSystem:hasCompleted(cid, index) then
				TaskSystem:startTask(cid, index)
				npcHandler:say("Muito bem, você começou a task de ".. task.name ..". Você precisa matar ".. task.count .." monstros. Os monstros que contam são: {".. table.concat(task.creatures, ", ") .."}. Use {!task} para ver mais informações, boa sorte!", cid)
			else
				npcHandler:say("Você já completou esta task e só pode fazer uma vez cada. Por favor, escolha outra.", cid)
			end
		else
			npcHandler:say("Esta task não existe...", cid)
		end

	elseif isInArray({"desistir", "give up", "quit"}, msg) and talkState[cid] == 1 then
		local task = TaskSystem:getCurrentTask(cid)
		if task then
			npcHandler:say("Você quer desistir da task de ".. task.name .."?", cid)
			talkState[cid] = 3
		else
			npcHandler:say("Você não está fazendo nenhuma task no momento. Me avise se quiser inicar uma {task}.", cid)
		end

	elseif agreeNPC(msg) and talkState[cid] == 3 then
		local task, index = TaskSystem:getCurrentTask(cid)
		if task then
			TaskSystem:quit(cid, index)
			npcHandler:say("Certo... você desistiu da task de ".. task.name ..". Me avise se quiser começar uma nova {task}.", cid)
			talkState[cid] = 1
		else
			npcHandler:say("Você não está fazendo nenhuma task no momento. Me avise se quiser inicar uma {task}.", cid)
		end

	elseif disagreeNPC(msg) and talkState[cid] == 3 then
		npcHandler:say("Muito bem, nunca desista!", cid)
		talkState[cid] = 1

	elseif isInArray({"premio", "reward"}, msg) and talkState[cid] == 1 then
		local task, index = TaskSystem:getCurrentTask(cid)
		if task then
			if TaskSystem:hasCompleted(cid, index) then
				local rewards = TaskSystem:finish(cid, index)
				npcHandler:say("Parabéns! Você completou a task de ".. task.name .." e seu premio foi: ".. rewards ..". Agora você já completou ".. TaskSystem:getCompletedTasks(cid).. " de ".. #TaskSystem.list ..", continue completando para receber o súper premio!", cid)
			else
				npcHandler:say("Você ainda não completou essa task... Você matou ".. TaskSystem:getKills(cid, task.storage) .." de ".. task.count .." ".. task.name ..". Volte aqui quando terminar.", cid)
			end
		else
			npcHandler:say("Você não está fazendo nenhuma {task} no momento... Me avise se quiser iniciar uma.", cid)
		end

	end
	return true 
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_FAREWELL, farewellCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
