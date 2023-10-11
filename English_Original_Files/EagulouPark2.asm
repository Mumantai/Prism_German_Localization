EagulouPark2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EagulouPark2AreaSign:
	ctxt "Area 2"
	done

EagulouPark2_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def 26, 17, 6, ROUTE_60
	warp_def 0, 4, 5, ROUTE_61
	warp_def 31, 39, 2, EAGULOU_PARK_1
	warp_def 0, 5, 6, ROUTE_62
	warp_def 35, 20, 3, EAGULOU_PARK_3
	warp_def 35, 21, 4, EAGULOU_PARK_3
	warp_def 30, 39, 1, EAGULOU_PARK_1

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost 33, 19, SIGNPOST_LOAD, EagulouPark2AreaSign
	signpost 31, 13, SIGNPOST_LOAD, EagulouPark2AreaSign
	signpost 5, 37, SIGNPOST_LOAD, EagulouPark2AreaSign

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 33, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BERSERK_GENE, EVENT_EAGULOU_PARK_2_ITEM_BERSERK_GENE
