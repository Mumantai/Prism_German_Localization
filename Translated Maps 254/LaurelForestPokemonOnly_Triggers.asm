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
	ctxt "Außerhalb des"
	line "Waldes, werden wir"
	para "wohl keine Beeren"
	line "finden können."
	para "Es gibt im Wald"
	line "sicherlich genug"
	para "leckere Beeren,"
	line "die von uns gefun-"
	cont "den werden wollen!"
	sdone

.butterfree_not_outside_forest_text
	ctxt "Oh, wir müssen"
	line "hier nicht suchen."
	para "Ich kenne mein"
	line "Baby gut und ich"
	para "weiß, er würde nie"
	line "versuchen, den"
	cont "Wald zu verlassen."
	sdone

.caterpie_not_outside_forest_text
	ctxt "Mami kann hier"
	line "nicht sein!"
	para "Wir haben immer in"
	line "diesem Wald gelebt"
	para "und ihn noch nie"
	line "verlassen."
	para "Ich weiß, dass"
	line "sie woanders ist!"
	sdone

.pikachu_not_in_lab_text
	ctxt "In einem Gebäude"
	line "werden wir keine"
	cont "Beeren finden."
	para "Lass uns woanders"
	line "suchen."
	sdone

.butterfree_not_in_lab_text
	ctxt "Du glaubst doch"
	line "nicht, er wäre"
	cont "hier drin ...?"
	para "Nein, ich habe"
	line "meinem Baby immer"
	para "gesagt, dass er"
	line "an keine Orte mit"
	para "Menschen gehen"
	line "soll."
	para "Lass uns hier"
	line "weggehen."
	sdone

.caterpie_not_in_lab_text
	ctxt "Mami kann hier"
	line "nicht sein!"
	para "Sie hat mir immer"
	line "gesagt, ich soll"
	para "mich von Menschen"
	line "fernhalten!"
	para "Lass uns woanders"
	line "weitersuchen!"
	sdone