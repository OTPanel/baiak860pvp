if not BlessWarnings then
    BlessWarnings = {}
end

patente = {
    
    {0,1,"Inútil",0},
    {1,10,"Iniciante",1},
    {10,30,"Assassino",20},
    {30,50,"Psicopata",50},
    {50,70,"Serial-Killer",80},
    {70,100,"Demolidor",100},
    {100,120,"Carrasco",150},
    {120,200,"Satanista",200},
    {200,250,"Profeta",310},
    {250,350,"Mercenario",350},
    {350,500,"Feiticeiro",500},
    {500,1000,"Canibal",1000},
    {1000,1500,"Bronze",2000},
    {1500,2000,"Prata",3000},
    {2000,3000,"Ouro",4000},
    {3000,10000000000,"Deus",10000},

}

killua = {
    
    getKills = function (cid)
        return isPlayer(cid) and getPlayerStorageZero(cid,722500) or error "argument must be a player id"
    end,

    addKill = function (cid)
        return isPlayer(cid) and doPlayerSetStorageValue(cid,722500,getPlayerStorageZero(cid,722500) + 1) or error "argument must be a player id"
    end,

    getPatente = function (cid)

        local kills = killua.getKills(cid)
        for i, v in pairs(patente) do
            if kills >= v[1] and kills < v[2] then
                return v[3]
            end
        end
    end,

    getPatenteReward = function (cid)
        local pt = killua.getPatente(cid)
        for a,b in pairs(patente) do
            if b[3] == pt then
                return b[4]
            end
        end
        return false
    end,

}
