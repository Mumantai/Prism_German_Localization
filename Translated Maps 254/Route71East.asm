Route71East_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route71EastBattleTowerSign:
	ctxt "Duellturm"
	done

Route71East_Trainer_1:
	trainer EVENT_ROUTE_71_EAST_TRAINER_1, JUGGLER, 3, .before_battle_text, .battle_won_text
	ctxt "Um so Jonglieren"
	line "zu können, muss"
	cont "man üben & üben!"
	para "Man wird nicht als"
	line "Jongleur geboren."
	done

.before_battle_text
	ctxt "Zeit für meine"
	line "übungen!"
	done

.battle_won_text
	ctxt "Das hat dich nicht"
	line "amüsiert?"
	done

Route71East_Trainer_2:
	trainer EVENT_ROUTE_71_EAST_TRAINER_2, FIREBREATHER, 8, .before_battle_text, .battle_won_text
	ctxt "Es gibt diverse"
	line "Items die du durch"
	para "Bergbau an anderen"
	line "Orten ausgraben"
	cont "kannst!"
	para "Wenn du z.B. nach"
	line "Feuerstein suchst,"
	cont "geh in der"
	para "Leuchtfeuerhöhle"
	line "abbauen!"
	done

.before_battle_text
	ctxt "Ich kenne ein "
	line "Geheimniss über"
	cont "den Bergbau."
	para "Schlag mich und"
	line "ich sags dir!"
	done

.battle_won_text
	ctxt "Willst du es nun"
	line "wissen?"
	done

Route71East_Trainer_3:
	trainer EVENT_ROUTE_71_EAST_TRAINER_3, FIREBREATHER, 7, .before_battle_text, .battle_won_text
	ctxt "Wenn du nach Osten"
	line "gehst, gelangst du"
	para "zu der"
	line "Leuchtfeuerhöhle."
	para "Dort habe ich"
	line "meine #mon her!"
	done

.before_battle_text
	ctxt "Zeit zum"
	line "schmelzen!"
	done

.battle_won_text
	ctxt "Das hat nicht so"
	line "gut geklappt."
	done

Route71East_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 25, 2, 8, CLATHRITE_1F
	warp_def 25, 26, 3, PHACELIA_WEST_EXIT
	warp_def 13, 24, 1, BATTLE_TOWER_ENTRANCE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 22, 20, SIGNPOST_LOAD, Route71EastBattleTowerSign

.ObjectEvents: db 3
	person_event SPRITE_JUGGLER, 21, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route71East_Trainer_1, -1
	person_event SPRITE_FIREBREATHER, 26, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route71East_Trainer_2, -1
	person_event SPRITE_FIREBREATHER, 25, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route71East_Trainer_3, -1