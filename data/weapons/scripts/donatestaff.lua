local min, max = 870, 1000
local storage = 722656

local function getMinDamage(level, magLevel)
	local min = ((level * 1.05) + (magLevel * 1.00))
	local naturalDamage = math.random(-30,45)
	min = min + naturalDamage
	if min < 870 then
		min = 870
	end
	return math.floor(min)
end

local function getMaxDamage(level, magLevel)
	local max = ((level * 1.05) + (magLevel * 1.00))
	local naturalDamage = math.random(-20,45)
	max = max + naturalDamage
	if max < 1000 then
		max = 1000
	end
	return math.ceil(max)
end

local effects = {
	
	[10] = {dist = CONST_ANI_ICE, hit = CONST_ME_ICEATTACK, dmg = COMBAT_ICEDAMAGE},
	[11] = {dist = CONST_ANI_EARTH, hit = CONST_ME_CARNIPHILA, dmg = COMBAT_POISONDAMAGE},
	[12] = {dist = CONST_ANI_HOLY, hit = CONST_ME_HOLYDAMAGE, dmg = COMBAT_HOLYDAMAGE},
	[13] = {dist = CONST_ANI_ENERGYBALL, hit = CONST_ME_PURPLEENERGY, dmg = COMBAT_ENERGYDAMAGE},
	[14] = {dist = CONST_ANI_CAKE, hit = CONST_ME_CAKE, dmg = COMBAT_DROWNDAMAGE},
	[15] = {dist = CONST_ANI_FIRE, hit = CONST_ME_FIREATTACK, dmg = COMBAT_FIREDAMAGE},
	[16] = {dist = CONST_ANI_SUDDENDEATH, hit = CONST_ME_MORTAREA, dmg = COMBAT_DEATHDAMAGE}

}

function onUseWeapon(cid, var)
	local level, magLevel = getPlayerLevel(cid), getPlayerMagLevel(cid)
	local min, max = getMinDamage(level, magLevel), getMaxDamage(level, magLevel)

	local sto = getCreatureStorage(cid, storage)
	if not effects[sto] then
		sto = 14;
	end
	
	local target = variantToNumber(var)
	if isCreature(target) then
		doSendDistanceShoot(getThingPos(cid), getThingPos(target), effects[sto].dist)
		doAreaCombatHealth(cid, effects[sto].dmg, getThingPos(target), 0, -min, -max, effects[sto].hit)
	end
	return true
end
