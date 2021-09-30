Route78EastExit_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route78EastExit_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $3, 3, ROUTE_78
	warp_def $7, $11, 1, ROUTE_79

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
