MersonGoldTokenExchange_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonGoldTokenExchangeNPC:
	faceplayer
	opentext
	checkevent EVENT_GOLDTOKENMAN_INTRO
	sif false, then
		writetext MersonGoldTokenExchange_Text_Intro
		setevent EVENT_GOLDTOKENMAN_INTRO
	sendif
	scriptstartasm
	ld hl, MersonGoldTokenExchange_EventFlags
	call CountEventFlagsFromList
	ld a, e
	cp 8
	ld hl, MersonGoldTokenExchange_CheckFinishedDex
	ret z
	ld hl, MersonGoldTokenExchange_AfterFillingDex
	ret nc
	ldh [hScriptVar], a
	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	push af
	ldh a, [hScriptVar]
	inc a
	ld b, a
	swap a
	sub b
	add a, a
	ld b, a
	pop af
	cp b
	ld hl, MersonGoldTokenExchange_RequirementsForMilestone
	ret c
	scriptstopasm
	writetext MersonGoldTokenExchange_Text_PassedMilestone
	waitbutton
	verbosegiveitem GOLD_TOKEN, 4
	sif false
		jumptext MersonGoldTokenExchange_Text_NeedMoreSpace
	closetext
	scriptstartasm
	ld hl, MersonGoldTokenExchange_EventFlags
.loop
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	push hl
	push de
	ld b, CHECK_FLAG
	predef EventFlagAction
	pop de
	pop hl
	jr nz, .loop
	ld b, 1
	predef EventFlagAction
	ld hl, 0
	ret

MersonGoldTokenExchange_EventFlags:
	dw EVENT_GOLDTOKENMAN_MILESTONE_1
	dw EVENT_GOLDTOKENMAN_MILESTONE_2
	dw EVENT_GOLDTOKENMAN_MILESTONE_3
	dw EVENT_GOLDTOKENMAN_MILESTONE_4
	dw EVENT_GOLDTOKENMAN_MILESTONE_5
	dw EVENT_GOLDTOKENMAN_MILESTONE_6
	dw EVENT_GOLDTOKENMAN_MILESTONE_7
	dw EVENT_GOLDTOKENMAN_MILESTONE_8
	dw EVENT_GOLDTOKENMAN_MILESTONE_9
	dw -1

MersonGoldTokenExchange_RequirementsForMilestone:
	jumptext MersonGoldTokenExchange_Text_RequirementsForMilestone

MersonGoldTokenExchange_CheckFinishedDex:
	checkcode VAR_DEXCAUGHT
	sif <, 253
		jumptext MersonGoldTokenExchange_Text_RequirementsForSpecialGift
	writetext MersonGoldTokenExchange_Text_FinishedDex
	waitbutton
	verbosegiveitem SHOP_TICKET, 1
	sif false
		jumptext MersonGoldTokenExchange_Text_NeedMoreSpace
	setevent EVENT_GOLDTOKENMAN_MILESTONE_9
	jumptext MersonGoldTokenExchange_Text_TicketGrantsAccessToShop

MersonGoldTokenExchange_AfterFillingDex:
	checkevent EVENT_SILPH_WAREHOUSE_GUARD_MOVED
	sif false
		jumptext MersonGoldTokenExchange_Text_AllICanRememberAboutSecretShop
	checkevent EVENT_TOLD_GOLDTOKENMAN_SECRET_SHOP_LOCATION
	setevent EVENT_TOLD_GOLDTOKENMAN_SECRET_SHOP_LOCATION
	sif false
		jumptext MersonGoldTokenExchange_Text_WhatSecretShopInSilphWarehouse
	jumptext MersonGoldTokenExchange_Text_AfterFillingDex

MersonGoldTokenExchange_Text_Intro:
	ctxt "Hallo, ich bin ein"
	line "großer Fan von"
	cont "#mon!"
	para "Für je 30 #mon,"
	line "die du besitzt,"
	para "gebe ich dir 4"
	line "Goldmünzen."
	para "Tolles Geschäft,"
	line "oder?"
	sdone

MersonGoldTokenExchange_Text_NeedMoreSpace:
	ctxt "Du hast keinen"
	line "Platz für dein"
	cont "Geschenk!"
	done

MersonGoldTokenExchange_Text_PassedMilestone:
	start_asm
	call MersonGoldTextExchange_GetMilestoneNumber
	ld hl, .text
	ret
.text
	ctxt "Du hast den"
	line "<STRBF1>"
	para "Meilenstein"
	line "erreicht."
	done
MersonGoldTokenExchange_Text_RequirementsForMilestone:
	start_asm
	call MersonGoldTextExchange_GetMilestoneNumber
	ldh a, [hScriptVar]
	inc a
	ld l, a
	swap a
	sub l
	add a, a
	ldh [hTemp], a
	ld hl, .text
	ret
.text
	ctxt "Fange"
	line "@"
	deciram hTemp, 1, 3
	ctxt " #mon, um"
	para "den Meilenstein"
	line "<STRBF1> zu"
	cont "erreichen!"
	done

MersonGoldTextExchange_GetMilestoneNumber:
	push bc
	ldh a, [hScriptVar]
	ld hl, MersonGoldTokenExchange_Text_OrdinalNumbers
	call GetNthString
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	ld bc, 8
	ld a, "@"
	push hl
	call ByteFill
	pop hl
	call PlaceString
	pop bc
	ret

MersonGoldTokenExchange_Text_OrdinalNumbers:
	db "1.@"
	db "2.@"
	db "3.@"
	db "4.@"
	db "5.@"
	db "6.@"
	db "7.@"
	db "8.@"

MersonGoldTokenExchange_Text_FinishedDex:
	ctxt "Beachtlich!"
	para "Du hast den Naljo-"
	line "#dex vollendet!"
	para "Wie versprochen,"
	line "gebe ich dir ein"
	para "ganz besonderes"
	line "Geschenk."
	sdone

MersonGoldTokenExchange_Text_TicketGrantsAccessToShop:
	ctxt "Mit diesem Ticket,"
	line "hast du Zugang zu"
	para "einem speziellen"
	line "Laden irgendwo in"
	cont "Rijon."
	para "Ich erinnere mich"
	line "noch, wie ich"
	para "damit die seltenen"
	line "Items gekauft"
	para "habe, die sie dort"
	line "anbieten."
	para "Jedoch habe ich"
	line "keine Verwendung"
	cont "mehr dafür."
	para "Oh, wenn ich mich"
	line "nur erinnern"
	para "könnte, wo er ist,"
	line "dann würde ich es"
	cont "dir sagen."
	para "Ich kann mich nur"
	line "daran erinnern,"
	para "dass ich mit dem"
	line "Magnetzug von"
	para "Naljo aus dorthin"
	line "gefahren bin."
	done

MersonGoldTokenExchange_Text_RequirementsForSpecialGift:
	ctxt "Ich habe ein ganz"
	line "besonderes"
	para "Geschenk für"
	line "diejenigen, die"
	para "ihren Naljo-"
	line "#dex "
	cont "vervollständigen!"
	para "Komm wieder, wenn"
	line "du alle #mon in"
	para "Naljo gefangen"
	line "hast, um ein ganz"
	para "besonderes"
	line "Geschenk zu"
	cont "erhalten."
	done

MersonGoldTokenExchange_Text_AllICanRememberAboutSecretShop:
	ctxt "Hmm <...> Irgendwo"
	para "in der Nähe des"
	line "Magnetzugs <...>"
	para "Wie auch immer,"
	line "herzlichen"
	para "Glückwunsch zu"
	line "deinem Erfolg."
	para "Du hast einen"
	line "#mon-Fan sehr"
	cont "glücklich gemacht."
	done

MersonGoldTokenExchange_Text_WhatSecretShopInSilphWarehouse:
	ctxt "Was?"
	para "Der Laden befindet"
	line "sich im"
	cont "Silph Co. Lager?"
	para "Oh, jetzt erinnere"
	line "ich mich daran!"
	para "Nun, genieße, was"
	line "er zu bieten hat!"
	done

MersonGoldTokenExchange_Text_AfterFillingDex:
	ctxt "Ich bin immer noch"
	line "schockiert und"
	para "erstaunt über"
	line "deine Leistung."
	para "Du hast einen"
	line "#mon-Fan sehr"
	cont "glücklich gemacht."
	done

MersonGoldTokenExchange_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $5, $4, 2, MERSON_CITY
	warp_def $5, $5, 2, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_GENTLEMAN, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, 8 + PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, MersonGoldTokenExchangeNPC, -1