function onSay(cid, words, param)
local frases = {

"Este é o melhor server que eu já¡ joguei",
"Maravilhoso este servidor, não acha?"
}
return doPlayerSay(cid,frases[math.random(#frases)],1)
end
