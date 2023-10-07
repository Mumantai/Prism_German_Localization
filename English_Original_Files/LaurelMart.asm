LaurelMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelMartNPC:
	ctxt "You can find Gold"
	line "Tokens in most"
	para "places, but only"
	line "one for each area."

	para "One here in Laurel"
	line "City, one in Route"
	cont "75, and so on."
	done

LaurelMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $7, 9, LAUREL_CITY
	warp_def $7, $6, 9, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, LAUREL_STANDARD_MART, -1
	person_event SPRITE_SUPER_NERD, 6, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelMartNPC, -1
	person_event SPRITE_CLERK, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_MART, 0, MART_GOLDTOKEN, LAUREL_GOLD_TOKEN_MART, -1
