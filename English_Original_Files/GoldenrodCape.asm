GoldenrodCape_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodCape_GoldToken:
	dw EVENT_GOLDENROD_CAPE_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

GoldenrodCape_Trainer_1:
	trainer EVENT_GOLDENROD_CAPE_TRAINER_1, FISHER, 1, .before_battle_text, .battle_won_text

	ctxt "<...>"

	para "But her aim is"
	line "gettin' better!"

	para "<...>"
	line "Tough crowd."
	done

.before_battle_text
	ctxt "My ex-wife still"
	line "misses me<...>"
	done

.battle_won_text
	ctxt "But her aim is"
	line "gettin' better!"
	done

GoldenrodCapeMagnetTrainSign:
	signpostheader 2
	ctxt "Do not trespass"
	next "on the railway."
	nl
	next "Maximum fine:"
	next "¥1,000,000"
	done

GoldenrodCape_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $6, $13, 1, GOLDENROD_CAPE_GATE
	warp_def $7, $13, 2, GOLDENROD_CAPE_GATE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 11, 20, SIGNPOST_ITEM, GoldenrodCape_GoldToken
	signpost  5, 10, SIGNPOST_LOAD, GoldenrodCapeMagnetTrainSign

.ObjectEvents
	db 5
	person_event SPRITE_POKE_BALL, 5, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_BLIZZARD, 0, EVENT_GOT_TM14
	person_event SPRITE_POKE_BALL, 19, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 5, MINING_PICK, EVENT_GOLDENROD_CAPE_ITEM_MINING_PICKS
	person_event SPRITE_ROCK, 7, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_FISHER,  9, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, GoldenrodCape_Trainer_1, -1
	person_event SPRITE_POKE_BALL,  2,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAGNET, EVENT_GOLDENROD_CAPE_ITEM_MAGNET
