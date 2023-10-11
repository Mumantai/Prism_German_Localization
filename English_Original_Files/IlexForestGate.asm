IlexForestGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

IlexForestGateNPC:
	ctxt "Ilex Forest is"
	line "big. Be careful!"

	para "You've seen worse?"

	para "You've made me"
	line "curious."

	para "Now I want to"
	line "visit the Naljo"
	cont "region."
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
