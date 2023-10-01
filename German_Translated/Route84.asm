Route84_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route84HiddenItem:
	dw EVENT_ROUTE_84_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route84DirectionsSign:
	ctxt "<LEFT> Flokalis"
	next "<RIGHT> Klathrat"
	nl   "  Tunnel"
	done

Route84_Trainer_1:
	trainer EVENT_ROUTE_84_TRAINER_1, COOLTRAINERM, 11, .before_battle_text, .battle_won_text

	ctxt "Nicht mal ein"
	line "wenig überrascht?"
	done

.before_battle_text
	ctxt "Du bist in meine"
	line "Falle getappt!"

	para "Kampfmodus"
	line "aktiviert!"
	done

.battle_won_text
	ctxt "Awww, das war"
	line "jetzt langweilig."
	done

Route84_Trainer_2:
	trainer EVENT_ROUTE_84_TRAINER_2, SKIER, 1, .before_battle_text, .battle_won_text

	ctxt "Manchmal fahre ich"
	line "auf meinen #mon"
	cont "Ski!"

	para "Lustig, huh?"
	done

.before_battle_text
	ctxt "Das ist eine sehr"
	line "schwierige Piste"
	para "für talentierte"
	line "Skifahrer wie ich"
	cont "es nunmal bin."
	done

.battle_won_text
	ctxt "Satz mit X war"
	line "wohl nix!"
	done

Route84_Trainer_3:
	trainer EVENT_ROUTE_84_TRAINER_3, SKIER, 2, .before_battle_text, .battle_won_text

	ctxt "Die komischen"
	line "Landschaften"
	para "dieser Region"
	line "wurden durch ein"
	para "sehr altes #mon"
	line "geformt."

	para "Es machte es zu"
	line "dem perfekten Ort"
	cont "zum Skifahren!"
	done

.before_battle_text
	ctxt "Diese Region hat"
	line "echt eigenartige"
	cont "Landschaften<...>"
	done

.battle_won_text
	ctxt "Ich beschwere"
	line "mich ja nicht!"
	done

Route84_Trainer_4:
	trainer EVENT_ROUTE_84_TRAINER_4, HIKER, 13, .before_battle_text, .battle_won_text

	ctxt "Ich brauchte nicht"
	line "mal nen Kompass!"
	done

.before_battle_text
	ctxt "Dieser Tunnel war"
	line "kein Problem für"
	cont "mich."

	para "Du musst nur drauf"
	line "achten wo du genau"
	cont "hin gehst!"
	done

.battle_won_text
	ctxt "Festhalten."
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
	person_event SPRITE_FRUIT_TREE, 17, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, 13, -1
	person_event SPRITE_POKE_BALL, 14, 51, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_STEEL_EATER, 0, EVENT_ROUTE_84_TM
