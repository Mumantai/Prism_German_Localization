RuinsF2_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, RuinsF2_TriggeredTrap

RuinsF2Blocks:
	clearevent EVENT_6
	jump RuinsF2_TriggeredTrap

RuinsF2TelumTrap:
	checkevent EVENT_TELUM_SWITCH
	sif true
		end
	checkevent EVENT_0
	sif false
		end
	playsound SFX_VICEGRIP
	appear 4
	clearevent EVENT_0
	applymovement 4, .movement
	end

.movement
	fast_slide_step_right
	fast_slide_step_right
	step_end

RuinsF2ClearArrow:
	disappear 4
	setevent EVENT_0
	end

RuinsF2Arrow:
	farjumptext RuinsF1Arrow

RuinsF2Trap1:
	setevent EVENT_RUINS_F2_TRAP_1
	setevent EVENT_1
	jump RuinsF2_TriggeredTrap

RuinsF2Trap2:
	setevent EVENT_RUINS_F2_TRAP_2
	setevent EVENT_2
	jump RuinsF2_TriggeredTrap

RuinsF2Trap3:
	setevent EVENT_RUINS_F2_TRAP_3
	setevent EVENT_3
	jump RuinsF2_TriggeredTrap

RuinsF2Trap4:
	setevent EVENT_RUINS_F2_TRAP_4
	setevent EVENT_4
	;fallthrough

RuinsF2_TriggeredTrap:
	varblocks .trap_blocks
	changeblock 26, 4, $1
	checkevent EVENT_6
	sif true, then
		changeblock 12, 14, $35
		jump RuinsF2CheckFall
	selse
		setevent EVENT_6
	sendif
	return

.trap_blocks
	db 3
	varblock1  2,  4, EVENT_RUINS_F2_TRAP_1, $01, $33
	varblock1 12, 14, EVENT_RUINS_F2_TRAP_2, $01, $35
	varblock2 24, 16, EVENT_RUINS_F2_TRAP_3, EVENT_RUINS_F2_TRAP_4, $01, $35, $33, $38

RuinsF2CheckFall:
	writebyte 0
.loop
	loadarray .traps
	pushvar
	readarrayhalfword 2
	checkevent -1
	sif false, then
		popvar
		addvar 1
		if_less_than 4, .loop
		return
	sendif
	clearevent -1
	playsound SFX_ENTER_DOOR
	callasm AnchorBGMap
	callasm BGMapAnchorTopLeft
	showemote EMOTE_SHOCK, PLAYER, 32
	applymovement PLAYER, .movement_from
	popvar
	cmdwitharrayargs
		db warp_command, %110
		map RUINS_F1
		db 0, 1
	endcmdwitharrayargs
	playsound SFX_BALL_POOF
	applymovement PLAYER, .movement_to
	playsound SFX_STRENGTH
	earthquake 24
	closetextend

.traps
	dbbw  3,  3, EVENT_1
.trapsEntrySizeEnd
	dbbw 23, 14, EVENT_2
	dbbw 36, 17, EVENT_3
	dbbw 36, 18, EVENT_4

.movement_from
	hide_person
	step_end

.movement_to
	show_person
	skyfall
	step_end

RuinsF2_TryJump1:
	checkevent EVENT_RUINS_F2_TRAP_3
RuinsF2_AfterTryJump:
	sif false
		end
	farjump Ruins_TryJump

RuinsF2_TryJump2:
	checkevent EVENT_RUINS_F2_TRAP_4
	jump RuinsF2_AfterTryJump

RuinsF2_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $b, $13, 4, RUINS_F1
	warp_def $13, $5, 1, RUINS_F3

	;xy triggers
	db 6
	xy_trigger 0, $4, $2, RuinsF2Trap1
	xy_trigger 0, $f, $c, RuinsF2Trap2
	xy_trigger 0, $10, $18, RuinsF2Trap3
	xy_trigger 0, $11, $18, RuinsF2Trap4
	xy_trigger 0, $a, $5, RuinsF2ClearArrow
	xy_trigger 0, $6, $3, RuinsF2TelumTrap

	;signposts
	db 2
	signpost 16, 24, SIGNPOST_READ, RuinsF2_TryJump1
	signpost 17, 24, SIGNPOST_READ, RuinsF2_TryJump2

	;people-events
	db 3
	person_event SPRITE_POKE_BALL, 17, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, GAS_MASK, EVENT_RUINS_F2_ITEM_GAS_MASK
	person_event SPRITE_POKE_BALL, 9, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BLUE_JEWEL, EVENT_RUINS_F2_ITEM_BLUE_JEWEL
	person_event SPRITE_SNES, 5, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RuinsF2Arrow, EVENT_0
