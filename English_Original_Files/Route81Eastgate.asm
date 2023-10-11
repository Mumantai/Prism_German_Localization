Route81Eastgate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route81EastgateNPC:
	ctxt "If you're going"
	line "east, I'd advise"
	para "against it unless"
	line "you're looking for"
	cont "some trouble."
	done

Route81Eastgate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $4, $0, 3, ROUTE_81
	warp_def $5, $0, 5, ROUTE_81
	warp_def $4, $9, 1, ROUTE_80
	warp_def $5, $9, 2, ROUTE_80

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route81EastgateNPC, -1
