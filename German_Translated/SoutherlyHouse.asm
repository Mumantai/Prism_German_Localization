SoutherlyHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SoutherlyHouseNPC:
	ctxt "Ein netter Trainer"
	line "gab mir vor langer"
	cont "Zeit ein Kirlia."

	para "Meins hat sich zu"
	line "einem Galagladi"
	cont "entwickelt!"

	para "Nur männliche"
	line "Kirlia entwickeln"
	cont "sich zu Galagladi."

	done

SoutherlyHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 2, SOUTHERLY_CITY
	warp_def $7, $3, 2, SOUTHERLY_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SAILOR, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SoutherlyHouseNPC, -1
