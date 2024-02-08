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
	next "<DOWN> Grenzübergang"
	done

SouthRijonGateBorderSign:
	ctxt "Die Grenze ist zur"
	next "Zeit aufgrund"
	next "eines ansteckenden"
	next "Virus geschlossen."
	nl   ""
	next "Tragt eine Maske!"
	done

SouthRijonGate_NPC_1:
	ctxt "Sie haben die"
	line "Grenze wegen eines"
	para "leichten Hustens"
	line "geschlossen!"
	para "Das ist reine"
	line "Paranoia!"
	done

SouthRijonGate_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 21, 11, SIGNPOST_LOAD, SouthRijonGateDirectionsSign
	signpost 31,  9, SIGNPOST_LOAD, SouthRijonGateBorderSign

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 23,  7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SouthRijonGate_NPC_1, -1