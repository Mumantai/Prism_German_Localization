PrisonPaths_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PrisonPaths_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 18, 3, 3, SAXIFRAGE_WARDENS_HOUSE
	warp_def 32, 3, 3, PRISON_F1
	warp_def 7, 14, 5, PRISON_F1
	warp_def 7, 15, 5, PRISON_F1
	warp_def 4, 3, 6, PRISON_PATHS
	warp_def 31, 17, 5, PRISON_PATHS
	warp_def 35, 16, 4, PRISON_F1
	warp_def 35, 17, 4, PRISON_F1

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
