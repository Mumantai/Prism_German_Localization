BattleArcadeLobby_MapScriptHeader:

;trigger count
	db 0
;callback count
	db 0

BattleArcadeLobbyBattleNPC:
	opentext
	special PlaceMoneyTopRight
	writetext .enter_text
	menuanonjumptable .menu
	dw .come_back_later
	dw .enter
	dw .instructions
	dw .come_back_later

.instructions
	writetext .instructions_text
	yesorno
	sif false
.come_back_later
		jumptext .come_back_later_text
.enter
	checkcode VAR_PARTYCOUNT
	sif <, 3
		jumptext .three_pokemon_text
	callasm BattleArcadeLobby_LegalityCheck
	sif <, 3
		jumptext .level_forty_text
	checkmoney 0, 500
	sif =, 2
		jumptext .not_enough_money_text
	takemoney 0, 500
	waitsfx ;wait for the text's "click" sound to end
	special PlaceMoneyTopRight
	playwaitsfx SFX_TRANSACTION

.selection_loop
	writetext .select_party_text
	callasm BattleArcadeLobby_LegalityCheck
	callasm ChooseThreePartyMonsForBattle
	sif false, then
		writetext .cancel_challenge_text
		yesorno
		iffalse .selection_loop
		givemoney 0, 500
		jumptext .refund_text
	sendif
	writetext .enter_to_begin_text
	closetext
	applymovement PLAYER, .entrance_movement
	special ClearBGPalettes
	warpsound
	waitsfx
	warp BATTLE_ARCADE_BATTLEROOM, 4, 7
	applymovement PLAYER, .approach_machine
	farscall MainArcadeScript
	applymovement PLAYER, .leave_machine
	warpsound
	waitsfx
	warp BATTLE_ARCADE_LOBBY, 5, 0
	applymovement PLAYER, .exit_movement
	spriteface PLAYER, UP
	jumptext .thanks_for_playing_text

.entrance_movement
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	remove_person
	step_end

.exit_movement
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

.approach_machine
	step_left
	step_left
	step_up
	step_up
	step_up
	step_left
	step_end

.leave_machine
	step_right
	step_down
	step_down
	step_down
	step_right
	step_right
	turn_head_down
	remove_person
	step_end

.menu
	db $40 ;flags (?)
	db 4, 4 ;start coordinates (y, x)
	db 11, 19 ;end coordinates (y, x) -- final y - initial y = 2 * items + 1, final x - initial x = longest item + 3
	dw .menu_options
	db 1 ;default option
.menu_options
	db $a0 ;flags 2.0 (??)
	db 3 ;option count
	db "Enter arcade@"
	db "Instructions@"
	db "Cancel@"

.enter_text
	ctxt "Welcome to the"
	line "Battle Arcade!"

	para "It costs ¥500"
	line "per try."

	para "Would you like"
	line "to enter?"
	done

.instructions_text
	ctxt "You will face a"
	line "series of random"
	para "battles until"
	line "your party is"
	cont "defeated."

	para "Your #mon's PP"
	line "will be restored"
	para "between battles,"
	line "and their status"
	para "conditions will be"
	line "healed; however,"
	cont "their HP won't be."

	para "The battles will"
	line "slowly rise in"
	para "difficulty as"
	line "you progress."

	para "At the end of"
	line "every round, you"
	para "will receive a"
	line "number of points"
	para "based on your"
	line "performance."

	para "The number of"
	line "points you"
	para "receive will be"
	line "multiplied by the"
	para "round number, so"
	line "try to get a long"
	cont "win streak!"

	para "At the end, your"
	line "total score will"
	para "be shown and you"
	line "will receive an"
	para "Arcade Ticket for"
	line "every 300 points."

	para "You can exchange"
	line "those tickets on"
	para "the counter on"
	line "the right for"
	cont "various prizes."

	para "So, do you want to"
	line "enter? It costs"
	cont "¥500 per try."
	done

.come_back_later_text
	ctxt "OK then, come"
	line "back some other"
	cont "time!"
	done

.three_pokemon_text
	ctxt "You must have"
	line "at least three"
	para "#mon in your"
	line "team to enter."

	para "You can use the"
	line "computer nearby"
	para "to organize your"
	line "team."
	done

.level_forty_text
	ctxt "Sorry, but your"
	line "#mon must be"
	para "at least level 40"
	line "to participate."

	para "You can use the"
	line "computer nearby"
	para "to organize your"
	line "team."
	done

.not_enough_money_text
	ctxt "Sorry, you don't"
	line "have enough money"
	cont "to enter."
	done

.select_party_text
	ctxt "Please select the"
	line "#mon you want"
	cont "to battle with."
	sdone

.cancel_challenge_text
	ctxt "Are you sure you"
	line "want to leave?"
	done

.refund_text
	ctxt "Your ¥500 will now"
	line "be refunded."

	para "We hope you enter"
	line "the challenge next"
	cont "time. Come again!"
	done

.enter_to_begin_text
	ctxt "Wonderful!"

	para "Please enter the"
	line "arcade room to"
	para "begin your"
	line "battles!"
	sdone

.thanks_for_playing_text
	ctxt "Thanks for"
	line "playing, and come"
	cont "again!"
	done

BattleArcadeLobbyInstructionsNPC:
	ctxt "The battles you"
	line "encounter are"
	para "completely"
	line "randomized!"

	para "The more fights"
	line "you win in a"
	para "row, the more"
	line "Arcade Tickets"
	cont "you get."

	para "You can exchange"
	line "them for some"
	cont "cool stuff!"
	done

BattleArcadeLobby_Door:
	ctxt "It's locked!"
	line "A sign on it says,"

	para "BATTLE ARCADE"
	line "PLAYERS ONLY"
	done

BattleArcadeLobby_Machines:
	jumptext .text

.text
	ctxt "It's a machine used"
	line "to generate a"
	para "match for the"
	line "Battle Arcade!"

	para "Hm? Some text is"
	line "flashing here."

	para "<...>"

	para "BATTLE TENT v2.0"
	line "[SYSTEM READY]"

	para "Copyright Bill"
	line "Solutions Inc."
	done

BattleArcadeLobby_HighScoreDisplay:
	start_asm
	push bc
	ld hl, wBattleArcadeMaxScore
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push hl
	ld hl, wStringBuffer1
	ld a, $8a
	ldh [hDigitsFlags], a
	predef PrintBigNumber
	ld bc, 0
	pop hl
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, 3
	ldh [hDigitsFlags], a
	ld hl, wStringBuffer3
	predef PrintBigNumber
	ld a, "@"
	ld [wStringBuffer1 + 10], a
	ld [wStringBuffer3 + 3], a
	pop bc
	ld hl, .text
	ret
.text
	ctxt "Current Arcade"
	line "high scores:"

	para "Score: <STRBF1>"
	line "Rounds won:   <STRBF3>"
	done

BattleArcadeLobby_LegalityCheck:
	ld hl, wPartyCount
	ld a, [hli]
	ld c, a
	ld d, a
	ld b, 0
.loop_species
	sla b
	ld a, [hli]
	and a
	jr z, .checked_species
	inc a
	jr z, .checked_species
	cp EGG + 1 ; a has been incremented
	jr z, .checked_species
	set 0, b
.checked_species
	dec c
	jr nz, .loop_species
	ld c, d
	push bc
	ld b, 0
	ld de, wPartyMon2 - wPartyMon1
	ld hl, wPartyMon1Level
.loop_level
	sla b
	ld a, [hl]
	add hl, de
	cp 40
	jr c, .checked_level
	set 0, b
.checked_level
	dec c
	jr nz, .loop_level
	ld a, b
	pop bc
	and b
	ld b, 0
	ld d, b
.loop_bits
	rrca
	jr nc, .no_increment
	inc d
.no_increment
	rl b
	dec c
	jr nz, .loop_bits
	ld a, d
	ldh [hScriptVar], a
	ld a, b
	ld [wBattleTowerLegalPokemonFlags], a
	ret

BattleArcadeLobby_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 9, 5, 1, ROUTE_86
	warp_def 9, 6, 1, ROUTE_86

.CoordEvents
	db 0

.BGEvents
	db 8
	signpost 0, 5, SIGNPOST_TEXT, BattleArcadeLobby_Door
	signpost 2, 4, SIGNPOST_TEXT, BattleArcadeLobby_HighScoreDisplay
	signpost  9,  0, SIGNPOST_LEFT, BattleArcadeLobby_Machines
	signpost  8,  0, SIGNPOST_LEFT, BattleArcadeLobby_Machines
	signpost  7,  0, SIGNPOST_LEFT, BattleArcadeLobby_Machines
	signpost  9, 11, SIGNPOST_RIGHT, BattleArcadeLobby_Machines
	signpost  8, 11, SIGNPOST_RIGHT, BattleArcadeLobby_Machines
	signpost  7, 11, SIGNPOST_RIGHT, BattleArcadeLobby_Machines

.ObjectEvents
	db 3
	person_event SPRITE_LASS, 5, 6, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BattleArcadeLobbyInstructionsNPC, -1
	person_event SPRITE_RECEPTIONIST, 1, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_MART, 0, MART_BATTLEARCADE, 0, -1
	person_event SPRITE_RECEPTIONIST, 1, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, BattleArcadeLobbyBattleNPC, -1
