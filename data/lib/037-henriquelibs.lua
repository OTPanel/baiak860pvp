function countDownTeleport(position, duration)
	if duration == 0 or getTileItemById(position, 1387).uid == 0 then
		return
	end
	local minute = duration >= 60
	local dateParameter = minute and "%M:%S" or "%S"
	local color = minute and COLOR_WHITE or COLOR_RED
	doSendAnimatedText(position, os.date(dateParameter, duration), color)
	doSendMagicEffect(position, minute and CONST_ME_MAGIC_BLUE or CONST_ME_MAGIC_RED)
	if not minute then
		if duration % 10 == 0 then
			doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
		end
	end
	addEvent(countDownTeleport, 1000, position, duration - 1)
end