Route70_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route70HiddenItem:
	dw EVENT_ROUTE_70_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route70DirectionsSign1:
	ctxt "<UP> Heidenau"
	next "<DOWN> Capparia City"
	done

Route70DirectionsSign2:
	ctxt "<RIGHT> Route 69"
	done

Route70IslandSign:
	signpostheader 7
	done

Route70NPC1:
	ctxt "Man, dieser Schnee"
	line "ist wirklich tief!"
	para "Wenn du beim"
	line "laufen den" 
	para "B-Knopf drückst,"
	line "rennst du"
	cont "schneller!"
	done

Route70NPC2:
	ctxt "Siehst du rechts"
	line "den Tunnel?"
	para "Es führt in die"
	line "Rijon-Region!"
	para "Du brauchst einen"
	line "Rijon-Pass damit"
	para "dich der Wächter"
	line "passieren lässt."
	done

Route70_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 6, 13, 1, ROUTE_69_SOUTH_GATE
	warp_def 11, 13, 1, LONG_TUNNEL_PATH
	warp_def 7, 13, 1, ROUTE_69_SOUTH_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 39, 8, SIGNPOST_LOAD, Route70DirectionsSign1
	signpost 7, 10, SIGNPOST_LOAD, Route70DirectionsSign2
	signpost 29, 7, SIGNPOST_ITEM, Route70HiddenItem
	signpost 50,  8, SIGNPOST_LOAD, Route70IslandSign

.ObjectEvents: db 4
	person_event SPRITE_YOUNGSTER, 38, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route70NPC1, -1
	person_event SPRITE_FISHER, 15, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route70NPC2, -1
	person_event SPRITE_POKE_BALL, 11, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ANTIDOTE, EVENT_ROUTE_70_ITEM_ANTIDOTE
	person_event SPRITE_POKE_BALL, 31, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, REPEL, EVENT_ROUTE_70_ITEM_REPELS