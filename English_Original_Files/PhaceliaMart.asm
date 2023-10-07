PhaceliaMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhaceliaMartNPC1:
	ctxt "Why do we need"
	line "all of these"
	cont "cities?"

	para "I enjoy the calm"
	line "countryside."

	para "An old man like"
	line "me can't take"
	para "any more stress"
	line "in his life, but"
	para "the construction"
	line "sounds keep"
	cont "waking me up."
	done

PhaceliaMartNPC2:
	ctxt "Andre is a beast!"

	para "He opened a Gym"
	line "here before they"
	para "started building"
	line "the city."

	para "A Gym in a cave,"
	line "imagine that?"
	done

PhaceliaMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 5, PHACELIA_CITY
	warp_def $7, $7, 5, PHACELIA_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, PHACELIA_STANDARD_MART, -1
	person_event SPRITE_GRAMPS, 6, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaMartNPC1, -1
	person_event SPRITE_BLACK_BELT, 2, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaMartNPC2, -1
