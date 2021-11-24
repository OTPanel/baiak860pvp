local config = {
  ["Behemoth"] = {
  loot = {{2663,4,1},{2656,4,1},{7730,4,1},{2202,4,1},{2640,4,1},{8849,4,1},{8926,4,1},{7407,4,1},{7450,4,1},{8911,4,1},{2534,4,1},{2157,50,50},{2157,25,100}},
  message = "Congratulation For Defeating Ferumbras,Your Reward is now in bag",
  effect = CONST_ME_SOUND_PURPLE,
  use_stats = false,
  chance_attr = {{'lifesteal',5,{3,7},{"melee","wand","dist"}},{'dodge',5,{1,5},{"armor"}}},
  animatedText = {COLOR_BLUE,"YA!"},
  SendToDepot = true,
  BagId = 9775
  },
}
--forgive this part V couldn't think of any better solution
function ItemInfo(array,item)
  for i = 1,#array do
  if(array[i] == "melee")then
  if getItemInfo(item).weaponType == WEAPON_SWORD or getItemInfo(item).weaponType == WEAPON_CLUB or getItemInfo(item).weaponType == WEAPON_AXE then
  return true
  end
  elseif(array[i] == "armor")then
  if getItemInfo(item).armor ~= 0 and getItemInfo(item).wieldPosition ~= CONST_SLOT_NECKLACE then
  return true
  end
  elseif(array[i] == "wand")then
  if getItemInfo(item).weaponType == WEAPON_WAND then
  return true
  end
  elseif(array[i] == "dist")then
  if getItemInfo(item).weaponType == WEAPON_DIST and getItemInfo(item).ammoType ~= 0 then
  return true
  end
  elseif(array[i] == "shield")then
  if getItemInfo(item).weaponType == WEAPON_SHIELD and getItemInfo(item).defense ~= 0 then
  return true
  end  
  elseif(array[i] == "all")then
  return true
  end
  end
  return false
end
--- info scanner End
 
function onKill(cid, target, damage, flags,war)
  if isPlayer(cid) and isMonster(target) then
  	local monster = config[getCreatureName(target)]
  	if monster then
  		local bag = doCreateItemEx(monster.BagId, 1)
  		for i = 1,#monster.loot do
  			if monster.loot[i][2] >= math.random(1,100) then -- random chance to get the item
  			local item = doAddContainerItem(bag, monster.loot[i][1],monster.loot[i][3])
      				if (monster.use_stats) then
         				for z = 1,#monster.chance_attr do
           					if(monster.chance_attr[z][2] >= math.random(1,100) and ItemInfo(monster.chance_attr[z][4], monster.loot[i][1]))then
             						doItemSetAttribute(item, monster.chance_attr[z][1], math.random(monster.chance_attr[z][3][1],monster.chance_attr[z][3][2])) -- add attribute
           					end
         				end
      				end
  			end
  		end
		if(getContainerItem(bag, 0).uid > 0)then -- check if the container has items or not
  			doSendMagicEffect(getThingPos(cid), monster.effect)
  			doSendAnimatedText(getThingPos(cid), monster.animatedText[2],monster.animatedText[1])
  			if monster.SendToDepot then
  				doPlayerSendMailByName(getCreatureName(cid), bag, getPlayerTown(cid), "Admin") -- send to depot
  			else
  				doPlayerAddItemEx(cid, bag,true) -- send to bag
  			end
  		doPlayerSendTextMessage(cid, 25, monster.message)
 		else
  			doPlayerSendTextMessage(cid, 25, "Better Luck Next Time,You Got No Reward.")
  		end
  	end
  end
  return true
end