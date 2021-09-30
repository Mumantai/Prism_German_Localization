OwsauriNamerater_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

OwsauriNameraterNPC:
	faceplayer
	opentext
	special NameRater
	endtext

OwsauriNamerater_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $2, 1, OWSAURI_CITY
	warp_def $7, $3, 1, OWSAURI_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_GENTLEMAN, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OwsauriNameraterNPC, -1
