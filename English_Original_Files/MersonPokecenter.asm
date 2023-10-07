MersonPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonPokecenterNPC1:
	ctxt "That path to South"
	line "Rijon should have"
	para "been cleared a"
	line "long time ago."
	done

MersonPokecenterNPC2:
	ctxt "There's a man who"
	line "is very interested"
	cont "in a full #dex."

	para "He gave me four"
	line "Gold Tokens"
	para "because I own more"
	line "than 30 #mon!"
	done

MersonPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 1, MERSON_CITY
	warp_def $7, $5, 1, MERSON_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_YOUNGSTER, 6, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, MersonPokecenterNPC1, -1
	person_event SPRITE_TEACHER, 4, 0, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, MersonPokecenterNPC2, -1
