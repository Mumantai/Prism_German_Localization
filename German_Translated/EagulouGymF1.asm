EagulouGymF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

EagulouGymF1_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $d, $a, 2, EAGULOU_CITY
	warp_def $b, $11, 1, EAGULOU_GYM_B1F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
