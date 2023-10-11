Orphanage_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MACRO adopt_mon
; input: pokemon, level, orphan point cost
; output:
; 0. pokemon
; 1. level
; 2. orphan point cost
; 4. event flag
	db \1, \2
	dw \3, EVENT_ADOPTED_\1
ENDM

OrphanageDonationLady:
	faceplayer
	opentext
	checkevent EVENT_GET_ORPHAN_CARD
	sif false, then
		writetext .first_welcome_text
		verbosegiveitem ORPHAN_CARD, 1
		waitbutton
		writetext .received_orphan_card_text
		setevent EVENT_GET_ORPHAN_CARD
		endtext
	sendif
	checkcode VAR_PARTYCOUNT
	sif <, 2
		jumptext .only_mon_text
	writetext .which_mon_text
	special Special_SelectMonFromParty
	sif false
		jumptext .cancelled_text
	sif =, $ff
		jumptext .invalid_mon_text
	sif =, EGG
		jumptext .egg_text
	callasm IsThisPokemonPlayerLarvitar
	sif true
		jumptext .invalid_mon_text
	callasm OrphanageCalculatePoints
	writetext .confirmation_text
	yesorno
	sif true, then
		callasm .process_donation
		writetext .thank_you_text
		callasm DeletePartyPoke
		special HealParty
		playwaitsfx SFX_HEAL_POKEMON
	sendif
	jumptext .parting_text

.process_donation
	ld hl, wOrphanageDonation1
	push hl
	ld de, wOrphanageDonation2
	ld c, wOrphanageDonationEnd - wOrphanageDonation2
.shift_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .shift_loop
	call UpdateTime
	ld a, [wCurPartySpecies]
	pop hl
	ld [hli], a
	ld de, wCurYear
	rept 2
		ld a, [de]
		inc de
		ld [hli], a
	endr
	ld a, [de]
	ld [hl], a
	ld a, [wCurPartySpecies]
	call PlayCry
	ld hl, wTempNumber
	ld a, [hli]
	ldh [hMoneyTemp], a
	ld a, [hl]
	ldh [hMoneyTemp + 1], a
	ld bc, hMoneyTemp
	push hl
	callba GiveOrphanPoints
	pop hl
	ld a, [hld]
	ld b, [hl]
	ld hl, wAccumulatedOrphanPoints + 3
	add [hl]
	ld [hld], a
	ld a, b
	adc [hl]
	ld [hld], a
	ret nc
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret

.only_mon_text
	ctxt "You can't donate"
	line "your only #mon."
	done

.which_mon_text
	ctxt "Welcome to the"
	line "#mon orphanage."

	para "Which #mon"
	line "would you like to"
	cont "donate?"
	sdone

.cancelled_text
	ctxt "Changed your mind?"

	para "If you have a"
	line "change of heart,"
	para "please consider"
	line "donating."
	done

.invalid_mon_text
	ctxt "I'm sorry, but we"
	line "cannot accept this"
	cont "#mon."
	done

.egg_text
	ctxt "I'm sorry, but we"
	line "don't accept eggs."
	done

.confirmation_text
	ctxt "Are you sure you"
	line "want to donate"
	cont "<STRBF1>?"
	done

.thank_you_text
	ctxt "Thank you for your"
	line "donation."

	para "I have put @"
	deciram wTempNumber, 2, 0
	ctxt ""
	line "points on your"
	cont "card."

	para "We will also heal"
	line "your party, as a"
	para "complimentary"
	line "service."
	sdone

.parting_text
	ctxt "We hope to see you"
	line "again!"
	done

.first_welcome_text
	ctxt "Welcome to the"
	line "#mon orphanage."

	para "Many people catch"
	line "#mon and leave"
	para "the poor things in"
	line "their PCs forever."

	para "We are here to"
	line "prevent that, and"
	para "give the unwanted"
	line "#mon to people"
	para "who actually care"
	line "about them."

	para "Since this is your"
	line "first time here,"
	para "I will give you"
	line "your very own"
	cont "Orphan Card."
	sdone

.received_orphan_card_text
	ctxt "Every time you"
	line "donate a #mon,"
	para "I will put points"
	line "on your card."

	para "The number of"
	line "points is based on"
	para "various aspects of"
	line "the #mon."

	para "Once you get"
	line "enough points, you"
	para "can exchange"
	line "points for a"
	para "#mon that's up"
	line "for adoption."

	para "If you are truly"
	line "interested in"
	para "donating to us,"
	line "talk to me again."
	done

IsThisPokemonPlayerLarvitar:
; Is it ours?
	call GetCurNick
	callba CheckIfMonIsYourOT
	jr c, .yup

; Is this even a Larvitar-line Pokemon?
	ld a, [wCurPartySpecies]
	sub LARVITAR
	cp TYRANITAR - LARVITAR + 1
	jr nc, .nope

; Did we get it in Acqua?
	ld a, MON_CAUGHTLOCATION
	call GetPartyParam
	and $7f
	cp ACQUA_MINES
	jr nz, .nope
.yup
	ld a, 1
	jr .done

.nope
	xor a
.done
	ldh [hScriptVar], a
	ret

DeletePartyPoke:
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jpba RemoveMonFromPartyOrBox

OrphanageCalculatePoints:
	ld a, MON_DVS
	call GetPartyParamLocation
	; Get the attributes of the Party Pokemon
	ld c, 1

	push hl
	call .add_DV_score
	call .add_DV_score ; Max: 13

	ld de, MON_LEVEL - (MON_DVS + 2)
	add hl, de
	ld a, [hl]
	rrca
	rrca
	call .add_lower_five_bits ; Max: 38

	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseCatchRate]
	cpl
	call .add_one_eighth ; Max: 69

	ld a, [wBaseExp]
	call .add_one_eighth ; Max: 100

	pop hl ; recover the DVs pointer
	callba CheckShininessHL
	ld a, c
	jr nc, .not_shiny
	; Max if shiny: 400
	add a, a
	add a, a
.not_shiny
	ld hl, wTempNumber + 1
	ld [hld], a
	ld [hl], 0
	rl [hl]
	ret

.add_DV_score
	ld a, [hl]
	rrca
	rrca
	and 3
	ld b, a
	ld a, [hli]
	rlca
	rlca
	and 3
	add a, c
	add a, b
	ld c, a
	ret

.add_one_eighth
	swap a
	rlca
.add_lower_five_bits
	and $1f
	add a, c
	ld c, a
	ret

OrphanageAdoptionLady:
	faceplayer
	opentext
	writetext .introduction_text
.loop
	writetext .which_mon_text
	loadmenudata .menu
	verticalmenu
	closewindow
	addvar -1
	sif >, 3
		jumptext .come_again_text
	loadarray .OrphanageAdoptedPokemonArray
	readarrayhalfword 4
	checkevent -1
	sif true
		jumptext .already_received_text
	readarrayhalfword 2
	callasm CheckOrphanPointsFromScript
	dw -1
	sif =, 2
		jumptext .not_enough_points_text
	checkcode VAR_PARTYCOUNT
	sif =, 6, then
		checkcode VAR_BOXSPACE
		sif false
			jumptext .no_room_text
	sendif
	writetext .confirmation_text
	yesorno
	sif false
		jumptext .come_again_text
	writetext .received_mon_text
	readarray 0
	special Special_GameCornerPrizeMonCheckDex
	cmdwitharrayargs
	db givepoke_command, %0011, 0, 1, NO_ITEM, 0
	endcmdwitharrayargs
	readarrayhalfword 4
	setevent -1
	readarrayhalfword 2
	callasm TakeOrphanPointsFromScript
	dw -1
	jump .loop

.OrphanageAdoptedPokemonArray
	adopt_mon CHIKORITA, 10, 100
.OrphanageAdoptedPokemonArrayEntrySizeEnd
	adopt_mon EEVEE, 15, 250
	adopt_mon TOGEPI, 15, 500
	adopt_mon RIOLU, 15, 1000

.menu
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 19 ; end coords
	dw .menu_options
	db 1 ; default option

.menu_options
	db $80 ; flags
	db 5
	db "Chikorita    100@"
	db "Eevee        250@"
	db "Togepi       500@"
	db "Riolu       1000@"
	db "Cancel@"

.introduction_text
	ctxt "Hello, you can"
	line "exchange your"
	para "Orphan Points for"
	line "#mon up for"
	cont "adoption."
	sdone

.which_mon_text
	ctxt "Which #mon do"
	line "you want?"
	done

.come_again_text
	ctxt "Come again if you"
	line "want to adopt a"
	cont "#mon."
	done

.already_received_text
	ctxt "You already"
	line "received this"
	cont "#mon!"
	done

.not_enough_points_text
	ctxt "You need more"
	line "points for this"
	cont "#mon."
	done

.no_room_text
	ctxt "I'm sorry, but your"
	line "party and box are"
	cont "both full."
	done

.confirmation_text
	ctxt "Are you sure you"
	line "want to adopt this"
	cont "#mon?"
	done

.received_mon_text
	ctxt "Thank you!"

	para "Please take good"
	line "care of it!"
	sdone

Orphanage_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $15, $e, 7, SPURGE_CITY
	warp_def $15, $f, 7, SPURGE_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_BUENA, 11, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OrphanageDonationLady, -1
	person_event SPRITE_COOLTRAINER_F, 19, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OrphanageAdoptionLady, -1
