Route80_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route80ProphetSign:
	ctxt "The Naljo Prophet"
	done

Route80IslandSign:
	signpostheader 7
	done

Route80_Trainer_1:
	trainer EVENT_ROUTE_80_TRAINER_1, SWIMMERM, 2, .before_battle_text, .battle_won_text

	ctxt "I can swim pretty"
	line "far away from the"
	para "coast. Once I even"
	line "went @"
	start_asm
	ld a, [wOptions2]
	and 1 << 2
	ld hl, .metric_text
	ret z
	ld hl, .imperial_text
	ret
.metric_text
	ctxt "a kilometer!"
	done
.imperial_text
	ctxt "half a mile!"
	done

.before_battle_text
	ctxt "I'm all pumped up!"
	done

.battle_won_text
	ctxt "Wait, I'm already"
	line "out of #mon?"
	done

Route80_Trainer_2:
	trainer EVENT_ROUTE_80_TRAINER_2, SWIMMERM, 1, .before_battle_text, .battle_won_text

	ctxt "All these laps"
	line "continue to tone"
	cont "my muscles."

	para "I'll be able to"
	line "get any girl I"
	para "want with this"
	line "body, baby!"
	done

.before_battle_text
	ctxt "My 100th lap for"
	line "the day!"

	para "Time for a break"
	line "with a battle!"
	done

.battle_won_text
	ctxt "Well, back to"
	line "swimming!"
	done

Route80_Trainer_3:
	trainer EVENT_ROUTE_80_TRAINER_3, SWIMMERF, 2, .before_battle_text, Route80_Trainers_3_5_BattleWon_Text

	ctxt "The harsh storms"
	line "that have occurred"
	para "here killed other"
	line "fugitives."

	para "We need to be"
	line "careful when we"
	para "travel on this"
	line "route."
	done

.before_battle_text
	ctxt "I'm trying to"
	line "escape from that"
	cont "dreadful prison."

	para "You're not gonna"
	line "stop me, never."
	done

Route80_Trainer_4:
	trainer EVENT_ROUTE_80_TRAINER_4, FISHER, 5, .before_battle_text, .battle_won_text

	ctxt "That fisherman"
	line "was a distant"
	para "relative to the"
	line "fishing guru."
	done

.before_battle_text
	ctxt "I caught these"
	line "#mon with a"
	cont "pretty good rod!"
	done

.battle_won_text
	ctxt "Well, if the rod's"
	line "name is <``>good<''><...>"

	para "Does that make it"
	line "false labeling?"
	done

Route80_Trainer_5:
	trainer EVENT_ROUTE_80_TRAINER_5, SWIMMERF, 1, .before_battle_text, Route80_Trainers_3_5_BattleWon_Text

	ctxt "This part of Naljo"
	line "often has"
	cont "thunderstorms."

	para "I'm not sure how"
	line "that makes sense."
	done

.before_battle_text
	ctxt "This route has"
	line "some very strange"
	cont "weather patterns."
	done

Route80_Trainer_6:
	trainer EVENT_ROUTE_80_TRAINER_6, FISHER, 6, .before_battle_text, .battle_won_text

	ctxt "Nobody's allowed in"
	line "this spot but me,"
	cont "understood?"
	done

.before_battle_text
	ctxt "Hey, you. This is"
	line "my fishing spot."
	done

.battle_won_text
	ctxt "Well<...>"
	done

Route80_Trainers_3_5_BattleWon_Text:
	ctxt "Don't swim when"
	line "there's a storm!"
	done

Route80_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 6, 6, 3, ROUTE_81_EASTGATE
	warp_def 7, 6, 4, ROUTE_81_EASTGATE
	warp_def 5, 9, 1, ROUTE_80_NOBU
	warp_def 37, 6, 2, SAXIFRAGE_EXITS

.CoordEvents: db 0

.BGEvents: db 3
	signpost 6, 10, SIGNPOST_TEXT, Route80ProphetSign
	signpost 4, 12, SIGNPOST_JUMPSTD, qrcode, QR_ROUTE_80
	signpost  8,  6, SIGNPOST_LOAD, Route80IslandSign

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 22, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_THUNDER, 0, EVENT_ROUTE_80_TM_THUNDER
	person_event SPRITE_POKE_BALL, 19, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DRAGON_SCALE, EVENT_ROUTE_80_ITEM_DRAGON_SCALE
	person_event SPRITE_SWIMMER_GUY, 22, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route80_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 41, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route80_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL, 45, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route80_Trainer_3, -1
	person_event SPRITE_FISHER, 18, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route80_Trainer_4, -1
	person_event SPRITE_SWIMMER_GIRL, 8, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route80_Trainer_5, -1
	person_event SPRITE_FISHER, 14, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route80_Trainer_6, -1
	person_event SPRITE_BOULDER, 41, 7, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
