NaljoBorderEast_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

NaljoBorderEast_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $4, $4, 4, NALJO_BORDER_WEST
	warp_def $d, $e, 1, ROUTE_64
	warp_def $d, $f, 1, ROUTE_64

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_POKE_BALL, 5, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_LIGHT_SCREEN, 0, EVENT_NALJO_BORDER_EAST_NPC_1
