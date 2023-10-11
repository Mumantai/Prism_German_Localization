MtEmber_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberMoltres:
	faceplayer
	opentext
	writetext .cry_text
	cry MOLTRES
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_MOLTRES
	loadwildmon MOLTRES, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_MOLTRES
	disappear 2
	end

.cry_text
	ctxt "Gyaoo!!!"
	done

MtEmber_Trainer_1:
	trainer EVENT_MT_EMBER_TRAINER_1, MINER, 3, .before_battle_text, .battle_won_text

	ctxt "The volcanic rock"
	line "in this area is"
	para "very rich in rare"
	line "minerals."

	para "I'll mine myself a"
	line "fortune in a"
	cont "flash!"
	done

.before_battle_text
	ctxt "Phew, that was a"
	line "long session."

	para "Fancy a break?"
	done

.battle_won_text
	ctxt "Ah, well, back to"
	line "work."
	done

MtEmber_Trainer_2:
	trainer EVENT_MT_EMBER_TRAINER_2, PICNICKER, 8, .before_battle_text, .battle_won_text

	ctxt "Our government"
	line "recently stripped"
	para "this place of its"
	line "environmental"
	cont "protection status."

	para "I urge you, please"
	line "don't mine here."
	done

.before_battle_text
	ctxt "Stop right there!"
	done

.battle_won_text
	ctxt "Please<...> just"
	line "listen to me."
	done

MtEmber_Trainer_3:
	trainer EVENT_MT_EMBER_TRAINER_3, MINER, 4, .before_battle_text, .battle_won_text

	ctxt "This is my mining"
	line "patch."

	para "Go find your own!"
	done

.before_battle_text
	ctxt "What do you think"
	line "you're playing at?"
	done

.battle_won_text
	ctxt "I can't believe"
	line "your impudence!"
	done

MtEmber_Trainer_4:
	trainer EVENT_MT_EMBER_TRAINER_4, BIRD_KEEPER, 9, .before_battle_text, .battle_won_text

	ctxt "How can you defend"
	line "your actions to"
	cont "yourself?"

	para "You are destroying"
	line "your children's"
	cont "future!"

	para "Does our natural"
	line "ecologic balance"
	para "mean anything to"
	line "you?"
	done

.before_battle_text
	ctxt "I won't let you"
	line "destroy our"
	cont "beautiful planet!"
	done

.battle_won_text
	ctxt "There's no point in"
	line "talking to you."
	done

MtEmber_Trainer_5:
	trainer EVENT_MT_EMBER_TRAINER_5, MINER, 5, .before_battle_text, .battle_won_text

	ctxt "And then of course"
	line "I've got this"
	para "terrible pain down"
	line "my left-hand side."
	done

.before_battle_text
	ctxt "I think you ought"
	line "to know I'm feeling"
	cont "very depressed<...>"
	done

.battle_won_text
	ctxt "Why stop now, just"
	line "when I'm hating it?"
	done

MtEmber_Trainer_6:
	trainer EVENT_MT_EMBER_TRAINER_6, OFFICER, 8, .before_battle_text, .battle_won_text

	ctxt "It is perfectly"
	line "legal to mine in"
	cont "this area."

	para "If those eco-nuts"
	line "don't like it, they"
	para "can vote for"
	line "someone else."
	done

.before_battle_text
	ctxt "Halt!"

	para "I'll no longer"
	line "tolerate you eco"
	para "activists causing"
	line "trouble on my"
	cont "turf!"
	done

.battle_won_text
	ctxt "Wait, you're not a"
	line "protester?"
	done

MtEmber_NPC_1:
	ctxt "This is the rest"
	line "place of the great"
	cont "phoenix."

	para "It is said to only"
	line "appear to those"
	cont "pure of spirit."

	para "And then journey"
	line "with that one"
	para "until they depart"
	line "this world."

	para "And after, it"
	line "shall appear once"
	cont "again."

	para "This is the way of"
	line "reincarnation."
	done

MtEmber_NPC_2:
	ctxt "I'm trying to pro-"
	line "test peacefully."

	para "My #mon should"
	line "not have to suffer"
	para "for mankind's"
	line "arrogance."

	para "Please, consider"
	line "them before you"
	cont "use your pickaxe."
	done

MtEmber_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 21, 6, 2, MT_EMBER_ROOM_1
	warp_def 15, 30, 1, MT_EMBER_ROOM_2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 13
	person_event SPRITE_MOLTRES, 4, 31, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtEmberMoltres, EVENT_MOLTRES
	person_event SPRITE_POKE_BALL, 4, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, ULTRA_BALL, EVENT_MT_EMBER_ITEM_ULTRA_BALLS
	person_event SPRITE_POKE_BALL, 34, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MOON_STONE, EVENT_MT_EMBER_ITEM_MOON_STONE
	person_event SPRITE_POKE_BALL, 16, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ANCIENTPOWER, 0, EVENT_MT_EMBER_TM_ANCIENTPOWER
	person_event SPRITE_MINER, 30, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmber_Trainer_1, -1
	person_event SPRITE_PICNICKER, 19, 27, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, MtEmber_Trainer_2, -1
	person_event SPRITE_MINER, 24, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, MtEmber_Trainer_3, -1
	person_event SPRITE_BIRDKEEPER, 37, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmber_Trainer_4, -1
	person_event SPRITE_MINER, 38, 29, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, MtEmber_Trainer_5, -1
	person_event SPRITE_OFFICER, 42, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmber_Trainer_6, -1
	person_event SPRITE_SAGE, 11, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MtEmber_NPC_1, -1
	person_event SPRITE_TWIN, 33, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, MtEmber_NPC_2, -1
	person_event SPRITE_POKE_BALL, 26, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 5, MINING_PICK, EVENT_MT_EMBER_ITEM_MINING_PICKS
