MersonMart_MapScriptHeader:
;trigger count
	db 0
;callback count
	db 0

MersonMartNPC1:
	ctxt "I can never beat"
	line "Karpman with the"
	para "garbage they sell"
	line "here!"
	done

MersonMartNPC2:
	ctxt "They sell Water"
	line "Stones in a city"
	para "that has a Water"
	line "Gym."

	para "Convenient, huh?"
	done

MersonMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 4, MERSON_CITY
	warp_def $7, $7, 4, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, MERSON_STANDARD_MART, -1
	person_event SPRITE_POKEFAN_M, 5, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MersonMartNPC1, -1
	person_event SPRITE_SUPER_NERD, 2, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, MersonMartNPC2, -1
