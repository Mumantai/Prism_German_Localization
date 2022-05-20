GoldenrodStorage_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

GoldenrodStorage_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $b, $2, 2, GOLDENROD_SWITCHES
	warp_def $b, $3, 3, GOLDENROD_SWITCHES
	warp_def $2, $11, 1, GOLDENROD_MART_B1F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
