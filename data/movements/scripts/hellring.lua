local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition, CONDITION_PARAM_STAT_MAXHEALTH, 1500)


function onEquip(cid, item, slot)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você equipou o hell ring e recebeu um bonus de 1500 de hp...")
doAddCondition(cid, condition)
doSendMagicEffect(getCreaturePos(cid), 10)
return true
end


function onDeEquip(cid, item, slot)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você retirou o hell ring e perdeu seu bonus..")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
return true
end