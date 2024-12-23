Route69North_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route69NorthDirectionsSign:
	ctxt "Das stehlen der"
	next "Schilder ist"
	next "verboten!"
	nl   ""
	next "<UP> Heidenau"
	next "<DOWN> Capparia City"
	done

Route69NorthNPC_1:
	ctxt "Ich habe hier mal"
	line "gewohnt."
	para "Ich komme immer"
	line "noch vorbei, um"
	para "den Garten zu"
	line "gießen."
	para "Früher habe ich"
	line "dort am Hafen den"
	para "Dorfbewohnern"
	line "geholfen, ihren"
	cont "Fang einzuholen."
	para "Ich vermisse diese"
	line "Tage <...>"
	done

Route69NorthNPC_2:
	ctxt "Ich kam her um"
	line "alleine zu sein."
	para "<...>"
	para "Also lass mich"
	line "bitte in Ruhe."
	done

Route69North_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def 25, 33, 1, ROUTE_69_NORTH_GATE
	warp_def 25, 34, 2, ROUTE_69_NORTH_GATE

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 11,  7, SIGNPOST_LOAD, Route69NorthDirectionsSign

	;people-events
	db 3
	person_event SPRITE_SAILOR,  8, 23, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, Route69NorthNPC_1, -1
	person_event SPRITE_COOLTRAINER_F, 20, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, Route69NorthNPC_2, -1
	person_event SPRITE_POKE_BALL, 12, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, LEAF_STONE, EVENT_ROUTE_69_ITEM_LEAF_STONE