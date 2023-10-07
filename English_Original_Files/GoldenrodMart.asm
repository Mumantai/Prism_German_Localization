GoldenrodMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodMartNPC1:
	ctxt "This place has a"
	line "decent selection"
	para "for a single-floor"
	line "mart."
	done

GoldenrodMartNPC2:
	ctxt "A huge department"
	line "store used to"
	cont "stand here."

	para "The quake"
	line "destroyed the"
	cont "building."

	para "Goldenrod will"
	line "have a basic mart"
	para "until more floors"
	line "are built."
	done

GoldenrodMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 2, GOLDENROD_CITY
	warp_def $7, $7, 2, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_SUPER_NERD, 2, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodMartNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 5, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, GoldenrodMartNPC2, -1
	person_event SPRITE_CLERK, 3, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, GOLDENROD_STANDARD_MART, -1
