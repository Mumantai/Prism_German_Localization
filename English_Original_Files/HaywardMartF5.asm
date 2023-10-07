HaywardMartF5_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardMartF5NPC1:
	ctxt "Got any cash?"

	para "My #mon need"
	line "their vitamins."
	done

HaywardMartF5NPC2:
	ctxt "My #mon loves"
	line "these enhancers,"
	para "but I'm not sure"
	line "why<...>"
	done

HaywardMartF5NPC3:
	ctxt "X Accuracy works"
	line "well with low"
	cont "accuracy moves."
	done

HaywardMartF5_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $0, $10, 1, HAYWARD_MART_F4
	warp_def $0, $d, 1, HAYWARD_MART_F6
	warp_def $0, $2, 1, HAYWARD_MART_ELEVATOR

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 0, 3, SIGNPOST_JUMPSTD, elevatorbutton

.ObjectEvents
	db 5
	person_event SPRITE_CLERK, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_STANDARD, HAYWARD_STANDARD_MART_5, -1
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_STANDARD, HAYWARD_STANDARD_MART_6, -1
	person_event SPRITE_GENTLEMAN, 4, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HaywardMartF5NPC1, -1
	person_event SPRITE_SAILOR, 5, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, HaywardMartF5NPC2, -1
	person_event SPRITE_TEACHER, 7, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, HaywardMartF5NPC3, -1
