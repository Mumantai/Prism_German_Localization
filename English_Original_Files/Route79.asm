Route79_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route79HiddenItem:
	dw EVENT_ROUTE_79_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route79_Trainer_1:
	trainer EVENT_ROUTE_79_TRAINER_1, COOLTRAINERM, 8, .before_battle_text, .battle_won_text

	ctxt "Many of those"
	line "locked up #mon"
	para "were abused by"
	line "their Trainers."

	para "I feel sorry for"
	line "them, but it makes"
	para "sense to keep them"
	line "locked away so"
	para "they don't harm"
	line "anyone else."
	done

.before_battle_text
	ctxt "Visiting jail is"
	line "something else."

	para "It's such a thrill"
	line "to see all of the"
	cont "hostile #mon."
	done

.battle_won_text
	ctxt "<...>Guess I should"
	line "learn from the"
	cont "prison #mon."
	done

Route79_Trainer_2:
	trainer EVENT_ROUTE_79_TRAINER_2, BIRD_KEEPER, 6, .before_battle_text, .battle_won_text

	ctxt "You could say I'm a"
	line "jailbird."

	para "<...>"

	para "Start laughing"
	line "before I get mad."
	done

.before_battle_text
	ctxt "I just broke out"
	line "of that prison."

	para "What did I do to"
	line "get there in the"
	cont "first place?"

	para "That's none of your"
	line "business."
	done

.battle_won_text
	ctxt "Guess my #mon"
	line "are pretty rusty."

	para "They usually don't"
	line "allow battles in"
	cont "the prison."
	done

Route79_Trainer_3:
	trainer EVENT_ROUTE_79_TRAINER_3, POKEFANM, 4, .before_battle_text, .battle_won_text

	ctxt "Join my Ponyta"
	line "club! We're all"
	cont "super friendly."
	done

.before_battle_text
	ctxt "Yooo, my brotha!"

	para "I'm the biggest"
	line "Ponyta fan ever!"
	done

.battle_won_text
	ctxt "Other Ponyta fans"
	line "will give me some"
	cont "backlash for this!"
	done

Route79_Trainer_4:
	trainer EVENT_ROUTE_79_TRAINER_4, COOLTRAINERM, 7, .before_battle_text, .battle_won_text

	ctxt "Turns out that"
	line "buying counterfeit"
	para "Protein wasn't the"
	line "best idea<...>"
	done

.before_battle_text
	ctxt "I just gave all of"
	line "my #mon a bunch"
	cont "of Protein."

	para "They'll now have no"
	line "problem taking you"
	cont "down!"
	done

.battle_won_text
	ctxt "Wait, why didn't"
	line "the Protein work?"
	done

Route79_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 13, 2, 2, ROUTE_78_EAST_EXIT
	warp_def 3, 32, 3, SAXIFRAGE_EXITS

.CoordEvents: db 0

.BGEvents: db 1
	signpost 16, 27, SIGNPOST_ITEM, Route79HiddenItem

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_M, 5, 29, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route79_Trainer_1, -1
	person_event SPRITE_BIRDKEEPER, 8, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 1, Route79_Trainer_2, -1
	person_event SPRITE_POKEFAN_M, 12, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route79_Trainer_3, -1
	person_event SPRITE_COOLTRAINER_M, 12, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 4, Route79_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 2, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, WATER_RING, EVENT_ROUTE_79_ITEM_WATER_RING
