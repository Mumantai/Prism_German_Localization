BattleTowerHallway_MapScriptHeader:
	; triggers
	db 2
	maptrigger .walk_to_battle_room_trigger
	maptrigger GenericDummyScript

	; callbacks
	db 0

.walk_to_battle_room_trigger
	priorityjump .walk_to_battle_room_script
	end

.walk_to_battle_room_script
	applymovement PLAYER, BattleTowerMovement_PlayerStepsDown
	follow 2, PLAYER
	applymovement 2, .receptionist_movement
	stopfollow
	callasm BattleTower_CheckCurrentStreak
	sif false
		showtext .here_is_your_room_text
	applymovement PLAYER, BattleTowerMovement_PlayerStepsUp
	dotrigger 1
	warpcheck
	end

.receptionist_movement
	rept 12
		step_right
	endr
	turn_head_left
	step_end

.here_is_your_room_text
	ctxt "Here is your"
	line "Battle Room."

	para "Best of luck!"
	sdone

BattleTowerHallway_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 0, 6, 3, BATTLE_TOWER_ELEVATOR
	warp_def 0, 18, 1, BATTLE_TOWER_BATTLE_ROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_RECEPTIONIST, 1, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
