MilosTowerClimb_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MilosTowerClimb_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $5, $5, 1, MILOS_GREEN_ORB
	warp_def $2c, $5, 2, MILOS_F1

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
