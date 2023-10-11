HaywardMartF2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardMartF2NPC1:
	ctxt "Max Repel is"
	line "mankind's greatest"
	cont "invention!"
	done

HaywardMartF2NPC2:
	ctxt "This store's gone"
	line "three days without"
	para "people arguing"
	line "over shoes."
	done

HaywardMartF2_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $0, $d, 1, HAYWARD_MART_F3
	warp_def $0, $10, 3, HAYWARD_MART_F1
	warp_def $0, $2, 1, HAYWARD_MART_ELEVATOR

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 0, 3, SIGNPOST_JUMPSTD, elevatorbutton

.ObjectEvents
	db 4
	person_event SPRITE_CLERK, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_STANDARD, HAYWARD_STANDARD_MART_1, -1
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_STANDARD, HAYWARD_STANDARD_MART_2, -1
	person_event SPRITE_POKEFAN_M, 7, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HaywardMartF2NPC1, -1
	person_event SPRITE_YOUNGSTER, 5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, HaywardMartF2NPC2, -1
