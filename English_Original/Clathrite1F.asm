Clathrite1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Clathrite1FMinecart:
	farjump MinecartScript

Clathrite1F_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def 31, 37, 7, CLATHRITE_1F
	warp_def 13, 7, 4, CLATHRITE_B1F
	warp_def 11, 23, 2, CLATHRITE_B1F
	warp_def 9, 23, 4, RUINS_OUTSIDE
	warp_def 15, 9, 1, ROUTE_84
	warp_def 33, 3, 9, ROUTE_72_GATE
	warp_def 17, 37, 1, CLATHRITE_1F
	warp_def 19, 39, 1, ROUTE_71B

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 38, 20, SIGNPOST_READ, Clathrite1FMinecart

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 30, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_HAIL, 0, EVENT_GOT_TM09

