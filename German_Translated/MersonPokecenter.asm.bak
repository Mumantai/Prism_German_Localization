MersonPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MersonPokecenterNPC1:
	ctxt "Der Weg zur"
	line "Süd-Rijon-Region"
	para "hätte schon längst"
	line "wieder frei sein"
	cont "müssen!"

	done

MersonPokecenterNPC2:
	ctxt "Es gibt da einen"
	line "Mann, der sehr an"
	para "einem"
	line "vollständigen"
	para "#dex"
	line "interessiert ist."

	para "Er hat mir vier"
	line "Goldmünzen"
	para "gegeben, weil ich"
	line "mehr als 30"
	cont "#mon besitze!"

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
