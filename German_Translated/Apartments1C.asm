Apartments1C_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Apartments1CNPC:
	ctxt "Was, meine Tür war"
	line "offen?!"

	para "Entschuldige, aber"
	line "kannst du dich mal"
	cont "vom Acker machen?"

	para "Jetzt?!"
	done

Apartments1C_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 6, APARTMENTS_F2
	warp_def $7, $3, 6, APARTMENTS_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_TEACHER, 4, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Apartments1CNPC, -1
