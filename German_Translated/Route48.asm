Route48_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, .set_bike_on

.set_bike_on
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

Route48HiddenItem:
	dw EVENT_ROUTE_48_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route48BorderSign:
	ctxt "Johto-Rijon"
	next "Grenze"
	done

Route48IlexForestSign:
	ctxt "<UP> Steineichenwald"
	next "<DOWN> Route 49"
	done

Route48UphillSign:
	ctxt "Gehe hinauffff!"

	done

Route48_Trainer_1:
	trainer EVENT_ROUTE_48_TRAINER_1, BIKER, 3, .before_battle_text, .battle_won_text

	ctxt "Warum die Medien"
	line "dich"
	cont "kontrollieren?"

	para "Na weil sie Geld"
	line "machen wollen!"

	done

.before_battle_text
	ctxt "Schaf!"

	done

.battle_won_text
	ctxt "Aaargy."
	done

Route48_Trainer_2:
	trainer EVENT_ROUTE_48_TRAINER_2, BIKER, 5, .before_battle_text, .battle_won_text

	ctxt "Zu ängstlich zum"
	line "Radfahren, was?"

	done

.before_battle_text
	ctxt "Radfahren auf dem"
	line "Hafengelände,"
	cont "sicher, ne?"

	done

.battle_won_text
	ctxt "Du bist ein"
	line "Weichei!"

	done

Route48_Trainer_3:
	trainer EVENT_ROUTE_48_TRAINER_3, BIKER, 4, .before_battle_text, .battle_won_text

	ctxt "Einmal ist mein"
	line "Fahrrad in die"
	cont "Bucht gerollt."

	para "War ich sauer, ey!"

	done

.before_battle_text
	ctxt "Ich werde an"
	line "diesem Hafen ein"
	para "paar Donuts"
	line "machen!"

	done

.battle_won_text
	ctxt "Das hat mich"
	line "ausgebrannt."

	done

Route48_Trainer_4:
	trainer EVENT_ROUTE_48_TRAINER_4, BIKER, 6, .before_battle_text, .battle_won_text

	ctxt "Die langweiligen"
	line "Leute in Azalea"
	para "City lieben meine"
	line "wilde Art."

	done

.before_battle_text
	ctxt "Ich darf nicht"
	line "durch das Johto-"
	cont "Tor gehen."

	done

.battle_won_text
	ctxt "Es ist, weil ich"
	line "feindselig bin!"

	done

Route48_Trainer_5:
	trainer EVENT_ROUTE_48_TRAINER_5, BIKER, 2, .before_battle_text, .battle_won_text

	ctxt "Ich kann dich"
	line "immer noch nicht"
	cont "leiden!"

	done

.before_battle_text
	ctxt "Ich mag dich zwar"
	line "nicht, aber lass"
	cont "uns kämpfen!"

	done

.battle_won_text
	ctxt "Jetzt mag ich dich"
	line "aber wirklich"
	cont "nicht!"

	done

Route48_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 4
	signpost 51, 9, SIGNPOST_LOAD, Route48BorderSign
	signpost 87, 9, SIGNPOST_LOAD, Route48IlexForestSign
	signpost 141, 11, SIGNPOST_LOAD, Route48UphillSign
	signpost 25, 8, SIGNPOST_ITEM, Route48HiddenItem

.ObjectEvents: db 6
	person_event SPRITE_FRUIT_TREE, 98, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, 9, -1
	person_event SPRITE_BIKER, 91, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route48_Trainer_1, -1
	person_event SPRITE_BIKER, 39, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route48_Trainer_2, -1
	person_event SPRITE_BIKER, 63, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route48_Trainer_3, -1
	person_event SPRITE_BIKER, 19, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, Route48_Trainer_4, -1
	person_event SPRITE_BIKER, 119, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route48_Trainer_5, -1
