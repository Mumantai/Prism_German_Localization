Route71East_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route71EastBattleTowerSign:
	ctxt "Battle Tower"
	done

Route71East_Trainer_1:
	trainer EVENT_ROUTE_71_EAST_TRAINER_1, JUGGLER, 3, .before_battle_text, .battle_won_text

	ctxt "Being able to"
	line "juggle like this"
	cont "takes practice!"

	para "Nobody is born a"
	line "juggler."
	done

.before_battle_text
	ctxt "Time for my new"
	line "juggling routine!"
	done

.battle_won_text
	ctxt "That doesn't"
	line "appease you?"
	done

Route71East_Trainer_2:
	trainer EVENT_ROUTE_71_EAST_TRAINER_2, FIREBREATHER, 8, .before_battle_text, .battle_won_text

	ctxt "There are actually"
	line "different items"
	para "you can mine out"
	line "in various areas!"

	para "For instance, if"
	line "you're looking for"
	para "Fire Stones, mine"
	line "deep into"
	cont "Firelight Caverns!"
	done

.before_battle_text
	ctxt "I know a little"
	line "secret about"
	cont "mining properly."

	para "Beat me to find"
	line "out what it is!"
	done

.battle_won_text
	ctxt "Alright, you wanna"
	line "hear it?"
	done

Route71East_Trainer_3:
	trainer EVENT_ROUTE_71_EAST_TRAINER_3, FIREBREATHER, 7, .before_battle_text, .battle_won_text

	ctxt "If you head east,"
	line "you'll end up in"
	cont "Firelight Caverns."

	para "That's where I"
	line "caught my #mon!"
	done

.before_battle_text
	ctxt "Time to melt away"
	line "those chills."
	done

.battle_won_text
	ctxt "Well, now that"
	line "didn't work out."
	done

Route71East_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 25, 2, 8, CLATHRITE_1F
	warp_def 25, 26, 3, PHACELIA_WEST_EXIT
	warp_def 13, 24, 1, BATTLE_TOWER_ENTRANCE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 22, 20, SIGNPOST_LOAD, Route71EastBattleTowerSign

.ObjectEvents: db 3
	person_event SPRITE_JUGGLER, 21, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route71East_Trainer_1, -1
	person_event SPRITE_FIREBREATHER, 26, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route71East_Trainer_2, -1
	person_event SPRITE_FIREBREATHER, 25, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route71East_Trainer_3, -1
