function onSay(cid, words, param)
local frases = {

"Este � o melhor server que eu j� joguei",
"Maravilhoso este servidor, n�o acha?"
}
return doPlayerSay(cid,frases[math.random(#frases)],1)
end
