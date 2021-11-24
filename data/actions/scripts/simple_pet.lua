function onUse(cid, item, frompos, item2, topos)



local dolls = {

[8982] = {pet = "Dragon Pet"},

[10063] = {pet = "Frost Dragon Pet"},

[6567] = {pet = "Dragon Lord Pet"},

[12385] = {pet = "Panda Pet"},

[11387] = {pet = "Crystal Spider Pet"},

[11392] = {pet = "Cobra Pet"},

[11388] = {pet = "Guardian Pet"},

}

local go = dolls[item.itemid]

local summon = getCreatureSummons(cid)



---------------------------------------------------



if #summon >= 1 then

for _, pid in ipairs(summon) do

doRemoveCreature(pid)

doCreatureSay(cid, "Can go rest ["..go.pet.."]", TALKTYPE_ORANGE_1)

end

return true

end



doConvinceCreature(cid, doSummonCreature(go.pet, getCreaturePosition(cid)))

doCreatureSay(cid, "Let battle ["..go.pet.."]", TALKTYPE_ORANGE_1)

return true

end