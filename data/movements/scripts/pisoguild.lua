function onStepIn(cid, item, position, fromPosition)
--- configuration by notle  ---
local exhaust = 120  -- Tempo para player poder manda messagem denovo! (1 por segundos)
local frase1 = "O Jogador"  -- frase que vem antes do nome da guild
local frase2 = "da guild"  -- frase que vem antes do nome dos players
local frase3 = "está invadindo o [AlphaCastle24Hrs],aviso aos donos atuais."   -- frase que vem depois do nome do player
--- configuration by notle  ---
if getPlayerGuildId(cid) == 0 then

doPlayerSendCancel(cid, "[Castle] Apenas Jogadores Com Guild Pode Entrar Nessa Zona.")
doTeleportThing(cid, fromPosition, false) return true
end
if getPlayerStorageValue(cid, 9951) >= os.time() and doPlayerSendCancel(cid, "aguardando "..(getPlayerStorageValue(cid, 9951) - os.time()).." segundos.") then return true end
    if getPlayerGuildId(cid) ~= getGlobalStorageValue(123123) then
        for _, pid in pairs(getPlayersOnline()) do
             if getPlayerGuildId(pid) and getPlayerGuildId(pid) == getGlobalStorageValue(123123) then
                doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, ""..frase1.." ["..getCreatureName(cid).."] "..frase2.." ["..getPlayerGuildName(cid).."] "..frase3.." ")
             end
        end
end
setPlayerStorageValue(cid, 9951, os.time() + exhaust)
return true
end