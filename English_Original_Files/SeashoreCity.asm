SeashoreCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SEASHORE_CITY
	return

SeashoreCityCitySign:
	ctxt "Where waves of"
	next "new journeys"
	next "begin their long"
	next "travels"
	done

SeashoreCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Sheryl"
	done

SeashoreCityNPC1:
	ctxt "Did you know that"
	line "the legendary"
	para "Trainer known as"
	line "Brown once lived"
	cont "here?"

	para "I met him when he"
	line "first started"
	cont "training."
	done

SeashoreCityNPC2:
	ctxt "It's important to"
	line "stay put!"
	done

SeashoreCityNPC3:
	ctxt "Set positive"
	line "goals, then"
	para "achieve them, even"
	line "if only you will"
	cont "appreciate it."
	done

SeashoreCity_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 5
	warp_def $19, $17, 1, BROWNS_HOUSE_F1
	warp_def $3, $20, 3, MERSON_CAVE_B2F
	warp_def $3, $22, 4, MERSON_CAVE_B1F
	warp_def $f, $19, 1, SEASHORE_MURA
	warp_def $d, $20, 1, SEASHORE_GYM

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 29, 21, SIGNPOST_LOAD, SeashoreCityCitySign
	signpost 15, 33, SIGNPOST_LOAD, SeashoreCityGymSign

	;people-events
	db 4
	person_event SPRITE_YOUNGSTER, 23, 29, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SeashoreCityNPC1, -1
	person_event SPRITE_JEN, 18, 26, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SeashoreCityNPC2, -1
	person_event SPRITE_YOUNGSTER, 20, 13, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SeashoreCityNPC3, -1
	person_event SPRITE_POKE_BALL, 6, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, DIVE_BALL, EVENT_SEASHORE_CITY_ITEM_DIVE_BALLS
