Route59Gate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route59GateGuard:
	ctxt "Botania City ist"
	line "aktuell unter"
	cont "Quarantäne."
	
	para "KEIN PASSIEREN,"
	line "BIS DER BOSS SEIN"
	cont "OK GIBT!!!"
	done

Route59Gate_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def $3, $0, 2, ROUTE_59
	warp_def $4, $0, 2, ROUTE_59
	warp_def $3, $5, 2, BOTAN_CITY
	warp_def $4, $5, 2, BOTAN_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, Route59GateGuard, EVENT_ROUTE_59_TRAINER_1
	person_event SPRITE_OFFICER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, Route59GateGuard, EVENT_ROUTE_59_TRAINER_1
