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
	ctxt "I know about four"
	line "#mon fossils."

	para "Anorith comes from"
	line "a Claw Fossil."

	para "Lileep comes from"
	line "a Root Fossil."

	para "Cranidos comes"
	line "from a Skull"
	cont "Fossil."

	para "And Shieldon comes"
	line "from an Armor"
	cont "Fossil."

	para "You can find"
	line "fossils by mining,"
	cont "so, good luck!"

	para "Oh, but you need"
	line "somewhere safe to"
	cont "carry them."

	para "Here, try this."
	sdone

.case_given_text
	ctxt "If you mine up a"
	line "fossil, put it in"
	para "that Fossil Case"
	line "and bring it here!"
	done

.have_one_fossil_text
	ctxt "You have a fossil"
	line "in your Fossil"
	cont "Case!"

	para "If you want to try"
	line "to revive it, take"
	cont "it to my partner."

	para "Or would you"
	line "rather donate it"
	cont "for research?"
	prompt

.have_many_fossils_text
	ctxt "You have @"
	deciram wFossilCaseCount, 1, 2
	ctxt ""
	line "fossils in your"
	cont "Fossil Case!"

	para "If you want to try"
	line "to revive them,"
	para "pick one and take"
	line "it to my partner."

	para "Or would you"
	line "rather donate one"
	para "of your fossils"
	line "for research?"
	prompt

.refused_text
	ctxt "Oh well, come back"
	line "later if you"
	cont "change your mind."
	done

.donated_text
	ctxt "Thank you very"
	line "much for your"
	cont "donation!"
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
	ctxt "Ah! This is a"
	line "<STRBF1>!"
	sdone

.help_me_text
	ctxt "I need you to help"
	line "me complete the"
	cont "process. Come!"
	prompt

.introduction_text
	ctxt "I am a scientist."

	para "That's right, a"
	line "SCIENTIST!"

	para "I invented a"
	line "machine to revive"
	cont "#mon fossils."

	para "Want me to try the"
	line "machine on yours?"
	done

.rejected_text
	ctxt "What, you don't"
	line "trust<...>"

	para "A SCIENTIST?!"
	done

.no_fossil_text
	ctxt "You don't have any"
	line "fossils. You can't"
	cont "fool a scientist!"
	done

.aborted_puzzle_text
	ctxt "What? You want to"
	line "stop?"

	para "Alright, come back"
	line "later then if you"
	para "want to revive a"
	line "fossil."
	done

.here_is_your_mon_text
	ctxt "I was successful!"

	para "Here is your"
	line "<STRBF1>!"
	done

.no_room_text
	ctxt "You don't have room"
	line "in your party or"
	para "box for another"
	line "#mon!"

	para "Were you expecting"
	line "me to fail?!"
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
