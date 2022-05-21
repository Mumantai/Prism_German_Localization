HeathGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HeathGateGuard:
	ctxt "Für die Sicherheit"
	line "haben wir mehrere"
	cont "Mauten installiert"

	para "Einpaar Idioten"
	line "kamen vorbei und"
	para "vandalisierten"
	line "hier rum."
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
	ctxt "Bitte erzähle es"
	line "niemanden, dass"
	cont "ich nur zusah<...>"

	para "Huh? Warum ich Mr."
	line "Gummianzug nicht"
	cont "aufgehalten habe?"

	para "Er schrie mich an"
	line "als ich sein Anzug"
	cont "Gummianzug nannte."

	para "Meine Gefühle"
	line "wurden so verletzt"
	cont "dass ich ne pause"
	cont "gebraucht habe."
	
	para "Sags keinem und"
	line "gebe dir diese VM."
	sdone
	
.after_HM_text
	ctxt "VM01 ist"
	line "Zerschneider!"

	para "Hiermit kannst du"
	line "Bäume fällen, die"
	cont "zuvor deinen Weg"
	cont "blockiert haben."
	
	para "Wie der Baum im"
	line "Osten von hier."
	
	para "Dafür brauchst du"
	line "den Natur Orden."

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
	ctxt "Oh gut, du bists."

	para "Ich habe gehört"
	line "was du aus dem<...>"
	para "nervigen<...>"
	line "Pink Patroller"
	cont "gemacht hast<...>"

	para "Wer gibt dir das"
	line "Recht, so mit"
	cont "Ihnen umzugehen?"

	para "Ich muss dir mal"
	line "ne Lehre erteilen!"
	done

.battle_won_text
	ctxt "Was ist hier nur"
	line "los!?"

	para "Ich, einer der"
	line "stärksten Trainer"
	para "dieser Erde,"
	line "besiegt von einem"
	cont "Kind!"

	para "Egal, Ich habe"
	line "große Pläne um in"
	para "Naljo alles wieder"
	line "zu korrigieren."

	para "Diesmal hattest du"
	line "Glück! Bis zum"
	cont "nächstenmal!"
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
