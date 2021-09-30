PhaceliaMoveDeleter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhaceliaMoveDeleterDude:
	faceplayer
	opentext
	special MoveDeletion
	endtext

PhaceliaMoveDeleter_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $2, 7, PHACELIA_CITY
	warp_def $7, $3, 7, PHACELIA_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_ROCKER, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PhaceliaMoveDeleterDude, -1
