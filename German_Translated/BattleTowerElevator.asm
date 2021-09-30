BattleTowerElevator_MapScriptHeader:
	; triggers
	db 2
	maptrigger .do_elevator_script
	maptrigger GenericDummyScript

	; callbacks
	db 0

.do_elevator_script
	priorityjump BattleTowerElevator_Script
	end

BattleTowerElevator_Script:
	follow 2, PLAYER
	applymovement 2, .movement_receptionist_enter
	stopfollow
	spriteface PLAYER, DOWN
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	follow 2, PLAYER
	applymovement 2, BattleTowerMovement_PlayerStepsDown
	stopfollow
	disappear 2
	warpsound
	applymovement PLAYER, BattleTowerMovement_PlayerStepsDown
	dotrigger 1
	warpsound
	warp BATTLE_TOWER_HALLWAY, 6, 0
	end

.movement_receptionist_enter
	step_right
	turn_head_down
	step_end

BattleTowerMovement_PlayerStepsDown:
	step_down
	step_end

BattleTowerElevator_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 3, 1, 3, BATTLE_TOWER_ENTRANCE
	warp_def 3, 2, 1, BATTLE_TOWER_HALLWAY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_RECEPTIONIST, 2, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
