function onUse(cid, item)
              if getPlayerStorageValue(cid, 55491) - os.time() < 0 then
              doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Agora voce e um player VIP.")
              setPlayerStorageValue(cid, 55491, os.time() + (930*24*60*60)) 
              doRemoveItem(item.uid, 1)
          else
             doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Voce ja e VIP.")
          end
return TRUE
end