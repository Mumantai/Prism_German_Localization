SouthSoutherly_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SouthSoutherlyHiddenItem:
	dw EVENT_SOUTH_SOUTHERLY_HIDDENITEM_BIG_PEARL
	db BIG_PEARL

SouthSoutherly_Trainer_1:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_1, FISHER, 11, .before_battle_text, .battle_won_text
	ctxt "Manchmal beißen"
	line "sie an, manchmal"
	para "aber auch nicht"
	done

.before_battle_text
	ctxt "Das hier, ist mein"
	line "besonderer Angel-"
	para "platz und du "
	line "stehst mir im Weg!"
	done

.battle_won_text
	ctxt "Gut! Angel ich"
	line "halt wo anders<...>"
	done

SouthSoutherly_Trainer_2:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_2, SWIMMERM, 12, .before_battle_text, .battle_won_text
	ctxt "Geh und bestaune"
	line "die Wunder von"
	cont "Tunod!"
	done

.before_battle_text
	ctxt "Du hast es fast"
	line "geschafft! "
	para "Ein Kampf noch!"
	done

.battle_won_text
	ctxt "Nun, du hast dich"
	line "bewährt. "
	done

SouthSoutherly_Trainer_3:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_3, SWIMMERM, 13, .before_battle_text, .battle_won_text
	ctxt "Beruhig dich."
	para "Das Leben ist ein"
	line "großer Witz."
	done

.before_battle_text
	ctxt "Südport City liegt"
	line "im Norden."
	para "Seltsam, oder?"
	done

.battle_won_text
	ctxt "Du nimmst das"
	line "alles zu ernst."
	done

SouthSoutherly_Trainer_4:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_4, SWIMMERF, 9, .before_battle_text, .battle_won_text
	ctxt "Ich vergesse immer"
	line "Schutz zu kaufen."
	done

.before_battle_text
	ctxt "Tentacha sind so"
	line "nervig! Und ihre"
	cont "Tentakel erst<...> "
	done

.battle_won_text
	ctxt "Okay."
	line "Du nervst mehr."
	done

SouthSoutherly_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 0

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 29,  7, SIGNPOST_ITEM, SouthSoutherlyHiddenItem

	;people-events
	db 5
	person_event SPRITE_FISHER, 18, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SouthSoutherly_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 6, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, SouthSoutherly_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 54, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, SouthSoutherly_Trainer_3, -1
	person_event SPRITE_SWIMMER_GIRL, 31, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 5, SouthSoutherly_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 33, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SUBSTITUTE, 0, EVENT_SOUTH_SOUTHERLY_TM