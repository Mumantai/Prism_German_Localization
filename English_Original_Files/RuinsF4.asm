RuinsF4_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, RuinsF4SetTraps

RuinsF4GasTrap:
	checkitem GAS_MASK
	sif true
		end
	showtext .text
	applymovement PLAYER, .step_back
	end

.step_back
	step_right
	step_end

.text
	ctxt "This room smells"
	line "very toxic."

	para "It's too hard to"
	line "breathe up here."
	sdone

RuinsF4TelumSwitch:
	opentext
	checkevent EVENT_TELUM_SWITCH
	sif true
		farjumptext RuinsSwitchAlreadyOffText
	writetext .switch_is_on_text
	yesorno
	sif false
		closetextend
	playsound SFX_ENTER_DOOR
	setevent EVENT_TELUM_SWITCH
	farjumptext RuinsSwitchTurnedOffText

.switch_is_on_text
	ctxt "The switch is on"
	line "and labeled"
	cont "Telum."

	para "Turn it off?"
	done

RuinsF4Trap1:
	setevent EVENT_RUINS_F4_TRAP_1
	setevent EVENT_1
	jump RuinsF4_Jump

RuinsF4Trap2:
	setevent EVENT_RUINS_F4_TRAP_2
	setevent EVENT_2
	jump RuinsF4_Jump

RuinsF4Hole4:
	checkcode VAR_FACING
	sif false ;sif =, DOWN
		end
	checkevent EVENT_RUINS_F4_TRAP_4
	sif false
		end
	scall RuinsF4_Jump
RuinsF4Trap3:
	setevent EVENT_RUINS_F4_TRAP_3
	setevent EVENT_3
	jump RuinsF4SetTraps

RuinsF4Hole3:
	checkcode VAR_FACING
	sif false ;sif =, DOWN
		end
	checkevent EVENT_RUINS_F4_TRAP_3
	sif false
		end
	scall RuinsF4_Jump
RuinsF4Trap4:
	setevent EVENT_RUINS_F4_TRAP_4
	setevent EVENT_4
	jump RuinsF4SetTraps

RuinsF4Trap5:
	setevent EVENT_RUINS_F4_TRAP_5
	setevent EVENT_5
	jump RuinsF4SetTraps

RuinsF4Trap6:
	setevent EVENT_RUINS_F4_TRAP_6
	setevent EVENT_6
	jump RuinsF4SetTraps

RuinsF4Hole1:
	checkcode VAR_FACING
	sif =, LEFT
		end
	checkevent EVENT_RUINS_F4_TRAP_5
	sif false
		end
	jump RuinsF4_Jump

RuinsF4Hole2:
	checkcode VAR_FACING
	sif =, RIGHT
		end
	checkevent EVENT_RUINS_F4_TRAP_6
	sif false
		end
RuinsF4_Jump:
	farjump Ruins_DoJump

RuinsF4SetTraps:
	varblocks .trap_blocks
	writebyte 0
.loop
	loadarray .traps
	pushvar
	readarrayhalfword 2
	checkevent -1
	sif false, then
		popvar
		addvar 1
		if_less_than 6, .loop
		return
	sendif
	clearevent -1
	playsound SFX_ENTER_DOOR
	callasm AnchorBGMap
	callasm BGMapAnchorTopLeft
	showemote EMOTE_SHOCK, PLAYER, 32
	applymovement PLAYER, .hide_falling_person
	popvar
	cmdwitharrayargs
		db warp_command, %110
		map RUINS_F3
		db 0, 1
	endcmdwitharrayargs
	playsound SFX_BALL_POOF
	applymovement PLAYER, .show_falling_person
	playsound SFX_STRENGTH
	earthquake 24
	closetextend

.traps
	dbbw 17, 12, EVENT_1
.trapsEntrySizeEnd
	dbbw 17, 13, EVENT_2
	dbbw 20, 13, EVENT_3
	dbbw 21, 13, EVENT_4
	dbbw 12, 18, EVENT_5
	dbbw 19, 13, EVENT_6

.trap_blocks
	db 3
	varblock2 12,  6, EVENT_RUINS_F4_TRAP_1, EVENT_RUINS_F4_TRAP_2, $01, $35, $33, $38
	varblock2 12, 10, EVENT_RUINS_F4_TRAP_3, EVENT_RUINS_F4_TRAP_4, $2b, $45, $44, $43
	varblock2  8, 12, EVENT_RUINS_F4_TRAP_5, EVENT_RUINS_F4_TRAP_6, $01, $36, $33, $39

.hide_falling_person
	hide_person
	step_end

.show_falling_person
	show_person
	skyfall
	step_end

RuinsF4_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $3, $11, 2, RUINS_F3
	warp_def $9, $f, 1, RUINS_F5

	;xy triggers
	db 5
	xy_trigger 0, $2, $e, RuinsF4GasTrap
	xy_trigger 0, $a, $c, RuinsF4Trap3
	xy_trigger 0, $a, $d, RuinsF4Trap4
	xy_trigger 0, $c, $8, RuinsF4Trap5
	xy_trigger 0, $d, $9, RuinsF4Trap6

	;signposts
	db 5
	signpost 5, 9, SIGNPOST_READ, RuinsF4TelumSwitch
	signpost 12, 8, SIGNPOST_READ, RuinsF4Hole1
	signpost 13, 9, SIGNPOST_READ, RuinsF4Hole2
	signpost 10, 12, SIGNPOST_READ, RuinsF4Hole3
	signpost 10, 13, SIGNPOST_READ, RuinsF4Hole4

	;people-events
	db 1
	person_event SPRITE_POKE_BALL, 10, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, MAX_REPEL, EVENT_RUINS_F4_ITEM_MAX_REPELS
