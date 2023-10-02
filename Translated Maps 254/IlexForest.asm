IlexForest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

IlexForest_GoldToken:
	dw EVENT_ILEX_FOREST_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

IlexForestShrine:
	ctxt "Dieser Schrein"
	line "wurde zu Ehren des"
	para "Schutzpatrons des"
	line "Waldes errichtet <...>"
	done

IlexForestSign:
	ctxt "Die hohen Bäume"
	next "des Waldes, lassen"
	next "kein Licht durch."
	nl	 ""
	next "Achten Sie auf"
	next "heruntergefallene"
	next "Gegenstände!"
	done

IlexForest_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $5, $1, 5, ROUTE_34_GATE
	warp_def $2a, $3, 1, ILEX_FOREST_GATE
	warp_def $2b, $3, 2, ILEX_FOREST_GATE

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost 22, 8, SIGNPOST_TEXT, IlexForestShrine
	signpost 17, 3, SIGNPOST_LOAD, IlexForestSign
	signpost 6, 17, SIGNPOST_ITEM, IlexForest_GoldToken

.ObjectEvents
	db 2
	person_event SPRITE_POKE_BALL, 22, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, GREEN_FLUTE, EVENT_ILEX_FOREST_ITEM_GREEN_FLUTE
	person_event SPRITE_POKE_BALL, 1, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, PP_UP, EVENT_ILEX_FOREST_ITEM_PP_UPS