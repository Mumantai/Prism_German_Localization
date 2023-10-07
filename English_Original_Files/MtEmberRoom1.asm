MtEmberRoom1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberRoom1_Trainer_1:
	trainer EVENT_MT_EMBER_ROOM1_TRAINER, COOLTRAINERM, 13, .before_battle_text, .battle_won_text

	ctxt "Great, now I have"
	line "no #mon, no"
	para "healing items, and"
	line "no way home."

	para "You've stranded me"
	line "here until I"
	cont "starve."

	para "Hope you're proud"
	line "of yourself."
	done

.before_battle_text
	ctxt "I was on my way to"
	line "Kindle Road to"
	para "test my skills and"
	line "#mon."

	para "But the path is"
	line "blocked!"

	para "You'll have to do."
	done

.battle_won_text
	ctxt "Don't tell me this"
	line "is my fault!"
	done

MtEmberRoom1NPC:
	ctxt "Oh<...> hello!"

	para "I'm trying to get"
	line "to Kindle Road."

	para "This rock is very"
	line "hard, though."

	para "If the devs help"
	line "me, you'll be able"
	para "to travel to"
	line "Kindle Road, and"
	cont "other places too!"
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
