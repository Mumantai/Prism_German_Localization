HaywardMartF4_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardMartF4NPC:
	ctxt "I'm so thankful"
	line "that they sell"
	cont "Repels here."

	para "I never go into"
	line "caves without"
	cont "them!"
	done

HaywardMartF4_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $0, $d, 1, HAYWARD_MART_F5
	warp_def $0, $10, 2, HAYWARD_MART_F3
	warp_def $0, $2, 1, HAYWARD_MART_ELEVATOR

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 0, 3, SIGNPOST_JUMPSTD, elevatorbutton

.ObjectEvents
	db 2
	person_event SPRITE_CLERK, 7, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_STANDARD, HAYWARD_STANDARD_MART_4, -1
	person_event SPRITE_SUPER_NERD, 4, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, HaywardMartF4NPC, -1
