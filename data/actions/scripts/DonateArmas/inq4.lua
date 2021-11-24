local tempo = 2

function onUse(cid, item, frompos, item2, topos)
 if getPlayerStorageValue(cid, 12968) > os.time() then
        return doPlayerSendCancel(cid, "Você deve esperar "..(getPlayerStorageValue(cid, 12968) - os.time()).. " segundos para usar novamente.")
    end
	wall1 = {x=7059, y=5623, z=14, stackpos=1}
	wall2 = {x=7059, y=5622, z=14, stackpos=1}
	wall3 = {x=7059, y=5621, z=14, stackpos=1}
	wall4 = {x=7059, y=5620, z=14, stackpos=1}
	wall5 = {x=7059, y=5619, z=14, stackpos=1}
	wall6 = {x=7059, y=5618, z=14, stackpos=1}
	wall7 = {x=7059, y=5617, z=14, stackpos=1}
	wall8 = {x=7059, y=5616, z=14, stackpos=1}
	wall9 = {x=7059, y=5615, z=14, stackpos=1}

	getwall1 = getThingfromPos(wall1)
	getwall2 = getThingfromPos(wall2)
	getwall3 = getThingfromPos(wall3)
	getwall4 = getThingfromPos(wall4)
	getwall5 = getThingfromPos(wall5)
	getwall6 = getThingfromPos(wall6)
	getwall7 = getThingfromPos(wall7)
	getwall8 = getThingfromPos(wall8)
	getwall9 = getThingfromPos(wall9)
	

	if item.itemid == 1945 and getwall1.itemid == 1526 then
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doRemoveItem(getwall3.uid,1)
		doRemoveItem(getwall4.uid,1)
		doRemoveItem(getwall5.uid,1)
		doRemoveItem(getwall6.uid,1)
		doRemoveItem(getwall7.uid,1)
		doRemoveItem(getwall8.uid,1)
		doRemoveItem(getwall9.uid,1)
		
		doCreateItem(6282,1,wall1)
		doCreateItem(6282,1,wall2)
		doCreateItem(6282,1,wall3)
		doCreateItem(6282,1,wall4)
		doCreateItem(6282,1,wall5)
		doCreateItem(6282,1,wall6)
		doCreateItem(6282,1,wall7)
		doCreateItem(6282,1,wall8)
		doCreateItem(6282,1,wall9)

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

		doTransformItem(item.uid,item.itemid-1)	
		setPlayerStorageValue(cid, 12968, tempo + os.time())
		
		doCreateItem(1526,1,wall1)
		doCreateItem(1526,1,wall2)
		doCreateItem(1526,1,wall3)
		doCreateItem(1526,1,wall4)
		doCreateItem(1526,1,wall5)
		doCreateItem(1526,1,wall6)
		doCreateItem(1526,1,wall7)
		doCreateItem(1526,1,wall8)
		doCreateItem(1526,1,wall9)

		
		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end