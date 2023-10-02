MoragaMoveRelearner_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaMoveRelearnerScript:
	faceplayer
	opentext
	checkevent EVENT_MET_MOVE_RELEARNER
	sif false, then
		writetext .intro_text
		setevent EVENT_MET_MOVE_RELEARNER
	sendif
	special MoveRelearner
	endtext

.intro_text
	ctxt "Hallo! Ich bin der"
	para "Attacken-Maniac!"
	para "Ich kann deinen"
	line "#mon helfen,"
	para "sich an Attacken"
	line "zu erinnern, die"
	para "sie verlernt"
	line "haben."
	para "Als Gegenleistung"
	line "hätte ich gerne"
	cont "eine Herzschuppe."
	para "Die sammle ich"
	line "nämlich."
	prompt

MoragaMoveRelearner_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 3, MORAGA_TOWN
	warp_def $7, $3, 3, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_GENTLEMAN, 4, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoragaMoveRelearnerScript, -1