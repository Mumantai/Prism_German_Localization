Route52House_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route52House_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $2, 3, ROUTE_52
	warp_def $7, $3, 3, ROUTE_52

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
