local config = {
	removeOnUse = "false",
	usableOnTarget = "yes", -- can be used on target? (fe. healing friend)
	splashable = "no",
	realAnimation = "yes", -- make text effect visible only for players in range 1x1
	healthMultiplier = 1.4,
	manaMultiplier = 1.7
}

local bonus = 0.98

config.removeOnUse = getBooleanFromString(config.removeOnUse)
config.usableOnTarget = getBooleanFromString(config.usableOnTarget)
config.splashable = getBooleanFromString(config.splashable)
config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
	[8704] = {empty = 7636, splash = 2, percentHealth = 2 * bonus, percentMana = 0, health = {50, 100}}, -- small health potion
	[7618] = {empty = 7636, splash = 2, percentHealth = 3 * bonus, percentMana = 0, health = {250, 450}}, -- health potion
	[7588] = {empty = 7634, splash = 2, percentHealth = 4 * bonus, percentMana = 0, health = {200, 400}, level = 1, vocations = {3, 4, 7, 8, 11, 12}, vocStr = "knights and paladins"}, -- strong health potion
	[7591] = {empty = 7635, splash = 2, percentHealth = 10 * bonus, percentMana = 0, health = {500, 700}, level = 1, vocations = {4, 8, 12}, vocStr = "knights"}, -- great health potion
	[8473] = {empty = 7635, splash = 2, percentHealth = 30 * bonus, percentMana = 0, health = {850, 950}, level = 1, vocations = {4, 8, 12}, vocStr = "knights"}, -- ultimate health potion

	[7620] = {empty = 7636, splash = 7, percentHealth = 0, percentMana = 10, mana = {250, 400}, vocations = {4, 8, 12}, vocStr = "knights"}, -- mana potion
	[7589] = {empty = 7634, splash = 7, percentHealth = 0, percentMana = 4 * bonus, mana = {110, 190}, level = 1, vocations = {1, 2, 3, 5, 6, 7, 9, 10, 11}, vocStr = "sorcerers, druids and paladins"}, -- strong mana potion
	[7590] = {empty = 7635, splash = 7, percentHealth = 0, percentMana = 15 * bonus, mana = {955, 1130}, level = 1, vocations = {1, 2, 5, 6, 9, 10}, vocStr = "sorcerers and druids"}, -- great mana potion

	[8472] = {empty = 7635, splash = 3, percentMana = 6 * bonus, percentHealth = 18 * bonus, health = {310, 500}, mana = {600, 800}, level = 1, vocations = {3, 7, 11}, vocStr = "paladins"} -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

	if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then
		if(not config.splashable) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
		doTransformItem(item.uid, potion.empty)
		return true
	end

	if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(itemEx.uid, "Only " .. potion.vocStr .. (potion.level and (" of level " .. potion.level) or "") .. " or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return true
	end

	local health = potion.health
	
	--[[local added_health = math.ceil(((potion.percentHealth / 100) * getCreatureMaxHealth(cid) ) * config.healthMultiplier)
	added_health = potion.percentHealth == 0 and 0 or math.random(added_health - 80, added_health + 90)]]
	if health then
		local added_health = math.random(health[1], health[2])
		if(not doCreatureAddHealth(itemEx.uid, added_health)) then
			return false
		end
	end

	local mana = potion.mana
	--[[local added_mana = math.ceil(( (potion.percentMana / 100) * getCreatureMaxMana(cid) ) * config.manaMultiplier)
	added_mana = potion.percentMana == 0 and 0 or math.random(added_mana - 80, added_mana + 90)]]
	if mana then
		local added_mana = math.random(mana[1], mana[2])
		if(not doPlayerAddMana(itemEx.uid, added_mana)) then
			return false
		end
	end

	if isInArray({8704, 7618, 7588, 7591, 8473}, item.itemid) then
		doSendAnimatedText(getPlayerPosition(cid), "Ahhhh...", 180)
	elseif isInArray({7620, 7589, 7590, 8472}, item.itemid) then
		doSendAnimatedText(getPlayerPosition(cid), "Ahhhh...", 17)
	end
	doSendMagicEffect(getThingPos(itemEx.uid), 30)
	if realAnimation then
		for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
			end
		end
	end

	doAddCondition(cid, exhaust)
	if(not potion.empty or config.removeOnUse) then
		doRemoveItem(item.uid, 1)
		return true
	end
end