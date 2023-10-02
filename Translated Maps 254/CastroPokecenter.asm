CastroPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CastroPokecenterNPC1:
	ctxt "Es gibt eine Fähre"
	line "in der Stadt,"
	para "die dich zu den"
	line "Kampfarkaden"
	cont "bringen kann."
	para "Ich weiß aber"
	line "nicht, wo sie die"
	cont "Tickets verkaufen."
	done

CastroPokecenterNPC2:
	ctxt "Ich trainiere, um"
	line "Teil von Kojis"
	cont "Crew zu werden!"
	para "HA!"
	done

CastroPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 5, CASTRO_VALLEY
	warp_def $7, $5, 5, CASTRO_VALLEY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_POKEFAN_M, 6, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroPokecenterNPC1, -1
	person_event SPRITE_BLACK_BELT, 4, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroPokecenterNPC2, -1