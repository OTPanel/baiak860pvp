function onThink(interval, lastExecution)
local texts = {["GERADOR"] = {SBW_GERADOR, 55, TEXTCOLOR_ORANGE}}

for text, param in pairs(texts) do
	doSendAnimatedText(param[1], text, param[3])
	doSendMagicEffect(param[1], param[2])
end
return TRUE
end