EmberBrook_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EmberBrookDirectionsSignEast:
	ctxt "<LEFT> Route 67"
	next "<RIGHT> Sevii Islands"
	next "  via Mt. Ember"
	done

EmberBrookDirectionsSignWest:
	ctxt "<UP> Mt. Ember"
	next "<LEFT> Rijon Border"
	next "  (Route 67)"
	done

EmberBrook_Trainer_1:
	trainer EVENT_EMBER_BROOK_TRAINER_1, SWIMMERF, 12, .before_battle_text, .battle_won_text

	ctxt "East to us is"
	line "Mt. Ember."

	para "It's an active"
	line "volcano that will"
	para "spew these big"
	line "rocks out into the"
	cont "ocean."

	para "They are great"
	line "training for"
	para "swimming, but not"
	line "for the novice."
	done

.before_battle_text
	ctxt "Do you know where"
	line "you are?"
	done

.battle_won_text
	ctxt "I did try to warn"
	line "you."
	done

EmberBrook_Trainer_2:
	trainer EVENT_EMBER_BROOK_TRAINER_2, SWIMMERF, 13, .before_battle_text, .battle_won_text

	ctxt "Sometimes, I wish"
	line "I could float here"
	para "forever, and be"
	line "able to forget all"
	cont "my problems<...>"

	para "Life is so cruel<...>"
	done

.before_battle_text
	ctxt "This part is the"
	line "calmest spot in"
	cont "Ember Brook."

	para "Fancy a dip?"
	done

.battle_won_text
	ctxt "Hm<...>?"

	para "Sorry, I was too"
	line "distracted by the"
	cont "relaxing current<...>"
	done

EmberBrook_Trainer_3:
	trainer EVENT_EMBER_BROOK_TRAINER_3, SWIMMERF, 14, .before_battle_text, .battle_won_text

	ctxt "I know I don't look"
	line "it, but before I"
	para "was a swimmer, I"
	line "was a fisherman."

	para "The power of"
	line "medical science"
	para "is incredible,"
	line "wouldn't you say?"
	done

.before_battle_text
	ctxt "Looks like I"
	line "caught you in my"
	cont "net!"
	done

.battle_won_text
	ctxt "Ack! You caught"
	line "me!"
	done

EmberBrook_Trainer_4:
	trainer EVENT_EMBER_BROOK_TRAINER_4, TWINS, 3, .before_battle_text, .battle_won_text

	ctxt "Sal: I'm afraid"
	line "this conversation"
	para "can serve no"
	line "purpose anymore."

	para "Goodbye."
	done

.before_battle_text
	ctxt "Sal: You want to"
	line "pass us?"

	para "I'm sorry, I'm"
	line "afraid we can't do"
	cont "that<...>"
	done

.battle_won_text
	ctxt "Stop, stop<...>"
	done

EmberBrook_Trainer_4_OtherTwin:
	trainer EVENT_EMBER_BROOK_TRAINER_4, TWINS, 3, .before_battle_text, .battle_won_text

	ctxt "Daisy: Nothing can"
	line "sneak past my"
	cont "sister!"

	para "Although, she is a"
	line "little strange."

	para "She keeps singing"
	line "to me. It's super"
	cont "annoying."
	done

.before_battle_text
	ctxt "Daisy: Oops!"

	para "Were you trying to"
	line "sneak past us?"
	done

.battle_won_text
	ctxt "Daisy: Oh, no!"

	para "You hid your"
	line "abilities well."
	done

EmberBrook_Trainer_5:
	trainer EVENT_EMBER_BROOK_TRAINER_5, CHEERLEADER, 3, .before_battle_text, .battle_won_text

	ctxt "So, I'm from One"
	line "Island, and this"
	para "is my first time"
	line "travelling abroad."

	para "I was told that"
	line "the Rijish always"
	para "say hello with a"
	line "#mon battle."

	para "Shows what I know."
	done

.before_battle_text
	ctxt "Oh, finally! A"
	line "friendly face!"

	para "Is this how people"
	line "from Rijon say"
	cont "hello?"
	done

.battle_won_text
	ctxt "Gosh, that was so"
	line "dumb<...>"
	done

EmberBrook_Trainer_6:
	trainer EVENT_EMBER_BROOK_TRAINER_6, BURGLAR, 3, .before_battle_text, .battle_won_text

	ctxt "I was told by an"
	line "associate of mine"
	para "that there was"
	line "valuable jewels in"
	para "that there"
	line "mountain."

	para "But it's all buried"
	line "in the rock, and I"
	cont "ain't no miner!"
	done

.before_battle_text
	ctxt "Put up your dukes!"
	line "This is a stick"
	cont "up!"
	done

.battle_won_text
	ctxt "Help! Police!"
	done

EmberBrook_Trainer_7:
	trainer EVENT_EMBER_BROOK_TRAINER_7, PICNICKER, 9, .before_battle_text, .battle_won_text

	ctxt "<...>"

	para "Oh, so you're not"
	line "someone sketchy."

	para "I'm terribly sorry."

	para "I'm somewhat lost,"
	line "and there are a"
	para "bunch of weird"
	line "people here."

	para "Don't worry. I'll"
	line "find my way soon."
	done

.before_battle_text
	ctxt "Eek!"

	para "Don't come any"
	line "closer!"
	done

.battle_won_text
	ctxt "Oh, heavens!"
	done

EmberBrook_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $8, $6, 3, EMBER_BROOK_GATE
	warp_def $9, $6, 4, EMBER_BROOK_GATE
	warp_def $7, $31, 1, MT_EMBER_ENTRANCE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost  9,  9, SIGNPOST_LOAD, EmberBrookDirectionsSignEast
	signpost  8, 48, SIGNPOST_LOAD, EmberBrookDirectionsSignWest

.ObjectEvents
	db 10
	person_event SPRITE_POKE_BALL, 13,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, ULTRA_BALL, EVENT_EMBER_BROOK_ITEM_ULTRA_BALLS
	person_event SPRITE_POKE_BALL,  8, 40, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DAMP_ROCK, EVENT_EMBER_BROOK_ITEM_DAMP_ROCK
	person_event SPRITE_SWIMMER_GIRL, 10, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, EmberBrook_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL, 11, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 4, EmberBrook_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL,  6, 44, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, EmberBrook_Trainer_3, -1
	person_event SPRITE_TWIN, 15, 42, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_4, -1
	person_event SPRITE_TWIN, 15, 43, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_4_OtherTwin, -1
	person_event SPRITE_CHEERLEADER, 12, 31, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_5, -1
	person_event SPRITE_BURGLAR,  5, 27, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_6, -1
	person_event SPRITE_PICNICKER,  4, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_7, -1
