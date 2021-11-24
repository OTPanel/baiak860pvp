--[[Bank System 1.0 
Criado por Henrique Matheus
God Stayrone]]



function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 3)) then
		return true
	end

		if (param == "") then
		doPlayerPopupFYI(cid, "Olá, Você está no banco virtual PvPBank, como podemos te ajudar?\n !bank balance = mostra seu saldo na conta virtual. \n !bank deposit, valor = deposita o dinheiro na sua conta virtual.\n !bank depositall = deposita todo valor do seu corpo no banco virtual. \n !bank withdraw, valor = retira dinheiro da sua conta virtual.\n !bank withdrawall = retira todo seu dinheiro do banco virtual.\n !bank transfer, nome, valor! = transfira um dinheiro para seu amigo! \n !bank transferall, name, transfira todo seu dinheiro.\nLembrando, nosso banco virtual e interligado com NPC Banqueiro.")			
		return true
	end


			local t = string.explode(param, ",")
		
		if t[1] == "balance" then
			doPlayerSendTextMessage(cid, 27, "Você tem "..getPlayerBalance(cid).." de dinheiro no banco virtual.")
			return true
				end
				
		if t[1]	== "deposit" then
				 if(not t[2]) then
                        doPlayerSendCancel(cid, "Defina o valor que você quer depositar. Ex: !bank deposit, 100")  
                        return true
                end
				
		local ValorMaximo = 2000000000
			if tonumber(t[2]) then
				if math.abs(t[2]) > ValorMaximo then
			doPlayerSendCancel(cid, "Você não pode depositar + que 2kks.")
			return true
		end
		
		if getPlayerMoney(cid) > math.abs(t[2]) then
		doPlayerDepositMoney(cid, t[2]) 
		doPlayerSendTextMessage(cid, 27, "Você depositou "..t[2].." de dinheiro no seu banco virtual.")
		else
		doPlayerSendTextMessage(cid, 27, "Você não tem "..t[2].." de dinheiro em sua backpack.")
		return true
		end	
		return true
		end
	end		
	
	if t[1] == "depositall" then
	if getPlayerMoney(cid) > 0 then
		doPlayerSendTextMessage(cid, 27, "Você depositou todo seu dinheiro no banco virtual, tinha um total de "..getPlayerMoney(cid).." gold coins.")
		doPlayerDepositAllMoney(cid)
		else 
		doPlayerSendTextMessage(cid, 27, "Você não tem nenhum dinheiro pra depositar!")
		end		
		return true
		end

	if t[1] == "withdraw" then
					 if(not t[2]) then
                        doPlayerSendCancel(cid, "Defina o valor que você quer retirar. Ex: !bank withdraw, 100")  
                        return true
                end
				
	local ValorMaximo = 2000000000
			if tonumber(t[2]) then
				if math.abs(t[2]) > ValorMaximo then
			doPlayerSendCancel(cid, "Você não pode retirar + que 2kks.")
			return true
		end
		
		if getPlayerBalance(cid) > math.abs(t[2]) then
		doPlayerWithdrawMoney(cid, math.abs(t[2])) 
		doPlayerSendTextMessage(cid, 27, "Você retirou "..t[2].." de dinheiro do seu banco virtual.\n Agora seu saldo é "..getPlayerBalance(cid).." gold coins.")
		else
		doPlayerSendTextMessage(cid, 27, "Você não tem "..t[2].." de dinheiro em seu banco virtual.")
		return true
		end	
		return true
		end
	end		
	
	if t[1] == "withdrawall" then
	if getPlayerBalance(cid) > 0 then
		doPlayerSendTextMessage(cid, 27, "Você retirou todo seu dinheiro do banco virtual, tinha um total de "..getPlayerBalance(cid).." gold coins.")
		doPlayerWithdrawAllMoney(cid)
		else 
		doPlayerSendTextMessage(cid, 27, "Você não tem nenhum dinheiro pra depositar!")
		end		
		return true
		end


	if t[1] == "transfer" then
	
				   if(not t[2] or (not tonumber(t[3]))) then
                        doPlayerSendCancel(cid, "Você está fazendo alguma coisa errada, basta dizer !bank transfer, PLAYER, Valor!")  
                        return true
                end
				
	
		if getPlayerBalance(cid) > math.abs(t[3]) then
		if playerExists(t[2]) then
		doPlayerTransferMoneyTo(cid, t[2], math.abs(t[3]))
		doPlayerSendTextMessage(cid, 27, "Você transferiu "..t[3].." para "..t[2]..". Seu saldo no banco virtual é "..getPlayerBalance(cid).." gold coins.")
		else
		doPlayerSendTextMessage(cid, 27, "O Player "..t[2].." não existe.")
		return true
		end
		else
		doPlayerSendTextMessage(cid, 27, "Você não tem todo esse valor no seu banco virtual, seu saldo é "..getPlayerBalance(cid).." gold coins.")
			return true
		
		end
		end
		
			if t[1] == "transferall" then
	
				   if(not t[2]) then
                        doPlayerSendCancel(cid, "Você está fazendo alguma coisa errada, basta dizer !bank transferall, PLAYER!")  
                        return true
                end
				
	
		if getPlayerBalance(cid) > 0 then
		if playerExists(t[2]) then
		doPlayerTransferAllMoneyTo(cid, t[2])
		doPlayerSendTextMessage(cid, 27, "Você transferiu todo seu dinheiro para "..t[2]..". Seu saldo no banco virtual agora é "..getPlayerBalance(cid).." gold coins.")
		else
		doPlayerSendTextMessage(cid, 27, "O Player "..t[2].." não existe.")
		return true
		end
		else
		doPlayerSendTextMessage(cid, 27, "Você não tem dinheiro no seu banco virtual para transferir.")
			return true
		
		end
		end



		return true
end
