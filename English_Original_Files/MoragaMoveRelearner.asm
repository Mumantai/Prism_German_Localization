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
	ctxt "Hello! I'm the"
	line "Move Relearner!"

	para "I can help your"
	line "#mon remember"
	para "moves that they"
	line "have forgotten."

	para "I can do this for"
	line "you, in exchange"
	cont "for a Heart Scale."

	para "I collect them,"
	line "you see."
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
