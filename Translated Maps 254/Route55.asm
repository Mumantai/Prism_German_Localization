Route55_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .unlock_rijon_second_half

.unlock_rijon_second_half
	setevent EVENT_RIJON_SECOND_PART
	return

Route55HiddenItem:
	dw EVENT_ROUTE_55_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route55DirectionsSign:
	ctxt "Felsenberg"
	next "<UP>  Unterführung"
	next "<UP><LEFT> Regenbogenturm"
	next "<UP><RIGHT> Felsenberg"
	next "<DOWN>  Merson City"
	done

Route55TowerSign:
	checkcode VAR_FACING
	loadarray .SignpostPointersArray
	readarrayhalfword 0
	loadsignpost -1

.SignpostPointersArray
	dw .FacingDown
.SignpostPointersArrayEntrySizeEnd:
	dw .FacingUp
	dw .FacingLeft
	dw .FacingRight

.FacingUp ; cannot read sign facing up
.FacingDown
.facingLeftEntryPoint
	stxt "<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT> Du"
	done

.FacingLeft
	stxt "Regenbogen"
	nl   "   Turm"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>"
	nl   "           <UP>"
	nl   "          Du@"
	done

.FacingRight
	nl   "   Turm"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>@"
	start_asm
	ld hl, .facingLeftEntryPoint
	ret

Route55_Trainer_1:
	trainer EVENT_ROUTE_55_TRAINER_1, HIKER, 5, .before_battle_text, Route55_Trainers_1_2_BattleWon_Text

	ctxt "Wieso mit deinen"
	line "#mon fliegen,"
	para "wenn du mit ihnen"
	line "laufen kannst?"
	done

.before_battle_text
	ctxt "Den längeren Weg"
	line "zu wählen, stärkt"
	cont "deinen Willen!"
	done

Route55_Trainer_2:
	trainer EVENT_ROUTE_55_TRAINER_2, HIKER, 6, .before_battle_text, Route55_Trainers_1_2_BattleWon_Text

	ctxt "Ich nehme an, die"
	line "verrückten Typen"
	para "im Norden möchten,"
	line "dass ihr Turm"
	para "nicht so leicht"
	line "erreichbar ist."
	done

.before_battle_text
	ctxt "Wieso kümmert sich"
	line "keiner darum, dass"
	para "man hier vorbei"
	line "kann?"
	done

Route55_Trainer_3:
	trainer EVENT_ROUTE_55_TRAINER_3, GENTLEMAN, 1, .before_battle_text, .battle_won_text

	ctxt "Diese Typen"
	line "glauben, dass"
	para "unsere Welt nichts"
	line "weiter ist als ein"
	para "von ihnen"
	line "erschaffenes"
	cont "Spiel."
	para "Ich kann Egomane"
	line "nicht"
	cont "ausstehen<...>"
	done

.before_battle_text
	ctxt "Betreten dieses"
	line "Gebäudes nur auf"
	cont "eigene Gefahr!"
	done

.battle_won_text
	ctxt "Höre nicht auf"
	line "diese falschen"
	cont "Propheten."
	done

Route55_Trainers_1_2_BattleWon_Text:
	ctxt "Gute Übung!"
	done

Route55_Dev:
	ctxt "Hallo!"
	para "Wir haben dieses"
	line "Gebäude"
	cont "übernommen."
	para "Es muss noch"
	line "renoviert werden,"
	para "da die letzten"
	line "Mieter plötzlich"
	para "verschwunden"
	line "sind<...>"
	para "Wir planen, bald"
	line "zu eröffnen!"
	done

Route55_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 0, 1, SILK_TUNNEL_1F
	warp_def 5, 13, 2, ROUTE_55_GATE_UNDERGROUND
	warp_def 49, 12, 1, MT_BOULDER_B1F

.CoordEvents: db 0

.BGEvents: db 3
	signpost 25, 13, SIGNPOST_READ, Route55TowerSign
	signpost 30, 2, SIGNPOST_ITEM, Route55HiddenItem
	signpost 55, 9, SIGNPOST_LOAD, Route55DirectionsSign

.ObjectEvents: db 4
	person_event SPRITE_FISHER, 53, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route55_Trainer_1, -1
	person_event SPRITE_FISHER, 49, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route55_Trainer_2, -1
	person_event SPRITE_GENTLEMAN, 27, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route55_Trainer_3, -1
	person_event SPRITE_COOLTRAINER_M, 22, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route55_Dev, -1