function onUse(cid, item, frompos, item2, topos)
	message = getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]: " .. "Invasão de Finger Killer na cidade, GOGOGO GALERA!"
	timePass = 3 * 60 * 60
	pos1 = {x=164,y=57,z=7}
	pos2 = {x=176,y=39,z=7}
	pos3 = {x=169,y=40,z=7} 
	pos4 = {x=156,y=57,z=7}   
	pos5 = {x=139,y=41,z=7} 
	pos6 = {x=173,y=57,z=7}  
	pos8 = {x=161,y=32,z=7} 
	pos9 = {x=138,y=60,z=7} 
	pos10 = {x=179,y=59,z=7} 
	pos11 = {x=132,y=23,z=7} 
	pos13 = {x=173,y=33,z=7} 
	pos14 = {x=178,y=27,z=7} 
	pos15 = {x=181,y=22,z=7} 
	pos16 = {x=197,y=39,z=7} 
	pos17 = {x=208,y=40,z=7} 
	pos18 = {x=208,y=50,z=7} 
	pos19 = {x=204,y=62,z=7} 
	pos20 = {x=194,y=57,z=7} 
	pos21 = {x=178,y=67,z=7} 
	pos22 = {x=104,y=61,z=7} 
	pos23 = {x=102,y=54,z=7} 
	pos24 = {x=103,y=46,z=7} 
	pos25 = {x=153,y=61,z=7} 
	pos26 = {x=96,y=41,z=7} 
	pos27 = {x=83,y=39,z=7} 
	pos28 = {x=110,y=34,z=7} 
	pos12 = {x=132,y=47,z=7}
	pos7 = {x=138,y=54,z=7}

	if getGlobalStorageValue(57349) - os.time() <= 0 then
		doBroadcastMessage(message, MESSAGE_EVENT_ADVANCE)
		setPlayerGlobalValue(57349, os.time() + timePass)
		doSummonCreature("Finger Killer", pos1)
   		doSummonCreature("Finger Killer", pos2)
   		doSummonCreature("Finger Killer", pos3)
   		doSummonCreature("Finger Killer", pos4)
   		doSummonCreature("Finger Killer", pos5)
   		doSummonCreature("Finger Killer", pos6)
   		doSummonCreature("Finger Killer", pos7)
   		doSummonCreature("Finger Killer", pos8)
   		doSummonCreature("Finger Killer", pos9)
   		doSummonCreature("Finger Killer", pos10)
   		doSummonCreature("Finger Killer", pos11)
   		doSummonCreature("Finger Killer", pos12)
   		doSummonCreature("Finger Killer", pos13)
   		doSummonCreature("Finger Killer", pos14)
   		doSummonCreature("Finger Killer", pos15)
   		doSummonCreature("Finger Killer", pos16)
   		doSummonCreature("Finger Killer", pos17)
   		doSummonCreature("Finger Killer", pos18)
   		doSummonCreature("Finger Killer", pos19)
   		doSummonCreature("Finger Killer", pos20)
   		doSummonCreature("Finger Killer", pos21)
   		doSummonCreature("Finger Killer", pos22)
   		doSummonCreature("Finger Killer", pos23)
   		doSummonCreature("Finger Killer", pos24)
   		doSummonCreature("Finger Killer", pos25)
   		doSummonCreature("Finger Killer", pos26)
   		doSummonCreature("Finger Killer", pos27)
   		doSummonCreature("Finger Killer", pos28)  
	else
		doPlayerSendTextMessage(cid,22,"ja teve uma invasão a menos de 3 horas!")
	end
end