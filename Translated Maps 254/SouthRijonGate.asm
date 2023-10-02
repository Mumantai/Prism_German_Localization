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
	ctxt "Der Grenzübergang"
	line "ist aufgrund eines"
	para "ansteckenden Virus"
	line "derzeit"
	cont "geschlossen."
	para "Trage eine Maske!"
	done

SouthRijonGate_NPC_1:
	ctxt "Sie haben die"
	line "Grenze"
	cont "geschlossen!"
	para "Auf dem Schild"
	line "steht, dass sie"
	para "sich wegen einer"
	line "Krankheit sorgen."
	para "Ich denke, es ist"
	line "nur Paranoia."
	done

SouthRijonGate_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 21, 11, SIGNPOST_LOAD, SouthRijonGateDirectionsSign
	signpost 31,  9, SIGNPOST_LOAD, SouthRijonGateBorderSign

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 23,  7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SouthRijonGate_NPC_1, -1