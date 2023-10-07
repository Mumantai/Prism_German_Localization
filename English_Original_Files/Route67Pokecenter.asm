Route67Pokecenter_MapScriptHeader:
 ;trigger count
	db 0

 ;callback count
	db 0

Route67PokecenterNPC:
	ctxt "Up ahead is Seneca"
	line "Caverns."

	para "It became a very"
	line "popular place for"
	para "Trainers after the"
	line "warp was added."

	para "They practice with"
	line "other Trainers to"
	para "prepare for the"
	line "Rijon League."
	done

Route67Pokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 4, ROUTE_67
	warp_def $7, $5, 4, ROUTE_67
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_LASS, 4, 1, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, Route67PokecenterNPC, -1
