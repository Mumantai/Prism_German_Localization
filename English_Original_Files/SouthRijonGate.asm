SouthRijonGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .unlock_rijon_second_half

.unlock_rijon_second_half
	setevent EVENT_RIJON_SECOND_PART
	return

SouthRijonGateDirectionsSign:
	ctxt "<UP> Merson City"
	next "<DOWN> Border"
	done

SouthRijonGateBorderSign:
	signpostheader 2
	ctxt "Border currently"
	next "closed due to an"
	next "infectious virus."
	nl   ""
	next "Wear a mask!"
	done

SouthRijonGate_NPC_1:
	text "They've shut the"
	line "border down!"

	para "The sign says they"
	line "are worried about"
	cont "some disease."

	para "I think it's just"
	line "paranoia."
	done

SouthRijonGate_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 21, 11, SIGNPOST_LOAD, SouthRijonGateDirectionsSign
	signpost 31,  9, SIGNPOST_LOAD, SouthRijonGateBorderSign

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 23,  7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SouthRijonGate_NPC_1, -1
