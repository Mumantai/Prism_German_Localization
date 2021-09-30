Route56_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route56HiddenItem_1:
	dw EVENT_ROUTE_56_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route56HiddenItem_2:
	dw EVENT_ROUTE_56_HIDDENITEM_SILVER_EGG
	db SILVER_EGG

Route56_Trainer_1:
	trainer EVENT_ROUTE_56_TRAINER_1, SWIMMERM, 7, .before_battle_text, .battle_won_text

	ctxt "Nächstes Mal"
	line "rasiere ich mir"
	para "die Haare; dadurch"
	line "schwimmt man doch"
	para "angeblich"
	line "schneller, oder?"

	done

.before_battle_text
	ctxt "Rat mal, wie viele"
	line "Runden ich gedreht"
	cont "habe!"

	done

.battle_won_text
	ctxt "Ich bin hundertmal"
	line "hin und her "
	cont "geschwommen."

	para "Im Ernst!"

	done

Route56_Trainer_2:
	trainer EVENT_ROUTE_56_TRAINER_2, SWIMMERF, 6, .before_battle_text, .battle_won_text

	ctxt "Komm irgendwann"
	line "einmal mit mir "
	cont "üben."

	done

.before_battle_text
	ctxt "Schau dir an, wie"
	line "ich"
	para "Rückenschwimmen "
	line "kann!"

	done

.battle_won_text
	ctxt "Schwimmen während"
	line "des Kampfes ist "
	cont "aufregend!"

	done

Route56_Trainer_3:
	trainer EVENT_ROUTE_56_TRAINER_3, SWIMMERM, 8, .before_battle_text, .battle_won_text

	ctxt "Schwimmen hält"
	line "dich fit."

	para "Wenn du surfst,"
	line "bekommt dein"
	para "#mon die"
	line "Bewegung, nicht "
	cont "du!"

	done

.before_battle_text
	ctxt "Schlag!"

	done

.battle_won_text
	ctxt "That battle"
	line "almost gave me"
	para "the other kind"
	line "of stroke!"
	done

Route56_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $3, $23, 2, ROUTE_56_GATE_UNDERGROUND
	warp_def $b, $5d, 1, ROUTE_56_GATE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 0, 77, SIGNPOST_ITEM, Route56HiddenItem_1
	signpost 17, 52, SIGNPOST_ITEM, Route56HiddenItem_2

	;people-events
	db 3
	person_event SPRITE_SWIMMER_GUY, 9, 72, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route56_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL, 11, 42, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route56_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 7, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route56_Trainer_3, -1
