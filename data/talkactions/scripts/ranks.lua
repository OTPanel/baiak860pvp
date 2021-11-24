local displayoutput = {"Level","Magic Level","Fist Fighting","Club Fighting","Sword Fighting","Axe Fighting","Distance Fighting","Shielding"}

local itemtype = {9969,9933,5896,8929,8932,7388,8849,8906,2580}

function onSay(cid, words, param)
    number = 1
    param = string.lower(param)
    skilllist = ""
    command = TRUE
    if param == "level" then        
        display = 1
    elseif param == "magic" then
        display = 2
    elseif param == "club" then
        id = 1
        display = 4
    elseif param == "sword" then
        id = 2
        display = 5
    elseif param == "axe" then
        id = 3
        display = 6
    elseif param == "distance" then
        id = 4
        display = 7
    elseif param == "shield" then
        id = 5
        display = 8
    else 
        error = 'Highscore Commands:\n\n!rank level\n!rank magic\n!rank fist\n!rank club\n!rank sword\n!rank axe\n!rank distance\n!rank shield\n'

        doShowTextDialog(cid, 5958, error)
        command = FALSE

    end

    if command ~= FALSE then
        if display == 1 then
            local player = db.getResult("SELECT `name`, `level` FROM `players` WHERE group_id < '3' ORDER BY `level` DESC LIMIT 50;")    
            if(player:getID() ~= -1) then
                while (true) do
                    local name = player:getDataString("name")
                    local level = player:getDataInt("level")

                      skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.."  -  "..level)
                    number = number + 1
                    if not(player:next()) then
                        break
                    end
                end
                player:free()
            end
        elseif display == 2 then
            local player = db.getResult("SELECT `name`, `maglevel` FROM `players` WHERE group_id < '2' ORDER BY `maglevel` DESC LIMIT 50;")
            if(player:getID() ~= -1) then    
                while (true) do
                    local name = player:getDataString("name")
                    local maglevel = player:getDataInt("maglevel")

                      skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.."  -  "..maglevel)
                    if not(player:next()) then
                        break
                    end
                    number = number + 1
                end
            end
            player:free()
        else
            local skills = db.getResult("SELECT `player_id`, `value`, `skillid` FROM `player_skills` WHERE `skillid` = "..id.." ORDER BY `value` DESC;")
            while (true) do
                local GUID = skills:getDataInt("player_id")
                local value = skills:getDataInt("value")
                local skillid = skills:getDataInt("skillid")
                local player = db.getResult("SELECT `name` FROM `players` WHERE `id` = "..GUID.." and group_id < '2' ")
                if(player:getID() ~= -1) then
                    local name = player:getDataString("name")
                      skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.."  -  "..value)
                    number = number + 1
                    player:free()
                end
                if number > 50 then
                    break
                end
                    if not(skills:next()) then
                    break
                end
            end
            skills:free()
        end
        dialog = ""..displayoutput[display].." Highscores: \n  "..skilllist..""
        doShowTextDialog(cid, itemtype[display], dialog)
		return true
    end    
end