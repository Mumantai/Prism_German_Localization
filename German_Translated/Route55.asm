Route55_MapScriptHeader;trigger count
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

Route55StudiosSign:
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

.FacingUp
	ctxt "(removed)"
	nl   " Studios."
	nl   "<UP>"
	nl   "<UP>@"
	start_asm
	ld hl, .facingUpEntryPoint
	ret

.FacingDown
	ctxt "(removed)"
	nl   " Studios.@"
.facingUpEntryPoint
	ctxt ""
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <LEFT>@"
.facingLeftEntryPoint
	ctxt "<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT> You"
	done

.FacingLeft
	ctxt "(removed)"
	nl   " Studios."
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>"
	nl   "           <UP>"
	nl   "          You"
	done

.FacingRight
	ctxt "(removed)"
	nl   " Studios."
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>"
	nl   "    <UP>@"
	start_asm
	ld hl, .facingLeftEntryPoint
	ret

Route55_Trainer_1:
	trainer EVENT_ROUTE_55_TRAINER_1, HIKER, 5, .before_battle_text, Route55_Trainers_1_2_BattleWon_Text

	ctxt "Warum mit deinem"
	line "#mon fliegen,"
	para "wenn du mit ihnen"
	line "laufen kannst?"
	done

.before_battle_text
	ctxt "Den langen Weg zu"
	line "gehen, ist immer"
	cont "erfrischend!"

	done

Route55_Trainer_2:
	trainer EVENT_ROUTE_55_TRAINER_2, HIKER, 6, .before_battle_text, Route55_Trainers_1_2_BattleWon_Text

	ctxt "Die verrückten"
	line "Typen im Norden,"
	para "mögen ihre Studios"
	line "wohl abgeschieden."

	done

.before_battle_text
	ctxt "Warum hat sich"
	line "niemand die Mühe"
	para "gemacht, diesen"
	line "Weg freizuräumen?"

	done

Route55_Trainer_3:
	trainer EVENT_ROUTE_55_TRAINER_3, GENTLEMAN, 1, .before_battle_text, .battle_won_text

	ctxt "Diese Leute"
	line "glauben, dass"
	para "unsere Welt nicht"
	line "mehr ist, als ein"
	para "Spiel, das sie"
	line "geschaffen haben."

	para "Ich kann Egomanen"
	line "nicht ausstehen <...>"
	done

.before_battle_text
	ctxt "Betritt dieses"
	line "Gebäude auf eigene"
	cont "Gefahr!"

	done

.battle_won_text
	ctxt "Hör nicht auf"
	line "falsche Propheten."

	done

Route55_Trainers_1_2_BattleWon_Text:
	ctxt "Gute Übung!"

	done

Route55_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 0, 1, SILK_TUNNEL_1F
	warp_def 5, 13, 2, ROUTE_55_GATE_UNDERGROUND
	warp_def 49, 12, 1, MT_BOULDER_B1F

.CoordEvents: db 0

.BGEvents: db 2
	signpost 25, 13, SIGNPOST_READ, Route55StudiosSign
	signpost 30, 2, SIGNPOST_ITEM, Route55HiddenItem

.ObjectEvents: db 3
	person_event SPRITE_FISHER, 53, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route55_Trainer_1, -1
	person_event SPRITE_FISHER, 49, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route55_Trainer_2, -1
	person_event SPRITE_GENTLEMAN, 27, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route55_Trainer_3, -1
