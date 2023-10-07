LaurelForestMain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelForestMain_Trainer_1:
	trainer EVENT_LAUREL_FOREST_MAIN_TRAINER_1, BUG_CATCHER, 3, .before_battle_text, .battle_won_text

	ctxt "My mommy doesn't"
	line "let me take my bug"
	cont "#mon home."

	para "Instead, I have a"
	line "secret hiding"
	para "place for them in"
	line "the forest."
	done

.before_battle_text
	ctxt "Wow, so many bugs"
	line "to catch here!"
	done

.battle_won_text
	ctxt "It's a good place"
	line "to train, too!"
	done

LaurelForestMain_Trainer_2:
	trainer EVENT_LAUREL_FOREST_MAIN_TRAINER_2, BUG_CATCHER, 4, .before_battle_text, .battle_won_text

	ctxt "Hm<...> I wonder if"
	line "certain species"
	cont "left the forest."

	para "I'd like to get my"
	line "hands on some rare"
	cont "bug #mon."
	done

.before_battle_text
	ctxt "This forest used"
	line "to extend even"
	para "further downwards,"
	line "until they started"
	para "all the building"
	line "work on that city!"
	done

.battle_won_text
	ctxt "The construction"
	line "probably scared"
	para "most of the local"
	line "bugs away<...>"
	done

LaurelForestMainMagikarpWorshipper:
	ctxt "Only those who"
	line "understand the"
	para "true potential of"
	line "the ancient fish"
	cont "may pass."

	para "You're just like"
	line "the rest: you do"
	cont "not understand."

	para "BEGONE!"
	done

LaurelForestMainClefairy:
	opentext
	writetext .text
	yesorno
	closetext
	sif false
		end
	clearevent EVENT_POKEONLY_CATERPIE_IN_PARTY
	checkevent EVENT_POKEONLY_FINISHED_CATERPIE_QUEST
	sif false, then
		clearevent EVENT_POKEONLY_CATERPIE_PICKED_UP
		setevent EVENT_POKEONLY_CATERPIE_NOT_IN_NEST
		setevent EVENT_POKEONLY_METAPOD_NOT_IN_NEST
		setevent EVENT_POKEONLY_CHILD_BUTTERFREE_NOT_IN_NEST
	sendif
	clearevent EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	clearevent EVENT_POKEONLY_PIKACHU_IN_PARTY
	setevent EVENT_POKEONLY_FIRE_OUT
	backupcustchar
	backupsecondpokemon
	setflag ENGINE_POKEMON_MODE
	setflag ENGINE_USE_TREASURE_BAG
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	callasm .heal_first_partymon
	warp LAUREL_FOREST_POKEMON_ONLY, 3, 56
	blackoutmod LAUREL_FOREST_POKEMON_ONLY
	end

.heal_first_partymon
	xor a
	ld [wCurPartyMon], a
	ld [wPokeonlyMainSpecies], a
	jpba HealPartyMon

.text
	ctxt "The Clefairy won't"
	line "let you pass<...>"

	para "Send @"
	text_from_ram wPartyMonNicknames
	ctxt ""
	line "instead?"
	done

LaurelForestMain_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def 3, 4, 4, LAUREL_FOREST_GATES
	warp_def 3, 5, 5, LAUREL_FOREST_GATES
	warp_def 33, 4, 9, LAUREL_FOREST_GATES
	warp_def 33, 5, 1, LAUREL_FOREST_GATES
	warp_def 3, 31, 8, LAUREL_FOREST_GATES

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 5
	person_event SPRITE_FAIRY, 4, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LaurelForestMainClefairy, -1
	person_event SPRITE_ELDER, 15, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelForestMainMagikarpWorshipper, EVENT_MAGIKARP_TEST
	person_event SPRITE_WHITNEY, 4, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BROOKLYN_NOT_IN_FOREST
	person_event SPRITE_BUG_CATCHER, 20, 33, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, LaurelForestMain_Trainer_1, -1
	person_event SPRITE_BUG_CATCHER, 31, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, LaurelForestMain_Trainer_2, -1
