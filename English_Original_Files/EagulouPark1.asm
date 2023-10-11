EagulouPark1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EagulouPark1AreaSign:
	ctxt "Area 3"
	done

EagulouPark1_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 7, EAGULOU_PARK_2
	warp_def $5, $0, 3, EAGULOU_PARK_2
	warp_def $16, $0, 5, EAGULOU_PARK_3
	warp_def $17, $0, 6, EAGULOU_PARK_3

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 23, 5, SIGNPOST_LOAD, EagulouPark1AreaSign

.ObjectEvents
	db 3
	person_event SPRITE_POKE_BALL, 1, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ULTRA_BALL, EVENT_EAGULOU_PARK_1_ITEM_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 4, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_HEADBUTT, 0, EVENT_EAGULOU_PARK_1_TM_HEADBUTT
	person_event SPRITE_POKE_BALL, 24, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CHARCOAL, EVENT_EAGULOU_PARK_1_ITEM_CHARCOAL
