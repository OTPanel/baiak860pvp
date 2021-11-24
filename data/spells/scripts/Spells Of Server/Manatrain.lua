function onCastSpell(cid, words)
local wait = 0.5 -- Tempo de exhaustion em segundos
local stor = 3711
local mana = -1420 -- Quanta mana vai gastar

if exhaustion.check(cid, stor) then
doPlayerSendCancel(cid, "") return false
elseif getPlayerMana(cid) < mana then
doPlayerSendCancel(cid, "") return false
end

doCreatureAddMana(cid, playermana)
doPlayerAddSpentMana(cid, getPlayerMana(cid))
doCreatureAddMana(cid,-2850)
exhaustion.set(cid, stor, wait)
doSendMagicEffect(getCreaturePos(cid), 11)
return false
end