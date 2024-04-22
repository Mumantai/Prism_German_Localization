SpurgeCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SPURGE_CITY
	return

SpurgeCityCitySign:
	ctxt "Die Stadt, in der"
	next "alles passieren"
	next "kann!"
	done

SpurgeCityOrphanageSign:
	ctxt "Waisenhaus"
	done

SpurgeCityCasinoSign:
	ctxt "Euphorbia Casino"
	next "Mach das große"
	next "Geld!"
	done

SpurgeCityIslandSign:
	signpostheader 5
	done

SpurgeCityGymGuard:
	ctxt "Mir wurde gesagt,"
	line "ich soll die Arena"
	para "blockieren, bis"
	line "der Leiter zurück"
	cont "ist."
	para "Langsam schlafen"
	line "meine Beine ein."
	done

SpurgeCityNPC1:
	ctxt "Ich habe ein"
	line "#mon aus dem"
	para "Waisenhaus"
	line "adoptiert."
	para "Das Arme hatte am"
	line "ganzen Körper"
	cont "blaue Flecken."
	done

SpurgeCityNPC2:
	ctxt "Ich habe vorhin"
	line "eine laute"
	cont "Explosion gehört."
	para "Was war das nur?"
	done

SpurgeCityNPC3:
	ctxt "Zzz <...>"
	para "Oh, äh, was?"
	para "Ich bin wohl"
	line "eingeschlafen!"
	para "Ich habe die"
	line "Schlüssel zu"
	para "meiner Wohnung"
	line "verloren und suche"
	para "schon den ganzen"
	line "Tag nach ihnen."
	done

SpurgeCityNPC4:
	ctxt "Wusstest du schon?"
	para "Diese Stadt gab es"
	line "vor zehn Jahren"
	cont "noch nicht."
	para "Und jetzt guck sie"
	line "dir an!"
	para "Wie sie wohl in 20"
	line "Jahren aussehen"
	cont "wird?"
	done

SpurgeCityNPC5:
	ctxt "Ich kümmere mich"
	line "nur um den Garten."
	para "Die Stadt wächst"
	line "immer weiter"
	para "Richtung Norden,"
	line "also muss ich ihn"
	cont "auch verschieben."
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
	line "TM gebe, kümmerst"
	para "du dich dann um"
	line "deinen eigenen"
	cont "Kram?"
	sdone

.after_TM_text
	ctxt "TM 39 enthält"
	line "Sternschauer!"
	para "Diese Attacke"
	line "verfehlt nie ihr"
	para "Ziel, außer der"
	line "Gegner benutzt"
	para "Fliegen, Schaufler"
	line "oder Schutzschild."
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

.BGEvents: db 5
	signpost 25, 31, SIGNPOST_LOAD, SpurgeCityCitySign
	signpost 25, 11, SIGNPOST_LOAD, SpurgeCityOrphanageSign
	signpost 19, 29, SIGNPOST_LOAD, SpurgeCityCasinoSign
	signpost 27,  7, SIGNPOST_LOAD, SpurgeCityIslandSign
	signpost 12, 32, SIGNPOST_JUMPSTD, qrcode, QR_SPURGE

.ObjectEvents: db 7
	person_event SPRITE_SCHOOLBOY, 6, 34, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeCityGymGuard, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_LASS, 28, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC1, -1
	person_event SPRITE_POKEFAN_M, 25, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC2, -1
	person_event SPRITE_SCHOOLBOY, 18, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC3, -1
	person_event SPRITE_SAILOR, 14, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC4, -1
	person_event SPRITE_BEAUTY, 7, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC5, -1
	person_event SPRITE_PSYCHIC, 13, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeCitySwiftTMPerson, -1