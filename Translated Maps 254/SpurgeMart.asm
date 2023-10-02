SpurgeMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeMartATM:
	opentext
	special Special_SpurgeMartBank
	endtext

SpurgeMartNPC1:
	ctxt "Schau dich gerne"
	line "um. Ich biete"
	cont "viele Spiele an."
	para "Wenn dir was"
	line "gefällt, sag mir"
	cont "bescheid!"
	done

SpurgeMartNPC2:
	ctxt "Sprudel ist nicht"
	line "besonders gesund,"
	para "aber dafür bil-"
	line "liger als Wasser."
	done

SpurgeMartNPC3:
	ctxt "Ein eigenartiger"
	line "Typ, komplett in"
	para "Rot, war hier um"
	line "etwas zu essen."
	para "Mit Rot meine ich"
	line "RICHTIG ROT!"
	para "Helm, jumpsuit."
	line "ALLES war ROT."
	para "Er weigerte sich"
	line "den Helm abzulegen"
	para "also hat er das"
	line "Essen mitgenommen."
	done

SpurgeMartNPC4:
	ctxt "Diese Essensmeile"
	line "schafft es mein"
	para "dickes Bäuchlein"
	line "zu füllen."
	done

SpurgeMartNPC5:
	ctxt "Mein Relaxo mag"
	line "diese Burger auch."
	para "Ich verdrücke aber"
	line "mehr als Relaxo."
	done

SpurgeMartNPC6:
	ctxt "Ich hörte diese"
	line "Milch die hier"
	para "verkauft wird,"
	line "stammt aus Johto."
	done

SpurgeMartNPC7:
	ctxt "Ich möchte gerne"
	line "ein Spiel für mein"
	cont "Sohn reklamieren."
	para "Wer ist 'Frigo'"
	line "Überhaupt?"
	para "Und #mon Quartz"
	line "hatte zu viel"
	cont "profanes in sich!"
	para "Pegi 7 Freigabe?"
	line "Ja klar!"
	done

SpurgeMartNPC8:
	ctxt "Keine Ahnung was"
	line "ich kaufen soll!"
	done

SpurgeMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $23, $14, 8, SPURGE_CITY
	warp_def $23, $15, 8, SPURGE_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 9, 10, SIGNPOST_RIGHT, SpurgeMartATM
	signpost 9, 11, SIGNPOST_LEFT, SpurgeMartATM

.ObjectEvents
	db 14
	person_event SPRITE_CLERK, 8, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_1, -1
	person_event SPRITE_CLERK, 19, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_2, -1
	person_event SPRITE_CLERK, 10, 35, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_3, -1
	person_event SPRITE_CLERK, 12, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_3, -1
	person_event SPRITE_CLERK, 30, 38, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_4, -1
	person_event SPRITE_CLERK, 24, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_GOLDTOKEN, SPURGE_GOLD_TOKEN_MART, -1
	person_event SPRITE_CLERK, 28, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC1, -1
	person_event SPRITE_GENTLEMAN, 10, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC2, -1
	person_event SPRITE_R_GAMBLER, 15, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC3, -1
	person_event SPRITE_FISHER, 11, 33, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC4, -1
	person_event SPRITE_FISHER, 18, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC5, -1
	person_event SPRITE_R_JRTRAINERM, 18, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC6, -1
	person_event SPRITE_TEACHER, 26, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC7, -1
	person_event SPRITE_YOUNGSTER, 29, 19, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC8, -1