PhloxLab1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_TILES, PhloxLabF1Tiles

PhloxLabF1RefreshMap:
	changemap PhloxLab1F_BlockData

; fallthrough
PhloxLabF1Tiles:
	checkevent EVENT_PHLOX_LAB_RED_ON
	sif false, then
		changeblock 12, 18, $3a
		changeblock 2, 2, $3a
		changeblock 8, 16, $57
		changeblock 8, 18, $3b
	sendif

	checkevent EVENT_PHLOX_LAB_BLUE_ON
	sif false, then
		changeblock 20, 18, $3a
		changeblock 20, 2, $3a
		changeblock 20, 4, $3f
		changeblock 22, 4, $41
	sendif

	checkevent EVENT_PHLOX_LAB_GREEN_ON
	sif false, then
		changeblock 6, 18, $3a
		changeblock 4, 22, $3a
		changeblock 8, 4, $3b
		changeblock 6, 4, $3f
	sendif

	checkevent EVENT_PHLOX_LAB_YELLOW_ON
	sif false, then
		changeblock 16, 2, $3a
		changeblock 8, 6, $3a
	sendif

	checkevent EVENT_PHLOX_LAB_BROWN_ON
	sif true
		return
	changeblock 16, 22, $3a
	changeblock 12, 2, $3a
	return

PhloxLab1FRedWarp1:
	switch 0

PhloxLab1FRedWarp2:
	switch 1

PhloxLab1FBlueWarp1:
	switch 2

PhloxLab1FBlueWarp2:
	switch 3

PhloxLab1FGreenWarp1:
	switch 4

PhloxLab1FGreenWarp2:
	switch 5

PhloxLab1FYellowWarp1:
	switch 6

PhloxLab1FYellowWarp2:
	switch 7

PhloxLab1FBrownWarp1:
	switch 8

PhloxLab1FBrownWarp2:
	writebyte 9

	sendif
	playsound SFX_WARP_TO
	applymovement PLAYER, .warp_from
	special FadeOutPalettes
	loadarray PhloxLabWarpCoordsArray
	cmdwitharrayargs
	db warp_command, %110
	map PHLOX_LAB_1F
	db 0, 1
	endcmdwitharrayargs
	playsound SFX_WARP_FROM
	applymovement PLAYER, .warp_to
	end

.warp_from
	teleport_from
	step_end

.warp_to
	teleport_to
	step_end

PhloxLabWarpCoordsArray:
	db 03, 02
PhloxLabWarpCoordsArrayEntrySizeEnd:
	db 13, 18
	db 21, 02
	db 21, 18
	db 05, 22
	db 07, 18
	db 17, 02
	db 09, 06
	db 17, 22
	db 13, 02

PhloxLabRedSwitch:
	switch 0

PhloxLabBlueSwitch:
	switch 1

PhloxLabGreenSwitch:
	switch 2

PhloxLabYellowSwitch:
	switch 3

PhloxLabBrownSwitch:
	writebyte 4

; toggle switch
	sendif
	pushvar
	loadarray PhloxLabSwitchArray
	readarrayhalfword 0
	checkevent -1
	sif false, then
		setevent -1
	selse
		clearevent -1
	sendif
	scall PhloxLabF1RefreshMap
	waitsfx
	playwaitsfx SFX_TWO_PC_BEEPS
	popvar
	jumptext PhloxLabSwitchText

PhloxLabSwitchArray:
	dw EVENT_PHLOX_LAB_RED_ON
PhloxLabSwitchArrayEntrySizeEnd:
	dw EVENT_PHLOX_LAB_BLUE_ON
	dw EVENT_PHLOX_LAB_GREEN_ON
	dw EVENT_PHLOX_LAB_YELLOW_ON
	dw EVENT_PHLOX_LAB_BROWN_ON

PhloxLabF1_YellowPalette:
	trainer EVENT_PHLOX_LAB_F1_YELLOW_PALETTE, PATROLLER, 17, .before_battle_text, .battle_won_text

	ctxt "Forget this place!"

	para "Maybe I'll go out"
	line "to Kalos."

	para "I'm sure someone"
	line "out there will"
	para "appreciate my"
	line "style and FLARE!"
	done

.before_battle_text
	ctxt "Palette Red was an"
	line "awful leader that"
	para "never appreciated"
	line "my fashion style."

	para "That's why he was"
	line "easily upstaged by"
	cont "a kid like you."
	done

.battle_won_text
	ctxt "No! The terrible"
	line "lighting ruined my"
	cont "shot at this!"
	done

PhloxLabF1_Trainer_1:
	trainer EVENT_PHLOX_LAB_F1_TRAINER_1, SCIENTIST, 4, .before_battle_text, .battle_won_text

	ctxt "Judging by the way"
	line "you fight, you"
	para "must be a true"
	line "#mon prodigy."
	done

.before_battle_text
	ctxt "6 years of medical"
	line "& #mon anatomy"
	para "study will give me"
	line "the upper hand in"
	cont "this battle!"
	done

.battle_won_text
	ctxt "<...>6 years wasted<...>"
	done

PhloxLabF1_Trainer_2:
	trainer EVENT_PHLOX_LAB_F1_TRAINER_2, SCIENTIST, 5, .before_battle_text, .battle_won_text

	ctxt "I should consider"
	line "a career change."
	done

.before_battle_text
	text "<...>Yes?"
	done

.battle_won_text
	ctxt "They don't pay me"
	line "enough to care if"
	cont "I lost to you."
	done

PhloxLabF1_Trainer_3:
	trainer EVENT_PHLOX_LAB_F1_TRAINER_3, SCIENTIST, 6, .before_battle_text, .battle_won_text

	ctxt "If you were more"
	line "considerate, you"
	para "wouldn't jeopardize"
	line "our employment."
	done

.before_battle_text
	ctxt "Not you again!"
	line "I just signed up"
	para "for the company"
	line "healthcare plan."

	para "There's no way I'm"
	line "letting you take"
	cont "down this company."
	done

.battle_won_text
	ctxt "Oh well, I guess I"
	line "need to file for"
	cont "unemployment now."
	done

PhloxLabF1_Trainer_4:
	trainer EVENT_PHLOX_LAB_F1_TRAINER_4, SCIENTIST, 7, .before_battle_text, .battle_won_text

	ctxt "I'm going to make"
	line "this company many"
	cont "millions, someday."

	para "Then they'll have"
	line "to bump up my"
	cont "measly salary."
	done

.before_battle_text
	ctxt "There is so much"
	line "research still"
	cont "left to be done!"

	para "I will stop you!"
	done

.battle_won_text
	ctxt "I must preserve my"
	line "findings for later"
	cont "publishing."
	done

PhloxLabSwitchText:
	start_asm
	ldh a, [hScriptVar]
	ld hl, .colors
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	ld hl, .text
	ret

.text
	ctxt "Pressed the <STRBF2>"
	line "Switch!"
	done

.colors
	db "Red@"
	db "Blue@"
	db "Green@"
	db "Yellow@"
	db "Brown@"

PhloxLabJournal_1:
	jumptext .text

.text
	ctxt "It seems to be a"
	line "journal entry."

	para "<...>"

	para "Feb 6, 1986"
	line "Cinnabar reports"
	para "enhancements to"
	line "the newborn will"
	cont "begin immediately."

	para "Will await data."
	done

PhloxLabJournal_2:
	jumptext .text

.text
	ctxt "Sep 2, 1986"
	line "All communications"
	para "from Cinnabar Lab"
	line "have gone silent"
	cont "for over 24 hours."

	para "I fear something"
	line "terrible has"
	cont "happened."
	done

PhloxLabJournal_3:
	jumptext .text

.text
	ctxt "Sep 15, 1986"
	line "No. 03 reports"
	cont "from Cinnabar."

	para "Lab destroyed,"
	line "cause unknown."

	para "Authorities are"
	line "investigating."

	para "Fuji has vanished"
	line "with the primary"
	para "subject - probable"
	line "treachery."

	para "No. 03 instructed"
	line "to extract as much"
	para "equipment as they"
	line "can and to evade"
	cont "detection."
	done


PhloxLab1F_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 23, 14, 3, PHLOX_TOWN
	warp_def 23, 15, 3, PHLOX_TOWN
	warp_def 7, 18, 1, PHLOX_LAB_2F

.CoordEvents: db 10
	xy_trigger 0, 18, 13, PhloxLab1FRedWarp1, EVENT_PHLOX_LAB_RED_ON
	xy_trigger 0, 02, 03, PhloxLab1FRedWarp2, EVENT_PHLOX_LAB_RED_ON
	xy_trigger 0, 18, 21, PhloxLab1FBlueWarp1, EVENT_PHLOX_LAB_BLUE_ON
	xy_trigger 0, 02, 21, PhloxLab1FBlueWarp2, EVENT_PHLOX_LAB_BLUE_ON
	xy_trigger 0, 18, 07, PhloxLab1FGreenWarp1, EVENT_PHLOX_LAB_GREEN_ON
	xy_trigger 0, 22, 05, PhloxLab1FGreenWarp2, EVENT_PHLOX_LAB_GREEN_ON
	xy_trigger 0, 06, 09, PhloxLab1FYellowWarp1, EVENT_PHLOX_LAB_YELLOW_ON
	xy_trigger 0, 02, 17, PhloxLab1FYellowWarp2, EVENT_PHLOX_LAB_YELLOW_ON
	xy_trigger 0, 02, 13, PhloxLab1FBrownWarp1, EVENT_PHLOX_LAB_BROWN_ON
	xy_trigger 0, 22, 17, PhloxLab1FBrownWarp2, EVENT_PHLOX_LAB_BROWN_ON

.BGEvents: db 8
	signpost 16, 16, SIGNPOST_UP, PhloxLabRedSwitch
	signpost  0,  4, SIGNPOST_UP, PhloxLabBlueSwitch
	signpost 0, 16, SIGNPOST_UP, PhloxLabGreenSwitch
	signpost 16, 2, SIGNPOST_UP, PhloxLabYellowSwitch
	signpost 0, 12, SIGNPOST_UP, PhloxLabBrownSwitch
	signpost 18, 19, SIGNPOST_UP, PhloxLabJournal_1
	signpost 22,  3, SIGNPOST_UP, PhloxLabJournal_2
	signpost 12, 21, SIGNPOST_UP, PhloxLabJournal_3

.ObjectEvents: db 6
	person_event SPRITE_SCIENTIST, 20, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF1_Trainer_1, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 3, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF1_Trainer_2, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 11, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF1_Trainer_3, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 9, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF1_Trainer_4, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_PALETTE_PATROLLER, 9, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF1_YellowPalette, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_POKE_BALL, 7, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_METRONOME, 0, EVENT_PHLOX_F1_TM51
	person_event SPRITE_POKE_BALL, 8, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAX_REVIVE, EVENT_PHLOX_ITEM_MAX_REVIVE
