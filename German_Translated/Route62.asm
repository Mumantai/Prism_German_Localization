Route62_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route62HiddenItem:
	dw EVENT_ROUTE_62_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route62Sign:
	ctxt "Der Weg zu vielen"
	next "Städten!"

	done

Route62_Trainer_1:
	trainer EVENT_ROUTE_62_TRAINER_1, GENTLEMAN, 3, .before_battle_text, .battle_won_text

	ctxt "Ich muss ihre"
	line "Ansichten"
	cont "respektieren."

	para "Alternativ kann"
	line "Eagulou auch über"
	para "einen"
	line "unterirdischen Weg"
	para "erreicht werden,"
	line "der nach Moraga"
	cont "führt."

	para "Ich hoffe, dass"
	line "dieser Weg nicht"
	para "auch versperrt"
	line "ist!"

	done

.before_battle_text
	ctxt "Ich komme zu spät"
	line "zu meiner "
	cont "Verabredung!"

	done

.battle_won_text
	ctxt "Ich denke, sie"
	line "haben einen guten"
	para "Grund, den"
	line "Eagulou-Pfad zu"
	cont "blockieren."

	done

Route62_Trainer_2:
	trainer EVENT_ROUTE_62_TRAINER_2, BLACKBELT_T, 11, .before_battle_text, .battle_won_text

	ctxt "Sie wirkten"
	line "intelligent, sie"
	para "müssen einen guten"
	line "Grund haben."

	done

.before_battle_text
	ctxt "Mit den Fäusten"
	line "allein komme ich"
	para "offenbar nicht zu"
	line "Joes Arena."

	done

.battle_won_text
	ctxt "Wenn der Weg frei"
	line "wäre, würde dieses"
	para "Team diese Arena"
	line "besitzen!"


	done

Route62_Trainer_3:
	trainer EVENT_ROUTE_62_TRAINER_3, SAGE, 6, .before_battle_text, .battle_won_text

	ctxt "Ich muss bei"
	line "meinen Freunden"
	cont "bleiben."

	para "Sie haben alle"
	line "Angst vor"
	cont "Varaneous."

	done

.before_battle_text
	ctxt "Ah, du hast also"
	line "meine Freunde"
	cont "kennengelernt?"

	done

.battle_won_text
	ctxt "Unfreundlich."

	done

Route62_MapEventHeader ;filler
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
