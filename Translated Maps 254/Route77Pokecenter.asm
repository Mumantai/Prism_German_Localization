Route77Pokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route77PokecenterNPC1:
	ctxt "Ein #mon Center"
	line "neben einer Höhle?"
	para "Sehr gute Idee!"
	done

Route77PokecenterNPC2:
	ctxt "Unterhalb der"
	line "Höhle, gab es mal"
	cont "eine Stadt."
	
	para "Darum auch dieses"
	line "#mon-Center."
	done

Route77Pokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 4, ROUTE_77
	warp_def $7, $5, 4, ROUTE_77
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_ROCKER, 13, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, Route77PokecenterNPC1, -1
	person_event SPRITE_POKEFAN_F, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route77PokecenterNPC2, -1