Route82Cave_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route82Cave_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $3, 4, ROUTE_82
	warp_def $5, $b, 5, ROUTE_82

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_POKE_BALL, 2, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HARD_STONE, EVENT_ROUTE_82_CAVE_ITEM_HARD_STONE
