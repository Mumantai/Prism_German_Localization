IlexForestGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

IlexForestGateNPC:
	ctxt "Das "
	line "Steineichenwald "
	cont "ist groß."

	para "Pass gut auf."

	line "Du hast "
	para "schlimmeres "
	line "gesehen?"

	para "jetzt hast du mich"
	line "neugierig gemacht."

	para "Jetzt muss ich "
	line "nach Naljo."

	done

IlexForestGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 2, ILEX_FOREST
	warp_def $5, $0, 3, ILEX_FOREST
	warp_def $4, $9, 1, AZALEA_TOWN
	warp_def $5, $9, 2, AZALEA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, IlexForestGateNPC, -1
