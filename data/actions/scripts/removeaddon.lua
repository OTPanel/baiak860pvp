local config = {
ADDONS = {
[6107] = {outfitid = 130, outfitid2 = 138, name = "mage addon"},
},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	doPlayerRemoveOutfit(cid, 130, 2)
	doPlayerRemoveOutfit(cid, 138, 2)
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You removed Mage addon.")
	end