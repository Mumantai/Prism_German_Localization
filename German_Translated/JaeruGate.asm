JaeruGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

JaeruGateGuard:
	ctxt "Wenn du hierher"
	line "über das Portal"
	para "gekommen bist,"
	line "können wir dich"
	para "leider nicht"
	line "passieren lassen."

	para "Sorry."
	done

JaeruGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $0, $4, 2, ROUTE_65
	warp_def $0, $5, 3, ROUTE_65
	warp_def $7, $4, 1, JAERU_CITY
	warp_def $7, $5, 1, JAERU_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, JaeruGateGuard, EVENT_CASTRO_FOREST_TRAINER_2
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, JaeruGateGuard, EVENT_CASTRO_FOREST_TRAINER_2
