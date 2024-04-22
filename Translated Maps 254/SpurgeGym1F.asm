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
	ctxt "War es dir zu"
	line "hart? Hier hast"
	para "du deine #mon"
	line "zurück. Schade."
	para "Komm wieder,"
	line "wenn du stärker"
	cont "bist."
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
	ctxt "Sorry, aber in"
	line "dieser Arena"
	para "brauchst du ein"
	line "volles Team aus"
	cont "sechs #mon."
	para "Komm mit einem"
	line "vollen Team zurück"
	para "und wir können"
	line "reden."
	para "Ach und bring bloß"
	line "keine Eier mit."
	para "Glaub mir, die"
	line "bringen dir hier"
	cont "nichts."
	done

.have_egg_text
	ctxt "Sorry, aber Eier"
	line "im Team sind hier"
	cont "nicht erlaubt."
	para "Komm mit einem"
	line "vollen Team"
	para "zurück, wenn du"
	line "die Arena"
	para "herausfordern"
	line "willst."
	done

.introduction_text
	ctxt "Hallo, Trainer!"
	para "Bist du bereit,"
	line "um den Naljo-Orden"
	cont "zu kämpfen?"
	para "<...>"
	para "Ja?"
	para "Ich aber nicht."
	sdone

.instructions_text
	ctxt "So läuft's ab:"
	line "Ich hab all"
	para "deine #mon"
	line "versteckt."
	para "Sobald du sie alle"
	line "gefunden hast,"
	cont "suchst du mich."
	para "Dann werden wir"
	line "sehen, ob du"
	para "meines Ordens"
	line "würdig bist!"
	done

.already_defeated_text
	ctxt "Jetzt, wo du den"
	line "Naljo-Orden hast,"
	para "kannst du die"
	line "Rijon-Liga"
	cont "herausfordern."
	para "Um dahin zu"
	line "kommen, gehst du"
	para "von den Akania"
	line "Docks nach Osten,"
	para "bis zum Grenz-"
	line "übergang, von wo"
	para "du die Senecahöhle"
	line "betrittst."
	para "Ab da, musst du"
	line "auf eine eigene"
	para "Stärke vertrauen"
	line "und dir den Weg"
	para "zur Rijon-Liga"
	line "bahnen."
	para "Gib alles!"
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