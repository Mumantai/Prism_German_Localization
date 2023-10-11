Apartments1B_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Apartments1BNPC:
	ctxt "That Game Corner"
	line "outside is so"
	para "noisy, even at"
	line "night."

	para "Seems like they've"
	line "never heard of a"
	para "sound-deadening"
	line "board."
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
