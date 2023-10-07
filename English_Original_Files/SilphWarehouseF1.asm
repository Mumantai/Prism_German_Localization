SilphWarehouseF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilphWarehouseF1Guard:
	faceplayer
	opentext
	writetext SilphWarehouseF1Guard_Text_NotAllowedUpstairs
	checkitem SHOP_TICKET
	paragraphdelay
	sif false
		jumptext SilphWarehouseF1Guard_Text_NothingOfInterest
	writetext SilphWarehouseF1Guard_Text_WaitIsThatShopTicket
	closetext
	checkcode VAR_FACING
	sif =, LEFT, then
		applymovement 2, .GuardMovesDownFacesUp
		moveperson 3, 26, 2
	selse
		applymovement 2, .GuardMovesRightFacesLeft
	sendif
	copybytetovar hOAMUpdate
	pushvar
	loadvar hOAMUpdate, 0
	disappear 2
	appear 3
	checkcode VAR_FACING
	sif =, LEFT, then
		callasm HandleNPCStep ; force update field 28
		spriteface 3, UP
	selse
		special UpdateSprites
	sendif
	popvar
	copyvartobyte hOAMUpdate
	end

.GuardMovesRightFacesLeft
	step_right
	turn_head_left
	step_end

.GuardMovesDownFacesUp
	step_down
	turn_head_up
	step_end

SilphWarehouseF1GuardMoved:
	ctxt "Please, enter as"
	line "you wish."
	done

SilphWarehouseF1Guard_Text_NotAllowedUpstairs:
	ctxt "Sorry, you're not"
	line "allowed up any"
	para "further unless"
	line "you're a Silph"
	cont "employee."
	prompt

SilphWarehouseF1Guard_Text_NothingOfInterest:
	ctxt "There isn't"
	line "anything up there"
	cont "of interest."
	done

SilphWarehouseF1Guard_Text_WaitIsThatShopTicket:
	ctxt "Hold on."

	para "Is that the Shop"
	line "Ticket?"

	para "Oh my, it really"
	line "is!"

	para "Trainers who are"
	line "in possession of"
	para "the Shop Ticket"
	line "are known to be"
	para "true champions of"
	line "#mon."

	para "Please, enter as"
	line "you wish."
	sdone

SilphWarehouseF1_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def 17, 8, 1, ROUTE_59
	warp_def 17, 9, 1, ROUTE_59
	warp_def 10, 27, 1, SILPH_WAREHOUSE_B1F
	warp_def 0, 26, 1, SILPH_WAREHOUSE_F2

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 1, 26, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SilphWarehouseF1Guard, EVENT_SILPH_WAREHOUSE_GUARD
	person_event SPRITE_OFFICER, 1, 27, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphWarehouseF1GuardMoved, EVENT_SILPH_WAREHOUSE_GUARD_MOVED | $8000
