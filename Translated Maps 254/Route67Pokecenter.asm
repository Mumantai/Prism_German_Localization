Route67Pokecenter_MapScriptHeader:
 ;trigger count
	db 0

 ;callback count
	db 0

Route67PokecenterNPC:
	ctxt "Weiter oben"
	line "befindet sich"
	cont "die Senecahöhle."
	para "Seit es den Warp"
	line "dort gibt, sind"
	para "sie unter Trainern"
	line "sehr beliebt."
	para "Sie trainieren mit"
	line "anderen Trainern,"
	para "um fit zu sein für"
	line "die Rijon-Liga."
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