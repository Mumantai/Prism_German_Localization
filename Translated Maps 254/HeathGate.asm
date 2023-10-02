HeathGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGateGuard:
	ctxt "Für die Sicherheit"
	line "aller Reisenden"
	para "haben wir mehrere"
	line "Durchgangshäuser"
	cont "aufgebaut."
	para "Ein paar Idioten"
	line "laufen hier rum"
	para "und machen nichts"
	line "als Randale."
	done

HeathGateTrigger:
	checkevent EVENT_GOT_HM01
	sif true
		end
	setevent EVENT_GOT_HM01
	showtext .initial_text
	checkcode VAR_YCOORD
	sif =, 5, then
		applymovement PLAYER, .walk_up
	selse
		spriteface PLAYER, UP
	sendif
	opentext
	writetext .before_HM_text
	givetm HM_CUT + RECEIVED_TM
	jumptext .after_HM_text

.walk_up
	step_up
	step_end

.initial_text
	ctxt "Hey, ich müsste"
	line "mit dir reden."
	sdone

.before_HM_text
	ctxt "Bitte sag keinem,"
	line "dass ich nur"
	cont "zugesehen habe <...>"
	para "Huh? Warum ich den"
	line "Gummianzug nicht"
	cont "aufgehalten habe?"
	para "Er hat mich belei-"
	line "digt, als ich ihn"
	cont "Gummianzug nannte."
	para "Das hat mich so"
	line "verletzt, dass ich"
	cont "erstmal 'ne Pause"
	cont "gebraucht habe."
	para "Hier, für deine"
	line "Verschwiegenheit."
	sdone

.after_HM_text
	ctxt "VM01 ist"
	line "Zerschneider!"
	para "Damit kannst du"
	line "Bäume fällen, die"
	cont "vorher deinen Weg"
	cont "blockiert haben."
	para "Wie den Baum im"
	line "Osten von hier."
	para "Dafür brauchst du"
	line "den Naturorden."
	done

HeathGate_PatrollerRed:
	trainer EVENT_HEATH_GATE_BEAT_RED_PATROLLER, PATROLLER, 15, .before_battle_text, .battle_won_text
	ctxt "Ich kann dich"
	line "nicht leiden."
	para "Niemand von uns."
	para "Kannst du nicht"
	line "einfach aufgeben,"
	para "wie jeder andere"
	line "auch?."
	done

.before_battle_text
	ctxt "Oh gut, du bist's."
	para "Dieser <...> nervige <...>"
	line "Rosa Ranger hat"
	para "mir alles erzählt,"
	line "was du bisher so"
	cont "angestellt hast <...>"
	para "Wer gibt dir das"
	line "Recht, so mit"
	cont "uns umzugehen?!"
	para "Ich muss dir wohl"
	line "mal eine Lehre"
	cont "erteilen."
	done

.battle_won_text
	ctxt "Was ist hier nur"
	line "los!?"
	para "Ich, einer der"
	line "stärksten Trainer"
	para "dieser Erde,"
	line "besiegt von einem"
	cont "Kind!"
	para "Egal, ich habe"
	line "große Pläne, um"
	para "Naljo wieder zum"
	line "Glanz zu bringen."
	para "Diesmal hattest du"
	line "Glück! Doch beim"
	cont "nächsten Mal <...>!"
	done

HeathGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 7, HEATH_VILLAGE
	warp_def $5, $0, 8, HEATH_VILLAGE
	warp_def $4, $9, 1, ROUTE_74
	warp_def $5, $9, 2, ROUTE_74

.CoordEvents
	db 2
	xy_trigger 0, 4, 5, HeathGateTrigger
	xy_trigger 0, 5, 5, HeathGateTrigger

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, HeathGateGuard, -1
	person_event SPRITE_PALETTE_PATROLLER, 3, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, HeathGate_PatrollerRed, EVENT_HEATH_GATE_BEAT_RED_PATROLLER