GravelTown_MapScriptHeader:
 ;trigger count
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
	para "the middle of this"
	line "path."

	para "Even though people"
	line "walk on them all"
	para "the time, they're"
	line "inexplicably"
	cont "staying strong."
	done

GravelTownNPC3:
	ctxt "The professor in"
	line "that lab is away"
	cont "on business."

	para "It must be lonely,"
	line "the job that he"
	cont "does."

	para "And, you know, it"
	line "doesn't have to"
	cont "be."

	para "Have you heard of"
	line "Phillip Ilk?"

	para "He grew up here"
	line "and married a"
	para "professor in a"
	line "faraway region."

	para "Plus, he cooks a"
	line "mean Pecha Berry"
	cont "pie!"

	para "So, you see, even"
	line "professors don't"
	cont "have to be lonely."
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
	db 4
	signpost 13, 13, SIGNPOST_LOAD, GravelTown_LabSign
	signpost 9, 3, SIGNPOST_LOAD, GravelTown_TownSign
	signpost 35, 11, SIGNPOST_LOAD, GravelTown_CaveSign
	signpost 1, 6, SIGNPOST_ITEM, GravelTown_GoldToken

.ObjectEvents
	db 3
	person_event SPRITE_COOLTRAINER_M, 12, 4, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GravelTownNPC1, -1
	person_event SPRITE_YOUNGSTER, 28, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GravelTownNPC2, -1
	person_event SPRITE_FISHING_GURU,  6,  9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, GravelTownNPC3, -1
