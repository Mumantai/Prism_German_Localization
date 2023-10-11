Route66_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route66HiddenItem:
	dw EVENT_ROUTE_66_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route66DirectionsSign:
	ctxt "Rijon Strait"
	next "<UP> Owsauri City"
	done

Route66_Trainer_1:
	trainer EVENT_ROUTE_66_TRAINER_1, SWIMMERF, 5, .before_battle_text, .battle_won_text

	ctxt "They need to have"
	line "a #mon battling"
	cont "olympic event."

	para "Just a suggestion!"
	done

.before_battle_text
	ctxt "Look at me, I'm"
	line "Ye Shiwen!"
	done

.battle_won_text
	ctxt "What, you don't"
	line "watch the"
	cont "olympics?"
	done

Route66_Trainer_2:
	trainer EVENT_ROUTE_66_TRAINER_2, SWIMMERM, 5, .before_battle_text, .battle_won_text

	ctxt "Maybe one day"
	line "you can swim for"
	para "yourself, instead"
	line "of riding."
	done

.before_battle_text
	ctxt "This lake is a"
	line "great place to"
	cont "practice my laps."
	done

.battle_won_text
	ctxt "Too bad most"
	line "people don't like"
	para "#mon training"
	line "on water."
	done

Route66_Trainer_3:
	trainer EVENT_ROUTE_66_TRAINER_3, SWIMMERM, 6, .before_battle_text, .battle_won_text

	ctxt "Trainers enjoy"
	line "having the same"
	para "types as their"
	line "interests."

	para "Makes sense, of"
	line "course."
	done

.before_battle_text
	ctxt "I'm a swimmer, I"
	line "must use water"
	cont "#mon; right?"
	done

.battle_won_text
	ctxt "Hahaha, psych!"

	para "What, you saw"
	line "through my"
	cont "sarcasm?"
	done

Route66_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 9, 11, SIGNPOST_LOAD, Route66DirectionsSign
	signpost 11, 18, SIGNPOST_ITEM, Route66HiddenItem

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 31, 13, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_BOIL, 0, EVENT_ROUTE_66_TM
	person_event SPRITE_SWIMMER_GIRL, 21, 7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route66_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 18, 14, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route66_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 30, 3, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route66_Trainer_3, -1
