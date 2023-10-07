OwsauriPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OwsauriPokecenterNPC1:
	ctxt "North of Jaeru"
	line "City's the league"
	cont "of this region."

	para "But you already"
	line "knew that, right?"
	done

OwsauriPokecenterNPC2:
	ctxt "Don't go into that"
	line "Gym without a"
	cont "sweater!"
	done

OwsauriPokecenterNPC3:
	ctxt "They opened up a"
	line "place in Hayward"
	para "City for geolo-"
	line "gists to study the"
	para "earthquakes that"
	line "have been striking"
	cont "the region."
	done

OwsauriPokecenter_MapEventHeader:
	;filler
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
