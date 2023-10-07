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
	ctxt "Hello, I am a huge"
	line "fan of #mon!"

	para "For every 30"
	line "#mon you own, I"
	para "will give you 4"
	line "Gold Tokens."

	para "Great deal, huh?"
	sdone

MersonGoldTokenExchange_Text_NeedMoreSpace:
	ctxt "You need more"
	line "space for your"
	cont "gift!"
	done

MersonGoldTokenExchange_Text_PassedMilestone:
	start_asm
	call MersonGoldTextExchange_GetMilestoneNumber
	ld hl, .text
	ret
.text
	ctxt "You passed the"
	line "<STRBF1> milestone!"
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
	ctxt "You need to own"
	line "@"
	deciram hTemp, 1, 3
	ctxt " #mon in"
	para "order to pass the"
	line "<STRBF1> milestone!"
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
	db "first@"
	db "second@"
	db "third@"
	db "fourth@"
	db "fifth@"
	db "sixth@"
	db "seventh@"
	db "eighth@"

MersonGoldTokenExchange_Text_FinishedDex:
	ctxt "Impressive!"

	para "You finished the"
	line "Naljo #dex!"

	para "As promised, here"
	line "is my very special"
	cont "gift."
	sdone

MersonGoldTokenExchange_Text_TicketGrantsAccessToShop:
	ctxt "This ticket grants"
	line "you access to a"
	para "special shop some-"
	line "where in Rijon."

	para "Oh, I remember"
	line "when I used to use"
	para "it to buy the rare"
	line "items they had for"
	cont "sale."

	para "But I have no use"
	line "for it anymore."

	para "Oh, if only I"
	line "could remember"
	para "where it was, then"
	line "I'd tell you."

	para "All I can remember"
	line "is taking the"
	para "Magnet Train from"
	line "Naljo to arrive"
	cont "there."
	done

MersonGoldTokenExchange_Text_RequirementsForSpecialGift:
	ctxt "I have a very"
	line "special gift for"
	para "those who complete"
	line "the Naljo #dex!"

	para "Come back when you"
	line "complete it to get"
	para "a very special"
	line "gift."
	done

MersonGoldTokenExchange_Text_AllICanRememberAboutSecretShop:
	ctxt "Hmm<...> somewhere"
	line "near the Magnet"
	cont "Train<...>"

	para "Anyway, congratul-"
	line "ations on your"
	cont "accomplishment."

	para "You've made a"
	line "#mon fan very"
	cont "happy."
	done

MersonGoldTokenExchange_Text_WhatSecretShopInSilphWarehouse:
	ctxt "What? The shop is"
	line "in the Silph"
	cont "Warehouse?"

	para "Oh, I remember it"
	line "now!"

	para "Well, enjoy what"
	line "it has to offer!"
	done

MersonGoldTokenExchange_Text_AfterFillingDex:
	ctxt "I'm still in shock"
	line "and awe over your"
	cont "accomplishment."

	para "You've made a"
	line "#mon fan very"
	cont "happy."
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
