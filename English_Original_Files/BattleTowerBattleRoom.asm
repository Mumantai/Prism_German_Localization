const_value = 2
	const BATTLE_TOWER_BATTLE_ROOM_OPPONENT
	const BATTLE_TOWER_BATTLE_ROOM_RECEPTIONIST

BattleTowerBattleRoom_MapScriptHeader:
; triggers
	db 2
	maptrigger GenericDummyScript
	maptrigger .run_battle_room_script

; callbacks
	db 1
	dbw MAPCALLBACK_NEWMAP, .Callback

.run_battle_room_script
	priorityjump BattleTowerBattleRoom_Script
	end

.Callback
	disappear BATTLE_TOWER_BATTLE_ROOM_OPPONENT
	return

BattleTowerBattleRoom_Script:
	dotrigger 0
	applymovement PLAYER, .movement_player_battle_position
	callasm BattleTower_LoadChallengeData
	iftrue .notFirstBattle
	; spriteface PLAYER, LEFT
	; applymovement BATTLE_TOWER_BATTLE_ROOM_RECEPTIONIST, .movement_nurse_walks_to_player
	; opentext
	; jump .backToNextBattleMenu
.loop
	callasm BattleTower_SavePartyItems
	callasm BattleTower_LoadCurrentTeam
	playsound SFX_ENTER_DOOR
	appear BATTLE_TOWER_BATTLE_ROOM_OPPONENT
	applymovement BATTLE_TOWER_BATTLE_ROOM_OPPONENT, .movement_opponent_walks_in
	opentext
	battletowertext 1
	closetext
	domaptrigger BATTLE_TOWER_ENTRANCE, 1
	setlasttalked 3
	callasm StartBattleTowerBattle
	callasm BattleTower_RestorePartyItems
	reloadmap
	iftrue .exit_failure
	applymovement BATTLE_TOWER_BATTLE_ROOM_OPPONENT, .movement_opponent_walks_out
	playsound SFX_EXIT_BUILDING
	disappear BATTLE_TOWER_BATTLE_ROOM_OPPONENT
	callasm BattleTower_SaveChallengeData
	callasm BattleTower_CheckFought7Trainers
	iffalse .exit_victorious
	writebyte 0

.notFirstBattle
	spriteface PLAYER, LEFT
	applymovement BATTLE_TOWER_BATTLE_ROOM_RECEPTIONIST, .movement_nurse_walks_to_player
	opentext
	iftrue .backToNextBattleMenu
	writetext .heal_party_text
	special HealParty
	playwaitsfx SFX_HEAL_POKEMON
.backToNextBattleMenu
	writetext BattleTowerText_AskNextBattle
.loop_ask
	menuanonjumptable BattleTowerBeforeMatchMenuHeader
	dw .loop_ask
	dw .close_text
	dw .quicksave
	dw .close_text_exit_failure

.close_text
	closetext
	spriteface PLAYER, RIGHT
	applymovement BATTLE_TOWER_BATTLE_ROOM_RECEPTIONIST, .movement_nurse_walks_away
	jump .loop

.close_text_exit_failure
	writetext .ask_retire_text
	yesorno
	iffalse .backToNextBattleMenu
	closetext
	callasm BattleTower_RestoreWinStreak
.exit_failure
	domaptrigger BATTLE_TOWER_ENTRANCE, 4
	jump .return_to_entrance

.exit_victorious
	domaptrigger BATTLE_TOWER_ENTRANCE, 3
.return_to_entrance
	pause 20
	warpfacing UP, BATTLE_TOWER_ENTRANCE, 3, 5
	end

.quicksave
	writetext .ask_save_text
	yesorno
	iffalse .backToNextBattleMenu
	writetext .saving_text
	domaptrigger BATTLE_TOWER_ENTRANCE, 1
	writebyte 2
	scriptstartasm

.BattleTowerReset
	call SetBattleTowerChallengeState
	callba BattleTower_SaveChallengeData
	ld a, 3
	ld [wSpawnAfterChampion], a
	callba SaveGameData
	ld de, SFX_SAVE
	call PlaySFX
	ld c, 1
	call FadeToDarkestColor
	ld a, $1
	ldh [hCGBPalUpdate], a
	call DelayFrame
	call WaitSFX
	jp Reset

.movement_player_battle_position
	step_up
	step_up
	step_up
	turn_head_right
	step_end

.movement_opponent_walks_in
	step_down
	step_down
	step_down
	step_down
	turn_head_left
	step_end

.movement_opponent_walks_out
	step_up
	step_up
	step_up
	step_up
	step_end

.movement_nurse_walks_to_player
	step_right
	step_end

.movement_nurse_walks_away
	step_left
	turn_head_right
	step_end

.heal_party_text
	ctxt "We will now heal"
	line "your #mon."
	done

.ask_save_text
	ctxt "Would you like to"
	line "save and rest?"
	done

.ask_retire_text
	ctxt "Do you wish to"
	line "retire from this"
	cont "challenge?"
	done

.saving_text
	ctxt "Saving<...>"
	done

BattleTowerBeforeMatchMenuHeader:
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 11 ; end coords
	dw .menu_data
	db 1 ; default option

.menu_data ; 17d297
	db %10000001 ; flags
	db 3
	db "Continue@"
	db "Rest@"
	db "Retire@"

BattleTowerText_AskNextBattle:
	start_asm
	ldh a, [rSVBK]
	push af
	wbk BANK(wBTWinStreak)
	ld a, [wBTWinStreak]
	ld h, a
	pop af
	ldh [rSVBK], a
	ld a, h
	ld hl, .normal_opponent
	cp 20
	jr z, .tycoon
	cp 48
	ret nz
.tycoon
	ld hl, .tycoon_text
	ret

.normal_opponent
	ctxt "Opponent no. @"
	start_asm
	ldh a, [rSVBK]
	push af
	wbk BANK(wBTCurStreak)
	ld a, [wBTCurStreak]
	add "1"
	ld [bc], a
	pop af
	ldh [rSVBK], a
	call JoyTextDelay
	ld hl, .continue_text
	ret

.continue_text
	ctxt ""
	line "is up next."

	para "Are you ready?"
	done

.tycoon_text
	ctxt "Congratulations on"
	line "winning thus far!"

	para "I've just been"
	line "informed that our"
	para "esteemed Tower"
	line "Tycoon seeks an"
	cont "audience with you."

	para "Are you ready to"
	line "accept their"
	cont "challenge?"
	done

BattleTowerBattleRoom_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 7, 3, 2, BATTLE_TOWER_HALLWAY
	warp_def 7, 4, 2, BATTLE_TOWER_HALLWAY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_YOUNGSTER, 0, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_TRAINER
	person_event SPRITE_RECEPTIONIST, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
