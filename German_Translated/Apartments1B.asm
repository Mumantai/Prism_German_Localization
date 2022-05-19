Apartments1B_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Apartments1BNPC:
	ctxt "Die Spielhalle da"
	line "draußen ist sogar"
	para "bei Nacht immer"
	line "noch so laut <...>"

	para "Die haben wohl"
	line "noch nie von"
	para "schalldämpfenden"
	line "Wänden gehört."
	done

Apartments1B_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 5, APARTMENTS_F2
	warp_def $7, $3, 5, APARTMENTS_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SUPER_NERD, 3, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Apartments1BNPC, -1
