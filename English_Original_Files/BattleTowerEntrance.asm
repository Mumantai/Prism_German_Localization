BattleTowerEntrance_MapScriptHeader:
; triggers
	db 5
	maptrigger GenericDummyScript
	maptrigger .resume_trigger
	maptrigger .abort_trigger
	maptrigger .reward_trigger
	maptrigger .finished_trigger

; callbacks
	db 1
	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_BATTLE_TOWER
	return

.abort_trigger
	priorityjump .abort_script
	end

.resume_trigger
	priorityjump .resume_script
	end

.reward_trigger
	priorityjump .reward_script
	end

.finished_trigger
	priorityjump BattleTower_AbortedOrFinishedBattleTower
	end

.abort_script
	spriteface PLAYER, UP
	opentext
	writetext .abort_text
	callasm BattleTower_ResetWinStreak
	jump BattleTower_AbortedOrFinishedBattleTower

.abort_text
	ctxt "I'm sorry."

	para "You did not save"
	line "before ending your"
	cont "last challenge."

	para "Because of this,"
	line "your progress has"
	cont "been lost."

	para "We will now save"
	line "the game."
	done

.resume_script
	spriteface PLAYER, UP
	opentext
	writetext .resume_text
	callasm BattleTower_LoadChallengeData
	dotrigger 2
	writebyte 1
	callasm SetBattleTowerChallengeState
	callasm SaveGameData
	playwaitsfx SFX_SAVE
	jump BattleTowerReceptionistScript_GoToBattleRoom

.resume_text
	ctxt "Welcome back!"

	para "Before we resume,"
	line "we must save the"
	cont "game."
	done

.reward_normal_text:
	ctxt "Congratulations!"

	para "For beating all"
	line "seven Trainers,"
	cont "you win BP!"

	para "<PLAYER> received"
	line "3 BP!"
	done

.reward_tycoon_text:
	ctxt "Congratulations!"

	para "For beating all"
	line "seven Trainers<...>"

	para "And for your"
	line "amazing fight with"
	cont "our Tycoon<...>"

	para "We hereby award"
	line "you these BP!"

	para "<PLAYER> received"
	line "20 BP!"
	done

.reward_script
	spriteface PLAYER, UP
	opentext
	callasm BattleTower_CheckDefeatedTycoon
	sif false, then
		writetext .reward_normal_text
		playwaitsfx SFX_2ND_PLACE
		writebyte 3
		callasm BattleTower_GiveBattlePoints
	selse
		callasm BattleTower_IncrementTycoonWinCounter
		writetext .reward_tycoon_text
		playwaitsfx SFX_1ST_PLACE
		writebyte 20
		callasm BattleTower_GiveBattlePoints
	sendif

; fallthrough

BattleTower_AbortedOrFinishedBattleTower:
	opentext
	callasm RestorePartyAfterBattleTower
	domaptrigger BATTLE_TOWER_BATTLE_ROOM, 0
	dotrigger 0
	writebyte 0
	callasm SetBattleTowerChallengeState
	callasm SaveGameData
	playwaitsfx SFX_SAVE
	jump BattleTowerReceptionistScript_Cancel

BattleTower_GiveBattlePoints:
	ldh a, [hScriptVar]
	ldh [hMoneyTemp + 1], a
	xor a
	ldh [hMoneyTemp], a
	ld bc, hMoneyTemp
	jpba GiveBattlePoints

BattleTower_IncrementTycoonWinCounter:
	ld hl, wTowerTycoonsDefeated
	inc [hl]
	ret nz
	inc hl
	inc [hl]
	ret nz
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret

SetBattleTowerChallengeState:
	sbk BANK(sBattleTowerChallengeState)
	ldh a, [hScriptVar]
	ld [sBattleTowerChallengeState], a
	jp CloseSRAM

BattleTowerReceptionistScript:
	faceplayer
	opentext
	writetext .welcome_text
	checkevent EVENT_BATTLE_TOWER_INTRO
	sif false, then
		setevent EVENT_BATTLE_TOWER_INTRO
.play_intro
		writetext .intro_text
	sendif
	writetext .ask_start_challenge_text
	menuanonjumptable .menu
	dw BattleTowerReceptionistScript_Cancel
	dw BattleTowerReceptionistScript_Continue
	dw .play_intro
IF DEF(DEBUG_MODE)
	dw .DEBUG
ELSE
	dw BattleTowerReceptionistScript_Cancel
ENDC

.DEBUG
	callasm BattleTower_InitChallenge
	callasm BattleTower_DebugTeam
	jump BattleTowerReceptionistScript_AskSave

.menu
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 14 ; end coords
	dw .options
	db 1 ; default option

.options
	db $a0 ; flags
	db 3
	db "Challenge@"
	db "Explanation@"
IF DEF(DEBUG_MODE)
	db "DEBUG @" ;trailing space so there are no shifts between debug and release
ELSE
	db "Cancel@"
ENDC

.welcome_text
	ctxt "Welcome to the"
	line "Battle Tower!"
	prompt

.intro_text
	ctxt "Here you can"
	line "participate in a"
	para "series of conse-"
	line "cutive battles."

	para "When you enter,"
	line "you will face 7"
	cont "Trainers in a row."

	para "Beat all of them"
	line "to continue your"
	cont "winning streak!"

	para "Lose, and your"
	line "streak is over."

	para "If you defeat"
	line "enough Trainers,"
	para "you may draw the"
	line "attention of our"
	cont "Chief!"
	prompt

.ask_start_challenge_text
	ctxt "Would you like to"
	line "start a challenge?"
	done

BattleTowerReceptionistScript_Continue:
	; Do you have at least 3 Pokemon?
	checkcode VAR_PARTYCOUNT
	sif <, 3, then
		writetext BattleTower_NotEnoughPokemonText
		jump BattleTowerReceptionistScript_WaitCancel
	sendif

	; Do you have at least 3 Pokemon that are legal?
	callasm BattleTower_InitChallenge
	writetext BattleTower_ChooseStrengthText

	; Choose either level 50 or open level
	loadmenudata BattleTower_LevelSetMenu
	verticalmenu
	closewindow
	iffalse BattleTowerReceptionistScript_Cancel
	if_equal 3, BattleTowerReceptionistScript_Cancel

	; Do you have enough Pokemon that can participate?
	callasm BattleTower_SetLevelGroup
	callasm CheckAtLeastThreeLegalPokemon
	sif <, 3, then
		writetext BattleTower_NotEnoughPokemonLevelText
		jump BattleTowerReceptionistScript_WaitCancel
	sendif

	; Party menu select
	writetext BattleTower_SelectThreePokemonText
	callasm BattleTower_LegalityCheck
	callasm ChooseThreePartyMonsForBattle
	iffalse BattleTowerReceptionistScript_Cancel
	writetext BattleTower_SaveBeforeText
	yesorno
	iffalse BattleTowerReceptionistScript_Cancel
	callasm BattleTower_SaveGame
	sif false, then
		dotrigger 0
		jump BattleTowerReceptionistScript_Cancel
	sendif
	callasm SetBattleTowerParty

BattleTowerReceptionistScript_AskSave:
	dotrigger 2
	callasm BattleTower_SaveChallengeData
	callasm SaveTheGame

BattleTowerReceptionistScript_GoToBattleRoom:
	domaptrigger BATTLE_TOWER_BATTLE_ROOM, 1
	domaptrigger BATTLE_TOWER_HALLWAY, 0
	domaptrigger BATTLE_TOWER_ELEVATOR, 0
	writetext .follow_me_text
	closetext
	follow 2, PLAYER
	applymovement 2, BattleTowerMovement_ReceptionistWalksUp
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear 2
	applymovement PLAYER, BattleTowerMovement_PlayerStepsUp
	warpcheck
	end

.follow_me_text
	ctxt "Please follow me."
	sdone

BattleTowerMovement_ReceptionistWalksUp:
	step_up
	step_up
	step_up
BattleTowerMovement_PlayerStepsUp:
	step_up
	step_end

BattleTower_LevelSetMenu:
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 14 ; end coords
	dw .options
	db 1 ; default option

.options
	db $a0 ; flags
	db 3
	db "Level 50@"
	db "Open Level@"
	db "Cancel@"

BattleTower_NotEnoughPokemonText:
	ctxt "I'm sorry."

	para "You need at least"
	line "3 #mon in"
	para "order to"
	line "participate."

	para "Eggs and legendary"
	line "#mon are not"
	cont "permitted."
	done

BattleTower_ChooseStrengthText:
	ctxt "Which room do you"
	line "wish to challenge?"
	done

BattleTower_NotEnoughPokemonLevelText:
	ctxt "I'm sorry."

	para "You do not have"
	line "enough #mon"
	para "which are at or"
	line "below the selected"
	cont "level."

	para "You need at least"
	line "3 #mon in"
	para "order to"
	line "participate."

	para "Eggs and legendary"
	line "#mon are not"
	cont "permitted."
	done

BattleTower_SelectThreePokemonText:
	ctxt "Please select 3"
	line "#mon."
	sdone

BattleTower_SaveBeforeText:
	ctxt "Before you begin,"
	line "we must save the"
	cont "game. Is that OK?"
	done

BattleTowerReceptionistScript_WaitCancel:
	pause 30
BattleTowerReceptionistScript_Cancel:
	jumptext .text

.text
	ctxt "We hope to see you"
	line "again!"
	sdone

BattleTower_LegalityCheck:
	ld hl, wPartyCount
	ld a, [hli]
	ld c, a
	ld b, 0
.loop
	ld a, [hli]
	callba BattleTower_IsCurSpeciesLegal
	ccf
	rr b
	dec c
	jr nz, .loop
	ld a, [wPartyCount]
	; a = 8 - a
	cpl
	add 8 + 1
.bitShiftLoop
	srl b
	dec a
	jr nz, .bitShiftLoop
	ld a, b
	ld [wBattleTowerLegalPokemonFlags], a
	ret

BattleTowerEntrance_Lass:
	ctxt "Alright! My"
	line "Azumarill and I"
	para "are gonna roll"
	line "over the"
	cont "competition!"

	para "With its cute"
	line "looks, we'll be"
	cont "unstoppable!"

	para "<...> <...> <...> Huh?"
	line "This isn't a"
	cont "Contest Hall?"
	done

BattleTowerEntrance_CooltrainerM:
	ctxt "They finally put"
	line "a PC here."

	para "Before, you had to"
	line "go all the way"
	cont "back to Phacelia"
	para "just to change"
	line "teams around!"
	done

BattleTowerEntrance_CooltrainerF:
	ctxt "There's a Battle"
	line "Tower in Olivine"
	cont "City, too."

	para "They don't allow"
	line "#mon stronger"
	cont "than level 40."

	para "What a joke! How"
	line "are you supposed"
	para "to win if you can't"
	line "use your strongest"
	cont "#mon?"
	done

BattleTowerEntrance_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def 7, 3, 3, ROUTE_71_EAST
	warp_def 7, 4, 3, ROUTE_71_EAST
	warp_def 0, 3, 1, BATTLE_TOWER_ELEVATOR

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 5
	person_event SPRITE_RECEPTIONIST, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BattleTowerReceptionistScript, -1
	person_event SPRITE_LASS, 5, 0, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, BattleTowerEntrance_Lass, -1
	person_event SPRITE_COOLTRAINER_M, 7, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, BattleTowerEntrance_CooltrainerM, -1
	person_event SPRITE_COOLTRAINER_F, 6, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, BattleTowerEntrance_CooltrainerF, -1
	person_event SPRITE_RECEPTIONIST, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_BATTLETOWER, 0, -1
