function onUse(cid, item, frompos, item2, topos)
	message = getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]: " .. "Invasão de Green Phantom na cidade, GOGOGO GALERA!"
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
   		doSummonCreature("Green Phantom", pos1)
   		doSummonCreature("Green Phantom", pos2)
   		doSummonCreature("Green Phantom", pos3)
   		doSummonCreature("Green Phantom", pos4)
   		doSummonCreature("Green Phantom", pos5)
   		doSummonCreature("Green Phantom", pos6)
   		doSummonCreature("Green Phantom", pos7)
   		doSummonCreature("Green Phantom", pos8)
   		doSummonCreature("Green Phantom", pos9)
   		doSummonCreature("Green Phantom", pos10)
   		doSummonCreature("Green Phantom", pos11)
   		doSummonCreature("Green Phantom", pos12)
   		doSummonCreature("Green Phantom", pos13)
   		doSummonCreature("Green Phantom", pos14)
   		doSummonCreature("Green Phantom", pos15)
   		doSummonCreature("Green Phantom", pos16)
   		doSummonCreature("Green Phantom", pos17)
   		doSummonCreature("Green Phantom", pos18)
   		doSummonCreature("Green Phantom", pos19)
   		doSummonCreature("Green Phantom", pos20)
   		doSummonCreature("Green Phantom", pos21)
   		doSummonCreature("Green Phantom", pos22)
   		doSummonCreature("Green Phantom", pos23)
   		doSummonCreature("Green Phantom", pos24)
   		doSummonCreature("Green Phantom", pos25)
   		doSummonCreature("Green Phantom", pos26)
   		doSummonCreature("Green Phantom", pos27)
   		doSummonCreature("Green Phantom", pos28) 
	else
		doPlayerSendTextMessage(cid,22,"Você ja fez uma invasão a menos de 3 horas!")
	end
end