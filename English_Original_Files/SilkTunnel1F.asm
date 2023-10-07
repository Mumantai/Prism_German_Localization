SilkTunnel1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilkTunnel1FHiddenItem:
	dw EVENT_SILK_TUNNEL_1F_HIDDENITEM_CRYSTAL_EGG
	db CRYSTAL_EGG

SilkTunnel1FSign:
	ctxt "<LEFT> Hayward City"
	next "<RIGHT> Moraga Town"
	done

SilkTunnel1F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 7
	warp_def $11, $4, 1, ROUTE_63
	warp_def $11, $5, 1, ROUTE_63
	warp_def $11, $1a, 8, MORAGA_TOWN
	warp_def $11, $1b, 8, MORAGA_TOWN
	warp_def $5, $7, 4, LONG_TUNNEL_PATH
	warp_def $3, $19, 7, SILK_TUNNEL_B1F
	warp_def $f, $17, 5, SILK_TUNNEL_B1F

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 3, 22, SIGNPOST_LOAD, SilkTunnel1FSign
	signpost 7, 11, SIGNPOST_ITEM, SilkTunnel1FHiddenItem

	;people-events
	db 3
	person_event SPRITE_POKE_BALL, 8, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ROCK_SLIDE, 0, EVENT_SILK_TUNNEL_1F_TM
	person_event SPRITE_ROCK, 7, 26, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_BOULDER, 8, 26, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
