SpurgeCity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SPURGE_CITY
	return

SpurgeCityCitySign:
	ctxt "Die Stadt, in"
	next "der nichts"
	next "unmöglich ist!"
	done

SpurgeCityOrphanageSign:
	ctxt "Waisenhaus"
	done

SpurgeCityQRCode:
	opentext
	qrcode 6
	checkitem QR_READER
	sif false
		closetextend
	farwritetext UsingQRScannerText
	playwaitsfx SFX_CALL
	jumptext .text

.text
	ctxt "Kristall-Ei -"
	line "Seidenpassage im"
	cont "ersten Flur."
	done

SpurgeCityCasinoSign:
	ctxt "Euphorbia Casino"
	next "Mach das große"
	next "Geld!"
	done

SpurgeCityGymGuard:
	ctxt "Ich bewache diese"
	line "Arena, bis der"
	cont "Leiter zurück ist."


	para "Meine Beine sind"
	line "eingeschlafen <...>"
	done

SpurgeCityNPC1:
	ctxt "Vorhin adoptierte"
	line "ich ein #mon"
	cont "vom Waisenhaus."

	para "Das arme Ding"
	line "hatte Prellungen"
	cont "am ganzen Körper."
	done

SpurgeCityNPC2:
	ctxt "Vor einer weile"
	line "hörte ich eine"
	cont "laute Explosion."
	para "Was das wohl war?"
	
	done

SpurgeCityNPC3:
	ctxt "Zzz <...>"

	para "Oh, uh, was?"

	para "Ich bin plötzlich"
	line "eingeschlafen!"

	para "Ich habe die"
	line "Schlüssel zu"
	cont "meiner Wohnung"
	cont "verloren."

	para "Ich suche sie"
	line "seit 6 Stunden!"
	done

SpurgeCityNPC4:
	ctxt "Wusstest du schon?"

	para "Vor 10 Jahren gab"
	line "es diese Stadt"
	cont "noch nicht."

	para "Schau sie dir"
	line "jetzt an!"

	para "Was wird wohl in"
	line "20 Jahren sein?"
	done

SpurgeCityNPC5:
	ctxt "Ich kümmere mich"
	line "um den Garten."

	para "Die Stadt wächst"
	line "und verdrängt die"
	cont "die Natur <...>"

	para "Den Garten bau ich"
	line "einfach mit aus."
	done

SpurgeCitySwiftTMPerson:
	faceplayer
	opentext
	checkevent EVENT_GET_TM39
	sif true
		jumptext .after_TM_text
	writetext .offer_TM_text
	givetm TM_SWIFT + RECEIVED_TM
	setevent EVENT_GET_TM39
	closetextend

.offer_TM_text
	ctxt "Was ich hier"
	line "mache?"

	para "Wenn ich dir diese"
	line "TM gebe, nervst du"
	para "du dann bitte"
	line "jemand anderes?"
	sdone

.after_TM_text
	ctxt "TM39 ist"
	line "Sternschauer"

	para "Diese Attacke"
	line "trifft immer!"
	para "Außer, wenn der"
	line "Gegner Fliegen,"
	cont "Schaufler oder"
	cont "Schutz einsetzt."
	done

SpurgeCity_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 23, 33, 1, SPURGE_POKECENTER
	warp_def 17, 20, 1, APARTMENTS_F1
	warp_def 17, 28, 1, SPURGE_GAME_CORNER
	warp_def 29, 5, 68, MOUND_B3F
	warp_def 23, 5, 1, SPURGE_HOUSE
	warp_def 5, 34, 1, SPURGE_GYM_1F
	warp_def 23, 12, 1, ORPHANAGE
	warp_def 25, 20, 1, SPURGE_MART
	warp_def 29, 6, 68, MOUND_B3F

.CoordEvents: db 0

.BGEvents: db 6
	signpost 25, 31, SIGNPOST_LOAD, SpurgeCityCitySign
	signpost 25, 11, SIGNPOST_LOAD, SpurgeCityOrphanageSign
	signpost 19, 29, SIGNPOST_LOAD, SpurgeCityCasinoSign
	signpost 23, 34, SIGNPOST_JUMPSTD, pokecentersign
	signpost 25, 24, SIGNPOST_JUMPSTD, martsign
	signpost 12, 32, SIGNPOST_READ, SpurgeCityQRCode

.ObjectEvents: db 7
	person_event SPRITE_SCHOOLBOY, 6, 34, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeCityGymGuard, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_LASS, 28, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC1, -1
	person_event SPRITE_POKEFAN_M, 25, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC2, -1
	person_event SPRITE_SCHOOLBOY, 18, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC3, -1
	person_event SPRITE_SAILOR, 14, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC4, -1
	person_event SPRITE_BEAUTY, 7, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC5, -1
	person_event SPRITE_PSYCHIC, 13, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeCitySwiftTMPerson, -1
