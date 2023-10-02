MtEmberRoom2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberRoom2_Trainer:
	trainer EVENT_MT_EMBER_ROOM2_TRAINER, FIREBREATHER, 1, .before_battle_text, .battle_won_text
	ctxt "Feuertypen erholen"
	line "sich gut bei einer"
	para "direkten"
	line "Wärmequelle. Das"
	para "ist ein weiterer"
	line "Grund, in diesem"
	para "Vulkan zu"
	line "trainieren."
	para "Versuchs mal!"
	done

.before_battle_text
	ctxt "Ich trainiere hier"
	line "im Vulkan, um"
	para "meine #mon"
	line "glücklich zu"
	cont "machen."
	para "Sie mögen es heiß!"
	done

.battle_won_text
	ctxt "Heiß, Heiß, HEIß!"
	done

MtEmberRoom2_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $c, 2, MT_EMBER
	warp_def $b, $d, 2, MT_EMBER

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_POKE_BALL, 4, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HEAT_ROCK, EVENT_MT_EMBER_ROOM_2_ITEM_HEAT_ROCK
	person_event SPRITE_FIREBREATHER, 2,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, MtEmberRoom2_Trainer, -1