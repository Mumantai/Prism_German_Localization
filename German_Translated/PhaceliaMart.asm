PhaceliaMart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhaceliaMartNPC1:
	ctxt "Warum brauchen wir"
	line "all diese Städte?"

	para "Ich genieße das"
	line "ländliche so sehr."

	para "Ein alter Mann wie"
	line "ich, braucht in"
	para "seinem Leben nicht"
	line "noch mehr Stress."
	para "Die Bauarbeiten"
	line "hier sind jedoch"
	cont "schon sehr nervig."
	done

PhaceliaMartNPC2:
	ctxt "Andre ist ein"
	line "Beast!"

	para "Die Arena baute er"
	line "bevor es hier ein"
	cont "Dorf gab!"

	para "Stell dir vor,"
	line "eine Arena in"
	cont "einer HÖHLE!"
	done

PhaceliaMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 5, PHACELIA_CITY
	warp_def $7, $7, 5, PHACELIA_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, PHACELIA_STANDARD_MART, -1
	person_event SPRITE_GRAMPS, 6, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaMartNPC1, -1
	person_event SPRITE_BLACK_BELT, 2, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaMartNPC2, -1
