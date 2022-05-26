LaurelForestPokemonOnlyCharmander:
	faceplayer
	cry CHARMANDER
	opentext
	loadvar wItemQuantityChangeBuffer, 1
	checkitem GIANT_ROCK
	sif false, then
		setevent EVENT_POKEONLY_TALKED_TO_CHARMANDER
		jumptext .explanation_text
	sendif
	checkevent EVENT_POKEONLY_TALKED_TO_CHARMANDER
	setevent EVENT_POKEONLY_TALKED_TO_CHARMANDER
	sif false
		writetext .explanation_text
	checkevent EVENT_POKEONLY_CHARMANDER_PUSHED_BOULDER_1
	iftrue .blockWater
	loadvar wItemQuantityChangeBuffer, 2
	checkitem GIANT_ROCK
	iftrue .placeBothRocks
	writetext .first_rock_text
	closetext
	scall .PlaceFirstRock
	jumptext .need_another_rock_text

.placeBothRocks
	writetext .both_rocks_text
	closetext
	scall .PlaceFirstRock
	jump .afterPlacingFirstRock

.blockWater
	writetext .second_rock_text
	closetext
.afterPlacingFirstRock
	changeblock 48, 26, $85
	playsound SFX_STRENGTH
	reloadmappart
	pause 64
	changeblock 46, 26, $5d
	playsound SFX_WHIRLWIND
	reloadmappart
	pause 16
	changeblock 44, 26, $5d
	reloadmappart
	pause 16
	changeblock 44, 28, $5d
	playsound SFX_WHIRLWIND
	reloadmappart
	pause 16
	changeblock 46, 28, $5d
	reloadmappart
	pause 16
	changeblock 46, 30, $5d
	playsound SFX_WHIRLWIND
	reloadmappart
	pause 16
	scall TriggerFillPond
	reloadmappart

	setevent EVENT_POKEONLY_CHARMANDER_PUSHED_BOULDER_2
	takeitem GIANT_ROCK, 1
	showtext .water_vanished_text
	writehalfword .cross_bridge
	checkcode VAR_FACING
	sif =, RIGHT
		writehalfword .cross_bridge_player_to_the_left
	applymovement 3, -1
	disappear 3
	end

.PlaceFirstRock
	changeblock $30, $1a, $cf
	playsound SFX_STRENGTH
	reloadmappart
	pause 64
	setevent EVENT_POKEONLY_CHARMANDER_PUSHED_BOULDER_1
	takeitem GIANT_ROCK, 1
	end

.cross_bridge
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_right
	step_up
	step_up
	step_end

.cross_bridge_player_to_the_left
	step_down
	step_left
	step_left
	step_up
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

.explanation_text
	ctxt "Hilfe!"

	para "Ein paar böse"
	line "Wissenschaftler"
	cont "haben hier nach"
	para "Fossilien gegraben"
	line "und das hat mich"
	para "aus meinem Haus"
	line "ausgesperrt!"

	para "Es muss einen Weg"
	line "geben, das Wasser"
	para "sicher überqueren"
	line "zu können <...>?"
	done

.first_rock_text
	ctxt "Ein großer Stein?"

	para "Könnte klappen!"

	para "Schieb es rüber!"
	sdone

.second_rock_text
	ctxt "Noch ein Stein!"

	para "Lass uns sehen,"
	line "ob das klappt <...>"
	sdone

.both_rocks_text
	ctxt "Zwei große Steine?"

	para "Könnte klappen!"

	para "Schieb sie beide"
	line "rüber!"
	sdone

.need_another_rock_text
	ctxt "Hmm <...>, ein Stein"
	line "ist nicht genug um"
	para "das Wasser aufzu-"
	line "halten."

	para "Vielleicht noch"
	line "ein Stein <...>"
	done

.water_vanished_text
	ctxt "Uh, wow, wie ist"
	line "das Wasser so"
	para "schnell ver-"
	line "schwunden?"

	para "Egal, ich komme"
	line "nach Hause,"
	cont "Mama und Papa!"
	sdone
