OwsauriMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OwsauriMartNPC1:
	ctxt "Lucky Punch only"
	line "works on one"
	cont "#mon!"
	done

OwsauriMartNPC2:
	ctxt "Shiny Stones can"
	line "evolve certain"
	para "#mon, and they"
	line "can also be used"
	cont "to make rings."
	done

OwsauriMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 2, OWSAURI_CITY
	warp_def $7, $7, 2, OWSAURI_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, OWSAURI_STANDARD_MART, -1
	person_event SPRITE_BUENA, 6, 11, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, OwsauriMartNPC1, -1
	person_event SPRITE_BURGLAR, 2, 0, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, OwsauriMartNPC2, -1
