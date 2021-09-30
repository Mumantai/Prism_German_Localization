RuinsEntry_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RuinsEntry_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $5, $7, 2, ROUTE_78
	warp_def $1, $5, 1, RUINS_OUTSIDE

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
