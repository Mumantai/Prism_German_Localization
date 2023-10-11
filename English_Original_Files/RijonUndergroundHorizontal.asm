RijonUndergroundHorizontal_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RijonUndergroundHorizontal_Trainer_1:
	trainer EVENT_RIJON_UNDERGROUND_HORIZONTAL_TRAINER_1, COOLTRAINERF, 4, .before_battle_text, .battle_won_text

	ctxt "Why have a long"
	line "tunnel with no"
	para "lights? It just"
	line "doesn't make"
	cont "sense!"
	done

.before_battle_text
	ctxt "How do you turn on"
	line "the lights?"
	done

.battle_won_text
	ctxt "Don't make this any"
	line "scarier than it"
	cont "has to be!"
	done

RijonUndergroundHorizontal_Trainer_2:
	trainer EVENT_RIJON_UNDERGROUND_HORIZONTAL_TRAINER_2, COOLTRAINERM, 4, .before_battle_text, .battle_won_text

	ctxt "Ouch!"

	para "My ears just"
	line "popped!"
	done

.before_battle_text
	ctxt "We're under the"
	line "bay!"

	para "Cool, huh?"
	done

.battle_won_text
	ctxt "That's too much"
	line "pressure!"
	done

RijonUndergroundHorizontal_MapEventHeader:
	;filler
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
	person_event SPRITE_COOLTRAINER_F, 1, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, RijonUndergroundHorizontal_Trainer_1, -1
	person_event SPRITE_COOLTRAINER_M, 5, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, RijonUndergroundHorizontal_Trainer_2, -1
