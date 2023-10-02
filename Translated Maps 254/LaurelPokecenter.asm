LaurelPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelPokecenterNPC1:
	ctxt "Karpador sind so"
	line "erbärmlich!"
	para "Wie kann man die"
	line "nur anbeten!?"
	done

LaurelPokecenterNPC2:
	ctxt "Warum ärgert sich"
	line "der Kerl, dass"
	cont "die Stadt wächst?"
	para "Ich finde das"
	line "jedenfalls super!"
	done

LaurelPokecenterNPC3:
	ctxt "Bald ist das hier"
	line "nur eine weitere"
	cont "lieblose Stadt."
	para "Ich finde, das"
	line "ist einfach krank!"
	done

LaurelPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 6, LAUREL_CITY
	warp_def $7, $5, 6, LAUREL_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_POKEFAN_M, 3, 0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, LaurelPokecenterNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 6, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, LaurelPokecenterNPC2, -1
	person_event SPRITE_GYM_GUY, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelPokecenterNPC3, -1