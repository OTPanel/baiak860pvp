--REDBULL SYSTEM by: Gabriel Stocco--

local limite = 2500                 -- Limite para o player ficar de estômago cheio(deixe igual seu food.lua encontrado em data/actions/scripts)
local food = {[5880] = {120}}       -- [ID] do item usável(igual na tag acrescentada no actions.xml) = {Quantia que vai satisfazer o player}
local speedup = 700                 -- Valor que aumentará a speed do player(se sua speed base for 300, ao usar o item ficará 850)
local time = 30                      -- Tempo que vai ficar com a velocidade alterada, após o tempo volta ao normal



function onUse(cid, item, fromPosition, itemEx, toPosition)
    if exhaustion.check(cid, 23007) == false then
        exhaustion.set(cid, 23007, 10)
    else
        return doPlayerSendCancel(cid, "Beba outro em:  " ..exhaustion.get(cid, 23007).."segundos.")
    end

    if(food[item.itemid] ~= nil) then
    if(getPlayerFood(cid) + food[item.itemid][1]) >= limite then
        doPlayerSendCancel(cid, "Você está cheio.")
    else
        doPlayerFeed(cid, food[item.itemid][1] /99.7)
        doRemoveItem(item.uid, 1)
        doSendMagicEffect(getCreaturePosition(cid), 25)
        doSendAnimatedText(getCreaturePosition(cid), "REDBUUUULL", TEXTCOLOR_BLUE)
        doCreatureAddHealth(cid, 0+ food[item.itemid][1])
        doChangeSpeed(cid, speedup)
        addEvent(doChangeSpeed, time*1000,cid, -speedup)
    end
    end
end