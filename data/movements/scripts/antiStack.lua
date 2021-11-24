local positions = {
{x = 127, y = 60, z = 7}, -- aqui vc coloca a posição pra onde ele vão
{x = 127, y = 61, z = 7}, 
{x = 127, y = 62, z = 7},
{x = 128, y = 62, z = 7},
{x = 129, y = 62, z = 7}, 
{x = 129, y = 61, z = 7},
{x = 129, y = 60, z = 7},
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTeleportThing(cid, positions[math.random(1, #positions)])
return true
end