Route67Gate_MapScriptHeader;trigger count
	db 0

 ;callback count
	db 0


Route67Gate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 7, 2, 1, ROUTE_65
	warp_def 7, 3, 1, ROUTE_65
	warp_def 3, 12, 1, ROUTE_67
	warp_def 3, 13, 1, ROUTE_67

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
