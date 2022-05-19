EagulouMart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

EagulouMartNPC:
	ctxt "Alle, die in der "
	line "Stadt wohnten, "
	cont "zogen aus."

	para "Sie mochten den "
	line "neuen Knast"
	cont "hier nicht."
	done

EagulouMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 5, EAGULOU_CITY
	warp_def $7, $7, 5, EAGULOU_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, EAGULOU_STANDARD_MART, -1
	person_event SPRITE_SAGE, 5, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, EagulouMartNPC, -1
