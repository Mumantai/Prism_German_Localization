AcaniaMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaMartNPC:
	ctxt "The Gold Tokens"
	line "are too cleverly"
	cont "hidden for me!"
	done

AcaniaMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 2, ACANIA_DOCKS
	warp_def $7, $7, 2, ACANIA_DOCKS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_TEACHER, 5, 9, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AcaniaMartNPC, -1
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, ACANIA_STANDARD_MART, -1
	person_event SPRITE_CLERK, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_GOLDTOKEN, ACANIA_GOLD_TOKEN_MART, -1
