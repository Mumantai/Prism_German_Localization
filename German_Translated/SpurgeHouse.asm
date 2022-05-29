SpurgeHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SpurgeHouseNPC1:
	ctxt "Bergbau ist toll!"

	para "Wenn du Bergbau"
	line "ausprobieren"
	para "willst, besorge"
	line "dir ne Spitzhacke!"

	para "Interagiere dann"
	line "mit einer felsigen"
	para "Oberfläche und bau"
	line "alles Mögliche ab!"
	done

SpurgeHouseNPC2:
	ctxt "Ein Dorf in der"
	line "Nähe verkauft"
	cont "Spitzhacken."

	para "Für das Bergbau"
	line "brauchst du mehr"
	cont "als eine!"
	done

SpurgeHouse_MapEventHeader ;filler
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
