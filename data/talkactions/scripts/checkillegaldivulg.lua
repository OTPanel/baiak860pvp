local CONFIG = {
serverName = "Baiak - Revol", 
adminName = "Automatic Ban", 
blockedLinks = {"melhorserver", "baiaksystem", "4535154186", "baiakfastattackgotdnsch", "1708140198", "baiakmania","17713416114", "warteraonline", "3522948244", "wartera", "208167239183", "donatefree", "baiakwars", "brbaiaktk", "5439368", "1495624665", "admhenrique", "henriquebaiak", "admmhenrique", "14956107219", "14421735216","thebaiak", "5177203152", "warotservegamecom", "baiakshowtk", "177234154186", "discordgg","543924635", "megabaiak", "raonline", "removados", "troqueos", "baiakshadowtk", "15869123107", "faliu","falido", "falencia", "procureoutro"},
action = "ban", 
actionTime = {1, "min"},
comment = "Sharing link: ",
muteStorage = 79004
}

local blockedLinksData = {}
local separator = '[ !\t@%$%^%+%-%.%%_,<>?()3]*'
for _, linkText in pairs(CONFIG.blockedLinks) do
    local data = {}
    data.link = linkText
 
    data.preg = '.*'
    for c in string.gmatch(linkText, '.') do
        if(c == '.') then
            data.preg = data.preg .. '.*'
        else
            data.preg = data.preg .. c .. separator
        end
    end
    data.preg = data.preg .. '.*'
 
    table.insert(blockedLinksData, data)
end
 
function isLegalMessage(words)
    for _, blockedLink in pairs(blockedLinksData) do
        if(string.match(words, blockedLink.preg) ~= nil) then
            return false, blockedLink.link
        end
    end
    return true, ''
end
 
function onSay(cid, words, param, channel)
if getPlayerStorageValue(cid, 5253711) > os.time() then
return false
end
local time = getPlayerStorageValue(cid, 455010)
    words = words .. " " .. param
    local legalMessage, forbiddenLink = isLegalMessage(
    string.lower(words))
	if channel == 9 and time > os.time() then
		return doPlayerSendCancel(cid, 'You are muted for ' .. (time - os.time()).. ' second' .. ((time - os.time()) > 1 and 's' or '').. ' in this channel.')
	end
	local time = getPlayerStorageValue(cid, 455011)
	if channel == 6 and time > os.time() then
		return doPlayerSendCancel(cid, 'You are muted for ' .. (time - os.time()).. ' second' .. ((time - os.time()) > 1 and 's' or '').. ' in this channel.')
	end
    if(not legalMessage) then
        if CONFIG.action == "mute" then
            local muteStorageValue = getPlayerStorageValue(cid, CONFIG.muteStorage)
            if(muteStorageValue > os.time()) then
                doPlayerSendCancel(cid, "You are still muted for " .. muteStorageValue-os.time() .. " seconds.")
                return true
            end
            setPlayerStorageValue(cid, CONFIG.muteStorage, mathtime(CONFIG.actionTime)+os.time())
            if(channel == CHANNEL_DEFAULT) then
                doCreatureSay(cid, CONFIG.serverName.." RULES!", TALKTYPE_SAY)
            end
			doAddCondition(cid, exhaust)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Link: " .. forbiddenLink .. " is forbidden.")
        else
            local accId = getPlayerAccountId(cid)
            doAddAccountBanishment(accId, getPlayerGUID(cid),mathtime(CONFIG.actionTime) + os.time(), 6, ACTION_BANISHMENT, CONFIG.comment..forbiddenLink, getPlayerGUIDByName(CONFIG.adminName), CONFIG.comment..forbiddenLink)
            doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_GREEN)
            doRemoveCreature(cid)
        end			
        return true
    end		
setPlayerStorageValue(cid, 5253711, 5 + os.time())
end

function mathtime(table)
local unit = {"sec", "min", "hour", "day"}
for i, v in pairs(unit) do
if v == table[2] then
return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
end
end
return error("Bad declaration in mathtime function.")
end
 