Orphanage_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

adopt_mon: MACRO
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
	ctxt "Du kannst uns dein"
	line "einziges #mon"
	cont "nicht überlassen."
	done

.which_mon_text
	ctxt "Willkommen im"
	line "#mon-"
	cont "Weisenhaus."

	para "Welches #mon"
	line "möchtest du"
	cont "uns überlassen?"
	sdone

.cancelled_text
	ctxt "Doch nicht mehr?"

	para "Wenn du es dir"
	line "anders überlegst,"

	para "komm jederzeit auf"
	line "uns zurück."
	done

.invalid_mon_text
	ctxt "Sorry, aber dieses"
	line "#mon können wir"
	cont "nicht annehmen."
	done

.egg_text
	ctxt "Wir nehmen keine"
	line "Eier an<...>"
	done

.confirmation_text
	ctxt "<STRBF1> wirklich"
	line "überlassen?"
	done

.thank_you_text
	ctxt "Danke für deine"
	line "Spende."

	para "Ich schreibe dir"
	line "@"
	deciram wTempNumber, 2, 0
	ctxt " Weisenpunkte"
	cont "auf die Karte gut."


	para "Desweiteren heilen"
	line "wir, als Zusatz-"
	para "leistung, dein"
	line "Team."
	sdone

.parting_text
	ctxt "Schau jederzeit"
	line "wieder vorbei!"
	done

.first_welcome_text
	ctxt "Willkommen beim"
	line "#mon-"
	cont "Weisenhaus."

	para "Einige Leute fang-"
	line "en #mon und"
	para "lassen die armen"
	line "Dinger in der PC-"
	cont "Box versauern."

	para "Wir sind hier, um"
	line "dies zu verhindern"
	para "und geben diese"
	line "#mon zu Mensch-"
	para "en, die sich wirk-"
	line "lich darum kümmern"

	para "Da du zum ersten"
	line "mal hier bist,"
	para "kriegst du"
	line "deine eigene"
	cont "Weisenkarte."
	sdone

.received_orphan_card_text
	ctxt "Jedesmal, wenn du"
	line "uns ein #mon,"
	para "überlässt, erhälst"
	line "du Weisenpunkte."

	para "Die Menge der"
	line "Punkte hängt von"
	para "vielen Faktoren"
	line "des #mon's ab."

	para "Wenn du genügend"
	line "Punkte hast,"
	para "kannst du damit,"
	line "im Gegenzug,"
	para "ein #mon"
	line "adoptieren."

	para "Solltest du wirk-"
	line "lich interessiert"
	para "sein, uns eins zu"
	line "überlassen, sprich"
	cont "mich nochmals an."
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
	adopt_mon RIOLU, 15, 750

.menu
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 19 ; end coords
	dw .menu_options
	db 1 ; default option

.menu_options
	db $80 ; flags
	db 5
	db "Endivie      100@"
	db "Evoli        250@"
	db "Togepi       500@"
	db "Riolu        750@"
	db "Zurück@"

.introduction_text
	ctxt "Hallo, du kannst"
	line "mit Weisenpunkten"
	para "ein #mon"
	line "adoptieren."
	sdone

.which_mon_text
	ctxt "Welches #mon"
	line "möchtest du?"
	done

.come_again_text
	ctxt "Komm wieder, wenn"
	line "du ein #mon ad-"
	cont "optieren möchtest."
	done

.already_received_text
	ctxt "Das #mon"
	line "hast du bereits"
	cont "erhalten!"
	done

.not_enough_points_text
	ctxt "Du benötigst mehr"
	line "Punkte für dieses"
	cont "#mon."
	done

.no_room_text
	ctxt "Tut mir leid, aber"
	line "dein Team und dei-"
	cont "ne Box i voll."
	done

.confirmation_text
	ctxt "Bist du sicher,"
	line "dass du dieses"
	cont "#mon adoptieren"
	cont "möchtest?"
	done

.received_mon_text
	ctxt "Vielen Dank!"

	para "Bitte behandle das"
	line "#mon gut!"
	sdone

Orphanage_MapEventHeader ;filler
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
