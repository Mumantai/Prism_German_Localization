EagulouPark3_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

EagulouPark3_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $19, $2, 1, EAGULOU_PARK_GATE
	warp_def $19, $3, 2, EAGULOU_PARK_GATE
	warp_def $0, $e, 5, EAGULOU_PARK_2
	warp_def $0, $f, 6, EAGULOU_PARK_2
	warp_def $a, $1d, 3, EAGULOU_PARK_1
	warp_def $b, $1d, 4, EAGULOU_PARK_1

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
