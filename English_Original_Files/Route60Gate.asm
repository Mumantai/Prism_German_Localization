Route60Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route60GateGuard:
	ctxt "Check out the"
	line "Power Plant south"
	para "of here if you"
	line "haven't yet."
	done

Route60Gate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $4, $0, 2, ROUTE_60
	warp_def $5, $0, 2, ROUTE_60
	warp_def $4, $7, 2, JAERU_CITY
	warp_def $5, $7, 2, JAERU_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, Route60GateGuard, -1
