Route66_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route66HiddenItem:
	dw EVENT_ROUTE_66_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route66DirectionsSign:
	ctxt "<UP> Osaria City"
	done

Route66_Trainer_1:
	trainer EVENT_ROUTE_66_TRAINER_1, SWIMMERF, 5, .before_battle_text, .battle_won_text

	ctxt "Wir brauchen eine"
	line "#mon "
	cont "Kampf-Olympiade."

	para "War nur ein "
	line "Vorschlag!"

	done

.before_battle_text
	ctxt "Sieh mich an, ich"
	line "bin Ye Shiwen!"

	done

.battle_won_text
	ctxt "Was, schaust du"
	line "dir keine"
	para "Olympischen Spiele"
	line "an?"

	done

Route66_Trainer_2:
	trainer EVENT_ROUTE_66_TRAINER_2, SWIMMERM, 5, .before_battle_text, .battle_won_text

	ctxt "Vielleicht kannst"
	line "du eines Tages"
	para "selbst schwimmen,"
	line "anstatt zu radeln."

	done

.before_battle_text
	ctxt "Dieser See ist ein"
	line "toller Ort, um"
	para "meine Runden zu "
	line "trainieren."

	done

.battle_won_text
	ctxt "Zu schade, dass"
	line "die meisten"
	para "Menschen #mon"
	line "Training auf dem"
	para "Wasser nicht "
	line "mögen."

	done

Route66_Trainer_3:
	trainer EVENT_ROUTE_66_TRAINER_3, SWIMMERM, 6, .before_battle_text, .battle_won_text

	ctxt "Trainer genießen"
	line "es, die gleichen"
	para "#mon Typen wie"
	line "ihre Interessen zu"
	cont "haben."

	para "Das macht auch "
	line "Sinn."

	done

.before_battle_text
	ctxt "Ich bin ein"
	line "Schwimmer, ich"
	para "muss Wasser"
	line "#mon benutzen, "
	cont "richtig?"

	done

.battle_won_text
	ctxt "Hahahaha, "
	line "verarscht!"

	para "Was?!"

	para "Du hast meinen"
	line "Sarkasmus "
	cont "durchschaut?"

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
