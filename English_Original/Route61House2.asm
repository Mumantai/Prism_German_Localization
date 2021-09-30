Route61House2_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route61House2_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $2, 1, ROUTE_61
	warp_def $7, $3, 1, ROUTE_61

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
