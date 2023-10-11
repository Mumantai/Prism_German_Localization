PhloxMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhloxMartNPC1:
	ctxt "Do you know where"
	line "they sell ski gear"
	cont "around here?"

	para "All mountain"
	line "towns sell winter"
	para "sports equipment,"
	line "don't they?"
	done

PhloxMartNPC2:
	ctxt "Did you know?"

	para "Max Repels used to"
	line "work for only 250"
	cont "steps."

	para "They only started"
	line "selling a 300-step"
	cont "version recently."
	done

PhloxMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 2, PHLOX_TOWN
	warp_def $7, $7, 2, PHLOX_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_SUPER_NERD, 2, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxMartNPC1, -1
	person_event SPRITE_TEACHER, 6, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxMartNPC2, -1
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, PHLOX_STANDARD_MART, -1
