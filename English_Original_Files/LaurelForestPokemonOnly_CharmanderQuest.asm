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
	ctxt "Help!"

	para "Some very mean"
	line "scientists dug for"
	para "fossils here, and"
	line "it's blocked me off"
	cont "from my own house!"

	para "There has to be"
	line "some way to get"
	para "the water out of"
	line "the way<...>?"
	done

.first_rock_text
	ctxt "Large rock?"

	para "That might work!"

	para "Push it over!"
	sdone

.second_rock_text
	ctxt "Another rock!"

	para "Let's see if this"
	line "will work<...>"
	sdone

.both_rocks_text
	ctxt "Two large rocks?"

	para "That might work!"

	para "Push them both"
	line "over!"
	sdone

.need_another_rock_text
	ctxt "Hmm<...> one rock isn't"
	line "enough to block"
	cont "off the water."

	para "Maybe if we had"
	line "another rock<...>"
	done

.water_vanished_text
	ctxt "Uh, wow, how did"
	line "the water vanish"
	cont "that fast?"

	para "No matter. I'm"
	line "coming back home,"
	cont "mom and dad!"
	sdone
