PhloxTown_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 2

	dbw 5, .set_fly_flag
	dbw MAPCALLBACK_TILES, .open_lab_door

.set_fly_flag
	setflag ENGINE_FLYPOINT_PHLOX_TOWN
	return

.open_lab_door
	checkevent EVENT_PHLOX_LAB_UNLOCKED
	sif true
		changeblock 14, 4, $17
	return

PhloxTownBingoSign:
	ctxt "Bingo Halle"
	done

PhloxTownAcquaMinesSign:
	ctxt "Wasserminen"
	done

PhloxTownLabSign:
	ctxt "Algernon"
	next "Laboratorium"
	done

PhloxTownTownSign:
	ctxt "Der Ruhige"
	next "Gebirgsruecken!"
	done

PhloxTownNPC1:
	ctxt "In diesen Gebieten"
	line "ist es fast immer"
	cont "kalt."

	para "Sogar mitten im"
	line "Sommer."
	done

PhloxTownNPC2:
	ctxt "Uns gefällt es"
	line "abgeschottet von"
	para "allen anderen zu"
	line "sein."

	para "Es muss ja nicht"
	line "alles und jeder"
	para "mit jedem"
	line "verbunden sein<...>"
	
	para "Ruhe ist auch"
	line "etwas Wunder-"
	cont "schönes!"
	done

PhloxTownNPC3:
	ctxt "Das Gebäude wurde"
	line "auf mein liebstes"
	cont "Angelplatz gebaut."

	para "Sie hatten eine"
	line "erlaubnis, daher"
	para "konnte ich nichts"
	line "tun<...>"
	done

PhloxTownNPC4:
	ctxt "Es gibt hier eine"
	line "abgeschottete"
	cont "untergrund Höhle."

	para "Am Tag is es"
	line "hin & wieder"
	para "komplett mit"
	line "Wasser geflutet!"
	done

PhloxTownLabDoor:
	opentext
	checkevent EVENT_PHLOX_LAB_UNLOCKED
	sif true
		jumptext .already_unlocked_text
	checkitem LAB_CARD
	sif false
		jumptext .locked_text
	setevent EVENT_PHLOX_LAB_UNLOCKED
	playsound SFX_TRANSACTION
	writetext .unlocked_door_text
	closetext
	changeblock 14, 4, $17
	reloadmappart
	end

.unlocked_door_text
	ctxt "Du öffnest die"
	line "Tür mit der"
	cont "Laborkarte!"
	sdone

.locked_text
	ctxt "Die Tür ist"
	line "verschlossen."
	done

.already_unlocked_text
	ctxt "Die Tür ist"
	line "bereits offen."
	done

PhloxTown_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 17, 13, 1, PHLOX_POKECENTER
	warp_def 23, 29, 1, PHLOX_MART
	warp_def 5, 14, 1, PHLOX_LAB_1F
	warp_def 27, 7, 2, PHLOX_ENTRY
	warp_def 23, 21, 1, PHLOX_BINGO
	warp_def 15, 21, 1, PHLOX_MYLES
	warp_def 9, 27, 2, ACQUA_PHLOXENTRANCE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 25, 19, SIGNPOST_LOAD, PhloxTownBingoSign
	signpost 9, 23, SIGNPOST_LOAD, PhloxTownAcquaMinesSign
	signpost 5, 11, SIGNPOST_LOAD, PhloxTownLabSign
	signpost 29, 13, SIGNPOST_LOAD, PhloxTownTownSign
	signpost 5, 14, SIGNPOST_READ, PhloxTownLabDoor

.ObjectEvents: db 4
	person_event SPRITE_COOLTRAINER_M, 13, 30, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC1, -1
	person_event SPRITE_YOUNGSTER, 29, 19, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC2, -1
	person_event SPRITE_FISHING_GURU, 6, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC3, -1
	person_event SPRITE_POKEFAN_F, 16, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC4, -1
