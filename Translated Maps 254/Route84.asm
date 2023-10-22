Route84_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route84HiddenItem:
	dw EVENT_ROUTE_84_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route84DirectionsSign:
	ctxt "<LEFT> Flokalis"
	next "<RIGHT> Klathrat-"
	nl   "  Tunnel"
	done

Route84_Trainer_1:
	trainer EVENT_ROUTE_84_TRAINER_1, COOLTRAINERM, 9, .before_battle_text, .battle_won_text
	ctxt "Nicht mal ein"
	line "wenig überrascht?"
	done

.before_battle_text
	ctxt "Du wurdest aus dem"
	line "Hinterhalt"
	cont "überfallen!"
	para "Würfel auf"
	line "Initiative!"
	done

.battle_won_text
	ctxt "Maaan, das macht"
	line "so keinen Spaß."
	done

Route84_Trainer_2:
	trainer EVENT_ROUTE_84_TRAINER_2, SKIER, 1, .before_battle_text, .battle_won_text
	ctxt "Manchmal fahre"
	line "ich zusammen"
	para "mit meinen #mon"
	line "Ski!"
	done

.before_battle_text
	ctxt "Das ist ein super"
	line "Hindernisparcour,"
	para "für erfahrene"
	line "Skiefahrer, wie"
	cont "mich!"
	done

.battle_won_text
	ctxt "Verflixt!"
	done

Route84_Trainer_3:
	trainer EVENT_ROUTE_84_TRAINER_3, SKIER, 2, .before_battle_text, .battle_won_text
	ctxt "Diese Landschaft,"
	line "soll von alten"
	line "legendären #mon"
	para "geformt worden"
	line "sein."
	para "Einfach perfekt"
	line "zum Skifahren!"
	done

.before_battle_text
	ctxt "Diese Region hat"
	line "echt eigenartige"
	cont "Landschaften <...>"
	done

.battle_won_text
	ctxt "Ich beschwere"
	line "mich ja nicht!"
	done

Route84_Trainer_4:
	trainer EVENT_ROUTE_84_TRAINER_4, HIKER, 13, .before_battle_text, .battle_won_text
	ctxt "Ich brauche nicht"
	line "mal einen Kompass!"
	done

.before_battle_text
	ctxt "Dieser Tunnel war"
	line "kein Problem."
	para "Man muss nur"
	line "darauf achten,"
	cont "wohin man geht!"
	done

.battle_won_text
	ctxt "Halt."
	done

Route84_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 63, 5, CLATHRITE_1F
	warp_def 5, 7, 1, PHLOX_ENTRY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 5, 42, SIGNPOST_ITEM, Route84HiddenItem
	signpost 9, 24, SIGNPOST_LOAD, Route84DirectionsSign

.ObjectEvents: db 6
	person_event SPRITE_COOLTRAINER_M, 8, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route84_Trainer_1, -1
	person_event SPRITE_BUENA, 11, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route84_Trainer_2, -1
	person_event SPRITE_BUENA, 10, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route84_Trainer_3, -1
	person_event SPRITE_HIKER, 7, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 4, Route84_Trainer_4, -1
	person_event SPRITE_FRUIT_TREE, 17, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, LUM_TREE_1, -1
	person_event SPRITE_POKE_BALL, 14, 51, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NEVERMELTICE, EVENT_ROUTE_84_ITEM_NEVERMELTICE