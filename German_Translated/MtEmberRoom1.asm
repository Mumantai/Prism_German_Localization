MtEmberRoom1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0
	
MtEmberRoom1NPC:
	ctxt "Oh<...> Hallo!"
	
	para "Ich versuche den"
	line "Glühweg zu"
	cont "erreichen."
	
	para "Aber dieser Felsen"
	line "ist zu hart."

	para "Wenn die"
	line "Entwickler mir"
	para "helfen, wirst du"
	line "den Glühweg und"
	para "andere Orte"
	line "erreichen können."
	done

MtEmberRoom1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $10, $c, 2, MT_EMBER_ENTRANCE
	warp_def $11, $2, 1, MT_EMBER
	warp_def $11, $3, 1, MT_EMBER

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_MINER, 5, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MtEmberRoom1NPC, EVENT_MOLTRES
