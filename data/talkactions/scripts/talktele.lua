function onSay(cid, words, param, channel)

local s = string.explode(param, ",")

local topos = {x=s[1], y=s[2], z=s[3]}


doCreateTeleport(1387, topos, getCreaturePosition(cid))

return TRUE

end