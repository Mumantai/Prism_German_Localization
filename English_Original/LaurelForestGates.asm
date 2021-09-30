LaurelForestGates_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

LaurelForestGates_GoldToken:
	dw EVENT_LAUREL_FOREST_GATES_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

LaurelForestGates_MapEventHeader:: db 0, 0

.Warps
	db 10
	warp_def 0, 5, 4, LAUREL_FOREST_MAIN
	warp_def 7, 4, 3, TORENIA_CITY
	warp_def 7, 5, 3, TORENIA_CITY
	warp_def 14, 4, 1, LAUREL_FOREST_MAIN
	warp_def 14, 5, 2, LAUREL_FOREST_MAIN
	warp_def 21, 4, 1, ROUTE_76
	warp_def 21, 5, 1, ROUTE_76
	warp_def 7, 19, 5, LAUREL_FOREST_MAIN
	warp_def 0, 4, 3, LAUREL_FOREST_MAIN
	warp_def 7, 20, 5, LAUREL_FOREST_MAIN

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 3, 22, SIGNPOST_ITEM, LaurelForestGates_GoldToken

.ObjectEvents
	db 0
