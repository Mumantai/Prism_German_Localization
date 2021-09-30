MtEmberRoom1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0
	
MtEmberRoom1NPC:
	ctxt "Oh<...> hello!"
	
	para "I'm trying to get"
	line "to Kindle Road."
	
	para "This rock is very"
	line "hard, though."

	para "If the devs help"
	line "me, you'll be"
	para "able to travel to"
	line "Kindle Road, and"
	cont "other places too!"
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
