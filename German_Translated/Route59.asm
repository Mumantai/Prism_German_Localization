Route59_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route59HiddenItem:
	dw EVENT_ROUTE_59_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route59DirectionsSign:
	ctxt "<UP> Silph Co. Lager"
	next "<UP><RIGHT>Botania City"
	next "<LEFT> Jaeru City"
	done

Route59_Trainer_1:
	trainer EVENT_ROUTE_59_TRAINER_1, JUGGLER, 2, .before_battle_text, .battle_won_text

	ctxt "Jetzt, wo sich die"
	line "Lage in Botania"
	para "City entspannt"
	line "hat, kann jeder"
	para "ohne Probleme"
	line "kommen und gehen."
	done

.before_battle_text
	ctxt "Botania City ist"
	line "nicht mehr in"
	cont "Quarantäne!"
	done

.battle_won_text
	ctxt "Schade, dass die"
	line "hier kein #mon"
	cont "Center haben. Ich"
	para "könnte jetzt echt"
	line "eins gebrauchen."
	done

Route59_Trainer_2:
	trainer EVENT_ROUTE_59_TRAINER_2, FIREBREATHER, 4, .before_battle_text, .battle_won_text

	ctxt "Achtung, gleich"
	line "wird's hier heiß!"
	
	done

.before_battle_text
	ctxt "Das hier, ist der"
	line "beste Ort, um mein"
	para "Feuerspucken zu"
	line "trainieren!"

	done

.battle_won_text
	ctxt "Spiel dich nicht"
	line "so auf."

	para "Ist ja nicht so,"
	line "als wärst du der"
	cont "Champ oder so."

	para "Oh, Moment."

	done

Route59_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 3, 54, 1, SILPH_WAREHOUSE_F1
	warp_def 5, 63, 2, ROUTE_59_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 55, SIGNPOST_LOAD, Route59DirectionsSign
	signpost 12, 17, SIGNPOST_ITEM, Route59HiddenItem

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 11, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWORDS_DANCE, 0, EVENT_ROUTE_59_NPC_1
	person_event SPRITE_JUGGLER, 10, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route59_Trainer_1, -1
	person_event SPRITE_FIREBREATHER, 4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route59_Trainer_2, -1
