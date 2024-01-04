SaffronMagnetTrain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronMagnetTrainEmployee:
	farjump MagnetTrainScript

SaffronMagnetTrainNPC1:
	ctxt "Mit dem Zug zu"
	line "fahren, ist super"
	cont "zum Entspannen."
	done

SaffronMagnetTrainNPC2:
	ctxt "<``>Wir sind auf dem"
	line "Weg<''>?"
	para "Was soll das"
	line "denn bedeuten?"
	para "Ich fahr doch zu"
	line "ihnen! Sie sollten"
	para "sollten schon"
	line "längst da sein!"
	para "Ich will nicht auf"
	line "die schiefe Bahn"
	para "geraten, nur weil"
	line "sie noch nicht"
	cont "da sind!"
	done

SaffronMagnetTrain_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $11, $8, 6, SAFFRON_CITY
	warp_def $11, $9, 7, SAFFRON_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronMagnetTrainEmployee, -1
	person_event SPRITE_ROCKER, 14, 11, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SaffronMagnetTrainNPC1, -1
	person_event SPRITE_POKEFAN_F, 10,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, SaffronMagnetTrainNPC2, -1