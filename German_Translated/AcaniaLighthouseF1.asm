AcaniaLighthouseF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AcaniaLighthouseF1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $11, $8, 6, ACANIA_DOCKS
	warp_def $11, $9, 6, ACANIA_DOCKS
	warp_def $b, $9, 1, ACANIA_LIGHTHOUSE_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
