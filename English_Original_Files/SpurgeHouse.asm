SpurgeHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeHouseNPC1:
	ctxt "Mining is great!"

	para "If you want to"
	line "experience mining,"
	cont "get a mine pick!"

	para "Just interact with"
	line "any rocky surface"
	para "once you get one"
	line "and mine away!"
	done

SpurgeHouseNPC2:
	ctxt "A nearby village"
	line "sells mining"
	cont "picks."

	para "If you want to"
	line "mine, you will"
	cont "need to buy some!"
	done

SpurgeHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $2, 5, SPURGE_CITY
	warp_def $7, $3, 5, SPURGE_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_BLACK_BELT, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeHouseNPC1, -1
	person_event SPRITE_TEACHER, 5, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SpurgeHouseNPC2, -1
