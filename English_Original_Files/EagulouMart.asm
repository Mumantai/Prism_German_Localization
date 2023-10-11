EagulouMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EagulouMartNPC:
	ctxt "Everyone who lived"
	line "in the city moved"
	cont "out."

	para "Seems like they"
	line "didn't like a"
	para "prison opening up"
	line "here."
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
