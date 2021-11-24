 local commonItems = {
  -- ITEMS ALL VOCS RECEIVE
  {itemid=2160, count=10}, -- 50k
  {itemid=2173, count=1}, -- aol
  {itemid=2789, count=50}, -- brown mushrooms
}

local firstItems = {
  { -- SORC ITEMS
    {itemid=7460, count=1}, -- spellbook of mind control
    {itemid=7735, count=1}, -- cajado do iniciante
    {itemid=7458, count=1}, -- hat of the mad
    {itemid=7463, count=1}, -- blue robe
    {itemid=7464, count=1}, -- blue legs
    {itemid=2641, count=1}, -- boh
    {itemid=7620, count=1}, -- mana potion
    {itemid=2268, count=1}, -- sd
    {itemid=7590, count=1}, -- great mana potions
  },
  { -- DRUID ITEMS
    {itemid=7460, count=1}, -- spellbook of mind control
    {itemid=7735, count=1}, -- cajado do iniciante
    {itemid=7458, count=1}, -- hat of the mad
    {itemid=7463, count=1}, -- blue robe
    {itemid=7464, count=1}, -- blue legs
    {itemid=2641, count=1}, -- boh
    {itemid=7620, count=1}, -- mana potion

    {itemid=2268, count=1}, -- sd
    {itemid=7590, count=1}, -- great mana potions
  },
  { -- PALADIN ITEMS
    {itemid=2517, count=1}, -- PvP shield
    {itemid=8850, count=1}, -- assassin star
    {itemid=9778, count=1}, -- PvP helmet
    {itemid=9776, count=1}, -- PvP armor
    {itemid=9777, count=1}, -- PvP legs
    {itemid=2641, count=1}, -- boh
    {itemid=7620, count=1}, -- mana potion
    {itemid=2268, count=1}, -- sd
    {itemid=8472, count=1}, -- spirit potion
  },
  { -- KNIGHT ITEMS
    {itemid=2517, count=1}, -- PvP shield
    {itemid=9778, count=1}, -- PvP helmet
    {itemid=9776, count=1}, -- PvP armor
    {itemid=9777, count=1}, -- PvP legs
    {itemid=2641, count=1}, -- boh
    {itemid=7620, count=1}, -- mana potions
    {itemid=8473, count=1}, -- ultimate health potion
    {itemid=10943, count=1}, -- machado do iniciante
    {itemid=12574, count=1}, -- clava do iniciante
    {itemid=7959, count=1}, -- espada do iniciante
  }
}

for _, items in ipairs(firstItems) do
  for _, item in ipairs(commonItems) do
    table.insert(items, item)
  end
end

function onLogin(cid)
  if getPlayerGroupId(cid) < 2 then
    local hasReceivedFirstItems = getPlayerStorageValue(cid, 67708)

    if hasReceivedFirstItems == EMPTY_STORAGE then
      --[[local backpack = ]]doPlayerAddItem(cid, 10521, 1)

      local giveItems = firstItems[getPlayerVocation(cid)]

      if giveItems ~= nil then
        for _, v in ipairs(giveItems) do
          doPlayerAddItem(cid, v.itemid, v.count or 1)
          --doAddContainerItem(backpack, v.itemid, v.count or 1)
        end

        doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Bem Vindo ao RealBaiak! Você acaba de receber seus primeiros equipamentos, lembre-se de pegar os 1kk bônus mais a frente e divirta-se!")
        setPlayerStorageValue(cid, 67708, 1)  
      end
    end
  end
  return true
end