PhloxEntry_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhloxEntry_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 13, 3, 2, ROUTE_84
	warp_def 5, 13, 4, PHLOX_TOWN

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
