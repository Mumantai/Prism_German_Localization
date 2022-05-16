AzaleaPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AzaleaPokecenterNPC1:
	ctxt "Die Mutternatur"
	line "trifft immer gute"
	cont "Entscheidungen."

	para "Vieleicht öffnet"
	line "Sie den Pfad eines"
	para "Tages durch einen"
	line "2. Erdrutsch"
	cont "wieder."
	done

AzaleaPokecenterNPC2:
	ctxt "Wenn du eine"
	line "Aprikoko auf"
	para "brichst, kannst"
	line "du #mon fangen!"

	para "Bevor #bälle"
	line "erfunden wurden,"
	para "nutzte man immer"
	line "Aprikokos."
	done

AzaleaPokecenterNPC3:
	ctxt "Der Erdrutsch"
	line "blockiert den"
	cont "Pfad zu Route 33."
	done

AzaleaPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 5, AZALEA_TOWN
	warp_def $7, $5, 5, AZALEA_TOWN
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_SUPER_NERD, 7, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaPokecenterNPC1, -1
	person_event SPRITE_POKEFAN_F, 4, 0, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaPokecenterNPC2, -1
	person_event SPRITE_FISHING_GURU, 1, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaPokecenterNPC3, -1
