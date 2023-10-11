AcaniaHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaHouseNPC:
	ctxt "This was a decent"
	line "place to live in,"

	para "until that Gym"
	line "Leader showed up."

	para "She uses Gas-"
	line "type #mon,"

	para "and the foul odor"
	line "is unpleasant."
	done

AcaniaHouseAggron:
	faceplayer
	opentext
	writetext .text
	cry AGGRON
	endtext

.text
	ctxt "Aggron: Rwar!"
	done

AcaniaHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 7, ACANIA_DOCKS
	warp_def $7, $3, 7, ACANIA_DOCKS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_COOLTRAINER_F, 3, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AcaniaHouseNPC, -1
	person_event SPRITE_AGGRON, 5, 1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, AcaniaHouseAggron, -1
