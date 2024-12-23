SpurgeGym1F_MapScriptHeader:
 ;trigger count
	db 2
	maptrigger .gym_entering_trigger
	maptrigger GenericDummyScript

 ;callback count
	db 0

.gym_entering_trigger
	priorityjump .Script
	end

.Script
	checkevent EVENT_ENTERED_SPURGE_GYM
	clearevent EVENT_ENTERED_SPURGE_GYM
	sif true, then
		checkevent EVENT_SPURGE_GYM_B1F_DYNAMITE
		sif true, then
			checkevent EVENT_SPURGE_GYM_SMASHROCK
			sif false
				takeitem DYNAMITE, 1
		sendif
		callasm UnhideParty
		applymovement 2, .leader_approaches_player
		faceperson PLAYER, LEFT
		showtext .forfeit_text
		applymovement 2, .leader_moves_back
	sendif
	dotrigger 1
	end

.leader_approaches_player
	step_down
	step_end

.leader_moves_back
	step_up
	step_end

.forfeit_text
	ctxt "Nicht Bereit für"
	line "die Challenge?"
	para "Hier hast du deine"
	line "#mon zurück."
	para "Komm wieder wenn"
	line "du stärker bist."
	sdone

SpurgeGymSign:
	ctxt "Euphorbia Arena"
	para "Leiter: Bruce"
	done

SpurgeGym1FLeader:
	faceplayer
	checkevent EVENT_SPURGE_GYM_DEFEATED
	sif true
		jumptext .already_defeated_text
	checkcode VAR_PARTYCOUNT
	sif !=, 6
		jumptext .less_than_six_mons_text
	callasm .CheckPartyForEggs
	sif false
		jumptext .have_egg_text
	showtext .introduction_text
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $17
	reloadmappart
	pause 16
	blackoutmod SPURGE_GYM_1F
	special HealParty
	callasm SpurgeHidePokemon
	setevent EVENT_ENTERED_SPURGE_GYM
	clearevent EVENT_SPURGE_GYM_POKEMON_1
	clearevent EVENT_SPURGE_GYM_POKEMON_2
	clearevent EVENT_SPURGE_GYM_POKEMON_3
	clearevent EVENT_SPURGE_GYM_POKEMON_4
	clearevent EVENT_SPURGE_GYM_POKEMON_5
	clearevent EVENT_SPURGE_GYM_POKEMON_6
	clearevent EVENT_SPURGE_GYM_B1F_CADENCE
	clearevent EVENT_SPURGE_GYM_B1F_JOSIAH
	clearevent EVENT_SPURGE_GYM_B1F_EDISON
	clearevent EVENT_SPURGE_GYM_B1F_RINJI
	clearevent EVENT_SPURGE_GYM_PUSHROCK
	clearevent EVENT_SPURGE_GYM_B1F_DYNAMITE
	clearevent EVENT_SPURGE_GYM_SWITCH_ENABLED
	clearevent EVENT_SPURGE_GYM_SMASHROCK
	applymovement PLAYER, .hide_player
	warp SPURGE_GYM_B1F, 20, 36
	warpsound
	applymovement PLAYER, .sky_fall
	domaptrigger SPURGE_GYM_1F, 0
	jumptext .instructions_text

.CheckPartyForEggs:
	ld hl, wPartySpecies
	xor a
	ldh [hScriptVar], a
.loop
	ld a, [hli]
	cp EGG
	ret z
	inc a
	jr nz, .loop
	inc a
	ldh [hScriptVar], a
	ret

.hide_player
	skyfall_top
	step_end

.sky_fall
	skyfall
	step_end

.less_than_six_mons_text
	ctxt "Entschuldige, du"
	line "benötigst ein"
	para "volles Team aus"
	line "6 #mon."
	para "Komm wieder mit"
	line "einem vollen Team."
	para "Ach, und bitte"
	line "keine Eier mit-"
	cont "nehmen <...>"
	para "Wäre sowieso zu"
	line "deinem Nachteil."
	done

.have_egg_text
	ctxt "Entschuldige, es"
	line "sind hier keine"
	cont "Eier erlaubt."
	para "Wenn du die Arena"
	line "Challenge antreten"
	para "möchtest, komm mit"
	line "einem vollen Team."
	done

.introduction_text
	ctxt "Hallo, Trainer!"
	para "Bist du bereit,"
	line "um den Naljo Orden"
	cont "zu kämpfen?"
	para "<...>"
	para "Ja?"
	para "Ich aber nicht."
	sdone

.instructions_text
	ctxt "So funktionierts:"
	para "Ich habe all deine"
	line "#mon genommen."
	para "Wenn du alle"
	line "findest, komm zu"
	para "mir und wir werden"
	line "sehen ob du meiner"
	cont "würdig bist."
	done

.already_defeated_text
	ctxt "Jetzt wo du den"
	line "Naljo Orden hast,"
	para "kannst du dich der"
	line "Rijon-Liga stellen"
	para "Um dahin zu kommen"
	line "gehst du zu den"
	para "Akania-Hafen und"
	line "von da aus nach"
	cont "Osten."
	para "Du erreichst dann"
	line "die Naljo-Grenze,"
	para "wo du den Eingang"
	line "in die Senecahöhle"
	cont "findest."
	para "Von da an bist"
	line "du auf dich allein"
	para "gestellt und musst"
	line "dich bis zur Liga"
	cont "durchkämpfen!"
	para "Halte durch!"
	done

SpurgeGym1F_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 13, 4, 6, SPURGE_CITY
	warp_def 13, 5, 6, SPURGE_CITY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 2, SIGNPOST_TEXT, SpurgeGymSign
	signpost 11, 7, SIGNPOST_TEXT, SpurgeGymSign

.ObjectEvents: db 1
	person_event SPRITE_BRUCE, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpurgeGym1FLeader, -1