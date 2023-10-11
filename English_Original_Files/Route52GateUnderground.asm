Route52GateUnderground_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route52GateUndergroundNPC:
	ctxt "Get out of my"
	line "house!"
	done

Route52GateUnderground_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $4, $4, 1, RIJON_UNDERGROUND_HORIZONTAL
	warp_def $7, $3, 2, ROUTE_52
	warp_def $7, $4, 2, ROUTE_52

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route52GateUndergroundNPC, -1
