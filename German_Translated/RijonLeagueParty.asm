RijonLeagueParty_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueParty_MapEventHeader ;filler
	db 0, 0

;warps
	db 0

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_LANCE, 6, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MOM, 6, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FIRE, 6, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
