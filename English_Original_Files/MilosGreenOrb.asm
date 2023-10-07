MilosGreenOrb_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MilosGreenOrbRayquazaServant:
	faceplayer
	checkevent EVENT_MILOS_RAYQUAZA
	sif true
		jumptext .already_battled_text
	opentext
	checkitem GREEN_ORB
	sif false
		jumptext .describe_rayquaza_text
	takeitem GREEN_ORB
	writetext .took_green_orb_text
	special Special_BattleTowerFade
	playsound SFX_ENTER_DOOR
	waitsfx
	warpfacing UP, MILOS_RAYQUAZA, 4, 7
	opentext
	writetext .request_battle_text
	setevent EVENT_MILOS_RAYQUAZA
	cry RAYQUAZA
	writetext .met_requirements_text
	cry RAYQUAZA
	applymovement 3, .rayquaza_approaches
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon RAYQUAZA, 50
	startbattle
	reloadmapafterbattle
	special Special_BattleTowerFade
	playsound SFX_ENTER_DOOR
	waitsfx
	warpfacing UP, MILOS_GREEN_ORB, 4, 3
	end

.rayquaza_approaches
	step_down
	step_down
	step_down
	step_down
	step_end

.describe_rayquaza_text
	ctxt "There's a #mon"
	line "that ceased the"
	para "war between Groud-"
	line "on and Kyogre."

	para "This sky god now"
	line "resides on this"
	cont "tower."

	para "It is very"
	line "aggressive, and"
	para "the only way for"
	line "it to agree to a"
	para "battle is to hold"
	line "the Green Orb."
	done

.took_green_orb_text
	ctxt "Good, please come"
	line "with me."
	sdone

.request_battle_text
	ctxt "Master, a child"
	line "has requested a"
	cont "battle."
	sdone

.met_requirements_text
	ctxt "The child has"
	line "also met the"
	cont "requirements."
	sdone

.already_battled_text
	ctxt "The challenge has"
	line "ended."
	done

MilosGreenOrb_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $4, 1, MILOS_TOWERCLIMB
	warp_def $f, $5, 1, MILOS_TOWERCLIMB

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SAGE, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MilosGreenOrbRayquazaServant, EVENT_MILOS_GREEN_ORB_NPC_1
