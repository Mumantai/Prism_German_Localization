SeashoreMura_MapScriptHeader:
 ;trigger count
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
	ctxt "My dad puts extra"
	line "pressure on me to"
	para "make sure I turn"
	line "out all right."
	done

SeashoreMuraDad:
	ctxt "I hope my boy Mura"
	line "is doing OK."

	para "He's part of the"
	line "Rijon League now."
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
