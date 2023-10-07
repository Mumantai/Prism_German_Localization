SaffronMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronMartNPC1:
	ctxt "A Trainer called"
	line "Gold once visited"
	para "Saffron and showed"
	line "me how to be"
	cont "stronger."

	para "I was able to"
	line "defeat the leader"
	para "of the Fighting"
	line "Dojo, but Sabrina"
	para "is still too much"
	line "for me!"
	done

SaffronMartNPC2:
	ctxt "It's always"
	line "exciting to meet"
	para "visitors from"
	line "faraway regions."
	done

SaffronMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 5, SAFFRON_CITY
	warp_def $7, $7, 5, SAFFRON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, SAFFRON_STANDARD_MART, -1
	person_event SPRITE_COOLTRAINER_F, 6, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaffronMartNPC1, -1
	person_event SPRITE_LASS, 3, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronMartNPC2, -1
