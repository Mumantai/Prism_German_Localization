Route77_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route77HiddenItem:
	dw EVENT_ROUTE_77_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route77IslandSignNorth:
	signpostheader 5
	done

Route77IslandSignSouth:
	signpostheader 7
	done

Route77Guard_AfterIlk:
	faceplayer
	checkevent EVENT_GOT_HM02
	sif false, then
		opentext
		writetext .give_HM_text
		givetm HM_FLY + RECEIVED_TM
		setevent EVENT_GOT_HM02
	sendif
	jumptext .regular_text

.regular_text
	ctxt "Oh, hello again!"

	para "I heard everything"
	line "from Prof. Ilk."

	para "Good luck to you!"
	done

.give_HM_text
	ctxt "Looks like you've"
	line "got clearance to"
	cont "pass."

	para "Next time, use"
	line "this HM to get to"
	para "Caper Ridge"
	line "faster!"
	sdone

Route77Guard_BeforeIlk:
	faceplayer
	checkflag ENGINE_MIDNIGHTBADGE
	sif false
		jumptext .no_badge_text
	checkevent EVENT_GOT_HM02
	sif false, then
		opentext
		writetext .no_clearance_text
		givetm HM_FLY + RECEIVED_TM
		setevent EVENT_GOT_HM02
	sendif
	jumptext .after_HM_text

.no_clearance_text
	ctxt "I can't let you"
	line "past without a"
	cont "valid clearance."

	para "We suffered a bad"
	line "earthquake here."

	para "If only we could"
	line "get some expert to"
	cont "assist us<...>"

	para "Like that guy<...>"
	line "What's he called,"
	cont "<``>Prof. Silk<''>?"

	para "<...>"

	para "What? Oh, he's"
	line "called Prof. Ilk?"

	para "You know that"
	line "crazy professor?"

	para "Maybe he can help"
	line "in this situation."

	para "He knows more"
	line "about this strange"
	cont "region than I do."

	para "<...>"

	para "Very well, you got"
	line "yourself a deal"
	cont "here."

	para "This HM will help"
	line "you get back to"
	para "Caper Ridge much"
	line "faster."
	sdone

.after_HM_text
	ctxt "HM02 is Fly."

	para "Your #mon will"
	line "be able to fly"
	para "you to important"
	line "places you've"
	cont "already visited!"

	para "You can visit any"
	line "town or any place"
	para "that's shown on"
	line "your map as a"
	cont "black diamond."

	para "Make sure to talk"
	line "to Prof. Ilk and"
	para "I'll get you a"
	line "clearance to pass."
	done

.no_badge_text
	ctxt "I was instructed"
	line "to just guard this"
	cont "bridge for now."

	para "Maybe, if you had"
	line "more badges, I"
	para "would feel more"
	line "comfortable to"
	cont "let you through."
	done

Route77_Trainer_1:
	trainer EVENT_ROUTE_77_TRAINER_1, FISHER, 2, .before_battle_text, .battle_won_text

	ctxt "Time to add to"
	line "my collection."
	done

.before_battle_text
	ctxt "I've been reelin'"
	line "them in today!"
	done

.battle_won_text
	ctxt "Sploosh!"
	done

Route77_Trainer_2:
	trainer EVENT_ROUTE_77_TRAINER_2, FISHER, 3, .before_battle_text, .battle_won_text

	ctxt "Not big enough?"
	done

.before_battle_text
	ctxt "My catch is HUGE!"

	para "Just LOOK at it!"
	done

.battle_won_text
	ctxt "Uh<...> What?"
	done

Route77_Trainer_3:
	trainer EVENT_ROUTE_77_TRAINER_3, FISHER, 4, .before_battle_text, .battle_won_text

	ctxt "Forget training,"
	line "I'll just catch"
	cont "strong ones!"
	done

.before_battle_text
	ctxt "Caught two big"
	line "#mon!"
	done

.battle_won_text
	text "OW!"
	done

Route77_Trainer_4:
	trainer EVENT_ROUTE_77_TRAINER_4, YOUNGSTER, 4, .before_battle_text, .battle_won_text

	ctxt "I released them"
	line "back in the wild."
	done

.before_battle_text
	ctxt "I just had to"
	line "catch these<...>"
	done

.battle_won_text
	ctxt "Ugh, no fair."
	done

Route77_Trainer_5:
	trainer EVENT_ROUTE_77_TRAINER_5, CAMPER, 1, .before_battle_text, .battle_won_text

	ctxt "Hmm<...> I'll get cold"
	line "with my warm"
	cont "#mon fainted."

	para "<...>"

	para "You're saying I"
	line "should head for a"
	cont "#mon Center?"

	para "No need, I'll heal"
	line "them naturally."
	done

.before_battle_text
	ctxt "Camping outside,"
	line "gotta love it."
	done

.battle_won_text
	ctxt "Well, who will"
	line "warm me up now?"
	done

Route77_Trainer_6:
	trainer EVENT_ROUTE_77_TRAINER_6, PICNICKER, 4, .before_battle_text, .battle_won_text

	ctxt "Guess I should've"
	line "trained them a bit"
	cont "more first<...>"
	done

.before_battle_text
	ctxt "I just caught"
	line "three #mon!"

	para "Now, time to make"
	line "them fight!"
	done

.battle_won_text
	ctxt "Well, that was a"
	line "bit fun, at least."
	done

Route77_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 73, 10, 1, MILOS_F1
	warp_def 21, 13, 1, ROUTE_77_JEWELERS
	warp_def 51, 7, 3, ROUTE_77_DAYCARE_HOUSE
	warp_def 69, 5, 1, ROUTE_77_POKECENTER
	warp_def 73, 9, 1, MILOS_F1
	warp_def 5, 11, 3, TORENIA_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 9, 13, SIGNPOST_JUMPSTD, qrcode, QR_ROUTE_77
	signpost 25, 4, SIGNPOST_ITEM, Route77HiddenItem
	signpost 23,  9, SIGNPOST_LOAD, Route77IslandSignNorth
	signpost 43,  9, SIGNPOST_LOAD, Route77IslandSignSouth

.ObjectEvents: db 13
	person_event SPRITE_FISHER, 30, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route77_Trainer_1, -1
	person_event SPRITE_FISHER, 37, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_2, -1
	person_event SPRITE_FISHER, 44, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_3, -1
	person_event SPRITE_YOUNGSTER, 63, 1, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_4, -1
	person_event SPRITE_YOUNGSTER, 23, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route77_Trainer_5, -1
	person_event SPRITE_PICNICKER, 57, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, Route77_Trainer_6, -1
	person_event SPRITE_BOULDER, 69, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 50, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 3, Route77Guard_AfterIlk, -1
	person_event SPRITE_OFFICER, 40, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route77Guard_BeforeIlk, EVENT_ILK_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 73, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_CURSE, 0, EVENT_ROUTE_77_TM03
	person_event SPRITE_FRUIT_TREE, 15, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, LEPPA_TREE_1, -1
	person_event SPRITE_POKE_BALL, 13, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, TWISTEDSPOON, EVENT_ROUTE_77_ITEM_TWISTEDSPOON
	person_event SPRITE_POKE_BALL, 7, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HYPER_POTION, EVENT_ROUTE_77_ITEM_HYPER_POTION
