SeashoreMura_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SeashoreMuraFearow:
	faceplayer
	opentext
	writetext .text
	cry FEAROW
	endtext

.text
	ctxt "Fearry: Feero!"
	done

SeashoreMuraSister:
	ctxt "Mein Vater übt"
	line "zusätzlichen Druck"
	para "auf mich aus, um"
	line "sicherzustellen,"
	para "dass ich mich gut "
	line "entwickle."

	done

SeashoreMuraDad:
	ctxt "Ich hoffe, meinem"
	line "Jungen Mura geht"
	cont "es gut."

	para "Er ist jetzt Teil"
	line "der Liga von "
	cont "Rijon."

	done

SeashoreMura_MapEventHeader: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 4, SEASHORE_CITY
	warp_def $7, $3, 4, SEASHORE_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_FEAROW, 2, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SeashoreMuraFearow, -1
	person_event SPRITE_LASS, 3, 0, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SeashoreMuraSister, -1
	person_event SPRITE_FISHING_GURU, 4, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SeashoreMuraDad, -1
