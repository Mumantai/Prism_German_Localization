OwsauriPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

OwsauriPokecenterNPC1:
	ctxt "Nördlich von Jaeru"
	line "City ist die Liga"
	cont "dieser Region."

	para "Aber das wusstest"
	line "du bestimmt schon,"
	cont "richtig?"
	done

OwsauriPokecenterNPC2:
	ctxt "Geh nicht in die"
	line "Arena ohne einen"
	cont "Pulli anzuhaben!"
	done

OwsauriPokecenterNPC3:
	ctxt "Sie einen einen"
	line "Ort geschaffen, wo"
	para "Geologen in Hay-"
	line "ward City Erdbeben"
	para "erforschen können,"
	line "die diese Region"
	cont "plagen."
	done

OwsauriPokecenter_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $7, $4, 3, OWSAURI_CITY
	warp_def $7, $5, 3, OWSAURI_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_RECEPTIONIST, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OwsauriPokecenterNPC1, -1
	person_event SPRITE_SUPER_NERD, 6, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriPokecenterNPC2, -1
	person_event SPRITE_SCIENTIST, 6, 0, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, OwsauriPokecenterNPC3, -1
