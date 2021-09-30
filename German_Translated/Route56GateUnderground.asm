Route56GateUnderground_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route56GateUnderground_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $4, $4, 2, RIJON_UNDERGROUND_VERTICAL
	warp_def $7, $3, 1, ROUTE_56
	warp_def $7, $4, 1, ROUTE_56

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
