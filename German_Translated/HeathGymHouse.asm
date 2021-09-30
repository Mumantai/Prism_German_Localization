HeathGymHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HeathGymHouse_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $9, $3, 2, HEATH_GYM
	warp_def $9, $4, 2, HEATH_GYM
	warp_def $5, $7, 2, HEATH_GYM_UNDERGROUND

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
