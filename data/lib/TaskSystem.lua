if not TaskSystem then
	TaskSystem = {}

	TaskSystem.list = {

		[1] = {name = "Dragon Lord", creatures = {"dragon lord","donate dragon lord","dragon lord vip","Castle Dragon Lord"}, storage = 2312111, count = 15000, exp = 7000000, money = 50000000, rewards = {}},
		[2] = {name = "Frost Dragon", creatures = {"frost dragon","donate frost dragon","frost dragon vip","Castle Frost Dragon"}, storage = 2312112, count = 15000, exp = 7000000, money = 50000000, rewards = {}},
		[3] = {name = "Grim Reaper", creatures = {"grim reaper","donate grim reaper","grim reaper vip"}, storage = 2312113, count = 12000, exp = 9000000, money = 70000000, rewards = {}},
		[4] = {name = "Medusa", creatures = {"medusa","donate medusa","medusa vip"}, storage = 2312129, count = 25000, exp = 9500000, money = 70000000, rewards = {}},
		[5] = {name = "Hydra", creatures = {"hydra","donate hydra","hydra vip","Castle Hydra","hydra supervip"}, storage = 2312130, count = 15000, exp = 7000000, money = 50000000, rewards = {}},
		[6] = {name = "Warlock", creatures = {"warlock","donate warlock","warlock vip","Castle Warlock", "donate warlock", "warlock supervip"}, storage = 2312114, count = 15000, exp = 10000000, money = 80000000, rewards = {}},
		[7]  = {name = "Demon", creatures = {"demon","donate demon","demon vip","castle demon"}, storage = 2312115, count = 50000, exp = 15000000, money = 500000000, rewards = {{12289,1}}},
		[8] = {name = "Serpent Spawn", creatures = {"serpent spawn","serpent spawn vip"}, storage = 2312116, count = 5000, exp = 9000000, money = 50000000, rewards = {{7440,1}}},
		[9] = {name = "Nightstalker Force", creatures = {"nightstalker force"}, storage = 2312117, count = 17500, exp = 10000000, money = 70000000, rewards = {{5957,1}}},
		[10] = {name = "Shrek Warrior", creatures = {"shrek warrior"}, storage = 2312119, count = 17500, exp = 8000000, money = 70000000, rewards = {{7440,1}}},
		[11] = {name = "Primal Shaman", creatures = {"primal shaman","Donate Primal Shaman"}, storage = 2312120, count = 7500, exp = 8500000, money = 80000000, rewards = {{5957,1}}},
		[12] = {name = "Primal Guard", creatures = {"primal guard"}, storage = 2312121, count = 7500, exp = 8500000, money = 80000000, rewards = {{5957,1}}},
		[13] = {name = "Donate Werewolf", creatures = {"donate werewolf","werewolf"}, storage = 2312122, count = 7500, exp = 8500000, money = 80000000, rewards = {{5957,1}}},
		[14] = {name = "Hurricane", creatures = {"hurricane"}, storage = 2312123, count = 7500, exp = 8500000, money = 80000000, rewards = {{5957,1}}},
		[15] = {name = "Tanoris", creatures = {"curse","tanoris charm","wind minion"}, storage = 2312124, count = 40000, exp = 20000000, money = 300000000, rewards = {{5957,1},{12289,1},{10310,1}}},
		[16] = {name = "Boss Stremoxy", creatures = {"boss stremoxy"}, storage = 2312125, count = 30, exp = 15000000, money = 200000000, rewards = {{5957,1}}},
		[17] = {name = "O Coisa", creatures = {"o coisa"}, storage = 2312126, count = 1, exp = 20000000, money = 200000000, rewards = {{5957,1}}},
		[18] = {name = "Alpha Tower", creatures = {"alpha tower"}, storage = 2312127, count = 10, exp = 9000000, money = 200000000, rewards = {{5957,1}}},
		[19] = {name = "Gonka", creatures = {"gonka"}, storage = 2312128, count = 1, exp = 5000000, money = 50000000, rewards = {{7440,1}}},
		[20] = {name = "Pandora", creatures = {"pandora"}, storage = 2312131, count = 1, exp = 25000000, money = 600000000, rewards = {{7440,1},{5957,1},{10310,1}}},
		[21] = {name = "Jabuti", creatures = {"jabuti","jabuti hatchling"}, storage = 2312140, count = 15000, exp = 6000000, money = 100000000, rewards = {{6527,5}}},
		[22] = {name = "Aladdin", creatures = {"aladdin"}, storage = 2312141, count = 6000, exp = 6000000, money = 100000000, rewards = {{6527,5}}},
		[23] = {name = "Ghalapago", creatures = {"ghalapago"}, storage = 2312142, count = 6000, exp = 6000000, money = 100000000, rewards = {{6527,5}}},
		[24] = {name = "Escaravelho", creatures = {"escaravelho"}, storage = 2312143, count = 6000, exp = 6000000, money = 100000000, rewards = {{6527,5}}},
		[25] = {name = "Instance", creatures = {"dark cleric","dark morfose"}, storage = 2312144, count = 20000, exp = 20000000, money = 600000000, rewards = {{6527,5}}},

	}

	

	TaskSystem.storages = {inMission = 722710}

	function TaskSystem:register(cid)
		registerCreatureEvent(cid, "Task System")
	end

	function TaskSystem:unregister(cid)
		unregisterCreatureEvent(cid, "Task System")
	end

	function TaskSystem:isInTask(cid)
		return getCreatureStorage(cid, self.storages.inMission) ~= EMPTY_STORAGE
	end

	function TaskSystem:getCurrentTask(cid)
		local storage = getCreatureStorage(cid, self.storages.inMission)
		if storage ~= EMPTY_STORAGE then
			return self.list[storage], storage
		end
		return false
	end

	function TaskSystem:getKills(cid, storage)
		return getPlayerStorageZero(cid, storage)
	end

	function TaskSystem:getCompletedTasks(cid)
		local count = 0
		for _, task in next, self.list do
			if getPlayerStorageZero(cid, task.storage) >= task.count then
				count = count + 1
			end
		end
		return count
	end

	function TaskSystem:getTasksList()
		local names = {}
		for _, task in next, self.list do
			table.insert(names, task.name)
		end
		return table.concat(names, ", ")
	end

	function TaskSystem:getTaskByName(name)
		for index, task in next, self.list do
			if task.name:lower() == name then
				return self.list[index], index
			end
		end
		return false
	end

	function TaskSystem:hasCompleted(cid, index)
		local task = self.list[index]
		return getPlayerStorageZero(cid, task.storage) >= task.count
	end

	function TaskSystem:startTask(cid, index)
		local task = self.list[index]
		doCreatureSetStorage(cid, self.storages.inMission, index)
		doCreatureSetStorage(cid, task.storage, 0)
		self:register(cid)
	end

	function TaskSystem:quit(cid, index)
		local task = self.list[index]
		doCreatureSetStorage(cid, task.storage, EMPTY_STORAGE)
		doCreatureSetStorage(cid, self.storages.inMission, EMPTY_STORAGE)
		self:unregister(cid)
	end

	function TaskSystem:getRewardString(index)
		local task = self.list[index]
		local rewardString = ""
		if task.money and task.money > 0 then
			rewardString = task.money .." gold coins, "
		end
		if task.exp and task.exp > 0 then
			rewardString = rewardString.. task.exp .." exp"
		end
		for _, reward in next, task.rewards do
			rewardString = rewardString..", ".. reward[2] .." ".. getItemNameById(reward[1])
		end
		return rewardString
	end

	function TaskSystem:finish(cid, index)
		local task = self.list[index]
		for _, reward in next, task.rewards do
			doPlayerAddItem(cid, reward[1], reward[2])
		end
		doPlayerAddMoney(cid, task.money)
		doPlayerAddExp(cid, task.exp)
		doCreatureSetStorage(cid, self.storages.inMission, EMPTY_STORAGE)
		self:unregister(cid)
		return self:getRewardString(index)
	end

	function TaskSystem:addKill(cid, index)
		local task = self.list[index]
		local kills = self:getKills(cid, task.storage) + 1
		if kills > task.count then
			doSendAnimatedText(getThingPos(cid), "Task Complete", COLOR_LIGHTGREEN)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Task System] Você completou a task de ".. task.name .."! Fale com o Grizzly Adams para pegar sua recompensa!")
		else
			doCreatureSetStorage(cid, task.storage, kills)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Task Sytem] Total de criaturas derrotadas: [".. kills .."/".. task.count .."] ".. task.name ..".")
		end
	end

	function TaskSystem:checkOnKill(cid, target, lastHit)
		if isMonster(target) and isPlayer(cid) and not isSummon(target) then
			local task, index = TaskSystem:getCurrentTask(cid)
			if task then
				if isInArray(task.creatures, getCreatureName(target):lower()) then
					self:addKill(cid, index)
				end
			end
		end
		return true
	end

	function TaskSystem:checkLogin(cid)
		if self:isInTask(cid) then
			self:register(cid)
		end
		return true
	end

end
