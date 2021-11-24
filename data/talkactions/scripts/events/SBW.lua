function onSay(cid, words, param, channel)
local k = string.explode(param, ",")
if(k[1] ~= nil) then
		if(string.upper(k[1]) == 'INFO') then
			local score = {}
			local output =  "Voce tem " .. getPlayerStorageValue(cid, SBW_SCORE) .. " pontos.\nVoce tem "..getPlayerStorageValue(cid, SBW_AMMO).."x municoes.\n------------------\nO maior matador:\n"
			for _, pid in ipairs(getPlayersOnline()) do
				if getPlayerStorageValue(pid, SBW_INEVENT) then
					table.insert(score, {getCreatureName(pid), getPlayerStorageValue(pid, SBW_SCORE)})
				end
			end
			local lx = table.getn(score)
			if(lx > 3) then lx = 3 end
				table.sort(score, function(a, b) return a[2] > b[2] end)
				for k = 1,lx do
					output = output .. k..". "..score[k][1] .." [".. score[k][2] .."].\n"
				end
				doPlayerPopupFYI(cid, output)
			end
if (string.upper(k[1]) == 'ATIRAR') then
	if(getPlayerStorageValue(cid, SBW_INEVENT) == 1) and not getTileInfo(getThingPos(cid)).protection then
		if getPlayerStorageValue(cid, SBW_EXAUSTHED) <= 1 then
			if(getPlayerStorageValue(cid, SBW_AMMO) > 0) then
				if SBW_STATUS == 'on' then
					if(SBW_AMMOINFI == false) then
						doPlayerSetStorageValue(cid, SBW_AMMO, getPlayerStorageValue(cid, SBW_AMMO)-1)
					end
					doPlayerSetStorageValue(cid, SBW_EXAUSTHED, 2)
					lineAnimation(getPlayerLookDirection(cid),getCreaturePosition(cid),12,cid,1,0,1,0,0,0,1,0)
					addEvent(doPlayerSetStorageValue, SBW_SHOOTEXAUSTHED, cid, SBW_EXAUSTHED, 1)
					if (getPlayerStorageValue(cid, SBW_AMMO) ~= 1) then
						doPlayerSendTextMessage(cid, 27, "Restam "..getPlayerStorageValue(cid, SBW_AMMO).."x bolas de neve.")
					else
						doPlayerSendTextMessage(cid, 27, "Usando sua ultima bola de neve.")
					end
				end
			else
				doPlayerSendCancel(cid, "Voce esta sem bolas de neve, recarregue no centro do campo ou mate um inimigo.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)     
			end
		else
			doPlayerPopupFYI(cid, "Voce nao pode atirar tao rapido.") 
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			return false
		end
	else
		doPlayerPopupFYI(cid, "Voce precisa estar no evento ou fora do protection zone.") 
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
end
end
return true
end
 
 
                function lineAnimation(lookDir,playerPos,effect,cid,fvar,fpos,ffound,fposV,fcheck,fvcid,floopCounter,fvpid, name)
                local var = fvar
                local pos = fpos
                local found = ffound
                local posV = fposV
                local check = fcheck
                local vcid = fvcid
                local loopCounter = floopCounter
                local vpid = fvpid
                local storage = SBW_EXAUSTHED
                        if var < 2 then
                                vcid = cid
                        end
                        pos = playerPos
                        if not isInWallArray(convert(lookDir,pos)) then--isInWallArray({x=convert(lookDir,pos).x, y=convert(lookDir,pos).y,z=convert(lookDir,pos).z}) then --isInArray(t.onShoot.misc.walls_id, getThingfromPos({x=convert(lookDir,pos).x, y=convert(lookDir,pos).y,z=convert(lookDir,pos).z, stackpos=0}).itemid) then
                                doSendDistanceShoot(pos, convert(lookDir,pos),effect)
                                pos = convert(lookDir,pos)
                                var=var+1
                                posV = convertV(lookDir,playerPos)
                                for _, pid in ipairs(getPlayersOnline()) do
                                        if (getCreaturePosition(pid).x == pos.x and getCreaturePosition(pid).y == pos.y and getCreaturePosition(pid).z == pos.z) then
                                                --if loopCounter > 2 then
                                                vpid = pid
                                                --end
                                                if (vpid ~= vcid) then
                                                        if var > 2 then
                                                                if (getCreaturePosition(pid).x == posV.x and getCreaturePosition(pid).y == posV.y and getCreaturePosition(pid).z == posV.z) then
                                                                        killPlayer(pid,pos,getCreatureName(vcid))
                                                                        if (lookDir == 0) or (lookDir == 2) then
                                                                                var = 6
                                                                        else
                                                                                var = 8
                                                                        end
                                                                end
                                                        end
                                                        killPlayer(pid,pos,vcid)
                                                        if (lookDir == 0) or (lookDir == 2) then
                                                                var = 6
                                                        else
                                                                var = 8
                                                        end
                                                end
                                        end
                                        loopCounter = loopCounter +1
                                end    
                                if (lookDir == 0) or (lookDir == 2) then
                                        if var ~= 6 then
                                                addEvent(lineAnimation, SBW_BALLSPEED, lookDir,pos,effect,nil,var,pos,found,posV,check,vcid,loopCounter,vpid)
                                        else
                                                var = 1
                                        end
                                else
                                        if var ~= 8 then
                                                addEvent(lineAnimation,  SBW_BALLSPEED, lookDir,pos,effect,nil,var,pos,found,posV,check,vcid,loopCounter,vpid)
                                        else
                                                var = 1
                                        end
                                end
                        else
                                doSendMagicEffect(convert(lookDir,pos),2)
                                var = 1
                        end
                end
 
                local ret = {}
                function convert(lookDir,pos)
                local positions = {
                        [0] = {x = pos.x, y = pos.y-1, z = pos.z},
                        [1] = {x = pos.x+1, y = pos.y, z = pos.z},
                        [2] = {x = pos.x, y = pos.y+1, z = pos.z},
                        [3] = {x = pos.x-1, y = pos.y, z = pos.z}
                        }
                        ret = positions[lookDir]
                return ret
                end
 
 
                local ret = {}
                function convertV(lookDir,pos)
                local positions = {
                        [0] = {x = pos.x, y = pos.y+1, z = pos.z},
                        [1] = {x = pos.x-1, y = pos.y, z = pos.z},
                        [2] = {x = pos.x, y = pos.y-1, z = pos.z},
                        [3] = {x = pos.x+1, y = pos.y, z = pos.z}
                        }
                        ret = positions[lookDir]
                return ret
                end
				
				function isInWallArray(pos)
                        for k = 0, table.getn(SBW_WALLSID) do
                                if getTileItemById(pos, SBW_WALLSID[k]).itemid == SBW_WALLSID[k] then --this doesn't even make sense but tried other ways and it gave errors, so meh 2lazy2search
									return true    
                                end
                        end
                        return false
                end
                               
                function killPlayer(cid, pos, killer)
                    local t_l = SBW_AREA[1]
					local b_r = SBW_AREA[2]
					local posti = {}
					local isPossibleToTeleportPlayer = false
					while (isPossibleToTeleportPlayer == FALSE) do
						posti = Position(math.random(t_l.x,b_r.x), math.random(t_l.y, b_r.y), 7)
						if isInWallArray(posti) == FALSE then
							isPossibleToTeleportPlayer = TRUE
						end
					end
					doTeleportThing(cid, posti)
					doSendMagicEffect(pos,2)
					doSendMagicEffect(posti,6)
					doSendAnimatedText(pos, ""..getCreatureName(killer).." ", 55)
					doPlayerSendTextMessage(cid, 27, "Voce foi morto por "..getCreatureName(killer)..".")
					doPlayerSetStorageValue(killer, SBW_SCORE, getPlayerStorageValue(killer, SBW_SCORE)+SBW_POINTSKILL)				
					doPlayerSendTextMessage(killer, 27, "You've killed "..getCreatureName(cid)..".")
					if SBW_LOSTSCORE then
						doPlayerSetStorageValue(cid, SBW_SCORE, getPlayerStorageValue(cid, SBW_SCORE)-1)
					end
					if SBW_RESETAMMO then
						doPlayerSetStorageValue(cid, SBW_AMMO, SBW_MINAMMO)
					end
                end
                                               
                