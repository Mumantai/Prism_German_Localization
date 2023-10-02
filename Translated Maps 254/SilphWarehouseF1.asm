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
	ctxt "Komm rein wann"
	line "immer du willst."
	done

SilphWarehouseF1Guard_Text_NotAllowedUpstairs:
	ctxt "Entschuldigung, "
	line "Sie dürfen nicht "
	para "weiter hoch, es "
	line "sei denn, Sie sind"
	cont "Silph-Mitarbeiter."
	prompt

SilphWarehouseF1Guard_Text_NothingOfInterest:
	ctxt "Es gibt dort oben "
	line "nichts "
	cont "Interessantes."
	done

SilphWarehouseF1Guard_Text_WaitIsThatShopTicket:
	ctxt "Warte mal."
	para "Ist das das"
	line "Marktticket?"
	para "Oh mein Gott, das "
	line "ist es wirklich!"
	para "Trainer, die im "
	line "Besitz des "
	para "Markttickets sind,"
	line "sind als wahre "
	para "Champions von "
	line "#mon bekannt."
	para "Bitte geh hinein, "
	line "wenn Du möchtest."
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