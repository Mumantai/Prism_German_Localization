FirelightMinecart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

FirelightMinecart_Minecart:
	farjump MinecartScript

FirelightMinecart_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def 7, 5, 2, FIRELIGHT_ROOMS

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 14, 12, SIGNPOST_READ, FirelightMinecart_Minecart

.ObjectEvents
	db 2
	person_event SPRITE_POKE_BALL, 7, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CONFUSEGUARD, EVENT_FIRELIGHT_MINECART_ITEM_CONFUSEGUARD
	person_event SPRITE_ROCK, 4, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
