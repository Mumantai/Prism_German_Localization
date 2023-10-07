MilosB2F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_blocks

.set_blocks
	checkevent EVENT_0
	sif true
		scall MilosB2F_RedOff
	checkevent EVENT_1
	sif true
		scall MilosB2F_YellowOff
	checkevent EVENT_2
	sif true
		scall MilosB2F_GreenOff
	checkevent EVENT_3
	sif true
		scall MilosB2F_BrownOff
	return

MilosB2F_GreenOff:
	changeblock 26, 10, $36
	changeblock 30, 12, $51
	changeblock 30, 10, $52
	changeblock 32, 22, $50
	end

MilosB2F_RedOff:
	changeblock 12, 16, $51
	changeblock 12, 14, $52
	changeblock 0, 16, $6b
	end

MilosB2F_YellowOff:
	changeblock 14, 22, $77
	changeblock 22, 10, $51
	changeblock 22, 8, $52
	changeblock 24, 16, $50
	changeblock 26, 16, $50
	end

MilosB2F_BrownOff:
	changeblock 30, 4, $32
	changeblock 32, 8, $82
	changeblock 32, 12, $82
	changeblock 30, 20, $52
	changeblock 30, 22, $51
	changeblock 36, 14, $52
	changeblock 36, 16, $51
	end

MilosB2F_GreenOn:
	changeblock 26, 10, $7b
	changeblock 30, 12, $2f
	changeblock 30, 10, $30
	changeblock 32, 22, $4c
	end

MilosB2F_RedOn:
	changeblock 12, 16, $68
	changeblock 12, 14, $67
	changeblock 0, 16, $6a
	end

MilosB2F_YellowOn:
	changeblock 14, 22, $76
	changeblock 22, 10, $7e
	changeblock 22, 8, $7d
	changeblock 24, 16, $2e
	changeblock 26, 16, $2e
	end

MilosB2F_BrownOn:
	changeblock 30, 4, $33
	changeblock 32, 8, $4d
	changeblock 32, 12, $4d
	changeblock 30, 20, $49
	changeblock 30, 22, $48
	changeblock 36, 14, $49
	changeblock 36, 16, $48
	end

MilosB2F_Movement_SlideDown6:
	fast_slide_step_down
	fast_slide_step_down
MilosB2F_Movement_SlideDown4:
	fast_slide_step_down
	fast_slide_step_down
	fast_slide_step_down
	fast_slide_step_down
	step_end

MilosB2FHole1:
	spriteface 0, 0
	playsound SFX_RETURN
	showemote 0, 0, 32
	applymovement 0, MilosB2F_Movement_SlideDown6
	playsound SFX_STRENGTH
	earthquake 16
	end

MilosB2FHole2:
	spriteface 0, 0
	playsound SFX_RETURN
	showemote 0, 0, 32
	applymovement 0, MilosB2F_Movement_SlideDown4
	playsound SFX_STRENGTH
	earthquake 16
	end

MilosB2FHole3:
	spriteface 0, 0
	playsound SFX_RETURN
	showemote 0, 0, 32
	applymovement 0, MilosB2F_Movement_SlideDown6
	playsound SFX_STRENGTH
	earthquake 16
	end

MilosB2FColorSwitchExplanationSign:
	jumptext .text

.text
	ctxt "Colored switches"
	line "will change"
	para "whether blocks of"
	line "the same color"
	cont "appear or not."
	done

MilosB2FGreenSwitch:
	opentext
	writetext MilosB2F_Text_PulledGreenSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_2, MilosB2F_GreenOff, MilosB2F_GreenOn
	reloadmappart
	closetextend

MilosB2F_Text_PulledGreenSwitch::
	ctxt "<PLAYER> pulled the"
	line "green switch!"
	sdone

MilosB2FRedSwitch:
	opentext
	writetext MilosB2F_Text_PulledRedSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_0, MilosB2F_RedOff, MilosB2F_RedOn
	reloadmappart
	closetextend

MilosB2F_Text_PulledRedSwitch::
	ctxt "<PLAYER> pulled the"
	line "red switch!"
	sdone

MilosB2FYellowSwitch:
	opentext
	writetext MilosB2F_Text_PulledYellowSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_1, MilosB2F_YellowOff, MilosB2F_YellowOn
	reloadmappart
	closetextend

MilosB2F_Text_PulledYellowSwitch::
	ctxt "<PLAYER> pulled the"
	line "yellow switch!"
	sdone

MilosB2FBrownSwitch:
	opentext
	writetext MilosB2F_Text_PulledBrownSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_3, MilosB2F_BrownOff, MilosB2F_BrownOn
	reloadmappart
	closetextend

MilosB2F_Text_PulledBrownSwitch::
	ctxt "<PLAYER> pulled the"
	line "brown switch!"
	sdone

MilosB2FLatinSign1:
	jumptext .text

.text
	ctxt "FAC FORTIA ET"
	line "PATERE"
	done

MilosB2FLatinSign2:
	jumptext .text

.text
	text "SIC PARVIS MAGNA"
	done

MilosB2FLatinSign3:
	jumptext .text

.text
	ctxt "BIS DAT QVI CITO"
	line "DAT"
	done

MilosB2FJump:
	playsound SFX_JUMP_OVER_LEDGE
	checkcode VAR_FACING
	sif >, 3
		writebyte 0
	anonjumptable
	dw .facing_down
	dw .facing_up
	dw .facing_left
	dw .facing_right

.facing_left
	applymovement PLAYER, .left_movement
	end

.facing_right
	applymovement PLAYER, .right_movement
.facing_down
.facing_up
	end

.left_movement
	jump_step_left
	step_end
.right_movement
	jump_step_right
	step_end

MilosB2F_PurplePatroller:
	trainer EVENT_MILOS_B2F_PURPLE_PATROLLER, PATROLLER, 7, .before_battle_text, .battle_won_text

	ctxt "Red is trying to"
	line "collect strange"
	para "orb shards from"
	line "around the region."
	done

.before_battle_text
	ctxt "There's a rare item"
	line "somewhere in this"
	cont "dump!"

	para "If we get that,"
	line "Red will be very"
	cont "pleased with us."
	done

.battle_won_text
	ctxt "I don't get it."

	para "You don't even see"
	line "us as a threat<...>"
	done

MilosB2F_BluePatroller:
	trainer EVENT_MILOS_B2F_BLUE_PATROLLER, PATROLLER, 10, .before_battle_text, .battle_won_text

	ctxt "I won't gain any"
	line "respect if I keep"
	cont "losing to kids!"
	done

.before_battle_text
	ctxt "I'm much better"
	line "prepared this time"
	cont "around."

	para "You better stop"
	line "pestering us, so"
	para "Red may continue"
	line "with his plans."
	done

.battle_won_text
	ctxt "Can't you just let"
	line "me win?"

	para "I don't wanna be an"
	line "intern forever."
	done

MilosB2F_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 5, 1, 2, MILOS_B1F
	warp_def 5, 39, 7, MILOS_F1
	warp_def 4, 15, 5, MILOS_B1F

.CoordEvents: db 3
	xy_trigger 0, 4, 21, MilosB2FHole1
	xy_trigger 0, 8, 37, MilosB2FHole2
	xy_trigger 0, 4, 13, MilosB2FHole3

.BGEvents: db 12
	signpost 6, 7, SIGNPOST_READ, MilosB2FColorSwitchExplanationSign
	signpost 5, 7, SIGNPOST_UP, MilosB2FColorSwitchExplanationSign
	signpost 10, 27, SIGNPOST_RIGHT, MilosB2FGreenSwitch
	signpost 16, 0, SIGNPOST_LEFT, MilosB2FRedSwitch
	signpost 22, 14, SIGNPOST_LEFT, MilosB2FYellowSwitch
	signpost 4, 31, SIGNPOST_RIGHT, MilosB2FBrownSwitch
	signpost 4, 23, SIGNPOST_READ, MilosB2FLatinSign1
	signpost 3, 23, SIGNPOST_UP, MilosB2FLatinSign1
	signpost 16, 17, SIGNPOST_READ, MilosB2FLatinSign2
	signpost 15, 17, SIGNPOST_UP, MilosB2FLatinSign2
	signpost 24, 1, SIGNPOST_READ, MilosB2FLatinSign3
	signpost 23, 1, SIGNPOST_UP, MilosB2FLatinSign3

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 24, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DUSK_STONE, EVENT_MILOS_B2F_ITEM_DUSK_STONE
	person_event SPRITE_POKE_BALL, 12, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, RAZOR_CLAW, EVENT_MILOS_B2F_ITEM_RAZOR_CLAW
	person_event SPRITE_PALETTE_PATROLLER, 24, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, MilosB2F_PurplePatroller, EVENT_MILOS_B2F_PURPLE_PATROLLER
	person_event SPRITE_PALETTE_PATROLLER, 12, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, MilosB2F_BluePatroller, EVENT_MILOS_B2F_BLUE_PATROLLER
	person_event SPRITE_POKE_BALL, 4, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SEISMIC_TOSS, 0, EVENT_MILOS_B2F_TM_SEISMIC_TOSS
