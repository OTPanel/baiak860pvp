local EventsListalist = {
	    
		{time = "01:00", name = "Snowball Event"},		
	    {time = "02:00", name = "DesertWar Event"},
		{time = "03:00", name = "Capture The Flag"},
		{time = "04:00", name = "FireStorm Event"},
		{time = "09:00", name = "Defend The Tower"},
		{time = "10:00", name = "Snowball Event"},
		{time = "11:00", name = "DesertWar Event"},
	    {time = "12:00", name = "Capture The Flag"},
	    {time = "13:00", name = "FireStorm Event"},
	    {time = "15:00", name = "Battlefield Event"},
	    {time = "16:00", name = "Defend The Tower"},
	    {time = "17:00", name = "Snowball Event"},
	    {time = "18:00", name = "DesertWar Event",},
	    {time = "19:00", name = "Capture The Flag",},
		{time = "20:00", name = "FireStorm Event"},
		{time = "21:00", name = "Real Castle"},
	    {time = "22:00", name = "Battlefield Event"},
	    {time = "23:00", name = "Defend The Tower"}
	    

	}
	
	local position = {x = 129, y = 58, z = 7}
	
	
	function onThink(interval, lastExecution)
		
	 local people = getPlayersOnline()
    if #people == 0 then
        return true
    end
	
	local Count = 0
	  for _, t in ipairs(EventsListalist) do
	        local eventTime = hourToNumber(t.time)
	        local realTime = hourToNumber(os.date("%H:%M:%S"))
	        if eventTime >= realTime then
	       doPlayerSay(people[1], "Próximo evento às {"..t.time.."h} "..t.name..", faltam "..timeString(eventTime - realTime)..".", TALKTYPE_MONSTER_SAY, false, 0, position)
	            return true
	        end
	        Count = Count + 1
	    end
		return true
	end