SaffronMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronMartNPC1:
	ctxt "Ein Trainer namens"
	line "Gold besuchte mal"
	para "Safronia City und"
	line "verriet mir, wie"
	para "ich stärker werden"
	line "kann."
	para "Ich konnte die"
	line "Leiterin des Kampf"
	para "Dojos besiegen,"
	line "aber Sabrina ist"
	para "immer noch zu"
	line "stark für mich!"
	done

SaffronMartNPC2:
	ctxt "Es ist immer"
	line "spannend, Besucher"
	para "aus weit"
	line "entfernten"
	para "Regionen zu "
	line "treffen."
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