Route52Gate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route52Gate_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $0, $5, 5, HAYWARD_CITY
	warp_def $7, $4, 1, ROUTE_52
	warp_def $7, $5, 1, ROUTE_52

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
