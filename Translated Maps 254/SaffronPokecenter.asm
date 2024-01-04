SaffronPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronPokecenterNPC1:
	ctxt "Der aktuelle CEO"
	line "der Silph Co. war"
	para "einmal der Champ"
	line "von Kanto."
	para "Wenn das nicht mal"
	line "bemerkenswert ist!"
	done

SaffronPokecenterNPC2:
	ctxt "Die Magnetbahn"
	line "wurde in den"
	para "letzten Jahren"
	line "ständig erweitert."
	para "Sie fährt jetzt in"
	line "vier Regionen!"
	done

SaffronPokecenterNPC3:
	ctxt "Ich habe gehört,"
	line "dass einige"
	para "legendäre Trainer"
	line "auf einer geheimen"
	para "Insel leben"
	line "sollen."
	para "Es ist nur ein"
	line "gerücht, aber"
	para "niemand weiß, wo"
	line "sie sich seit"
	para "einiger Zeit"
	line "aufhalten."
	done

SaffronPokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 9, SAFFRON_CITY
	warp_def $7, $5, 9, SAFFRON_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_GENTLEMAN, 4, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronPokecenterNPC1, -1
	person_event SPRITE_FISHING_GURU, 5, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronPokecenterNPC2, -1
	person_event SPRITE_POKEFAN_F, 3, 0, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronPokecenterNPC3, -1