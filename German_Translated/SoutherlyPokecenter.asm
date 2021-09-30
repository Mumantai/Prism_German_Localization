SoutherlyPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SoutherlyPokecenterNPC1:
	ctxt "Ernest war früher"
	line "Feuerwehrmann!"

	para "Dort hat er"
	line "gelernt, seine"
	para "Feuer-#mon zu"
	line "beschützen! "
	done

SoutherlyPokecenterNPC2:
	ctxt "Ich weiß nicht"
	line "viel über Naljo."

	para "Ich wusste ja"
	line "nichtmals, dass es"
	para "existiert, bis sie"
	line "den Pfad öffneten."

	done

SoutherlyPokecenterNPC3:
	ctxt "Du bist den langen"
	line "weg geschwommen?"

	para "Deine #mon"
	line "müssen müde sein!"

	para "Zum Glück bist du"
	line "am richtigen Ort!"

	done

SoutherlyPokecenter_MapEventHeader ;filler
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
