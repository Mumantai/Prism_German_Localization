Route87_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route87DirectionsSign:
	ctxt "<UP>  Tunod Waterway"
	next "<UP><UP> Southerly City"
	next "<DOWN>  Laurel City"
	done

Route87IslandSign:
	signpostheader 5
	done

Route87_Trainer_1:
	trainer EVENT_ROUTE_87_TRAINER_1, SWIMMERM, 9, .before_battle_text, .battle_won_text

	ctxt "You should always"
	line "stretch before"
	para "swimming down long"
	line "waterways."

	para "I do it in front"
	line "of the girls!"
	done

.before_battle_text
	ctxt "This is a long"
	line "waterway."

	para "Your #mon had"
	line "better be prepared"
	para "for a major"
	line "workout!"
	done

.battle_won_text
	ctxt "That was too"
	line "intense!"
	done

Route87_Trainer_2:
	trainer EVENT_ROUTE_87_TRAINER_2, SWIMMERF, 7, .before_battle_text, .battle_won_text

	ctxt "You unleashed 3"
	line "years' worth of"
	cont "repressed anger."
	done

.before_battle_text
	ctxt "Time for a calm"
	line "battle aided by"
	para "the gentle lull of"
	line "the ocean's waves."
	done

.battle_won_text
	ctxt "You need to calm"
	line "down."
	done

Route87_Trainer_3:
	trainer EVENT_ROUTE_87_TRAINER_3, SWIMMERM, 10, .before_battle_text, .battle_won_text

	ctxt "It turns out my"
	line "flight was delayed"
	cont "4 hours."

	para "I woke up before"
	line "sunrise for"
	cont "nothing!"
	done

.before_battle_text
	ctxt "The closest"
	line "airport to Naljo"
	para "is the Southerly"
	line "Airport, and you"
	para "have to swim so"
	line "far to get to it!"
	done

.battle_won_text
	ctxt "Well, I guess I'm"
	line "swimming the rest"
	cont "of the way there."
	done

Route87_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $37, $a, 16, MAGIKARP_CAVERNS_MAIN

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 48, 12, SIGNPOST_LOAD, Route87DirectionsSign
	signpost 53,  8, SIGNPOST_LOAD, Route87IslandSign

	;people-events
	db 3
	person_event SPRITE_SWIMMER_GUY, 40, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route87_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL, 23, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route87_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 12, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route87_Trainer_3, -1
