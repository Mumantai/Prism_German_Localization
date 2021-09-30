Route67House_MapScriptHeader;trigger count
	db 0

 ;callback count
	db 0

Route67House_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 2, 5, ROUTE_67
	warp_def 7, 3, 5, ROUTE_67
	warp_def 3, 3, 2, NALJO_BORDER_WARPROOM

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
