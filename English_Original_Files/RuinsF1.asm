MACRO ruins_pit
	db \2 ; Y
	db \3 ; X
	dw \1 ; Flag
	db \4 ; Permissions
	ENDM

RuinsF1_MapScriptHeader::
	;trigger count
	db 1
	maptrigger .check_jumps_and_pits

	;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_traps

.check_jumps_and_pits
	callasm RuinsF1CheckJump
	callasm RuinsF1CheckPit
	end

.set_traps
	clearevent EVENT_2
	jump RuinsF1SetTraps

RuinsF1CheckJump:
	ldh a, [hJoyPressed]
	cp A_BUTTON
	ret nz
	call .get_facing_direction
	push af
	ld hl, wYCoord
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop af
	jumptable

.Jumptable
	dw .down
	dw .up
	dw .left
	dw .right

.get_facing_direction
	ld a, [wPlayerDirection]
	and $c
	rrca
	rrca
	ret

.down
	inc e
	inc e
.up
	dec e
	jr .checkTile

.left
	dec d
	dec d
.right
	inc d

.checkTile
	call RuinsF1ReadPitTable
	ret nc

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld b, CHECK_FLAG
	push hl
	ld hl, wEventFlags
	predef EventFlagAction
	pop hl
	ret z
	call .get_facing_direction
	ld b, a
	ld c, DOWN
	ld d, [hl]

.facingCheck
	ld a, b
	bit 3, d
	jr z, .facingOK
	cp c
	ret z
.facingOK
	sla d
	inc c
	ld a, c
	cp 4
	jr nz, .facingCheck

	ld a, BANK(Ruins_TryJump)
	ld de, Ruins_TryJump
	;fallthrough
RuinsF1SetPriorityJump:
	ld hl, wPriorityScriptBank
	ld [hli], a ;hl = wPriorityScriptAddr
	ld a, e
	ld [hli], a
	ld [hl], d
	ld hl, wScriptFlags
	set 3, [hl]
	ret

RuinsF1CheckPit:
	ld hl, wYCoord
	ld a, [hli]
	ld e, a
	ld d, [hl]
	call RuinsF1ReadPitTable
	ret nc

	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld b, SET_FLAG
	ld hl, wEventFlags
	predef EventFlagAction

	ld a, BANK(RuinsF1_TriggeredTrap)
	ld de, RuinsF1_TriggeredTrap
	jr RuinsF1SetPriorityJump

RuinsF1ReadPitTable: ;e: Y, d: X, set carry if it was found. Returns address of entry in hl
	ld hl, RuinsF1PitTable
.loop
	ld a, [hli]
	cp -1
	ret z
	cp e
	ld a, [hli]
	jr nz, .no_match
	cp d
	scf
	ret z
.no_match
	inc hl
	inc hl
	inc hl
	jr .loop

RuinsF1PitTable:
	ruins_pit EVENT_RUINS_F1_TRAP_1, 8, 4, 0
	ruins_pit EVENT_RUINS_F1_TRAP_2, 8, 5, 0
	ruins_pit EVENT_RUINS_F1_TRAP_3, 6, 14, 0
	ruins_pit EVENT_RUINS_F1_TRAP_4, 6, 15, 0
	ruins_pit EVENT_RUINS_F1_TRAP_5, 11, 28, 0
	ruins_pit EVENT_RUINS_F1_TRAP_6, 10, 28, 0
	ruins_pit EVENT_RUINS_F1_TRAP_7, 8, 37, FACE_RIGHT
	ruins_pit EVENT_RUINS_F1_TRAP_8, 12, 36, FACE_LEFT
	ruins_pit EVENT_RUINS_F1_TRAP_9, 16, 37, FACE_RIGHT
	ruins_pit EVENT_RUINS_F1_TRAP_10, 20, 36, FACE_LEFT
	ruins_pit EVENT_RUINS_F1_TRAP_11, 28, 37, FACE_RIGHT
	ruins_pit EVENT_RUINS_F1_TRAP_12, 29, 37, FACE_DOWN | FACE_RIGHT
	ruins_pit EVENT_RUINS_F1_TRAP_13, 27, 8, 0
	ruins_pit EVENT_RUINS_F1_TRAP_14, 26, 8, 0
	ruins_pit EVENT_RUINS_F1_TRAP_15, 25, 8, 0
	ruins_pit EVENT_RUINS_F1_TRAP_16, 25, 7, 0
	ruins_pit EVENT_RUINS_F1_TRAP_17, 25, 6, 0
	ruins_pit EVENT_RUINS_F1_TRAP_18, 26, 6, 0
	ruins_pit EVENT_RUINS_F1_TRAP_19, 27, 6, 0
	ruins_pit EVENT_RUINS_F1_TRAP_20, 27, 7, 0
	db -1, -1, -1, -1

RuinsF1Arrow:
	ctxt "This arrow smells"
	line "poisonous."

	para "Better not touch"
	line "it."
	done

RuinsF1ClearArrow:
	disappear 5
	setevent EVENT_0
	end

RuinsF1MurumSwitch:
	opentext
	checkevent EVENT_MURUM_SWITCH
	sif true
		jumptext RuinsSwitchAlreadyOffText
	writetext .switch_on_text
	yesorno
	sif false
		closetextend
	playsound SFX_ENTER_DOOR
	setevent EVENT_MURUM_SWITCH
	jumptext RuinsSwitchTurnedOffText

.switch_on_text
	ctxt "The switch is on"
	line "and labeled Murum."

	para "Turn it off?"
	done

RuinsSwitchAlreadyOffText:
	ctxt "The switch is"
	line "already off."
	done

RuinsSwitchTurnedOffText:
	ctxt "Turned the switch"
	line "off."
	done

Ruins_TryJump:
	checkevent EVENT_JUMPING_SHOES
	sif false
		end
Ruins_DoJump:
	playsound SFX_JUMP_OVER_LEDGE
	checkcode VAR_FACING
	sif >, 3
		writebyte 0
	multiplyvar 2
	addhalfwordtovar .movements
	applymovement PLAYER, -1
	end

.movements
	jump_step_down
	step_end

	jump_step_up
	step_end

	jump_step_left
	step_end

	jump_step_right
	step_end

RuinsF1_TriggeredTrap:
	setevent EVENT_1
RuinsF1SetTraps:
	varblocks .trap_blocks
	checkevent EVENT_2
	sif false, then
		setevent EVENT_2
		return
	sendif
	playsound SFX_ENTER_DOOR
	callasm AnchorBGMap
	callasm BGMapAnchorTopLeft
	showemote EMOTE_SHOCK, PLAYER, 32
	applymovement PLAYER, .from_movement
	random 16
	sif =, 15
		writebyte 0
	sif >, 10
		addvar -11
	loadarray .coordinates, 2
	cmdwitharrayargs
		db warp_command, %110
		map RUINS_B1F
		db 0, 1
	endcmdwitharrayargs
	playsound SFX_BALL_POOF
	applymovement PLAYER, .to_movement
	playsound SFX_STRENGTH
	earthquake 24
	closetextend

.from_movement
	hide_person
	step_end

.to_movement
	show_person
	skyfall
	step_end

.coordinates
	db  9,  8
	db  8,  9
	db 15, 10
	db 14,  9
	db  4, 10
	db  5,  8
	db 10,  5
	db  8,  4
	db 11, 15
	db  8, 14
	db  8,  8

.trap_blocks
	db 12
	varblock1 36,  8, EVENT_RUINS_F1_TRAP_7,  $01, $34
	varblock1 36, 12, EVENT_RUINS_F1_TRAP_8,  $01, $33
	varblock1 36, 16, EVENT_RUINS_F1_TRAP_9,  $01, $34
	varblock1 36, 20, EVENT_RUINS_F1_TRAP_10, $01, $33
	varblock1  8, 24, EVENT_RUINS_F1_TRAP_15, $01, $35
	varblock2  4,  8, EVENT_RUINS_F1_TRAP_1,  EVENT_RUINS_F1_TRAP_2,  $2b, $45, $44, $43
	varblock2 14,  6, EVENT_RUINS_F1_TRAP_3,  EVENT_RUINS_F1_TRAP_4,  $2b, $45, $44, $43
	varblock2 28, 10, EVENT_RUINS_F1_TRAP_5,  EVENT_RUINS_F1_TRAP_6,  $2f, $46, $47, $42
	varblock2 36, 28, EVENT_RUINS_F1_TRAP_11, EVENT_RUINS_F1_TRAP_12, $01, $36, $34, $3b
	varblock2  8, 26, EVENT_RUINS_F1_TRAP_13, EVENT_RUINS_F1_TRAP_14, $01, $33, $35, $38
	varblock2  6, 24, EVENT_RUINS_F1_TRAP_16, EVENT_RUINS_F1_TRAP_17, $01, $35, $36, $3c
	varblock3  6, 26, EVENT_RUINS_F1_TRAP_18, EVENT_RUINS_F1_TRAP_19, EVENT_RUINS_F1_TRAP_20, $01, $36, $35, $3c, $33, $39, $38, $3f

RuinsF1TelumTrap:
	checkevent EVENT_TELUM_SWITCH
	sif true
		end
	checkevent EVENT_0
	sif false
		end
	playsound SFX_VICEGRIP
	appear 5
	applymovement 5, .movement
	end

.movement
	fast_slide_step_left
	fast_slide_step_left
	step_end

RuinsF1_PaletteYellow:
	trainer EVENT_RUINS_F1_YELLOW_PATROLLER, PATROLLER, 5, .before_battle_text, .battle_won_text

	ctxt "Please stop."

	para "If we find the"
	line "stone turtle, we"
	para "can steal its orb"
	line "and harness the"
	cont "orb's energy."

	para "With that, we can"
	line "make any #mon"
	cont "even stronger!"
	done

.before_battle_text
	ctxt "We're down to two,"
	line "but we're not going"
	cont "to stop!"

	para "We've developed a"
	line "strong partnership"
	para "that'll make Green"
	line "and me rich!"
	done

.battle_won_text
	ctxt "That shouldn't have"
	line "happened again<...>"
	done

RuinsF1_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $1f, $12, 3, RUINS_OUTSIDE
	warp_def $1f, $13, 6, RUINS_OUTSIDE
	warp_def $1d, $3, 17, RUINS_B1F
	warp_def $9, $b, 1, RUINS_F2

	;xy triggers
	db 2
	xy_trigger 0, $6, $24, RuinsF1TelumTrap
	xy_trigger 0, $b, $24, RuinsF1ClearArrow

	;signposts
	db 1
	signpost 1, 31, SIGNPOST_READ, RuinsF1MurumSwitch

	;people-events
	db 5
	person_event SPRITE_P0, -3, -3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_RUINS_F1_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 2, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, RED_JEWEL, EVENT_RUINS_F1_ITEM_RED_JEWEL
	person_event SPRITE_PALETTE_PATROLLER, 22, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 2, RuinsF1_PaletteYellow, EVENT_RUINS_F1_YELLOW_PATROLLER
	person_event SPRITE_FAMICOM, 5, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXT, 0, RuinsF1Arrow, EVENT_0
	person_event SPRITE_POKE_BALL, 14, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DRAGONBREATH, 0, EVENT_GET_TM24
