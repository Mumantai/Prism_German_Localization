MoragaTown_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_MORAGA_TOWN
	return

MoragaTown_GoldToken:
	dw EVENT_MORAGA_TOWN_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

MoragaTownGymSign:
	ctxt "#mon Arena"
	next "Leiter: Lois"
	nl " "
	next "Die harmonische"
	next "Pflanzen-Trainerin"

	done

MoragaTownTownSign:
	ctxt "Eigentlich gar"
	next "keine Stadt."


	done

MoragaTownClosedSign:
	ctxt "Wegen Renovierung"
	next "geschlossen."

	done

MoragaTownNPC1:
	ctxt "Warum sollte"
	line "jemand die Blumen"
	para "im Eingangsbereich"
	line "pflanzen?"

	para "Die werden immer "
	line "zertrampelt!"

	done

MoragaTownNPC2:
	ctxt "Ich habe gehört,"
	line "dass in diesem"
	para "großen Gebäude ein"
	line "Museum errichtet"
	para "werden soll."

	line "Wir könnten etwas"
	cont "Kultur gebrauchen."

	done

MoragaTownNPC3:
	ctxt "In diesen schmalen"
	line "Pfaden bilden sich"
	para "ständig lästige"
	line "Menschen "
	cont "Ansammlungen."

	para "Sie in Bewegung zu"
	line "bringen ist"
	para "schwieriger als"
	line "ein Relaxo "
	cont "aufzuwecken."

	done

MoragaTownNPC4:
	ctxt "Warum sie einen"
	line "alten Mann nicht"
	para "in die Arena"
	line "lassen, ist mir"
	cont "ein Rätsel!"

	done

MoragaTown_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def $21, $2b, 2, MORAGA_GATE_UNDERGROUND
	warp_def $15, $3, 1, MORAGA_MART
	warp_def $3, $5, 1, MORAGA_TM_MACHINE
	warp_def $5, $1e, 1, MORAGA_GYM
	warp_def $f, $9, 1, MORAGA_HOUSE
	warp_def $7, $27, 1, MORAGA_POKECENTER
	warp_def $1d, $5, 1, MORAGA_DINER
	warp_def $13, $28, 3, SILK_TUNNEL_1F

.CoordEvents
	db 0

.BGEvents
	db 6
	signpost 7, 29, SIGNPOST_LOAD, MoragaTownGymSign
	signpost 7, 40, SIGNPOST_JUMPSTD, pokecentersign
	signpost 21, 4, SIGNPOST_JUMPSTD, martsign
	signpost 29, 25, SIGNPOST_LOAD, MoragaTownTownSign
	signpost 27, 33, SIGNPOST_LOAD, MoragaTownClosedSign
	signpost 6, 10, SIGNPOST_ITEM, MoragaTown_GoldToken

.ObjectEvents
	db 5
	person_event SPRITE_POKE_BALL, 12, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, KINGS_ROCK, EVENT_MORAGA_TOWN_ITEM_KINGS_ROCK
	person_event SPRITE_TEACHER, 22, 40, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, MoragaTownNPC1, -1
	person_event SPRITE_POKEFAN_F, 28, 20, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaTownNPC2, -1
	person_event SPRITE_COOLTRAINER_M, 11, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaTownNPC3, -1
	person_event SPRITE_SAGE, 6, 27, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaTownNPC4, -1
