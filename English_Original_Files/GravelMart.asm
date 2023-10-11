GravelMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GravelMartNPC1:
	ctxt "I'm worried about"
	line "Prof. Tim."

	para "He's never been"
	line "gone for this"
	cont "long before."
	done

GravelMartNPC2:
	ctxt "Elixirs are great,"
	line "but expensive!"
	done

GravelMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 2, GRAVEL_TOWN
	warp_def $7, $7, 2, GRAVEL_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.Object
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, GRAVEL_STANDARD_MART, -1
	person_event SPRITE_FISHER, 5, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GravelMartNPC1, -1
	person_event SPRITE_BLACK_BELT, 2, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GravelMartNPC2, -1
