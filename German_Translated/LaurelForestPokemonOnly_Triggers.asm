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

entry: MACRO
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
	ctxt "Hey, müssen nicht"
	line "außerhalb des"
	para "Waldes nach Beern"
	line "suchen."

	para "Ich bin mir sicher"
	line "es gibt leckere"
	para "Beeren hier die"
	line "nur gefunden"
	cont "werden wollen!"
	sdone

.butterfree_not_outside_forest_text
	ctxt "Oh, wir müssen"
	line "hier nicht suchen."

	para "Ich kenne mein"
	line "Baby gut und ich"
	para "weiß, er würde nie"
	line "versuchen den Wald"
	cont "zu verlassen."
	sdone

.caterpie_not_outside_forest_text
	ctxt "Mammi kann hier"
	line "nicht vorbei sein!"

	para "Wir haben immer in"
	line "diesem Wald gelebt"
	para "und ihn nie"
	line "verlassen."

	para "Ich weiß, dass"
	line "sie woanders ist!"
	sdone

.pikachu_not_in_lab_text
	ctxt "Hey, es werden"
	line "Beeren in einem"
	cont "Gebäude sein."

	para "Lass uns woanders"
	line "suchen."
	sdone

.butterfree_not_in_lab_text
	ctxt "Du glaubst doch"
	line "nicht er wäre hier"
	cont "drin...?"

	para "Nein, Ich habe"
	line "meinem Baby immer"
	para "gesagt nicht zu"
	line "Plätzen mit"
	para "Menschen zu"
	line "wandern."

	para "Lass uns hier weg"
	line "gehen."
	sdone

.caterpie_not_in_lab_text
	ctxt "Mammi kann hier"
	line "nicht sein!"

	para "Sie hat mir immer"
	line "gesagt vom"
	para "Menschenplatz weg"
	line "zu bleiben!"

	para "Lass uns woanders"
	line "weiter suchen!"
	sdone
