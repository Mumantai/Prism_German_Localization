CastroMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CastroMartNPC1:
	ctxt "Ether restores"
	line "the PP of one of"
	cont "your moves."
	done

CastroMartNPC2:
	ctxt "Safe Goggles will"
	line "prevent your"
	para "#mon from"
	line "being hurt by"
	cont "weather effects."
	done

CastroMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 3, CASTRO_VALLEY
	warp_def $7, $7, 3, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, CASTRO_STANDARD_MART, -1
	person_event SPRITE_SCIENTIST, 2, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroMartNPC1, -1
	person_event SPRITE_GRANNY, 6, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroMartNPC2, -1
