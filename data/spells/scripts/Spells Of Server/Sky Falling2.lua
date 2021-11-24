local spellConfig = {
	{effect = CONST_ME_FIREATTACK,
	 area = createCombatArea({
		{1, 0, 1},
		{0, 2, 0},
		{0, 1, 0}})
	},
	{effect = CONST_ME_FIREAREA,
	 area = createCombatArea({
		{0, 1, 0, 0, 0},
		{1, 0, 0, 1, 0},
		{0, 0, 2, 0, 0},
		{0, 0, 1, 0, 1},
		{1, 0, 0, 1, 0}})
	},
	{effect = CONST_ME_FIREATTACK,
	 area = createCombatArea({
		{0, 0, 1, 0, 1},
		{1, 0, 0, 0, 1},
		{0, 0, 2, 1, 0},
		{0, 1, 0, 0, 1},
		{1, 0, 1, 0, 0}})
	},
	{effect = CONST_ME_HITBYFIRE,
	 area = createCombatArea({
		{0, 0, 1, 0, 1},
		{1, 0, 0, 0, 1},
		{0, 0, 2, 1, 0},
		{0, 1, 0, 0, 1},
		{1, 0, 1, 0, 0}})
	},
	{effect = CONST_ME_FIREAREA,
	 area = createCombatArea({
		{0, 0, 1, 0, 1, 0, 0},
		{0, 0, 0, 0, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 0, 1, 2, 1, 0, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 0, 1, 0, 0, 0, 0},
		{0, 0, 1, 0, 1, 0, 0}})
	},
	{effect = CONST_ME_HITBYFIRE,
	 area = createCombatArea({
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 1, 0, 1, 0},
		{1, 0, 1, 0, 0, 0, 1},
		{0, 0, 0, 2, 1, 0, 0},
		{0, 1, 0, 0, 0, 0, 1},
		{1, 0, 0, 1, 0, 1, 0},
		{0, 0, 1, 0, 1, 0, 0}})
	},
	{effect = CONST_ME_FIREAREA,
	 area = createCombatArea({
		{0, 0, 1, 0, 1, 0, 0},
		{0, 1, 0, 1, 0, 1, 0},
		{1, 0, 1, 0, 0, 0, 1},
		{0, 0, 0, 2, 1, 0, 0},
		{0, 1, 0, 0, 0, 0, 1},
		{1, 0, 0, 1, 0, 1, 0},
		{0, 0, 1, 0, 1, 0, 0}})
	}
}

local combats = {}
for k, config in ipairs(spellConfig) do
	combats[k] = createCombatObject()
		onTargetTile = function(cid, pos)
			local basePos = getThingPosition(cid)
			local fromPos = {x=basePos.x-6, y=basePos.y-8, z=basePos.z}
			doSendDistanceShoot(fromPos, pos, CONST_ANI_FIRE)
		end
		setCombatCallback(combats[k], CALLBACK_PARAM_TARGETTILE, "onTargetTile")
		setCombatParam(combats[k], COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
		setCombatParam(combats[k], COMBAT_PARAM_EFFECT, config.effect)
		setCombatFormula(combats[k], COMBAT_FORMULA_LEVELMAGIC, -0.593, -50, -0.929, -100)
		setCombatArea(combats[k], config.area)
end

local function castingSpellTime(p)
	if(isCreature(p[1]) == TRUE) then
		doCombat(unpack(p))
	end
end
function onCastSpell(cid, var)
	for k, combat in ipairs(combats) do
		addEvent(castingSpellTime, (250*k), {cid, combat, var})
	end
	return true
end