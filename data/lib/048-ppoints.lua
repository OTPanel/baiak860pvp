-- Sirion_Mido Says: Credites to: LucasFerraz

-- Sirion_Mido Says: Credites to: LucasFerraz

-- Sirion_Mido Says: Credites to: LucasFerraz


function getAccountPoints(cid)

    local res = db.getResult('select `premium_points` from accounts where name = \''..getPlayerAccount(cid)..'\'')

    if(res:getID() == -1) then

	   return false

    end

    local ret = res:getDataInt("premium_points")

    res:free()

    return tonumber(ret)

end


function doAccountAddPoints(cid, count)

    return db.executeQuery("UPDATE `accounts` SET `premium_points` = '".. getAccountPoints(cid) + count .."' WHERE `name` ='"..getPlayerAccount(cid).."'")

end


function doAccountRemovePoints(cid, count)

    return db.executeQuery("UPDATE `accounts` SET `premium_points` = '".. getAccountPoints(cid) - count .."' WHERE `name` ='"..getPlayerAccount(cid).."'")

end



-- Sirion_Mido Says: Credites to: LucasFerraz

-- Sirion_Mido Says: Credites to: LucasFerraz

-- Sirion_Mido Says: Credites to: LucasFerraz