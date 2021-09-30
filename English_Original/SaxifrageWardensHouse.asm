SaxifrageWardensHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaxifrageWardensHouse_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $7, $2, 7, SAXIFRAGE_ISLAND
	warp_def $7, $3, 7, SAXIFRAGE_ISLAND
	warp_def $2, $6, 1, PRISON_PATHS

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
