local BOOST_SYSTEM_MONSTER_NAME_STORAGE = 12380
local BOOST_SYSTEM_LOOT_BONUS_STORAGE = 12381
local BOOST_SYSTEM_EXP_BONUS_STORAGE = 12382

local function addBonusLoot(cid, position, name)
  local check = false
  local corpse = nil

  for i = 0, 255 do
    position.stackpos = i
    corpse = getTileThingByPos(position)
    if corpse.uid > 0 and isCorpse(corpse.uid) then
      check = true 
      break
    end
  end

  if not check then 
    return 
  end

  
  local newRate = (1 + (getStorage(BOOST_SYSTEM_LOOT_BONUS_STORAGE) / 100)) * getConfigValue("rateLoot")
  local mainbp = doCreateItemEx(5949, 1)
  local monsterLoot = getMonsterLootList(name)

  local bonusString = ""

  for i, loot in pairs(monsterLoot) do
    if math.random(1, 100000) <= newRate * loot.chance then 
      local count = loot.countmax and math.random(1, loot.countmax) or 1
      doAddContainerItem(mainbp, loot.id, count)
      bonusString = bonusString .. count .. " " .. getItemInfo(loot.id).name .. ", "
    end
  end

  if bonusString ~= "" then
    if bonusString:sub(bonusString:len(), bonusString:len()) == "," then 
      bonusString = bonusString:sub(1, bonusString:len() - 1) .. "."
    end
    doAddContainerItemEx(corpse.uid, mainbp)  
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Loot bonus (" .. name .. "):  ".. bonusString ..".")
  end
end

function onKill(cid, target, lastHit)
  if not isMonster(target) then 
    return true
  end

  local bonusMonster = getStorage(BOOST_SYSTEM_MONSTER_NAME_STORAGE)
  local targetName = getCreatureName(target)
  if not targetName:lower():find(bonusMonster) then
    return true
  end

  local monsterExp = getMonsterInfo(targetName).experience
  local rate = getExperienceStage(getPlayerLevel(cid))
  local expBonus = getStorage(BOOST_SYSTEM_EXP_BONUS_STORAGE) 
  local exp = math.ceil((monsterExp * rate) * (expBonus / 100))
  doPlayerAddExperience(cid, exp)
  doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você recebeu " .. exp .. " a mais de exp de bônus por matar um " .. targetName .. " .")
  addEvent(addBonusLoot, 100, cid, getThingPos(target), targetName) 
  addEvent(doSendAnimatedText, 100, getThingPos(cid), "+" .. exp .. " exp", 19)
  return true
end

function onLogin(cid)
  registerCreatureEvent(cid, "monsterBoostKill")
  return true
end