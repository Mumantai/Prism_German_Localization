Route34_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route34DirectionsSign:
	ctxt "<UP> Dukatia City"
	next "<DOWN> Steineichenwald"
	next "<DOWN><RIGHT>Azalea City"
	done

Route34EmptyHouseSign:
	ctxt "Zu verkaufen."

	para "Sieht so aus, als "
	line "würde hier niemand"
	cont "leben <...> "
	done

Route34ApricornAdSign:
	signpostheader 1
	ctxt "Schlaue Trainer,"
	nl 	 "machen sich ihre"
	nl 	 "#bälle selbst!"

	next "Suche in ganz"
	nl 	 "Rijon nach"
	nl 	 "Aprikoko-Bäumen!"

	done

Route34_Trainer_1:
	trainer EVENT_ROUTE_34_TRAINER_1, PICNICKER, 6, .before_battle_text, .battle_won_text

	ctxt "Ich werde nicht"
	line "aufgeben, nur weil"
	para "ein starker"
	line "Trainer mich"
	cont "besiegt hat!"

	done

.before_battle_text
	ctxt "Bist du der"
	line "Champion von"
	cont "Rijon?"

	para "Dann sei du mein"
	line "Sparringpartner!"

	done

.battle_won_text
	ctxt "Ich gewinne nie <...>"

	done

Route34_Trainer_2:
	trainer EVENT_ROUTE_34_TRAINER_2, YOUNGSTER, 5, .before_battle_text, .battle_won_text

	ctxt "Ich muss es weiter"
	line "versuchen."

	para "Schließlich ist"
	line "ein Leben ohne"
	para "Scheitern, ein"
	line "Leben ohne"
	cont "Erfahrung."

	done

.before_battle_text
	ctxt "Ich war"
	line "Klassenbester im"
	cont "#monunterricht!"

	done

.battle_won_text
	ctxt "Ich bin vielleicht"
	line "nicht der Beste,"
	para "aber ich mag die"
	line "Herausforderung!"

	done

Route34_Trainer_3:
	trainer EVENT_ROUTE_34_TRAINER_3, POKEFANM, 3, .before_battle_text, .battle_won_text

	ctxt "Niemals aufgeben,"
	line "ja, ja, ja!"

	done

.before_battle_text
	ctxt "Weiter trainieren,"
	line "ja, ja, ja!"

	done

.battle_won_text
	ctxt "Weiter versuchen,"
	line "ja, ja, ja!"

	done

Route34_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $25, $d, 3, ROUTE_34_GATE
	warp_def $25, $e, 4, ROUTE_34_GATE

	;xy triggers
	db 0

	;signposts
	db 3
	signpost 6, 12, SIGNPOST_LOAD, Route34DirectionsSign
	signpost 13, 10, SIGNPOST_TEXT, Route34EmptyHouseSign
	signpost 33, 13, SIGNPOST_LOAD, Route34ApricornAdSign

	;people-events
	db 4
	person_event SPRITE_POKE_BALL, 48, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_ROUTE_34_ITEM_PP_UP
	person_event SPRITE_LASS, 22, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, Route34_Trainer_1, -1
	person_event SPRITE_YOUNGSTER, 10, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route34_Trainer_2, -1
	person_event SPRITE_POKEFAN_M, 27, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route34_Trainer_3, -1
