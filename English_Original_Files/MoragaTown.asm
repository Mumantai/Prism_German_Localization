MoragaTown_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_MORAGA_TOWN
	return

MoragaTown_GoldToken:
	dw EVENT_MORAGA_TOWN_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

MoragaTownGymSign:
	ctxt "#mon Gym"
	next "Leader: Lois"
	nl   ""
	next "The harmonious"
	next "grassy Trainer!"
	done

MoragaTownTownSign:
	ctxt "Not really a town"
	next "at all"
	done

MoragaTownClosedSign:
	ctxt "Closed for"
	next "renovations."
	done

MoragaTownNPC1:
	ctxt "Why would someone"
	line "plant the flowers"
	para "in front of the"
	line "entrance way?"

	para "They keep getting"
	line "stepped on!"
	done

MoragaTownNPC2:
	ctxt "I heard they're"
	line "putting a museum"
	para "in this big"
	line "building."

	para "We could use some"
	line "culture."
	done

MoragaTownNPC3:
	ctxt "These narrow paths"
	line "often create"
	para "annoying walls of"
	line "people."

	para "Getting them to"
	line "move is harder"
	para "than waking up a"
	line "Snorlax."
	done

MoragaTownNPC4:
	ctxt "Why they won't let"
	line "an old man visit"
	para "the Gym is beyond"
	line "me!"
	done

MoragaTown_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def $21, $2b, 2, MORAGA_GATE_UNDERGROUND
	warp_def $15, $3, 1, MORAGA_MART
	warp_def $3, $5, 1, MORAGA_TM_MACHINE
	warp_def $5, $1e, 1, MORAGA_GYM
	warp_def $f, $9, 1, MORAGA_HOUSE
	warp_def $7, $27, 1, MORAGA_POKECENTER
	warp_def $1d, $5, 1, MORAGA_DINER
	warp_def $13, $28, 3, SILK_TUNNEL_1F

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 7, 29, SIGNPOST_LOAD, MoragaTownGymSign
	signpost 29, 25, SIGNPOST_LOAD, MoragaTownTownSign
	signpost 27, 33, SIGNPOST_LOAD, MoragaTownClosedSign
	signpost 6, 10, SIGNPOST_ITEM, MoragaTown_GoldToken

.ObjectEvents
	db 5
	person_event SPRITE_POKE_BALL, 12, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, KINGS_ROCK, EVENT_MORAGA_TOWN_ITEM_KINGS_ROCK
	person_event SPRITE_TEACHER, 22, 40, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, MoragaTownNPC1, -1
	person_event SPRITE_POKEFAN_F, 28, 20, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaTownNPC2, -1
	person_event SPRITE_COOLTRAINER_M, 11, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaTownNPC3, -1
	person_event SPRITE_SAGE, 6, 27, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaTownNPC4, -1
