Route82Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route82GateGuard:
	ctxt "If you can't swim,"
	line "or use Surf, I"
	para "recommend heading"
	line "back to the city."
	done

Route82Gate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $4, $0, 9, TORENIA_CITY
	warp_def $5, $0, 10, TORENIA_CITY
	warp_def $4, $9, 1, ROUTE_82
	warp_def $5, $9, 2, ROUTE_82

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route82GateGuard, -1
