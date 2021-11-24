local cfg = {
    upgrade = {
        message = 'Upgrade!',
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
[8302] = {tier = 1, upgraderType = 'key', chance = 100,
        items = {
        [12655] = {success = 12629, fail = 12655}, -- +1
        [12629] = {success = 12661, fail = 12655}, -- +2
		[12661] = {success = 12662, fail = 12629}, -- +3
		[12662] = {success = 12663, fail = 12661}, -- +4
		[12663] = {success = 12664, fail = 12662}, -- +5
		[12664] = {success = 12665, fail = 12663}, -- +6 Final Wand
		[12654] = {success = 12680, fail = 12654}, -- +1
        [12680] = {success = 12681, fail = 12654}, -- +2
		[12681] = {success = 12682, fail = 12680}, -- +3
		[12682] = {success = 12683, fail = 12681}, -- +4
		[12683] = {success = 12684, fail = 12682}, -- +5
		[12684] = {success = 12685, fail = 12683}, -- +6 Final Sling Shot
		[2390] = {success = 12674, fail = 2390}, -- +1
        [12674] = {success = 12675, fail = 2390}, -- +2
		[12675] = {success = 12676, fail = 12674}, -- +3
		[12676] = {success = 12677, fail = 12675}, -- +4
		[12677] = {success = 12678, fail = 12676}, -- +5
		[12678] = {success = 12679, fail = 12677}, -- +6 Final Sword
		[2444] = {success = 12686, fail = 2444}, -- +1
        [12686] = {success = 12687, fail = 2444}, -- +2
		[12687] = {success = 12688, fail = 12686}, -- +3
		[12688] = {success = 12689, fail = 12687}, -- +4
		[12689] = {success = 12690, fail = 12688}, -- +5
		[12690] = {success = 12691, fail = 12689}, -- +6 Final Club
		[8925] = {success = 12692, fail = 8925}, -- +1
        [12692] = {success = 12693, fail = 8925}, -- +2
		[12693] = {success = 12694, fail = 12692}, -- +3
		[12694] = {success = 12695, fail = 12693}, -- +4
		[12695] = {success = 12696, fail = 12694}, -- +5
		[12696] = {success = 12697, fail = 12695} -- +6 Final Axe
        }
    },
[8303] = {tier = 2, upgraderType = 'key', chance = 45,
        items = {
        [12655] = {success = 12629, fail = 12655}, -- +1
        [12629] = {success = 12661, fail = 12655}, -- +2
		[12661] = {success = 12662, fail = 12629}, -- +3
		[12662] = {success = 12663, fail = 12661}, -- +4
		[12663] = {success = 12664, fail = 12662}, -- +5
		[12664] = {success = 12665, fail = 12663}, -- +6 Final Wand
		[12654] = {success = 12680, fail = 12654}, -- +1
        [12680] = {success = 12681, fail = 12654}, -- +2
		[12681] = {success = 12682, fail = 12680}, -- +3
		[12682] = {success = 12683, fail = 12681}, -- +4
		[12683] = {success = 12684, fail = 12682}, -- +5
		[12684] = {success = 12685, fail = 12683}, -- +6 Final Sling Shot
		[2390] = {success = 12674, fail = 2390}, -- +1
        [12674] = {success = 12675, fail = 2390}, -- +2
		[12675] = {success = 12676, fail = 12674}, -- +3
		[12676] = {success = 12677, fail = 12675}, -- +4
		[12677] = {success = 12678, fail = 12676}, -- +5
		[12678] = {success = 12679, fail = 12677}, -- +6 Final Sword
		[2444] = {success = 12686, fail = 2444}, -- +1
        [12686] = {success = 12687, fail = 2444}, -- +2
		[12687] = {success = 12688, fail = 12686}, -- +3
		[12688] = {success = 12689, fail = 12687}, -- +4
		[12689] = {success = 12690, fail = 12688}, -- +5
		[12690] = {success = 12691, fail = 12689}, -- +6 Final Club
		[8925] = {success = 12692, fail = 8925}, -- +1
        [12692] = {success = 12693, fail = 8925}, -- +2
		[12693] = {success = 12694, fail = 12692}, -- +3
		[12694] = {success = 12695, fail = 12693}, -- +4
		[12695] = {success = 12696, fail = 12694}, -- +5
		[12696] = {success = 12697, fail = 12695} -- +6 Final Axe
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
                    doTransformItem(itemEx.uid, upgradeid.success)
                else
					doTransformItem(itemEx.uid, upgradeid.fail)
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