MtEmberRoom1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberRoom1_Trainer_1:
	trainer EVENT_MT_EMBER_ROOM1_TRAINER, COOLTRAINERM, 13, .before_battle_text, .battle_won_text
	ctxt "Na Super! Keine"
	line "#mon, keine"
	para "Heil-Items, und"
	line "kein Weg zurück."
	para "Wegen dir hänge"
	line "ich hier fest, bis"
	cont "ich verhungere."
	para "Hoffe bist stolz"
	line "auf dich."
	done

.before_battle_text
	ctxt "Ich war unterwegs"
	line "zum Glühweg um"
	para "mich und meine"
	line "#mon zu testen."
	para "Aber der Weg ist"
	line "blockiert!"
	para "Jetzt musst du"
	line "mich testen!"
	done

.battle_won_text
	ctxt "War das etwa"
	line "meine Schuld?"
	done

MtEmberRoom1NPC:
	ctxt "Oh <...> Hallo!"
	para "Ich versuche, zum"
	line "Glühweg zu kommen."
	para "Dieser Felsen ist"
	line "aber viel zu hart."
	para "Wenn die Entwick-"
	line "ler mir helfen,"
	para "kannst du den"
	line "Glühweg und andere"
	cont "Orte erreichen!"
	done

MtEmberRoom1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $10, $c, 2, MT_EMBER_ENTRANCE
	warp_def $11, $2, 1, MT_EMBER
	warp_def $11, $3, 1, MT_EMBER

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_MINER, 5, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MtEmberRoom1NPC, -1
	person_event SPRITE_COOLTRAINER_M,  7,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, MtEmberRoom1_Trainer_1, -1