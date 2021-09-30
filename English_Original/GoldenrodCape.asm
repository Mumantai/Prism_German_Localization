GoldenrodCape_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

GoldenrodCape_GoldToken:
	dw EVENT_GOLDENROD_CAPE_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

GoldenrodCape_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $6, $13, 1, GOLDENROD_CAPE_GATE
	warp_def $7, $13, 2, GOLDENROD_CAPE_GATE

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 11, 20, SIGNPOST_ITEM, GoldenrodCape_GoldToken

.ObjectEvents
	db 3
	person_event SPRITE_POKE_BALL, 5, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_BLIZZARD, 0, EVENT_GOT_TM14
	person_event SPRITE_POKE_BALL, 19, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 5, MINING_PICK, EVENT_GOLDENROD_CAPE_ITEM_MINING_PICKS
	person_event SPRITE_ROCK, 7, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
