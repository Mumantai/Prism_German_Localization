MtBoulderB2F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtBoulderB2FUnreadableSign:
	ctxt "The sign is too"
	line "damaged; it is no"
	cont "longer readable."
	done

MtBoulderB2F_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $11, $14, 8, MT_BOULDER_B1F
	warp_def $11, $15, 8, MT_BOULDER_B1F
	warp_def $7, $b, 2, MT_BOULDER_B1F
	warp_def $4, $19, 3, MT_BOULDER_B1F

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 15, 9, SIGNPOST_TEXT, MtBoulderB2FUnreadableSign

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 1, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_REFLECT, 0, EVENT_MT_BOULDER_B2F_NPC_1
