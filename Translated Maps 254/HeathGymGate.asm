HeathGymGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGymGateNPC:
	ctxt "Vor langer Zeit"
	line "wurde diese Region"
	para "von den Wächtern"
	line "beschützt."
	para "Nur die Nachfahrn"
	line "des Boten können"
	cont "sie zähmen."
	para "Der einzig"
	line "bekannte Nachfahre"
	para "ist ein sehr"
	line "starker Trainer."
	para "Vor langer Zeit"
	line "ist er gemeinsam"
	para "mit seiner Familie"
	line "weggezogen <...>"
	done

HeathGymGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $9, $d, 1, HEATH_GYM
	warp_def $9, $e, 1, HEATH_GYM
	warp_def $6, $13, 2, HEATH_VILLAGE
	warp_def $7, $13, 1, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_KIMONO_GIRL, 5, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathGymGateNPC, -1