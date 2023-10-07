Route65_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route65HiddenItem:
	dw EVENT_ROUTE_65_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route65Sign:
	ctxt "Talrus Foothill"
	next "Path to Rijon"
	next "League"
	done

Route65_Trainer_1:
	trainer EVENT_ROUTE_65_TRAINER_1, JUGGLER, 4, .before_battle_text, .battle_won_text

	ctxt "Try teaching your"
	line "#mon Metronome"
	para "to bring a little"
	line "surprise into your"
	cont "life!"
	done

.before_battle_text
	ctxt "What's going to"
	line "happen?"

	para "No one knows!"
	done

.battle_won_text
	ctxt "Ahaha! How silly!"
	done

Route65_Trainer_2:
	trainer EVENT_ROUTE_65_TRAINER_2, POKEMANIAC, 3, .before_battle_text, .battle_won_text

	ctxt "This really is a"
	line "great spot if you"
	para "like to see lots"
	line "of powerful"
	cont "#mon come by."
	done

.before_battle_text
	ctxt "Fufufu<...>"
	line "The home stretch."

	para "When approaching"
	line "trainers are at"
	para "their most"
	line "vulnerable!"
	done

.battle_won_text
	ctxt "I suppose it was"
	line "I<...>"

	para "<...>who was"
	line "vulnerable<...>"
	done

Route65_Rival:
	trainer EVENT_ROUTE_65_RIVAL, RIVAL1, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Don't go any"
	line "further."

	para "I travelled this"
	line "world with diff-"
	para "erent eyes since I"
	line "escaped prison."

	para "Life as a fugitive"
	line "is difficult and"
	cont "empty."

	para "When I lay awake"
	line "at night with my"
	para "#mon at my"
	line "side, I realize"
	para "that I am actually"
	line "thankful for their"
	cont "presence."

	para "My bonds with them"
	line "have grown while I"
	para "have grown"
	line "stronger."

	para "It's time for me to"
	line "test my strength"
	cont "in battle!"
	done

.battle_won_text
	ctxt "I still have more"
	line "to learn."
	done

.after_battle_text
	ctxt "I know I've done"
	line "much harm to"
	para "others as well as"
	line "my own #mon,"
	para "but thanks to the"
	line "example you set,"
	para "I'm ready to start"
	line "over and be the"
	cont "better Trainer."

	para "The way your"
	line "#mon battle"
	para "reflects your"
	line "inner strength and"
	cont "resolve."

	para "A Trainer like you"
	line "is destined to be"
	cont "champion."

	para "So long until next"
	line "time, Trainer."
	done

Route65_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $73, $d, 1, ROUTE_67_GATE
	warp_def $8b, $7, 1, JAERU_GATE
	warp_def $8b, $8, 2, JAERU_GATE

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 136, 8, SIGNPOST_LOAD, Route65Sign
	signpost 21, 12, SIGNPOST_LOAD, Route65Sign
	signpost 100, 14, SIGNPOST_ITEM, Route65HiddenItem
	signpost 123, 4, SIGNPOST_JUMPSTD, qrcode, QR_ROUTE_65

	;people-events
	db 3
	person_event SPRITE_JUGGLER, 61, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route65_Trainer_1, -1
	person_event SPRITE_POKEMANIAC, 42,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route65_Trainer_2, -1
	person_event SPRITE_SILVER, 15, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 5, Route65_Rival, -1
