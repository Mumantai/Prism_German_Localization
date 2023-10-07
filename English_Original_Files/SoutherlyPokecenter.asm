SoutherlyPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyPokecenterNPC1:
	ctxt "Ernest used to be"
	line "a firefighter!"

	para "That experience"
	line "has taught him how"
	para "to protect his"
	line "fire #mon!"
	done

SoutherlyPokecenterNPC2:
	ctxt "I don't know much"
	line "about Naljo."

	para "There used to be a"
	line "bridge to it in"
	para "Palmtree Resort,"
	line "but a bad storm"
	para "destroyed it a few"
	line "years back."

	para "Since then, no one"
	line "can agree on who"
	para "pays for the"
	line "reconstruction."
	done

SoutherlyPokecenterNPC3:
	ctxt "You surfed that"
	line "long path?"

	para "Your #mon must"
	line "be really tired!"

	para "Thank goodness you"
	line "are at the right"
	cont "place!"
	done

SoutherlyPokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 7, SOUTHERLY_CITY
	warp_def $7, $5, 7, SOUTHERLY_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_ROCKER, 5, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyPokecenterNPC1, -1
	person_event SPRITE_SUPER_NERD, 7, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyPokecenterNPC2, -1
	person_event SPRITE_POKEFAN_M, 3, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyPokecenterNPC3, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
