LaurelForestPokemonOnly_Pikachu_BerriesArentOutsideForest:
	switch 0

LaurelForestPokemonOnly_Butterfree_NoWayBabyWanderedOutsideForest:
	switch 2

LaurelForestPokemonOnly_Caterpie_MommyIsntOutsideForest:
	switch 4

LaurelForestPokemonOnly_Pikachu_BerriesArentInLab:
	switch 1

LaurelForestPokemonOnly_Butterfree_NoWayBabyWanderedInsideLab:
	switch 3

LaurelForestPokemonOnly_Caterpie_MommyIsntInLab:
	switch 5
	sendif

	pushvar
	loadarray .PreventPlayerLeaveArray, 4
	readarray 0
	cry 0
	readarray 1
	setlasttalked -1
	popvar
	callasm .is_odd
	pushvar
	sif true, then
		readarray 1
		moveperson LAST_TALKED, 54, 6
	selse
		readarray 1
		moveperson LAST_TALKED, 5, 55
	sendif
	appear LAST_TALKED
	faceplayer
	faceperson PLAYER, LAST_TALKED
	readarrayhalfword 2
	showtext -1
	disappear LAST_TALKED
	popvar
	sif true, then
		applymovement PLAYER, .PlayerStepsBackDown
	selse
		applymovement PLAYER, .PlayerStepsBackRight
	sendif
	end
.is_odd
	ldh a, [hScriptVar]
	and 1
	ldh [hScriptVar], a
	ret

MACRO entry
	db \1, \2
	dw \3
	db \1, \2
	dw \4
ENDM
.PreventPlayerLeaveArray
	entry PIKACHU, 9, .pikachu_not_outside_forest_text, .pikachu_not_in_lab_text
	entry BUTTERFREE, 4, .butterfree_not_outside_forest_text, .butterfree_not_in_lab_text
	entry CATERPIE, 6, .caterpie_not_outside_forest_text, .caterpie_not_in_lab_text
PURGE entry

.PlayerStepsBackRight
	step_right
	step_end

.PlayerStepsBackDown
	step_down
	step_end

.pikachu_not_outside_forest_text
	ctxt "Hey, we don't need"
	line "to look for"
	para "berries outside of"
	line "the forest."

	para "I'm sure there are"
	line "tasty berries here"
	para "that are just"
	line "waiting to be"
	cont "discovered!"
	sdone

.butterfree_not_outside_forest_text
	ctxt "Oh, we don't need"
	line "to check here."

	para "I know my baby"
	line "well, and I know"
	para "that he'll never"
	line "try leaving the"
	cont "forest."
	sdone

.caterpie_not_outside_forest_text
	ctxt "Mommy can't be"
	line "past here!"

	para "We've always lived"
	line "in this forest and"
	para "have never left or"
	line "stepped out."

	para "I know that she's"
	line "somewhere else!"
	sdone

.pikachu_not_in_lab_text
	ctxt "Hey, there won't be"
	line "any berries in a"
	cont "human building."

	para "Let's look"
	line "somewhere else."
	sdone

.butterfree_not_in_lab_text
	ctxt "You don't imagine"
	line "he's in here<...>?"

	para "No, I've always"
	line "told my baby to"
	para "never wander into"
	line "any places with"
	cont "humans."

	para "Let's move away"
	line "from here."
	sdone

.caterpie_not_in_lab_text
	ctxt "Mommy can't be"
	line "here!"

	para "She's always told"
	line "me to stay away"
	para "from the human"
	line "place!"

	para "Let's continue"
	line "searching"
	cont "elsewhere!"
	sdone
