--[[

				Real Castle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

function onUse(cid, item, frompos, item2, topos)
	if item.uid == 61466 then
		local guild = getGlobalStorageValue(realCastle.guild_storage) > 1 and "a guild "..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).." possui o domínio" or "nenhuma guild possui o domínio do castelo"
		local sto = realCastle.dateStorages
		local gsto = getGlobalStorageValue
		local time = gsto(sto[1]).."/"..gsto(sto[2]).."/"..gsto(sto[3])
		local domain = realCastle.isOpen() and "as guilds estão batalhando pelo domínio do castelo" or guild
		local msg = " -----------[Real.Castle]---------\n\n\nAtualmente "..domain..".\n\nPróxima batalha: "..time.." às 21:00."
		doShowTextDialog(cid,8977,msg)
		return true
	end
	if not realCastle.isOpen() then 
		doTeleportThing(cid,getTownTemplePosition(1)) 
		return true 
	end
	if not realCastle.isDominating(cid) then
		realCastle.domain(cid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_CRAPS)
	else
		doPlayerSendCancel(cid,"Sua guild já está com o domínio do castelo.")
	end
	return true
end
