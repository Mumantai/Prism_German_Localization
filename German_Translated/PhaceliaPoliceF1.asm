PhaceliaPoliceF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhaceliaPoliceF1_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $7, $3, 3, PHACELIA_CITY
	warp_def $7, $4, 3, PHACELIA_CITY
	warp_def $4, $3, 1, PHACELIA_POLICE_F2

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
