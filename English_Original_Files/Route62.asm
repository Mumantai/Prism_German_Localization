Route62_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route62HiddenItem:
	dw EVENT_ROUTE_62_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route62Sign:
	ctxt "Castro Field"
	next "The path to many"
	next "cities!"
	done

Route62_Trainer_1:
	trainer EVENT_ROUTE_62_TRAINER_1, GENTLEMAN, 3, .before_battle_text, .battle_won_text

	ctxt "I must respect"
	line "their beliefs."

	para "Another way to get"
	line "to Eagulou is an"
	para "underground path"
	line "connecting to"
	cont "Moraga."

	para "I hope that one"
	line "isn't blocked off"
	cont "too!"
	done

.before_battle_text
	ctxt "I'm late for my"
	line "meeting!"
	done

.battle_won_text
	ctxt "I guess they have"
	line "a good reason for"
	para "blocking off the"
	line "Eagulou path."
	done

Route62_Trainer_2:
	trainer EVENT_ROUTE_62_TRAINER_2, BLACKBELT_T, 11, .before_battle_text, .battle_won_text

	ctxt "They seemed wise,"
	line "they must have a"
	cont "good reason."
	done

.before_battle_text
	ctxt "It appears fists"
	line "alone won't get"
	cont "me to Joe's Gym."
	done

.battle_won_text
	ctxt "If the path was"
	line "open, this team"
	para "would own that"
	line "Gym!"
	done

Route62_Trainer_3:
	trainer EVENT_ROUTE_62_TRAINER_3, SAGE, 6, .before_battle_text, .battle_won_text

	ctxt "I have to stick"
	line "with my friends."

	para "They're all scared"
	line "of Varaneous."
	done

.before_battle_text
	ctxt "Ah, so you've"
	line "met my friends?"
	done

.battle_won_text
	ctxt "Unfriendly."
	done

Route62_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def 5, 45, 1, ROUTE_62_GATE
	warp_def 5, 12, 2, ROUTE_61_GATE_NORTH

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 5, 27, SIGNPOST_LOAD, Route62Sign
	signpost 14, 36, SIGNPOST_ITEM, Route62HiddenItem

	;people-events
	db 3
	person_event SPRITE_GENTLEMAN, 11, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route62_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 10, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, Route62_Trainer_2, -1
	person_event SPRITE_SAGE, 6, 41, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route62_Trainer_3, -1
