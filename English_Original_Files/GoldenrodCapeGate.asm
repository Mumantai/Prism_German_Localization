GoldenrodCapeGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodCapeGateNPC:
	ctxt "I hope you enjoy"
	line "the view!"
	done

GoldenrodCapeGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 1, GOLDENROD_CAPE
	warp_def $5, $0, 2, GOLDENROD_CAPE
	warp_def $4, $9, 7, GOLDENROD_CITY
	warp_def $5, $9, 8, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodCapeGateNPC, -1
