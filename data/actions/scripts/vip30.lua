function onUse(cid, item)
	if doRemoveItem(item.uid, 1) then
		vip.addVipByAccount(getPlayerAccount(cid),30 * 24 * 60 * 60)
		doPlayerSendTextMessage(cid,22, "Foi adicionado 30 dias de acesso VIP para sua conta.")
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua vip acaba em "..os.date("%d %B %Y %X ",vip.getVip(cid)))
	end
   return true
end