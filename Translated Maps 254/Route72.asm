Route72_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route72HiddenItem:
	dw EVENT_ROUTE_72_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route72DirectionsSign:
	ctxt "<UP> Oxalia City"
	next "<DOWN><LEFT>Capparia City"
	next "<DOWN><RIGHT>Klathrat-"
	next "  Tunnel"
	done

Route72IslandSign:
	signpostheader 7
	done

Route72_Trainer_1:
	trainer EVENT_ROUTE_72_TRAINER_1, YOUNGSTER, 1, .before_battle_text, .battle_won_text
	ctxt "Es ist hart ein"
	line "Trainer zu sein!"
	para "Du weist nie was"
	line "dein Gegner dabei"
	cont "hat!"
	done

.before_battle_text
	ctxt "Hey!"
	para "Wenn zwei Trainer"
	line "Augenkontakt haben"
	cont "gibts einen Kampf!"
	done

.battle_won_text
	ctxt "Was ist passiert?"
	done

Route72_Trainer_2:
	trainer EVENT_ROUTE_72_TRAINER_2, YOUNGSTER, 2, .before_battle_text, .battle_won_text
	ctxt "Bleh!"
	para "Wenn du mein"
	line "Lehrer wärst, hätt"
	cont "ich die Note 5!"
	done

.before_battle_text
	ctxt "Bildung ist der"
	line "Schlüssel zum"
	cont "Erfolg!"
	done

.battle_won_text
	ctxt "NEIN! Verloren???"
	done

Route72_Trainer_3:
	trainer EVENT_ROUTE_72_TRAINER_3, PICNICKER, 1, .before_battle_text, .battle_won_text
	ctxt "Denke niemals"
	line "negativ!"
	done

.before_battle_text
	ctxt "Oh, hey."
	para "Interesse an einem"
	line "Kampf?"
	done

.battle_won_text
	ctxt "Das war toll!"
	done

Route72_Trainer_4:
	trainer EVENT_ROUTE_72_TRAINER_4, POKEFANM, 1, .before_battle_text, .battle_won_text
	ctxt "Ich habe mein"
	line "Urlaub dazu genuzt"
	para "Pikachu Anhänger"
	line "zu sammeln!"
	done

.before_battle_text
	ctxt "Wer ist der größte"
	line "Pikachu Fan?"
	para "Steht vor dir!"
	done

.battle_won_text
	ctxt "Mein Pikachu<...>"
	done

Route72_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 37, 13, 1, ROUTE_72_GATE
	warp_def 37, 14, 2, ROUTE_72_GATE
	warp_def 7, 11, 7, ROUTE_72_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 11, 18, SIGNPOST_ITEM, Route72HiddenItem
	signpost 33, 17, SIGNPOST_LOAD, Route72DirectionsSign
	signpost 26,  4, SIGNPOST_LOAD, Route72IslandSign

.ObjectEvents: db 5
	person_event SPRITE_YOUNGSTER, 30, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route72_Trainer_1, -1
	person_event SPRITE_YOUNGSTER, 14, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route72_Trainer_2, -1
	person_event SPRITE_PICNICKER, 28, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, Route72_Trainer_3, -1
	person_event SPRITE_POKEFAN_M, 19, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route72_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 25, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, PARLYZ_HEAL, EVENT_ROUTE_72_ITEM_PARLYZ_HEALS