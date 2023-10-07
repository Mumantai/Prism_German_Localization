Route64_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route64HiddenItem:
	dw EVENT_ROUTE_64_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route64SilphWarehouseSign:
	ctxt "Silph Warehouse"
	done

Route64NaljoBorderSign:
	ctxt "<UP> Naljo Border"
	next "  (Acania Docks)"
	next "<RIGHT> Hayward City"
	done

Route64NaljoBorderInfoSign:
	ctxt "Western Docks"
	next "<LEFT> Naljo Border"
	next "  (Acania Docks)"
	next "<RIGHT> Hayward City"
	done

Route64_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $5, $30, 2, NALJO_BORDER_EAST

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 15, 3, SIGNPOST_LOAD, Route64SilphWarehouseSign
	signpost 9, 49, SIGNPOST_LOAD, Route64NaljoBorderSign
	signpost 15, 79, SIGNPOST_LOAD, Route64NaljoBorderInfoSign
	signpost 6, 39, SIGNPOST_ITEM, Route64HiddenItem

	;people-events
	db 2
	person_event SPRITE_POKE_BALL, 6, 40, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SMOOTH_ROCK, EVENT_ROUTE_64_ITEM_SMOOTH_ROCK
	person_event SPRITE_ROCK, 6, 43, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
