GravelTown_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_GRAVEL_TOWN
	setevent EVENT_RIJON_SECOND_PART
	return

GravelTown_GoldToken:
	dw EVENT_GRAVEL_TOWN_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

GravelTown_LabSign:
	ctxt "Professor Tim's"
	next "Lab"
	done

GravelTown_TownSign:
	ctxt "A quiet mountain"
	next "town."
	done

GravelTown_CaveSign:
	ctxt "Merson Cave"
	next "Entrance"
	done

GravelTownNPC1:
	ctxt "The crisp mountain"
	line "air makes me feel"
	cont "so alive!"
	done

GravelTownNPC2:
	ctxt "Someone planted"
	line "these flowers in"
	para "the middle of"
	line "this path."

	para "Even though people"
	line "walk on them all"
	para "the time, they're"
	line "inexplicably"
	cont "staying strong."
	done

GravelTown_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $23, $d, 2, MERSON_CAVE_B2F
	warp_def $1b, $9, 1, GRAVEL_MART
	warp_def $b, $c, 1, JENS_LAB

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 13, 13, SIGNPOST_LOAD, GravelTown_LabSign
	signpost 9, 3, SIGNPOST_LOAD, GravelTown_TownSign
	signpost 35, 11, SIGNPOST_LOAD, GravelTown_CaveSign
	signpost 27, 10, SIGNPOST_JUMPSTD, martsign
	signpost 1, 6, SIGNPOST_ITEM, GravelTown_GoldToken

.ObjectEvents
	db 2
	person_event SPRITE_COOLTRAINER_M, 12, 4, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GravelTownNPC1, -1
	person_event SPRITE_YOUNGSTER, 28, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GravelTownNPC2, -1
