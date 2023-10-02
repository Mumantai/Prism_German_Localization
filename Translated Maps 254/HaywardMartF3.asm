HaywardMartF3_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardMartF3NPC1:
	ctxt "Auf dieser Etage"
	line "wurden früher"
	para "Videospiele"
	cont "verkauft."
	done

HaywardMartF3NPC2:
	text "MUSS"
	para "VIDEOSPIELE"
	para "SPIELEN!"
	done

HaywardMartF3NPC3:
	ctxt "Geh weg, ich habe"
	line "schon fast den"
	cont "Highscore!"
	done

HaywardMartF3NPC4:
	ctxt "Wo sind die"
	line "Videospiele hin?"
	done

HaywardMartF3_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $0, $10, 1, HAYWARD_MART_F2
	warp_def $0, $d, 2, HAYWARD_MART_F4
	warp_def $0, $2, 1, HAYWARD_MART_ELEVATOR

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 0, 3, SIGNPOST_JUMPSTD, elevatorbutton

.ObjectEvents
	db 5
	person_event SPRITE_CLERK, 5, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_MART, 0, MART_STANDARD, HAYWARD_STANDARD_MART_3, -1
	person_event SPRITE_YOUNGSTER, 5, 0, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, HaywardMartF3NPC1, -1
	person_event SPRITE_GAMEBOY_KID, 2, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HaywardMartF3NPC2, -1
	person_event SPRITE_GAMEBOY_KID, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, HaywardMartF3NPC3, -1
	person_event SPRITE_SUPER_NERD, 6, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HaywardMartF3NPC4, -1