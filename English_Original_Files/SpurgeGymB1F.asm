SpurgeGymB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeGymB1FBoulder:
	ctxt "There should be a"
	line "way to move this"
	cont "without a #mon."
	done

SpurgeGymB1FExplodingRock:
	takeitem DYNAMITE
	sif false
		jumptext SpurgeGymB1FBoulder
	showtext .placed_dynamite_text
	applymovement PLAYER, .stand_back
	disappear 8
	playwaitsfx SFX_EGG_BOMB
	setevent EVENT_SPURGE_GYM_SMASHROCK
	end

.stand_back
	run_step_right
	run_step_right
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	step_end

.placed_dynamite_text
	ctxt "Placed the dyna-"
	line "mite on the rock"
	cont "and lit it up!"

	para "Stand back!"
	sdone

SpurgeGymB1FThirdMon:
	setevent EVENT_SPURGE_GYM_POKEMON_3
	jump SpurgeGymGetPokemon

SpurgeGymB1FSixthMon:
	setevent EVENT_SPURGE_GYM_POKEMON_6
	jump SpurgeGymGetPokemon

SpurgeGymB1FButton:
	checkevent EVENT_SPURGE_GYM_PUSHROCK
	sif true
		jumptext .already_pressed_text
	opentext
	writetext .pressed_text
	playwaitsfx SFX_EGG_BOMB
	waitbutton
	disappear 3
	setevent EVENT_SPURGE_GYM_PUSHROCK
	closetextend

.pressed_text
	ctxt "Pressed the"
	line "button!"
	done

.already_pressed_text
	ctxt "The button has"
	line "already been"
	cont "pressed."
	done

SpurgeGymB1F_TrainerDisappears:
	teleport_from
	remove_person
	step_end

SpurgeGymB1FCadence:
	faceplayer
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext .no_mons_text
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer CADENCE, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_CADENCE
	playsound SFX_WARP_FROM
	applymovement 4, SpurgeGymB1F_TrainerDisappears
	disappear 4
	end

.no_mons_text
	ctxt "Hang on a sec!"

	para "You can't battle me"
	line "without a #mon"
	cont "on you!"
	done

.before_battle_text
	ctxt "YOU!"

	para "Every time a Gym"
	line "Leader loses, a"
	para "bit of respect"
	line "goes straight down"
	cont "the drain."

	para "I'mma get you back,"
	line "this time with"
	para "EVERYTHING I'VE"
	line "GOT!"
	sdone

.battle_won_text
	ctxt "Noo! Not again!"
	done

.after_battle_text
	ctxt "Once again, you've"
	line "knocked down my"
	cont "Gym's prestige."
	sdone

SpurgeGymB1FJosiah:
	faceplayer
	opentext
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext .no_mons_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer JOSIAH, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_JOSIAH
	playsound SFX_WARP_FROM
	applymovement 5, SpurgeGymB1F_TrainerDisappears
	disappear 5
	end

.no_mons_text
	ctxt "Whoa, hold on a"
	line "sec! You can't"
	para "battle me unless"
	line "you have a #mon"
	cont "on you!"
	done

.before_battle_text
	ctxt "How you doin', my"
	line "main pal?"

	para "You may have"
	line "toasted me back"
	para "when you were just"
	line "a newbie, but I"
	para "think it was just"
	line "beginner's luck."

	para "I'm packing the"
	line "heat forrealz this"
	cont "time, bet on it!"
	sdone

.battle_won_text
	ctxt "You're packin' some"
	line "serious heat,"
	cont "dude!"
	done

.after_battle_text
	ctxt "Ah, burned again<...>"
	sdone

SpurgeGymB1FEdison:
	faceplayer
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext SpurgeGymB1F_Text_GenericNeedOneMon
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer EDISON, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_EDISON
	playsound SFX_WARP_FROM
	applymovement 6, SpurgeGymB1F_TrainerDisappears
	disappear 6
	end

.before_battle_text
	ctxt "A battle is a"
	line "battle, and a de-"
	cont "feat is a defeat."

	para "I've reviewed,"
	line "calculated, and"
	para "planned brand new"
	line "strategies to beat"
	para "your very unique"
	line "battling style."

	para "I will not be"
	line "defeated again!"
	sdone

.battle_won_text
	ctxt "But--how?!"
	done

.after_battle_text
	ctxt "How could I have"
	line "been so foolish!"

	para "There must have"
	line "been an opening<...>"
	cont "but where?"
	sdone

SpurgeGymB1FRinji:
	faceplayer
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext SpurgeGymB1F_Text_GenericNeedOneMon
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer RINJI, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_RINJI
	playsound SFX_WARP_FROM
	applymovement 7, SpurgeGymB1F_TrainerDisappears
	disappear 7
	end

.before_battle_text
	ctxt "Greetings."

	para "It's been a while."

	para "I can tell by the"
	line "way the world vib-"
	para "rates around you"
	line "that you and your"
	para "#mon have grown"
	line "so much stronger"
	para "because of your"
	line "unique bond."

	para "Let's test that"
	line "bond properly."
	sdone

.battle_won_text
	ctxt "Seeing the growth"
	line "of a bond between"
	para "#mon and"
	line "Trainer is such an"
	para "immensely humbling"
	line "experience!"
	done

.after_battle_text
	ctxt "Pleasant journeys,"
	line "my friend!"
	sdone

SpurgeGymB1F_Text_GenericNeedOneMon:
	ctxt "I'm sorry, but you"
	line "need at least one"
	para "#mon to battle"
	line "with me!"
	done

SpurgeGymB1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 37, 25, 1, SPURGE_GYM_HOUSE
	warp_def 29, 9, 1, SPURGE_GYM_B2F_SIDESCROLL
	warp_def 17, 31, 2, SPURGE_GYM_B2F
	warp_def 7, 37, 3, SPURGE_GYM_B2F
	warp_def 5, 7, 4, SPURGE_GYM_B2F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 27, 37, SIGNPOST_READ, SpurgeGymB1FButton

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 10, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FThirdMon, EVENT_SPURGE_GYM_POKEMON_3
	person_event SPRITE_BOULDER, 29, 19, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXT, 0, SpurgeGymB1FBoulder, EVENT_SPURGE_GYM_PUSHROCK
	person_event SPRITE_CADENCE, 8, 20, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FCadence, EVENT_SPURGE_GYM_B1F_CADENCE
	person_event SPRITE_JOSIAH, 27, 32, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FJosiah, EVENT_SPURGE_GYM_B1F_JOSIAH
	person_event SPRITE_EDISON, 6, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FEdison, EVENT_SPURGE_GYM_B1F_EDISON
	person_event SPRITE_BUGSY, 8, 37, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FRinji, EVENT_SPURGE_GYM_B1F_RINJI
	person_event SPRITE_ROCK, 33, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FExplodingRock, EVENT_SPURGE_GYM_SMASHROCK
	person_event SPRITE_POKE_BALL, 26, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, DYNAMITE, EVENT_SPURGE_GYM_B1F_DYNAMITE
	person_event SPRITE_POKE_BALL, 8, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FSixthMon, EVENT_SPURGE_GYM_POKEMON_6
