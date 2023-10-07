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

	ctxt "Sometimes they"
	line "bite, sometimes"
	cont "they don't."
	done

.before_battle_text
	ctxt "This is my special"
	line "fishing spot, and"
	cont "you're in my way!"
	done

.battle_won_text
	ctxt "Fine, I'll fish"
	line "around you<...>"
	done

SouthSoutherly_Trainer_2:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_2, SWIMMERM, 12, .before_battle_text, .battle_won_text

	ctxt "Go, go and enjoy"
	line "the wonders of"
	cont "Tunod!"
	done

.before_battle_text
	ctxt "You're almost"
	line "there!"

	para "One more battle,"
	line "though!"
	done

.battle_won_text
	ctxt "Well, you proved"
	line "yourself."
	done

SouthSoutherly_Trainer_3:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_3, SWIMMERM, 13, .before_battle_text, .battle_won_text

	ctxt "You gotta chill."

	para "Life's one big"
	line "joke to me."
	done

.before_battle_text
	ctxt "Southerly is"
	line "north."

	para "Hilarious, eh?"
	done

.battle_won_text
	ctxt "You take this too"
	line "seriously."
	done

SouthSoutherly_Trainer_4:
	trainer EVENT_SOUTH_SOUTHERLY_TRAINER_4, SWIMMERF, 9, .before_battle_text, .battle_won_text

	ctxt "I keep forgetting"
	line "to bring my Repel."
	done

.before_battle_text
	ctxt "There's too many"
	line "Tentacool."

	para "That's not cool!"
	done

.battle_won_text
	ctxt "You're more"
	line "annoying now."
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
