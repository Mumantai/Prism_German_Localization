LaurelLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelLabFossilCaseNPC:
	faceplayer
	opentext
	checkitem FOSSIL_CASE
	sif true, then
		copybytetovar wFossilCaseCount
		sif true, then
			sif =, 1, then
				writetext .have_one_fossil_text
			selse
				writetext .have_many_fossils_text
			sendif
			yesorno
			sif false
				jumptext .refused_text
			callasm .count_donation_and_take_fossil
			jumptext .donated_text
		sendif
	selse
		checkiteminbox FOSSIL_CASE
		sif false, then
			writetext .give_fossil_case_text
			verbosegiveitem FOSSIL_CASE
		sendif
	sendif
	jumptext .case_given_text

.give_fossil_case_text
	ctxt "Ich kenne vier"
	line "#mon Fossilien."
	para "Anorith kommt aus"
	line "dem Klauenfossil."
	para "Liliep kommt aus"
	line "dem Wurzelfossil."
	para "Koknodon kommt aus"
	line "dem Kopffossil."
	para "Schilterus kommt"
	line "aus dem Panzer-"
	cont "fossil."
	para "Fossilien erhälst"
	line "du beim Bergbau,"
	cont "also viel Glück!"
	para "Oh, du brauchst"
	line "aber etwas, um sie"
	cont "tragen zu können."
	para "Hier, nimm das."
	sdone

.case_given_text
	ctxt "Wenn du was aus-"
	line "gegraben hast,"
	para "verstaue es in"
	line "der Fossiltasche"
	cont "und bring es her."
	done

.have_one_fossil_text
	ctxt "Du hast ein"
	line "Fossil dabei!"
	para "Willst du es be-"
	line "leben? Dann bring"
	cont "es meinem Partner."
	para "Oder willst du es"
	line "für die Wissen-"
	cont "schaft spenden?"
	prompt

.have_many_fossils_text
	ctxt "Du hast @"
	deciram wFossilCaseCount, 1, 2
	ctxt ""
	line "Fossilien in der"
	cont "Fossiltasche!"
	para "Wenn du welche"
	line "beleben willst,"
	para "bring sie meinem"
	line "Partner."
	para "Oder willst du es"
	line "der Wissenschaft"
	cont "spenden?"
	prompt

.refused_text
	ctxt "OK, komm zurück,"
	line "wenn du deine"
	cont "Meinung änderst."
	done

.donated_text
	ctxt "Danke für die"
	line "Spende!"
	done

.count_donation_and_take_fossil
	wbk BANK(wDonatedFossils)
	ld hl, wDonatedFossils
	inc [hl]
	jr nz, .counted
	inc hl
	inc [hl]
	jr nz, .counted
	dec [hl]
	dec hl
	dec [hl]
.counted
	wbk BANK(wFossilCaseCount)
	; fallthrough

TakeFossil:
	ld hl, wFossilCaseCount
	dec [hl]
	inc hl
	ld a, [hl]
	push af
.loop
	inc hl
	ld a, [hld]
	ld [hli], a
	inc a
	jr nz, .loop
	pop af
	ret

LaurelLabRevivalScientist:
	faceplayer
	opentext
	writetext .introduction_text
	yesorno
	sif false
		jumptext .rejected_text
	checkitem FOSSIL_CASE
	sif false
.no_fossil
		jumptext .no_fossil_text
	copybytetovar wFossilCaseCount
	iffalse .no_fossil
	checkcode VAR_PARTYCOUNT
	if_less_than 6, .go
	checkcode VAR_BOXSPACE
	sif false
		jumptext .no_room_text
.go
	copybytetovar wFossilCase
	pushvar
	addhalfwordtovar .fossils
	copyvarbytetovar
	scall .appraise
	pullvar
	special Special_FossilPuzzle
	sif false, then
		faceperson PLAYER, LEFT
		popvar
		jumptextfaceplayer .aborted_puzzle_text
	sendif
	callasm .take_fossil_increment_count
	faceplayer
	faceperson PLAYER, LEFT
	opentext
	writetext .here_is_your_mon_text
	playwaitsfx SFX_DEX_FANFARE_140_169
	popvar
	addhalfwordtovar .fossils
	copyvarbytetovar
	givepoke 0, 10
	closetextend

.fossils
	db LILEEP, ANORITH, CRANIDOS, SHIELDON

.take_fossil_increment_count
	call TakeFossil
	ld hl, wFossilsRevived
	inc [hl]
	ret nz
	inc hl
	inc [hl]
	ret nz
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret

.appraise
	pokenamemem 0, 0
	writetext .this_is_a_mon_text
	writetext .help_me_text
	closetext
	spriteface 2, UP
	checkcode VAR_FACING
	anonjumptable
	dw .end
	dw .step_left_and_up
	dw .end
	dw .look_up

.step_left_and_up
	applymovement 0, .step_left_and_up_movement
.end
	end

.step_left_and_up_movement
	step_left
	step_up
	step_end

.look_up
	applymovement 0, .look_up_movement
	end

.look_up_movement
	turn_head_up
	step_end

.this_is_a_mon_text
	ctxt "Ah!"
	para "Das ist ein"
	line "<STRBF1>!"
	sdone

.help_me_text
	ctxt "Komm, für den"
	line "Prozess brauche"
	cont "ich deine Hilfe."
	prompt

.introduction_text
	ctxt "Ich bin ein"
	line "Wissenschaftler."
	para "Richtig gehört,"
	line "WISSENSCHAFTLER!"
	para "Meine Maschiene"
	line "holt Fossilien"
	cont "zurück ins Leben!"
	para "Wollen wir es an"
	line "deinem testen?"
	done

.rejected_text
	ctxt "Was? Du traust"
	line "nicht einem <...>"
	para "WISSENSCHAFTLER?!"
	done

.no_fossil_text
	ctxt "Wissenschaftler"
	line "kann man nicht"
	para "reinlegen, du hast"
	line "keine Fossilien!"
	done

.aborted_puzzle_text
	ctxt "Was? Du willst"
	line "aufhören?"
	para "OK, komm wieder,"
	line "wenn du Fossilien"
	para "wiederbeleben"
	line "möchtest."
	done

.here_is_your_mon_text
	ctxt "Es war ein Erfolg!"
	para "Hier ist dein"
	line "<STRBF1>!"
	done

.no_room_text
	ctxt "Du hast kein Platz"
	line "in deinem Team!"
	para "Dachtest du, ich"
	line "würde scheitern?!"
	done

LaurelLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $4, 5, LAUREL_CITY
	warp_def $b, $5, 5, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_SCIENTIST, 7, 9, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelLabRevivalScientist, -1
	person_event SPRITE_SCIENTIST, 6, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelLabFossilCaseNPC, -1