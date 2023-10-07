Route74_MapScriptHeader:
 ;trigger count
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

Route74IslandSignEast:
	signpostheader 5
	done

Route74IslandSignWest:
	signpostheader 6
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
	ctxt "I'm ready for a"
	line "real battle!"
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

	para "None of them have"
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

	ctxt "No #mon is"
	line "truly the same."

	para "Every single one"
	line "has its own"
	cont "individual traits."
	done

.before_battle_text
	ctxt "I want to take a"
	line "look at your"
	cont "#mon party."
	done

.battle_won_text
	ctxt "Wow, your #mon"
	line "are talented!"
	done

Route74_NPC_1:
	ctxt "For years this was"
	line "a ferry crossing."

	para "Then they built"
	line "this land bridge."

	para "It's convenient,"
	line "sure. But what"
	para "about the family"
	line "who ran the ferry"
	cont "service?"

	para "Society never"
	line "thinks about the"
	cont "little people<...>"
	done

Route74_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 10,  4, 3, HEATH_GATE
	warp_def 11,  4, 4, HEATH_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost  5, 39, SIGNPOST_LOAD, Route74DirectionsSign
	signpost 19, 44, SIGNPOST_ITEM, Route74HiddenItem
	signpost 10, 24, SIGNPOST_LOAD, Route74IslandSignEast
	signpost 10,  8, SIGNPOST_LOAD, Route74IslandSignWest

.ObjectEvents: db 7
	person_event SPRITE_SAILOR, 29, 45, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 5, Route74_Trainer_1, -1
	person_event SPRITE_POKEFAN_M, 13, 39, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route74_Trainer_2, -1
	person_event SPRITE_POKEFAN_F, 19, 47, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 5, Route74_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 22, 44, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route74_Trainer_4, -1
	person_event SPRITE_SAILOR, 11, 14, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 2, Route74_NPC_1, -1
	person_event SPRITE_POKE_BALL,  4, 42, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWEET_SCENT, ObjectEvent, EVENT_ROUTE_74_TM12
	person_event SPRITE_POKE_BALL, 24,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, FIRE_STONE, EVENT_ROUTE_74_ITEM_FIRE_STONE
