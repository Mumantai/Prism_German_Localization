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
	ctxt "Not up for the"
	line "challenge?"

	para "Here are your"
	line "#mon back,"
	cont "then. Bummer."

	para "Come back once"
	line "you get stronger."
	sdone

SpurgeGymSign:
	ctxt "Spurge Gym"

	para "Leader: Bruce"
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
	ctxt "Sorry, but this"
	line "Gym requires you"
	para "to have a full"
	line "party of six."

	para "Come back with"
	line "a full team, and"
	cont "then we'll talk."

	para "Also, don't bring"
	line "any eggs with your"
	cont "party, please."

	para "Trust me, it's"
	line "for your own"
	cont "benefit."
	done

.have_egg_text
	ctxt "Sorry, eggs are"
	line "not allowed here."

	para "Come back with no"
	line "eggs in your party"
	para "if you want to"
	line "challenge the Gym."
	done

.introduction_text
	ctxt "Welcome, Trainer!"

	para "Are you ready to"
	line "fight for the"
	cont "Naljo Badge?"

	para "<...>"

	para "Well, I'm not."
	sdone

.instructions_text
	ctxt "Here's the skinny."

	para "I've taken all of"
	line "your #mon."

	para "Once you find all"
	line "of them, come and"
	para "find me. Then I'll"
	line "see if you're"
	para "truly worthy of"
	line "getting my badge."
	done

.already_defeated_text
	ctxt "Now that you have"
	line "the Naljo Badge,"
	para "you will be able"
	line "to compete in the"
	cont "Rijon League!"

	para "To get there,"
	line "go to Acania Docks"
	cont "and head east."

	para "You'll reach the"
	line "Naljo Border,"
	para "where you'll be"
	line "able to enter the"
	cont "Seneca Caverns."

	para "From that point"
	line "on, you'll have to"
	para "rely on your own"
	line "skill to navigate"
	para "through it in"
	line "order to reach"
	cont "the Rijon League."

	para "Stay strong!"
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
