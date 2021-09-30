Route74_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route74HiddenItem:
	dw EVENT_ROUTE_74_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route74DirectionsSign:
	ctxt "<DOWN> Spurge City"
	next "<RIGHT> Laurel City"
	next "<LEFT> Heath Village"
	done

Route74_Trainer_1:
	trainer EVENT_ROUTE_74_TRAINER_1, SAILOR, 1, .before_battle_text, .battle_won_text

	ctxt "I've traveled all"
	line "over the world"
	cont "with my #mon."

	para "In my opinion,"
	line "Alola is the most"
	cont "relaxing region!"
	done

.before_battle_text
	ctxt "I'm ready for"
	line "a real battle!"
	done

.battle_won_text
	ctxt "Awaaargh!"
	done

Route74_Trainer_2:
	trainer EVENT_ROUTE_74_TRAINER_2, POKEFANM, 2, .before_battle_text, .battle_won_text

	ctxt "I'm not the only"
	line "Pikachu maniac in"
	cont "the Naljo region."

	para "But!"

	para "None of them has"
	line "as much passion"
	cont "as I do!"
	done

.before_battle_text
	ctxt "Haha!"

	para "Time to show off"
	line "my Pikachu!"
	done

.battle_won_text
	text "Feh!"
	done

Route74_Trainer_3:
	trainer EVENT_ROUTE_74_TRAINER_3, POKEFANF, 1, .before_battle_text, .battle_won_text

	ctxt "Baby #mon are"
	line "so adorable!"
	done

.before_battle_text
	ctxt "How cute are your"
	line "#mon? Show me!"
	done

.battle_won_text
	ctxt "I don't mind"
	line "losing, really<...>"
	done

Route74_Trainer_4:
	trainer EVENT_ROUTE_74_TRAINER_4, PSYCHIC_T, 1, .before_battle_text, .battle_won_text

	ctxt "No #mon is the"
	line "truly the same."

	para "Every single one"
	line "has its own"
	cont "individual traits."
	done

.before_battle_text
	ctxt "I want to take"
	line "a look at your"
	cont "#mon party."
	done

.battle_won_text
	ctxt "Wow, your #mon"
	line "are talented!"
	done

Route74_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 10, 4, 3, HEATH_GATE
	warp_def 11, 4, 4, HEATH_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 5, 9, SIGNPOST_LOAD, Route74DirectionsSign
	signpost 19, 14, SIGNPOST_ITEM, Route74HiddenItem

.ObjectEvents: db 5
	person_event SPRITE_SAILOR, 29, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 5, Route74_Trainer_1, -1
	person_event SPRITE_POKEFAN_M, 13, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route74_Trainer_2, -1
	person_event SPRITE_POKEFAN_F, 19, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 5, Route74_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 22, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route74_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 4, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWEET_SCENT, ObjectEvent, EVENT_ROUTE_74_TM12
