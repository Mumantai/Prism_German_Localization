AcquaRoom_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, .AcquaRoomWarp
	
.AcquaRoomWarp
	writebyte 2
	farjump AcquaWarpMod

AcquaRoom_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $3, $25, 2, ACQUA_START
	warp_def $d, $5, 3, ACQUA_MEDTIDE
	warp_def $15, $3, 3, ACQUA_LOWTIDE
	dummy_warp $21, $3
	warp_def $1f, $1f, 6, ACQUA_ROOM
	warp_def $1f, $7, 5, ACQUA_ROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_POKE_BALL, 10, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SHARP_BEAK, EVENT_ACQUA_ROOM_ITEM_SHARP_BEAK
	person_event SPRITE_POKE_BALL, 20, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, TRADE_STONE, EVENT_ACQUA_ROOM_ITEM_TRADE_STONE
	person_event SPRITE_POKE_BALL, 23, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NUGGET, EVENT_ACQUA_ROOM_ITEM_NUGGET
