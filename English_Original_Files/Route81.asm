Route81_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 2
	dbw MAPCALLBACK_NEWMAP, .set_fly_flag
	dbw MAPCALLBACK_TILES, Route81Bridge

.set_fly_flag
	setflag ENGINE_FLYPOINT_ROUTE_81
	return

Route81Bridge:
	checkevent EVENT_BUILT_BRIDGE
	sif false
		return_if_callback_else_end
	changeblock 6, 12, $f
	changeblock 8, 12, $f
	changeblock 6, 14, $f
	changeblock 8, 14, $f
	return_if_callback_else_end

Route81DirectionsSign:
	ctxt "<UP> Acania Docks"
	next "<LEFT> Provincial"
	nl   "  Park"
	next "<RIGHT> Route 80"
	done

Route81IslandSign:
	signpostheader 7
	done

Route81_Trainer_1:
	trainer EVENT_ROUTE_81_TRAINER_1, BIRD_KEEPER, 4, .before_battle_text, .battle_won_text

	ctxt "Construction on"
	line "the bridge isn't"
	cont "done yet<...>"

	para "Thankfully, my"
	line "#mon can help"
	cont "me get across."
	done

.before_battle_text
	ctxt "My bird #mon"
	line "can fly me across!"
	done

.battle_won_text
	ctxt "Guess they can't"
	line "help me win a"
	cont "battle, though."
	done

Route81_Trainer_2:
	trainer EVENT_ROUTE_81_TRAINER_2, BLACKBELT_T, 6, .before_battle_text, .battle_won_text

	ctxt "I carved this path"
	line "with my own hands."

	para "That must impress"
	line "my idol, right?!"
	done

.before_battle_text
	ctxt "HAAAAAAAAAAAAAAAAA"
	line "AAAAAAAAAAAAAAAAA!"

	para "<...>"

	para "I'm training to one"
	line "day become Andre's"
	cont "disciple!"
	done

.battle_won_text
	text "WHAT?"
	done

Route81_Trainer_3:
	trainer EVENT_ROUTE_81_TRAINER_3, PICNICKER, 5, .before_battle_text, .battle_won_text

	ctxt "If you can find"
	line "HM03, for Surf,"
	para "you can ride your"
	line "#mon as it"
	para "swims through the"
	line "sea!"
	done

.before_battle_text
	ctxt "Going north would"
	line "lead you straight"
	para "to Acania if the"
	line "bridge wasn't out."
	done

.battle_won_text
	ctxt "That was harsh!"
	done

Route81_Trainer_4:
	trainer EVENT_ROUTE_81_TRAINER_4, PICNICKER, 7, .before_battle_text, .battle_won_text

	ctxt "The construction"
	line "of that #mon"
	cont "Center really"
	para "scared my poor"
	line "#mon."
	done

.before_battle_text
	ctxt "This used to be my"
	line "favorite picnic"
	para "spot, until they"
	line "built that stupid"
	cont "#mon Center<...>"
	done

.battle_won_text
	ctxt "Well, they were"
	line "intimidated."
	done

Route81_Trainer_5:
	trainer EVENT_ROUTE_81_TRAINER_5, SUPER_NERD, 3, .before_battle_text, .battle_won_text

	ctxt "I could sure use"
	line "the help of those"
	cont "smarter than me."
	done

.before_battle_text
	ctxt "I heard there's"
	line "scientists who"
	para "want to enhance"
	line "natural abilities"
	cont "of #mon."

	para "That's so cool."
	done

.battle_won_text
	ctxt "Really?!"
	done

Route81DoubleTeamTMDude:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_81_TM32
	sif true
		jumptext .after_TM_given_text
	writetext .give_TM_text
	givetm TM_DOUBLE_TEAM + RECEIVED_TM
	sif true
		setevent EVENT_ROUTE_81_TM32
	closetextend

.give_TM_text
	ctxt "I thought my"
	line "#mon would team"
	para "up when using this"
	line "move, but I was"
	cont "very mistaken!"

	para "Here, take it!"
	sdone

.after_TM_given_text
	ctxt "TM32 is called"
	line "Double Team."

	para "Don't let the name"
	line "fool you; it only"
	para "increases"
	line "evasiveness."
	done

Route81MegaphoneGirl:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_81_MEGAPHONE
	sif true
		jumptext .after_megaphone_given_text
	writetext .give_megaphone_text
	verbosegiveitem MEGAPHONE, 1
	waitbutton
	sif false
		jumptext .no_room_text
	setevent EVENT_ROUTE_81_MEGAPHONE
	closetextend

.give_megaphone_text
	ctxt "HEY, YOU!"

	para "YOU WOULDN'T"
	line "HAPPEN TO BE"
	para "INTERESTED IN"
	line "GETTING THIS"
	para "MEGAPHONE OFF MY"
	line "HANDS, WOULD YOU?"
	sdone

.after_megaphone_given_text
	ctxt "Sorry if I hurt"
	line "your ears."

	para "I imagine a Sound-"
	line "type #mon could"
	para "use this Megaphone"
	line "to hurt opponents"
	cont "even harder."
	done

.no_room_text
	ctxt "NO ROOM?"

	para "GUESS YOU DON'T"
	line "MIND THE NOISE,"
	cont "THEN."
	done

Route81BridgeBuilder:
	faceplayer
	opentext
	checkevent EVENT_NOBU_EXPLAINS_PROTECTORS
	sif false
		jumptext .before_nobu_text
	checkevent EVENT_BUILT_BRIDGE
	sif true
		jumptext .bridge_built_text
	checkitem BRICK_PIECE
	sif false
		jumptext .introduction_text
	writetext .got_bricks_text
	yesorno
	sif false
		jumptext .refused_text
	takeitem BRICK_PIECE, 20
	sif false
		jumptext .not_enough_bricks_text
	setevent EVENT_BUILT_BRIDGE
	writetext .enough_bricks_text
	special ClearBGPalettes
	special Special_BattleTowerFade
	playwaitsfx SFX_GRASS_RUSTLE
	playwaitsfx SFX_VICEGRIP
	playwaitsfx SFX_DOUBLE_KICK
	playwaitsfx SFX_DOUBLESLAP
	playwaitsfx SFX_STOMP
	scall Route81Bridge
	reloadmap
	special FadeInPalettes
	jumptext .after_building_bridge_text

.introduction_text
	ctxt "OK, so<...> Lance is"
	line "your father, and"
	para "you need to get up"
	line "there to stop"
	para "crazy #mon from"
	line "possibly"
	cont "destroying Naljo?"

	para "Uh, OK."
	line "Sounds legit."

	para "I'll need 20 Brick"
	line "Pieces to prop up"
	para "the dock from the"
	line "bottom. Otherwise,"
	cont "it could break."

	para "There's a mart that"
	line "sells them<...>"

	para "I'm not so sure of"
	line "where, though<...>"
	done

.before_nobu_text
	ctxt "I'm supposed to"
	line "finish building"
	cont "this bridge<...>"

	para "I'm way too tired"
	line "to work, though."

	para "You'd have to give"
	line "me a good reason"
	para "why this bridge"
	line "needs to be built"
	cont "now."
	done

.bridge_built_text
	ctxt "I built your"
	line "bridge; now please"
	cont "stop bothering me."
	done

.got_bricks_text
	ctxt "So, you have some"
	line "bricks?"

	para "Want to give them"
	line "to me so I can"
	cont "build the bridge?"
	done

.enough_bricks_text
	ctxt "Good, time to get"
	line "to work!"
	prompt

.after_building_bridge_text
	ctxt "How invigorating!"

	para "Well, that's my"
	line "workout for the"
	cont "week."

	para "I'm done, bye."
	done

.refused_text
	ctxt "Then stop wasting"
	line "my time."
	done

.not_enough_bricks_text
	ctxt "I need TWENTY."

	para "Let me spell that"
	line "out for you."

	para "T<...>"

	para "W<...>"

	para "E<...>"

	para "Don't facepalm"
	line "while I'm talking"
	cont "to you!"
	done

Route81_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 9, 7, 3, ROUTE_81_NORTHGATE
	warp_def 58, 4, 3, PROVINCIAL_PARK_GATE
	warp_def 58, 13, 1, ROUTE_81_EASTGATE
	warp_def 59, 4, 4, PROVINCIAL_PARK_GATE
	warp_def 59, 13, 2, ROUTE_81_EASTGATE
	warp_def 47, 6, 1, ROUTE_81_POKECENTER
	warp_def 43, 17, 1, ROUTE_81_GOODROD

.CoordEvents: db 0

.BGEvents: db 2
	signpost 56, 8, SIGNPOST_LOAD, Route81DirectionsSign
	signpost 22, 10, SIGNPOST_LOAD, Route81IslandSign

.ObjectEvents: db 9
	person_event SPRITE_BIRDKEEPER, 22, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route81_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 28, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route81_Trainer_2, -1
	person_event SPRITE_PICNICKER, 37, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route81_Trainer_3, -1
	person_event SPRITE_PICNICKER, 43, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, Route81_Trainer_4, -1
	person_event SPRITE_SUPER_NERD, 49, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, Route81_Trainer_5, -1
	person_event SPRITE_BIRDKEEPER, 29, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route81DoubleTeamTMDude, -1
	person_event SPRITE_FRUIT_TREE, 34, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, CHESTO_TREE_1, -1
	person_event SPRITE_GUITARISTF, 11, 9, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, Route81MegaphoneGirl, -1
	person_event SPRITE_BLACK_BELT, 16, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route81BridgeBuilder, -1
