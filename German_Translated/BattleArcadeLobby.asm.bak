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
	db "Teilnehmen@"
	db "Anleitung@"
	db "Abbruch@"

.enter_text
	ctxt "Willkommen in den"
	line "Kampfarkaden!"

	para "Jeder Versuch"
	line "kostet ¥500."

	para "Möchtest du dein"
	line "Glück versuchen?"
	done

.instructions_text
	ctxt "Du wirst dich ei-"
	line "ner Reihe zufäl-"
	para "liger Kämpfe stel-"
	line "len, bis dein Team"
	cont "kampfunfähig ist."

	para "Zwischen den Kämp-"
	line "fen, wird alles"
	para "auser den KP"
	line "deiner #mon"
	cont "geheilt."

	para "Je Runde wirds"
	line "Schwerer!"

	para "Am Ende jeder Run-"
	line "de, erhälst du,"
	para "basierend auf"
	line "deiner Leistung,"
	para "eine gewisse An-"
	line "zahl an Tränken."

	para "Deine Punktzahl,"
	line "wird mit der Run-"
	para "dennummer multi-"
	line "pliziert, also"
	para "versuch möglichst"
	line "lange durch-"
	cont "zuhalten!"

	para "Am Ende, wird dei-"
	line "ne Gesamtpunktzahl"
	para "angezeigt und du"
	line "bekommst ein Arka-"
	para "denticket pro 300"
	line "erreichter Punkte."

	para "Diese Tickets,"
	line "können am Schalter"
	para "auf der Rechten"
	line "Seite gegen Preise"
	cont "getauscht werden."
	
	para "Jeder Versuch kos-"
	line "tet nur ¥500. Na,"
	cont "wie sieht's aus?"
	done


.come_back_later_text
	ctxt "Okay. Beehren Sie"
	line "uns bitte bald"
	cont "wieder!"
	done


.three_pokemon_text
	ctxt "Du brauchst minde-"
	line "stens drei #mon"
	para "in deinem Team, um"
	line "teilzunehmen."

	para "Du kannst den PC"
	line "dort benutzen, um"
	para "dein Team zu bear-"
	line "beiten."
	done

.level_forty_text
	ctxt "Deine #mon"
	line "müssen mindestens"
	para "Level 40 haben, um"
	line "teilzunehmen."

	para "Du kannst den PC"
	line "dort benutzen, um"
	para "dein Team zu bear-"
	line "beiten."
	done

.not_enough_money_text
	ctxt "Sorry, du hast"
	line "nicht genug Geld,"
	cont "um teilzunehmen."
	done

.select_party_text
	ctxt "Bitte wähle die"
	line "#mon, die teil-"
	cont "nehmen sollen."
	sdone

.cancel_challenge_text
	ctxt "Möchtest du wirk-"
	line "lich schon gehen?"
	done

.refund_text
	ctxt "Hier hast du deine"
	line "¥500 wieder."

	para "Bitte kommen Sie"
	line "bald wieder. Viel"
	cont "Erfolg!"
	done


.enter_to_begin_text
	ctxt "Wunderbar!"

	para "Bitte geh in den"
	line "Arkadensaal, um"
	para "mit den Kämpfen zu"
	line "beginnen!"
	sdone

.thanks_for_playing_text
	ctxt "Danke für's Spie-"
	line "len. Kommen Sie"
	cont "bald wieder!"
	done
	
BattleArcadeLobbyInstructionsNPC:
	ctxt "Ab hier, sind die"
	line "Kämpfe komplett"
	para "dem Zufall über-"
	line "lassen!"

	para "Je mehr Kämpfe du"
	line "am Stück gewinnst,"
	para "desto mehr Arka-"
	line "dentickets be-"
	cont "kommst du."

	para "Diese kannst du"
	line "gegen coolen Kram"
	cont "eintauschen!"
	done

BattleArcadeLobby_Door:
	ctxt "Verschlossen. Auf"
	line "dem Schild steht:"

	para "ZUTRITT NUR FÜR"
	line "TEILNEHMER!"
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
	ctxt "Derzeitige"
	line "Highscores:"

	para "Punkte: <STRBF1>"
	line "Runden: <STRBF3>"
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
	db 2
	signpost 0, 5, SIGNPOST_TEXT, BattleArcadeLobby_Door
	signpost 2, 4, SIGNPOST_TEXT, BattleArcadeLobby_HighScoreDisplay

.ObjectEvents
	db 3
	person_event SPRITE_LASS, 5, 6, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BattleArcadeLobbyInstructionsNPC, -1
	person_event SPRITE_RECEPTIONIST, 1, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_MART, 0, MART_BATTLEARCADE, 0, -1
	person_event SPRITE_RECEPTIONIST, 1, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, BattleArcadeLobbyBattleNPC, -1
