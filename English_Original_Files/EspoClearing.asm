EspoClearing_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EspoClearingHiddenItem1:
	dw EVENT_ESPO_CLEARING_HIDDENITEM_STARDUST
	db STARDUST

EspoClearingHiddenItem2:
	dw EVENT_ESPO_CLEARING_HIDDENITEM_STAR_PIECE
	db STAR_PIECE

EspoClearingSign:
	ctxt "<RIGHT> Southerly City"
	next "<LEFT> Espo Forest"
	done

EspoClearingNPC1:
	ctxt "My dad taught me"
	line "how to fish here."

	para "He also always"
	line "told me to keep"
	para "away from the"
	line "forest."
	done

EspoClearing_Trainer_1:
	trainer EVENT_ESPO_CLEARING_TRAINER_1, COOLTRAINERF, 6, .before_battle_text, .battle_won_text

	ctxt "Anybody can be a"
	line "Psychic."

	para "It just takes"
	line "concentration and"
	cont "dedication."
	done

.before_battle_text
	ctxt "Behold my psychic"
	line "power!"
	done

.battle_won_text
	ctxt "<...>Ow, my head<...>"
	done

EspoClearing_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $e, $2, 1, ESPO_FOREST
	warp_def $e, $3, 2, ESPO_FOREST

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost  5, 22, SIGNPOST_LOAD, EspoClearingSign
	signpost  9, 31, SIGNPOST_ITEM, EspoClearingHiddenItem1
	signpost  7,  9, SIGNPOST_ITEM, EspoClearingHiddenItem2

.ObjectEvents
	db 3
	person_event SPRITE_COOLTRAINER_F,  7,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, EspoClearing_Trainer_1, -1
	person_event SPRITE_PICNICKER, 6, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, EspoClearingNPC1, -1
	person_event SPRITE_POKE_BALL,  3,  2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, STAR_PIECE, EVENT_ESPO_CLEARING_ITEM_1
