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
	para "die Haare, dadurch"
	line "soll man schneller"
	para "schwimmen können."

	done

.before_battle_text
	ctxt "Wie viele Bahnen"
	line "bin ich jetzt"
	cont "geschwommen?"

	done

.battle_won_text
	ctxt "Es müssen schon"
	line "Hunderte gewesen"
	cont "sein."

	para "Im Ernst!"

	done

Route56_Trainer_2:
	trainer EVENT_ROUTE_56_TRAINER_2, SWIMMERF, 6, .before_battle_text, .battle_won_text

	ctxt "Trainier doch mal"
	line "mit mir."
	
	done

.before_battle_text
	ctxt "Ich bin der beste"
	line "Rückenschwimmer!"

	done

.battle_won_text
	ctxt "Beim Kämpfen zu"
	line "schwimmen, ist"
	cont "so aufregend!"

	done

Route56_Trainer_3:
	trainer EVENT_ROUTE_56_TRAINER_3, SWIMMERM, 8, .before_battle_text, .battle_won_text

	ctxt "Schwimmen hält"
	line "dich fit."

	para "Wenn du surfst,"
	line "bekommt dein"
	para "#mon die ganze"
	line "Bewegung und"
	cont "du bleibst faul!"

	done

.before_battle_text
	ctxt "Schlag!"

	done

.battle_won_text
	ctxt "Jetzt hast du mir"
	line "einen Schlag"
	para "verpasst."

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
