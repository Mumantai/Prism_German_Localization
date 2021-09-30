RijonUndergroundHorizontal_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonUndergroundHorizontal_Trainer_1:
	trainer EVENT_RIJON_UNDERGROUND_HORIZONTAL_TRAINER_1, COOLTRAINERF, 6, .before_battle_text, .battle_won_text

	ctxt "Warum haben wir"
	line "einen langen"
	cont "Tunnel ohne Licht?"

	para "Es macht einfach"
	line "keinen Sinn!"

	done

.before_battle_text
	ctxt "Wo sind die "
	line "Lichtschalter?"

	done

.battle_won_text
	ctxt "Mach es nicht"
	line "grusliger, als es"
	cont "schon ist!"

	done

RijonUndergroundHorizontal_Trainer_2:
	trainer EVENT_RIJON_UNDERGROUND_HORIZONTAL_TRAINER_2, COOLTRAINERM, 6, .before_battle_text, .battle_won_text

	ctxt "Autsch!"

	para "Meine Ohren sind"
	line "eben explodiert!"

	done

.before_battle_text
	ctxt "Wir sind unter der"
	line "Bucht!"

	para "Cool, was?"

	done

.battle_won_text
	ctxt "Das ist zu viel "
	line "Druck!"

	done

RijonUndergroundHorizontal_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $5, $2, 1, ROUTE_52_GATE_UNDERGROUND
	warp_def $2, $2f, 1, ROUTE_55_GATE_UNDERGROUND

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_LASS, 1, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, RijonUndergroundHorizontal_Trainer_1, -1
	person_event SPRITE_YOUNGSTER, 5, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, RijonUndergroundHorizontal_Trainer_2, -1
