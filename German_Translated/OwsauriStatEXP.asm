OwsauriStatEXP_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

OwsauriStatEXPNPC:
	faceplayer
	opentext
	writetext .introduction_text
	yesorno
	sif false
		closetextend
	checkmoney 0, 500
	sif =, 2
		jumptext .not_enough_money_text
	takemoney 0, 500
	writetext .choose_a_mon_text
	special Special_SelectMonFromParty
	iffalse .refund
	writetext .which_stat_text
	loadmenudata .menu
	verticalmenu
	closewindow
	sif true
		jumptext OwsauriStatEXP_ShowEXP
.refund
	givemoney 0, 500
	closetextend

.introduction_text
	ctxt "Für ¥500 verrate"
	line "ich dir die Fleiß-"
	para "Punkte von einem"
	line "#mon von dir."

	para "Interessiert?"
	done

.not_enough_money_text
	ctxt "Sorry, aber du"
	line "hast nicht genug"
	cont "Geld dabei."
	done

.choose_a_mon_text
	ctxt "Welches #mon"
	line "soll ich prüfen?"
	sdone

.which_stat_text
	ctxt "Welchen Status"
	line "soll ich prüfen?"
	done

.menu
	db $40 ; flags
	db 00, 05 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db $5
StatExpStatNames:
	db "KP@"
	db "Angriff@"
	db "Vert@"
	db "Init@"
	db "Spezial@"

OwsauriStatEXP_ShowEXP:
	start_asm
	push bc
	ld a, [wPartyMenuCursor]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1 + MON_HP_EXP
	rst AddNTimes
	ldh a, [hScriptVar]
	dec a
	push af
	add a, a
	ld c, a
	ld b, 0
	add hl, bc
	ld de, wTempNumber
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, "@"
	ld hl, wStringBuffer1
	ld c, 8 ; b is already 0
	call ByteFill
	pop af
	ld hl, StatExpStatNames
	call GetNthString
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	call PlaceString
	pop bc
	ld hl, .text
	ret

.text
	ctxt "<STRBF1>  EP:"
	line "@"
	deciram wTempNumber, 2, 5
	ctxt "/65535"
	done

OwsauriStatEXP_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $2, 5, OWSAURI_CITY
	warp_def $7, $3, 5, OWSAURI_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_PHARMACIST, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, OwsauriStatEXPNPC, -1
