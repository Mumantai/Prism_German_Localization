CastroMansion_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CastroMansion_GoldToken:
	dw EVENT_CASTRO_MANSION_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

CastroMansionNPC:
	ctxt "What?"

	para "This dump is"
	line "being renovated."

	para "I am on break, so"
	line "please let me be."
	done

CastroMansion_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $17, $e, 2, CASTRO_VALLEY
	warp_def $17, $f, 2, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 7, 7, SIGNPOST_ITEM, CastroMansion_GoldToken

.ObjectEvents
	db 3
	person_event SPRITE_POKE_BALL, 17, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, ULTRA_BALL, EVENT_CASTRO_MANSION_ITEM_ULTRA_BALLS
	person_event SPRITE_POKE_BALL, 17, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAGNET, EVENT_CASTRO_MANSION_ITEM_MAGNET
	person_event SPRITE_FISHER, 14, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroMansionNPC, -1
