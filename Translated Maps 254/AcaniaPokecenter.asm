AcaniaPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaPokecenterNPC1:
	ctxt "Wenn du nach Osten"
	line "surfst, kommst du"
	cont "zur Rijon-Region."
	para "Jemand baute einen"
	line "Teleporter, der"
	para "Trainer mit allen"
	line "Orden aus Naljo"
	para "zur Rijon-Liga"
	line "bringen kann!"
	done

AcaniaPokecenterNPC2:
	ctxt "Meine #mon und"
	line "ich sind ganz"
	para "wild darauf, die"
	line "Pfeiler des Hafens"
	cont "zu zersägen."
	para "Das sollte Andre"
	line "gefallen oder <...>?"
	done

AcaniaPokecenterNPC3:
	ctxt "Der Leuchtturm"
	line "ist noch immer"
	cont "im Bau, doch"
	para "sie brauchen ein"
	line "Feuer-#mon,"
	para "um das Licht am"
	line "Brennen zu halten."
	done

AcaniaPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 1, ACANIA_DOCKS
	warp_def $7, $5, 1, ACANIA_DOCKS
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_FISHER, 4, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, AcaniaPokecenterNPC1, -1
	person_event SPRITE_BLACK_BELT, 6, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, AcaniaPokecenterNPC2, -1
	person_event SPRITE_SUPER_NERD, 6, 0, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AcaniaPokecenterNPC3, -1