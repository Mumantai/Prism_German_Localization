Route69North_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route69NorthDirectionsSign:
	signpostheader 3
	ctxt "Please stop tak-"
	next "ing the signs."
	nl   ""
	next "<UP> Heath Village"
	next "<DOWN> Caper Ridge"
	done

Route69NorthNPC_1:
	ctxt "I used to live"
	line "here."

	para "I still come by to"
	line "water the garden."

	para "Back in the day, I"
	line "would watch over"
	cont "the docks there."

	para "I would help the"
	line "villagers haul in"
	cont "their catch."

	para "I miss those days<...>"
	done

Route69NorthNPC_2:
	ctxt "I come here to be"
	line "alone."

	para "<...>"

	para "Please, leave me"
	line "be."
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
