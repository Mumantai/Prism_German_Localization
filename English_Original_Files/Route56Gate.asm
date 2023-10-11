Route56Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route56GateNPC:
	ctxt "You seem fine, go"
	line "ahead."
	done

Route56Gate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $3, $0, 2, ROUTE_56
	warp_def $4, $0, 2, ROUTE_56
	warp_def $3, $5, 1, ROUTE_57
	warp_def $4, $5, 1, ROUTE_57

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 1, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, Route56GateNPC, -1
