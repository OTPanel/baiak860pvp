local cfg = {
    upgrade = {
        message = 'Parabéns pode aproveitar seu  item por 7 dias.',
        color   = TEXTCOLOR_YELLOW,
        effect  = CONST_ME_FIREWORK_RED
    },

    fail = {
        message  = 'Upgrade Failed.',
        talkType = TALKTYPE_MONSTER,
        effect   = CONST_ME_POFF
    }
}

local gear = {
[12706] = {tier = 1, upgraderType = 'key', chance = 100,
        items = {
            	[12667] = 12713, -- Ring Mage
            	[12668] = 12714, -- Ring Pali
				[12669] = 12715, -- Ring Kina
				[12644] = 12720, -- Bota Mage
				[12639] = 12719, -- Bota Pali
				[12649] = 12718, -- Bota Kina
				
        }
    }
}
	
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local tmp  = gear[item.itemid]
    local upgradeid = tmp and tmp.items[itemEx.itemid]
    local name = (itemEx.uid == 0) and 'this' or (itemEx.type > 1) and getItemPluralName(itemEx.uid) or (getItemArticle(itemEx.uid) ~= '') and (''.. getItemArticle(itemEx.uid) .. ' ' .. getItemName(itemEx.uid)) or getItemName(itemEx.uid)
        if upgradeid then
            if itemEx.type <= 1 then
                if math.random(100) <= tmp.chance then
                    doSendMagicEffect(toPosition, cfg.upgrade.effect)
                    doSendAnimatedText(toPosition, cfg.upgrade.message, cfg.upgrade.color)
                    doTransformItem(itemEx.uid, upgradeid)
                else
                    doCreatureSay(cid, cfg.fail.message, cfg.fail.talkType)
                    doSendMagicEffect(toPosition, cfg.fail.effect)
                end
                doRemoveItem(item.uid, 1)
            else
                doPlayerSendCancel(cid, 'You may only upgrade '.. name ..' 1 at a time.')
                doSendMagicEffect(toPosition, CONST_ME_POFF)
            end
        else
            doPlayerSendCancel(cid, 'You are unable to upgrade '.. name ..' with a tier '.. tmp.tier .. ' '.. tmp.upgraderType ..'.')
            doSendMagicEffect(toPosition, CONST_ME_POFF)
        end
    return true
end