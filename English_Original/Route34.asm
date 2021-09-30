Route34_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route34DirectionsSign:
	ctxt "<UP> Goldenrod City"
	next "<DOWN> Ilex Forest"
	next "<DOWN><RIGHT>Azalea Town"
	done

Route34EmptyHouseSign:
	ctxt "For Sale"

	para "Looks like nobody"
	line "lives here<...>"
	done

Route34ApricornAdSign:
	signpostheader 1
	ctxt "Talented Trainers"
	nl   "can make their"
	nl   "own #balls!"

	next "Search through"
	nl   "Rijon to find"
	nl   "apricorn trees."
	done

Route34_Trainer_1:
	trainer EVENT_ROUTE_34_TRAINER_1, PICNICKER, 6, .before_battle_text, .battle_won_text

	ctxt "I won't give up"
	line "just because a"
	para "strong Trainer"
	line "beat me!"
	done

.before_battle_text
	ctxt "Are you the Rijon"
	line "champion?"

	para "Let me have a"
	line "practice battle"
	cont "with you."
	done

.battle_won_text
	ctxt "I can never win!"
	done

Route34_Trainer_2:
	trainer EVENT_ROUTE_34_TRAINER_2, YOUNGSTER, 5, .before_battle_text, .battle_won_text

	ctxt "I gotta keep"
	line "trying."

	para "After all, a life"
	line "without failure"
	para "is a life without"
	line "experience."
	done

.before_battle_text
	ctxt "I graduated at"
	line "the top of my"
	cont "class!"

	para "The class was"
	line "#mon!"
	done

.battle_won_text
	ctxt "I may not be the"
	line "best, but I"
	para "enjoy the sport"
	line "of it!"
	done

Route34_Trainer_3:
	trainer EVENT_ROUTE_34_TRAINER_3, POKEFANM, 3, .before_battle_text, .battle_won_text

	ctxt "Never give up,"
	line "yeah, yeah!"
	done

.before_battle_text
	ctxt "Keep on training,"
	line "yeah, yeah!"
	done

.battle_won_text
	ctxt "Keep on trying,"
	line "yeah, yeah!"
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
