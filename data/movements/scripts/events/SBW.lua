function onStepIn(cid, item, pos)
	doTeleportThing(cid, SBW_TPGO)
	doBroadcastMessage("[SNOWBALL WAR] O " ..getCreatureName(cid).. " jogador ingressou no evento.", MESSAGE_STATUS_CONSOLE_ORANGE)					
	doPlayerSetStorageValue(cid, SBW_INEVENT, 1)
	doPlayerSetStorageValue(cid, SBW_AMMO, SBW_MINAMMO)
	doPlayerSetStorageValue(cid, SBW_SCORE, 0)           														
end