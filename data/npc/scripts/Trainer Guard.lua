local area_entrance = {x = 639, y = 109, z = 14}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

  if msgcontains(msg,'como funciona') then
    selfSay("Treinando nessa área especial, você recebe uma quantidade de exp por segundo (com base no seu level). Custa 100kk (200kk para level 700+) por hora para treinar aí dentro e você só pode treinar 2 horas por dia. Lembre-se de deixar seu bot com o Anti-Idle, ou você será kikado normalmente.",cid)
  elseif msgcontains(msg,'entrar') then
    if getPlayerLevel(cid) >= 500 then
      local price = getPlayerLevel(cid) >= 700 and 200 or 100
      selfSay("Para entrar, você deve me pagar "..price.."kk agora. Quer entrar? Lembre-se de deixar seu bot com o Anti-Idle, ou você será kikado normalmente.",cid)
      talkState[talkUser] = 10
    else
      selfSay("Somente jogadores level 500+ podem treinar aqui.",cid)
    end
  elseif msgcontains(msg,'yes') and talkState[talkUser] == 10 then
    local price = getPlayerLevel(cid) >= 700 and 200000000 or 100000000
    local storage = getPlayerTableStorage(cid,722531)
    if tonumber(storage[1]) and tonumber(storage[2]) then
      if tonumber(storage[1]) < os.time() or tonumber(storage[2]) < 2 then
        if doPlayerRemoveMoney(cid,price) then
          doTeleportThing(cid,area_entrance)
          doPlayerSetStorageValue(cid,722512,os.time())
          selfSay("Aproveite!",cid)
        else
          selfSay("Você não tem dinheiro suficiente.",cid)
        end
      else
        selfSay("Você só pode treinar aqui 3 horas por dia, volte daqui ".. timeString(tonumber(storage[1]) - os.time()) ..".",cid)
      end
    else

      if doPlayerRemoveMoney(cid,price) then
        doTeleportThing(cid,area_entrance)
        doPlayerSetStorageValue(cid,722512,os.time())
        setPlayerTableStorage(cid,722531,{os.time()+(24*3600),0})
        selfSay("Aproveite!",cid)
      else
        selfSay("Você não tem dinheiro suficiente.",cid)
      end
    end

  elseif msgcontains(msg,'no') and talkState[talkUser] == 10 then
    selfSay("Tudo bem, esta é uma escolha sua.",cid)
  end
   
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())