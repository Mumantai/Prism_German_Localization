ToreniaCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_TORENIA_CITY
	return

ToreniaCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Edison"
	done

ToreniaCityCitySign:
	ctxt "The region's"
	next "youngest city"
	done

ToreniaCityPachisiSign:
	ctxt "Pachisi Hall"
	done

ToreniaCityNPC1:
	ctxt "The Pachisi board"
	line "is so much fun!"

	para "I actually caught"
	line "a new #mon"
	cont "there recently!"
	done

ToreniaCityNPC2:
	ctxt "Living here at a"
	line "time like this<...>"

	para "It's like being a"
	line "part of history."
	done

ToreniaCityNPC3:
	ctxt "Last time I spoke"
	line "to the Gym Leader,"
	para "he said he wished"
	line "he could dream."

	para "What's the big deal"
	line "about dreaming?"

	para "Dreams scare me."
	done

ToreniaCityNPC4:
	ctxt "This city is gonna"
	line "be huge once the"
	cont "expansion is done."
	done

ToreniaCity_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 13
	warp_def $13, $15, 1, TORENIA_MART
	warp_def $1f, $22, 1, TORENIA_GYM
	warp_def $5, $9, 2, LAUREL_FOREST_GATES
	warp_def $5, $1c, 1, TORENIA_MAGNET_TRAIN
	warp_def $5, $1d, 2, TORENIA_MAGNET_TRAIN
	warp_def $b, $d, 1, TORENIA_POKECENTER
	warp_def $13, $10, 1, TORENIA_PACHISI
	warp_def $b, $17, 1, TORENIA_DRIFLOOM_TRADE
	warp_def $c, $21, 1, ROUTE_82_GATE
	warp_def $d, $21, 2, ROUTE_82_GATE
	warp_def $13, $9, 1, TORENIA_CELEBRITY
	warp_def $1b, $b, 1, TORENIA_GATE
	warp_def $1b, $c, 2, TORENIA_GATE

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 31, 31, SIGNPOST_LOAD, ToreniaCityGymSign
	signpost  5, 30, SIGNPOST_JUMPSTD, magnettrainsign
	signpost 6, 10, SIGNPOST_LOAD, ToreniaCityCitySign
	signpost 19, 13, SIGNPOST_LOAD, ToreniaCityPachisiSign

	;people-events
	db 7
	person_event SPRITE_PICNICKER, 23, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, ToreniaCityNPC1, -1
	person_event SPRITE_PICNICKER, 14, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, ToreniaCityNPC2, -1
	person_event SPRITE_GRAMPS, 11, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, ToreniaCityNPC3, -1
	person_event SPRITE_YOUNGSTER, 18, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, ToreniaCityNPC4, -1
	person_event SPRITE_FRUIT_TREE, 24, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_FRUITTREE, 0, CHERI_TREE_1, -1
	person_event SPRITE_POKE_BALL, 31, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_TORENIA_CITY_ITEM_PP_UP
	person_event SPRITE_POKE_BALL,  1, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, RARE_CANDY, EVENT_TORENIA_CITY_ITEM_RARE_CANDY
