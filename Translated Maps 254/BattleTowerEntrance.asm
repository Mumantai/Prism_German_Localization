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
	ctxt "Es tut mir leid."
	para "Du hast bei deinem"
	line "letzten Besuch"
	cont "nicht gespeichert."
	para "Deshalb wurde dein"
	line "Fortschritt"
	cont "zurückgesetzt."
	para "Das Spiel wird"
	line "nun gespeichert."
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
	ctxt "Willkommen zurück!"
	para "Bevor wir starten,"
	line "sichern wir das"
	cont "Spiel."
	done

.reward_normal_text:
	ctxt "Glückwunsch!"
	para "Du hast alle 7"
	line "Trainer besiegt."
	cont "Dafür gibt es GP!"
	para "<PLAYER> erhält"
	line "3 GP!"
	done

.reward_tycoon_text:
	ctxt "Glückwunsch!"
	para "Für das Besiegen"
	line "von 7 Trainern <...>"
	para "Und für den hammer"
	line "Kampf mit unserem"
	cont "Kampfkoloss <...>"
	para "Belohnen wir dich"
	line "mit reichlich GP!"
	para "<PLAYER> erhält"
	line "20 GP!"
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
	db "Kampf@"
	db "Erklärung@"
IF DEF(DEBUG_MODE)
	db "DEBUG @" ;trailing space so there are no shifts between debug and release
ELSE
	db "Zurück@"
ENDC

.welcome_text
	ctxt "Willkommen im"
	line "Duellturm!"
	prompt

.intro_text
	ctxt "Hier kannst du an"
	line "einer Serie von"
	para "aufeinander-"
	line "folgenden Kämpfen"
	cont "teilnehmen."
	para "Du wirst dich 7"
	line "Trainern hinter-"
	cont "einander stellen."
	para "Besiege alle, um"
	line "deine Siegesserie"
	cont "fortzusetzen!"
	para "Verliere und die"
	line "Serie reißt ab."
	para "Besiegst du genü-"
	line "gend Trainer, wird"
	para "unser Leiter viel-"
	line "leicht auf dich"
	cont "aufmerksam!"
	prompt

.ask_start_challenge_text
	ctxt "Nimmst du die Her-"
	line "ausforderung an?"
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
	ctxt "Bitte folge mir."
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
	db "LV 50@"
	db "LV offen@"
	db "Zurück@"

BattleTower_NotEnoughPokemonText:
	ctxt "Entschuldigung."
	para "Du brauchst min-"
	line "destens 3 #mon,"
	para "um teilnehmen"
	line "zu können."
	para "Eier und legendäre"
	line "#mon sind"
	cont "nicht erlaubt."
	done

BattleTower_ChooseStrengthText:
	ctxt "Welchen Raum"
	line "möchtest du"
	cont "herausfordern?"
	done

BattleTower_NotEnoughPokemonLevelText:
	ctxt "Es tut mir leid."
	para "Du hast nicht"
	line "genug #mon, die"
	para "auf oder unter"
	line "dem"
	para "ausgewählten"
	line "Level sind."
	para "Du benötigst"
	line "mindestens 3"
	para "#mon, um"
	line "teilnehmen zu"
	cont "können."
	para "Eier und"
	line "legendäre #mon"
	para "sind nicht"
	line "erlaubt."
	done

BattleTower_SelectThreePokemonText:
	ctxt "Bitte wähle 3"
	line "#mon."
	sdone

BattleTower_SaveBeforeText:
	ctxt "Vor dem Start"
	line "speichern wir das"
	cont "Spiel. Okay?"
	done

BattleTowerReceptionistScript_WaitCancel:
	pause 30
BattleTowerReceptionistScript_Cancel:
	jumptext .text

.text
	ctxt "Beehren Sie uns"
	line "bald wieder!"
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
	ctxt "Mein Azumarill"
	line "und ich werden"
	para "die Gegner nur so"
	line "überrollen!"
	para "Sein süßes Äußeres"
	line "macht es wirklich"
	cont "unaufhaltbar!"
	para "<...> <...> <...> Was?"
	line "Das hier ist keine"
	cont "Wettbewerbshalle?"
	done

BattleTowerEntrance_CooltrainerM:
	ctxt "Endlich gibt es"
	line "hier einen PC."
	para "Früher musste man"
	line "den ganzen Weg bis"
	cont "nach Phacelia, nur"
	para "um sein Team zu"
	line "bearbeiten!"
	done

BattleTowerEntrance_CooltrainerF:
	ctxt "In Oliviana City"
	line "gibt es auch einen"
	cont "Duellturm."
	para "Dort erlauben sie"
	line "keine #mon"
	cont "über Level 40."
	para "Was für ein Witz!"
	line "Wie soll man bitte"
	para "ohne seine besten"
	line "#mon gewinnen?"
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