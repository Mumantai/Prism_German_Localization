MoragaHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaHouseNPC1:
	ctxt "Papa always likes"
	line "to act nostalgic."
	done

MoragaHouseNPC2:
	ctxt "This town's crime"
	line "rate has grown"
	para "ever since they"
	line "added that Botan"
	cont "train station."
	done

MoragaHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 5, MORAGA_TOWN
	warp_def $7, $3, 5, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_YOUNGSTER, 4, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaHouseNPC1, -1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaHouseNPC2, -1
