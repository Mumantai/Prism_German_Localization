PrisonF2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PrisonF2_Movement_Down4:
	step_down
PrisonF2_Movement_Down3:
	step_down
PrisonF2_Movement_Down2:
	step_down
PrisonF2_Movement_Down:
	step_down
	step_end

PrisonF2_Movement_Left2:
	step_left
PrisonF2_Movement_Left:
	step_left
	step_end

PrisonF2_Movement_Right:
	step_right
	step_end

PrisonF2GuardTrap1:
	faceperson PLAYER, 3
	faceperson 3, PLAYER
PrisonF2_PrintMessageAndWarp:
	opentext
	writetext PrisonF2GuardTrap_Text_BeforeWarping
PrisonF2_WarpToBelowFloor:
	warp PRISON_F1, 20, 3
	closetextend

PrisonF2GuardTrap2A:
	spriteface 4, DOWN
	selse

PrisonF2GuardTrap2F:
	spriteface 4, LEFT
	selse

PrisonF2GuardTrap2G:
	spriteface 4, RIGHT

	sendif
	faceperson PLAYER, 4
	faceperson 4, PLAYER
	jump PrisonF2_PrintMessageAndWarp

PrisonF2GuardTrap2B:
	writehalfword PrisonF2_Movement_Down
	selse

PrisonF2GuardTrap2C:
	writehalfword PrisonF2_Movement_Down2
	selse

PrisonF2GuardTrap2D:
	writehalfword PrisonF2_Movement_Down3
	selse

PrisonF2GuardTrap2E:
	writehalfword PrisonF2_Movement_Down4

	sendif
	faceperson PLAYER, 4
	faceperson 4, PLAYER
	showtext PrisonF2GuardTrap_Text_BeforeWarping
	applymovement 4, -1
	jump PrisonF2_WarpToBelowFloor

PrisonF2GuardTrap3A:
	faceperson PLAYER, 5
	faceperson 5, PLAYER
	jump PrisonF2_PrintMessageAndWarp

PrisonF2Guard3:
PrisonF2GuardTrap3B:
	faceperson PLAYER, 5
	faceperson 5, PLAYER
	showtext PrisonF2GuardTrap_Text_BeforeWarping
	applymovement 5, PrisonF2_Movement_Right
	jump PrisonF2_WarpToBelowFloor

PrisonF2GuardTrap4A:
	writehalfword PrisonF2_Movement_Left2
	selse

PrisonF2GuardTrap4B:
	writehalfword PrisonF2_Movement_Left

	sendif
	faceperson PLAYER, 6
	faceperson 6, PLAYER
	showtext PrisonF2GuardTrap_Text_BeforeWarping
	applymovement 6, -1
	jump PrisonF2_WarpToBelowFloor

PrisonF2GuardTrap4C:
	faceperson PLAYER, 6
	faceperson 6, PLAYER
	jump PrisonF2_PrintMessageAndWarp

PrisonF2GuardTrap5A:
	faceperson PLAYER, 7
	faceperson 7, PLAYER
	showtext PrisonF2GuardTrap_Text_BeforeWarping
	applymovement 7, PrisonF2_Movement_Left
	jump PrisonF2_WarpToBelowFloor

PrisonF2GuardTrap5B:
	spriteface 7, LEFT
	selse

PrisonF2GuardTrap5C:
	spriteface 7, UP
	selse

PrisonF2GuardTrap5D:
	spriteface 7, DOWN

	sendif
	faceperson PLAYER, 7
	faceperson 7, PLAYER
	jump PrisonF2_PrintMessageAndWarp

PrisonF2Guard1:
PrisonF2Guard2:
PrisonF2Guard4:
PrisonF2Guard5:
	faceplayer
	opentext
	writetext PrisonF2GuardTrap_Text_BeforeWarping
	jump PrisonF2_WarpToBelowFloor

PrisonF2GuardTrap_Text_BeforeWarping:
	ctxt "HALT!"

	para "You're not allowed"
	line "up here."
	sdone

PrisonF2RoofCardGuard:
	faceplayer
	opentext
	checkitem ROOF_CARD
	sif false
		jumptext .need_roof_card_text
	setevent EVENT_PRISON_F2_ROOF_CARD_GUARD
	writetext .got_roof_card_text
	closetext
	applymovement 8, .movement
	disappear 8
	end

.movement
	return_dig 32
	step_end

.need_roof_card_text
	ctxt "No one's allowed"
	line "up here without a"
	cont "special Roof Card."
	done

.got_roof_card_text
	ctxt "Well, it looks"
	line "like you have the"
	para "Roof Card, so I"
	line "guess I'll let"
	cont "you in."
	sdone

PrisonF2_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 9, 37, 6, PRISON_F1
	warp_def 32, 31, 1, PRISON_ROOF
	warp_def 16, 0, 1, PRISON_ELECTRIC_CHAIR
	warp_def 17, 0, 2, PRISON_ELECTRIC_CHAIR
	warp_def 20, 39, 1, PRISON_CAFETERIA
	warp_def 21, 39, 2, PRISON_CAFETERIA

.CoordEvents: db 23
	xy_trigger 0, 2, 15, PrisonF2GuardTrap1
	xy_trigger 0, 3, 14, PrisonF2GuardTrap1
	xy_trigger 0, 3, 16, PrisonF2GuardTrap1
	xy_trigger 0, 13, 5, PrisonF2GuardTrap2A
	xy_trigger 0, 14, 5, PrisonF2GuardTrap2B
	xy_trigger 0, 15, 5, PrisonF2GuardTrap2C
	xy_trigger 0, 16, 5, PrisonF2GuardTrap2D
	xy_trigger 0, 17, 5, PrisonF2GuardTrap2E
	xy_trigger 0, 12, 4, PrisonF2GuardTrap2F
	xy_trigger 0, 12, 6, PrisonF2GuardTrap2G
	xy_trigger 0, 19, 37, PrisonF2GuardTrap3A
	xy_trigger 0, 19, 38, PrisonF2GuardTrap3B
	xy_trigger 0, 18, 36, PrisonF2GuardTrap3A
	xy_trigger 0, 20, 36, PrisonF2GuardTrap3A
	xy_trigger 0, 23, 30, PrisonF2GuardTrap4A
	xy_trigger 0, 23, 31, PrisonF2GuardTrap4B
	xy_trigger 0, 23, 32, PrisonF2GuardTrap4C
	xy_trigger 0, 22, 33, PrisonF2GuardTrap4C
	xy_trigger 0, 24, 33, PrisonF2GuardTrap4C
	xy_trigger 0, 7, 1, PrisonF2GuardTrap5A
	xy_trigger 0, 7, 2, PrisonF2GuardTrap5B
	xy_trigger 0, 6, 3, PrisonF2GuardTrap5C
	xy_trigger 0, 8, 3, PrisonF2GuardTrap5D

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 2, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_EXPLOSION, 0, EVENT_PRISON_F2_TM
	person_event SPRITE_OFFICER, 3, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonF2Guard1, -1
	person_event SPRITE_OFFICER, 12, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonF2Guard2, -1
	person_event SPRITE_OFFICER, 19, 36, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonF2Guard3, -1
	person_event SPRITE_OFFICER, 23, 33, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonF2Guard4, -1
	person_event SPRITE_OFFICER, 7, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonF2Guard5, -1
	person_event SPRITE_OFFICER, 30, 32, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PrisonF2RoofCardGuard, EVENT_PRISON_F2_ROOF_CARD_GUARD
