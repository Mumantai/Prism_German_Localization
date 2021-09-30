MtEmberRoom2_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MtEmberRoom2_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $c, 2, MT_EMBER
	warp_def $b, $d, 2, MT_EMBER

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 4, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HEAT_ROCK, EVENT_MT_EMBER_ROOM_2_ITEM_HEAT_ROCK
