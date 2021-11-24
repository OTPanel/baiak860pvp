local configs = {

    [8884] = {itemid = 5468, cost = 30000000}, -- Removedor de frags
    [8885] = {itemid = 7747, cost = 7000000}, -- War Sword
    [8886] = {itemid = 7753, cost = 7000000}, -- War Axe
    [8887] = {itemid = 7756, cost = 7000000}, -- War Club
    [8888] = {itemid = 2453, cost = 7000000}, -- War Staff
    [8889] = {itemid = 8854, cost = 7000000}, -- War Crossbow
    [9000] = {itemid = 9693, cost = 12000000}, -- Addon Doll
    [9001] = {itemid = 7488, cost = 30000000}, -- Stamina Potion
    [9007] = {itemid = 12575, cost = 80000000}, -- Dodge Stone
    [9008] = {itemid = 12396, cost = 80000000}, -- Critical Stone
	[9009] = {itemid = 5957, cost = 180000000}, -- Double Exp
	[9010] = {itemid = 8981, cost = 270000000}, -- Escritura de Cave
	[9011] = {itemid = 8932, cost = 14000000}, -- Alpha Sword
	[9012] = {itemid = 8929, cost = 14000000}, -- Alpha Club
	[9013] = {itemid = 8293, cost = 14000000}, -- Alpha Axe
	[9014] = {itemid = 7414, cost = 14000000}, -- Alpha Staff
	[9015] = {itemid = 7366, cost = 14000000} -- Alpha Star

}

function onUse(cid, item, fromPosition, itemEx, toPosition)

    local current = configs[item.actionid]
    if current then
        if canPlayerReceiveItem(cid, current.itemid, 1) then
            if doPlayerRemoveMoney(cid, current.cost) then
                doPlayerAddItem(cid, current.itemid, 1)
                doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
                doSendAnimatedText(fromPosition, "Comprado!", TEXTCOLOR_RED)
                doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
            else
                doCreatureSay(cid, "Ops, não tenho a grana!", TALKTYPE_ORANGE_1)
            end
        else
            doCreatureSay(cid, "Sem espaço!", TALKTYPE_ORANGE_1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não tem cap ou espaço na sua backpack o suficiente para comprar este item.")
        end
    end
	return true
end
