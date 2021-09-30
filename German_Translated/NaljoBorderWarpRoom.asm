NaljoBorderWarpRoom_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

NaljoBorderWarpRoom_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $4, $3, 3, NALJO_BORDER_WEST
	warp_def $3, $5, 3, ROUTE_67_HOUSE

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
