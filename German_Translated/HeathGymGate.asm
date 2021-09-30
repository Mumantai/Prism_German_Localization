HeathGymGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HeathGymGateNPC:
	ctxt "Vor Jahrzehnten"
	line "wurde diese Region"
	para "von den Wächtern"
	line "überwacht."

	para "Nur ein Nachfahre"
	line "des Boten kann sie"
	cont "zähmen."

	para "Der einzig"
	line "bekannte nachfahre"
	para "ist ein starker"
	line "Trainer."

	para "Vor langer Zeit"
	line "ist er gemeinsam"
	para "mit seiner Familie"
	line "fortgezogen<...>"
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
	person_event SPRITE_LOIS, 5, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathGymGateNPC, -1
