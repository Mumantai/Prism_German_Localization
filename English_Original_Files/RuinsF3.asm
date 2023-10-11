RuinsF3_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, RuinsF3Blocks

RuinsF3Hole1:
	checkevent EVENT_RUINS_F3_TRAP_5
	sif false
		end
	checkcode VAR_FACING
	sif =, UP
		end
	jump RuinsF3_JumpHole

RuinsF3Hole2:
	checkevent EVENT_RUINS_F3_TRAP_6
	sif false
		end
	checkcode VAR_FACING
	sif false ;sif =, DOWN
		end
RuinsF3_JumpHole:
	farjump Ruins_TryJump

RuinsF3RandomBall1:
	disappear 4
	setevent EVENT_RUINS_OPENED_BALL_1
	checkevent EVENT_RUINS_RANDOM_BALL_IS_1
	jump RuinsF3_DoRandomBall

RuinsF3RandomBall2:
	disappear 5
	setevent EVENT_RUINS_OPENED_BALL_2
	checkevent EVENT_RUINS_RANDOM_BALL_IS_2
	jump RuinsF3_DoRandomBall

RuinsF3RandomBall3:
	disappear 6
	setevent EVENT_RUINS_OPENED_BALL_3
	checkevent EVENT_RUINS_RANDOM_BALL_IS_3
RuinsF3_DoRandomBall:
	sif true, then
		opentext
		giveitem BROWN_JEWEL, 1
		sif false
			jumptext .no_room_text
		writetext .got_brown_jewel_text
		playwaitsfx SFX_DEX_FANFARE_50_79
		closetextend
	sendif
	random 9
	anonjumptable
	dw .misdreavus
	dw .swablu
	dw .metang
	dw .golbat
	dw .golbat
	dw .golbat
	dw .yanma
	dw .yanma
	dw .yanma

.no_room_text
	ctxt "No room for this!"
	done

.got_brown_jewel_text
	ctxt "You found the"
	line "Brown Jewel!"
	done

.misdreavus
	switch MISDREAVUS

.swablu
	switch SWABLU

.metang
	switch METANG

.golbat
	switch GOLBAT

.yanma
	writebyte YANMA

	sendif
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon 0, 40
	startbattle
	reloadmapafterbattle
	end

RuinsF3Gap4:
	checkcode VAR_FACING
	sif =, LEFT
		end
	checkevent EVENT_RUINS_F3_TRAP_2
	sif false
		end
	checkevent EVENT_JUMPING_SHOES
	sif false
		end
	scall RuinsF3_JumpHole
RuinsF3Trap1:
	setevent EVENT_RUINS_F3_TRAP_1
	setevent EVENT_1
	jump RuinsF3_ApplyTraps

RuinsF3Gap3:
	checkcode VAR_FACING
	sif =, LEFT
		end
	checkevent EVENT_RUINS_F3_TRAP_1
	sif false
		end
	checkevent EVENT_JUMPING_SHOES
	sif false
		end
	scall RuinsF3_JumpHole
RuinsF3Trap2:
	setevent EVENT_RUINS_F3_TRAP_2
	setevent EVENT_2
	jump RuinsF3_ApplyTraps

RuinsF3Trap3:
	setevent EVENT_RUINS_F3_TRAP_3
	setevent EVENT_3
	jump RuinsF3_ApplyTraps

RuinsF3Trap4:
	setevent EVENT_RUINS_F3_TRAP_4
	setevent EVENT_4
	jump RuinsF3_ApplyTraps

RuinsF3Trap5:
	setevent EVENT_RUINS_F3_TRAP_5
	setevent EVENT_5
	jump RuinsF3_ApplyTraps

RuinsF3Trap6:
	setevent EVENT_RUINS_F3_TRAP_6
	setevent EVENT_6
	jump RuinsF3_ApplyTraps

RuinsF3Blocks:
	checkevent EVENT_RUINS_RANDOM_BALL_PICKED
	sif false
		scall RuinsF3_SelectGoodRandomBall
	checkevent EVENT_MURUM_SWITCH
	sif true
		changeblock 18, 4, 1
RuinsF3_ApplyTraps:
	setevent EVENT_0
	varblocks .trap_blocks
	changeblock 22, 16, $1
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
		map RUINS_F2
		db 0, 1
	endcmdwitharrayargs
	playsound SFX_BALL_POOF
	applymovement PLAYER, .show_falling_person
	playsound SFX_STRENGTH
	earthquake 24
	closetextend

.traps
	dbbw 19, 20, EVENT_1
.trapsEntrySizeEnd
	dbbw 19, 21, EVENT_2
	dbbw  9, 23, EVENT_3
	dbbw  9, 22, EVENT_4
	dbbw 10,  8, EVENT_5
	dbbw 12,  9, EVENT_6

.trap_blocks
	db 4
	varblock1  8,  2, EVENT_RUINS_F3_TRAP_5, $01, $33
	varblock1 10,  2, EVENT_RUINS_F3_TRAP_6, $01, $35
	varblock2 22, 14, EVENT_RUINS_F3_TRAP_1, EVENT_RUINS_F3_TRAP_2, $01, $35, $33, $38
	varblock2 10, 18, EVENT_RUINS_F3_TRAP_3, EVENT_RUINS_F3_TRAP_4, $01, $33, $35, $38

.hide_falling_person
	hide_person
	step_end

.show_falling_person
	show_person
	skyfall
	step_end

RuinsF3Gap1:
	checkevent EVENT_RUINS_F3_TRAP_4
	iftrue RuinsF3_JumpHole
	end

RuinsF3Gap2:
	checkevent EVENT_RUINS_F3_TRAP_3
	iftrue RuinsF3_JumpHole
	end

RuinsF3_SelectGoodRandomBall:
	setevent EVENT_RUINS_RANDOM_BALL_PICKED
	random 3
	anonjumptable
	dw .one
	dw .two
	dw .three

.one
	setevent EVENT_RUINS_RANDOM_BALL_IS_1
	return

.two
	setevent EVENT_RUINS_RANDOM_BALL_IS_2
	return

.three
	setevent EVENT_RUINS_RANDOM_BALL_IS_3
	return

RuinsF3_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 3, 2, RUINS_F2
	warp_def 7, 19, 1, RUINS_F4

.CoordEvents: db 6
	xy_trigger 0, 14, 22, RuinsF3Trap1
	xy_trigger 0, 15, 22, RuinsF3Trap2
	xy_trigger 0, 19, 10, RuinsF3Trap3
	xy_trigger 0, 18, 10, RuinsF3Trap4
	xy_trigger 0, 2, 8, RuinsF3Trap5
	xy_trigger 0, 3, 10, RuinsF3Trap6

.BGEvents: db 6
	signpost 2, 8, SIGNPOST_READ, RuinsF3Hole1
	signpost 3, 10, SIGNPOST_READ, RuinsF3Hole2
	signpost 18, 10, SIGNPOST_READ, RuinsF3Gap1
	signpost 19, 10, SIGNPOST_READ, RuinsF3Gap2
	signpost 14, 22, SIGNPOST_READ, RuinsF3Gap3
	signpost 15, 22, SIGNPOST_READ, RuinsF3Gap4

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 19, 23, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SANDSTORM, 0, EVENT_RUINS_F3_NPC_1
	person_event SPRITE_POKE_BALL, 18, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PEARL, EVENT_RUINS_F3_ITEM_PEARL
	person_event SPRITE_POKE_BALL, 2, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RuinsF3RandomBall1, EVENT_RUINS_OPENED_BALL_1
	person_event SPRITE_POKE_BALL, 2, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RuinsF3RandomBall2, EVENT_RUINS_OPENED_BALL_2
	person_event SPRITE_POKE_BALL, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RuinsF3RandomBall3, EVENT_RUINS_OPENED_BALL_3
