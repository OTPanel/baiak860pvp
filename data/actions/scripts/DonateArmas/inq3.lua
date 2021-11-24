local tempo = 2

function onUse(cid, item, frompos, item2, topos)
 if getPlayerStorageValue(cid, 12968) > os.time() then
        return doPlayerSendCancel(cid, "Você deve esperar "..(getPlayerStorageValue(cid, 12968) - os.time()).. " segundos para usar novamente.")
    end
	wall1 = {x=7044, y=5626, z=14, stackpos=1}
	wall2 = {x=7045, y=5626, z=14, stackpos=1}
	wall3 = {x=7046, y=5626, z=14, stackpos=1}
	wall4 = {x=7047, y=5626, z=14, stackpos=1}
	wall5 = {x=7048, y=5626, z=14, stackpos=1}
	wall6 = {x=7049, y=5626, z=14, stackpos=1}
	wall7 = {x=7050, y=5626, z=14, stackpos=1}
	wall8 = {x=7051, y=5626, z=14, stackpos=1}
	wall9 = {x=7052, y=5626, z=14, stackpos=1}
	wall10 = {x=7053, y=5626, z=14, stackpos=1}
	wall11 = {x=7054, y=5626, z=14, stackpos=1}
	wall12 = {x=7055, y=5626, z=14, stackpos=1}
	wall13 = {x=7056, y=5626, z=14, stackpos=1}
	getwall1 = getThingfromPos(wall1)
	getwall2 = getThingfromPos(wall2)
	getwall3 = getThingfromPos(wall3)
	getwall4 = getThingfromPos(wall4)
	getwall5 = getThingfromPos(wall5)
	getwall6 = getThingfromPos(wall6)
	getwall7 = getThingfromPos(wall7)
	getwall8 = getThingfromPos(wall8)
	getwall9 = getThingfromPos(wall9)
	getwall10 = getThingfromPos(wall10)
	getwall11 = getThingfromPos(wall11)
	getwall12 = getThingfromPos(wall12)
	getwall13 = getThingfromPos(wall13)
	

	if item.itemid == 1945 and getwall1.itemid == 1524 then
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doRemoveItem(getwall3.uid,1)
		doRemoveItem(getwall4.uid,1)
		doRemoveItem(getwall5.uid,1)
		doRemoveItem(getwall6.uid,1)
		doRemoveItem(getwall7.uid,1)
		doRemoveItem(getwall8.uid,1)
		doRemoveItem(getwall9.uid,1)
		doRemoveItem(getwall10.uid,1)
		doRemoveItem(getwall11.uid,1)
		doRemoveItem(getwall12.uid,1)
		doRemoveItem(getwall13.uid,1)
		
		doCreateItem(6281,1,wall1)
		doCreateItem(6281,1,wall2)
		doCreateItem(6281,1,wall3)
		doCreateItem(6281,1,wall4)
		doCreateItem(6281,1,wall5)
		doCreateItem(6281,1,wall6)
		doCreateItem(6281,1,wall7)
		doCreateItem(6281,1,wall8)
		doCreateItem(6281,1,wall9)
		doCreateItem(6281,1,wall10)
		doCreateItem(6281,1,wall11)
		doCreateItem(6281,1,wall12)
		doCreateItem(6281,1,wall13)
		doTransformItem(item.uid,item.itemid+1)
		setPlayerStorageValue(cid, 12968, tempo + os.time())
	elseif item.itemid == 1946 then
	
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doRemoveItem(getwall3.uid,1)
		doRemoveItem(getwall4.uid,1)
		doRemoveItem(getwall5.uid,1)
		doRemoveItem(getwall6.uid,1)
		doRemoveItem(getwall7.uid,1)
		doRemoveItem(getwall8.uid,1)
		doRemoveItem(getwall9.uid,1)
		doRemoveItem(getwall10.uid,1)
		doRemoveItem(getwall11.uid,1)
		doRemoveItem(getwall12.uid,1)
		doRemoveItem(getwall13.uid,1)
		doTransformItem(item.uid,item.itemid-1)	
		setPlayerStorageValue(cid, 12968, tempo + os.time())
		
		doCreateItem(1524,1,wall1)
		doCreateItem(1524,1,wall2)
		doCreateItem(1524,1,wall3)
		doCreateItem(1524,1,wall4)
		doCreateItem(1524,1,wall5)
		doCreateItem(1524,1,wall6)
		doCreateItem(1524,1,wall7)
		doCreateItem(1524,1,wall8)
		doCreateItem(1524,1,wall9)
		doCreateItem(1524,1,wall10)
		doCreateItem(1524,1,wall11)
		doCreateItem(1524,1,wall12)
		doCreateItem(1524,1,wall13)
		
		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end