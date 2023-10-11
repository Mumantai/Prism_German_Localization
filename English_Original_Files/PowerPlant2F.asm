PowerPlant2F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PowerPlant2F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $d, $2, 3, POWER_PLANT_1F
	warp_def $2, $3, 1, POWER_PLANT_3F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_POKE_BALL,  3,  8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAX_ETHER, EVENT_POWER_PLANT_ITEM_MAX_ETHER
