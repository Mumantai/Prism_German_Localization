OlcanIsle_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OlcanIsleSeagallop:
	ctxt "Seagallop Ferry"
	nl   ""
	next "Sorry, currently"
	next "out of service."
	done

OlcanIsleTritorch:
	ctxt "<UP> Mt. Tritorch"
	done

OlcanIsleNPC1:
	ctxt "Rankor comprises"
	line "all the islands"
	para "between Tunod and"
	line "Johto."

	para "It may not seem"
	line "like much, but"
	para "they have their"
	line "own League and"
	para "many breathtaking"
	line "landmarks!"
	done

OlcanIsle_Trainer_1:
	trainer EVENT_OLCAN_ISLE_TRAINER_1, BLACKBELT_T, 12, .before_battle_text, .battle_won_text

	ctxt "Rankor's trainers"
	line "are on average the"
	para "strongest in the"
	line "world."

	para "You'd best be up"
	line "for the challenge."
	done

.before_battle_text
	ctxt "Hey, trainer!"

	para "You've just set"
	line "foot in the Rankor"
	cont "region."

	para "Let's see what"
	line "you're worth."
	done

.battle_won_text
	ctxt "I see you're not"
	line "just anyone."
	done

OlcanIsle_Trainer_2:
	trainer EVENT_OLCAN_ISLE_TRAINER_2, HIKER, 16, .before_battle_text, .battle_won_text

	ctxt "Olcan Isle is home"
	line "to Mt. Tritorch,"
	cont "an active volcano."

	para "The weather here"
	line "is usually really"
	cont "hot!"
	done

.before_battle_text
	ctxt "Tunod?"

	para "Sorry, kiddo,"
	line "this island is"
	para "part of the Rankor"
	line "Archipelago."
	done

.battle_won_text
	ctxt "Wow! You're no"
	line "ordinary tourist!"
	done

OlcanIsle_Trainer_3:
	trainer EVENT_OLCAN_ISLE_TRAINER_3, POKEMANIAC, 5, .before_battle_text, .battle_won_text

	ctxt "Rankor is like a"
	line "home for strong"
	cont "trainers."

	para "We can't let that"
	line "be taken away from"
	cont "us!"
	done

.before_battle_text
	ctxt "Tunod is trying to"
	line "annex our proud"
	cont "Rankor region!"

	para "But we elite"
	line "trainers can and"
	para "will stand against"
	line "it!"
	done

.battle_won_text
	ctxt "Amazing! You're"
	line "free to stay here"
	cont "anytime."
	done

OlcanIsle_Trainer_4:
	trainer EVENT_OLCAN_ISLE_TRAINER_4, MINER, 6, .before_battle_text, .battle_won_text

	ctxt "A boulder fell and"
	line "blocked the way to"
	cont "Mt. Tritorch."

	para "Most people inside"
	line "left by air, but"
	para "some didn't mind"
	line "staying in there"
	cont "to train."

	para "That's Rankor's"
	line "trainers for you."
	done

.before_battle_text
	ctxt "Sorry, trainer,"
	line "the path is gonna"
	para "be out for a"
	line "while."

	para "How about a"
	line "battle instead?"
	done

.battle_won_text
	ctxt "Phew<...> The heat"
	line "is a real pain."
	done

OlcanIsle_Trainer_5:
	trainer EVENT_OLCAN_ISLE_TRAINER_5, SWIMMERF, 15, .before_battle_text, .battle_won_text

	ctxt "The water here is"
	line "really warm!"

	para "When I heard the"
	line "Ferry was down, I"
	para "surfed all the way"
	line "here to enjoy a"
	para "nice swim free"
	line "from tourists!"
	done

.before_battle_text
	ctxt "Hey there!"

	para "What brings you"
	line "here on this"
	cont "remote island?"
	done

.battle_won_text
	ctxt "You came all the"
	line "way from Naljo?"
	done

OlcanIsle_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def 33, 42, 2, OLCAN_CHINE_ENTRANCE
	warp_def  9, 27, 1, OLCAN_POKECENTER
	warp_def 15,  8, 1, OLCAN_DOCK_EXIT
	warp_def 15,  9, 2, OLCAN_DOCK_EXIT

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost  9, 28, SIGNPOST_JUMPSTD, pokecentersign
	signpost 16,  6, SIGNPOST_LOAD, OlcanIsleSeagallop
	signpost  6, 12, SIGNPOST_LOAD, OlcanIsleTritorch

.ObjectEvents
	db 8
	person_event SPRITE_BLACK_BELT, 26, 26, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, OlcanIsle_Trainer_1, -1
	person_event SPRITE_HIKER, 21, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, OlcanIsle_Trainer_2, -1
	person_event SPRITE_POKEMANIAC,  9, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, OlcanIsle_Trainer_3, -1
	person_event SPRITE_MINER,  8, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, OlcanIsle_Trainer_4, -1
	person_event SPRITE_SWIMMER_GIRL, 32, 35, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, OlcanIsle_Trainer_5, -1
	person_event SPRITE_HIKER, 16, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, OlcanIsleNPC1, -1
	person_event SPRITE_POKE_BALL, 14, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, RARE_CANDY, EVENT_OLCAN_ISLE_ITEM_1
	person_event SPRITE_POKE_BALL, 31, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SAFE_GOGGLES, EVENT_OLCAN_ISLE_ITEM_2
