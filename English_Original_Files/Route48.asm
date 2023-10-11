Route48_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, .set_bike_on

.set_bike_on
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

Route48HiddenItem:
	dw EVENT_ROUTE_48_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route48BorderSign:
	ctxt "Johto - Rijon"
	next "border"
	done

Route48IlexForestSign:
	ctxt "Rijoh Bridge"
	next "<UP> Ilex Forest"
	next "<DOWN> Route 49"
	done

Route48UphillSign:
	ctxt "Going uphill!"
	done

Route48_Trainer_1:
	trainer EVENT_ROUTE_48_TRAINER_1, BIKER, 3, .before_battle_text, .battle_won_text

	ctxt "Why should the"
	line "media control you?"

	para "Listen to what I"
	line "have to say, not"
	cont "to what they say."
	done

.before_battle_text
	ctxt "Conformist!"
	done

.battle_won_text
	ctxt "Aaargy."
	done

Route48_Trainer_2:
	trainer EVENT_ROUTE_48_TRAINER_2, BIKER, 5, .before_battle_text, .battle_won_text

	ctxt "Too scared to"
	line "bike, huh?"
	done

.before_battle_text
	ctxt "Biking on docks,"
	line "safe, huh?"
	done

.battle_won_text
	ctxt "You're a wimp!"
	done

Route48_Trainer_3:
	trainer EVENT_ROUTE_48_TRAINER_3, BIKER, 4, .before_battle_text, .battle_won_text

	ctxt "One time my bike"
	line "rolled into the"
	cont "bay."

	para "Needless to say, I"
	line "was furious!"
	done

.before_battle_text
	ctxt "I'm going to do"
	line "some donuts on"
	cont "this dock!"
	done

.battle_won_text
	ctxt "That burned me"
	line "out."
	done

Route48_Trainer_4:
	trainer EVENT_ROUTE_48_TRAINER_4, BIKER, 6, .before_battle_text, .battle_won_text

	ctxt "Azalea Town's"
	line "boring people can't"
	para "appreciate my wild"
	line "lifestyle."
	done

.before_battle_text
	ctxt "I'm not allowed to"
	line "go through the"
	cont "Johto gate."
	done

.battle_won_text
	ctxt "It's 'cause I'm"
	line "hostile!"
	done

Route48_Trainer_5:
	trainer EVENT_ROUTE_48_TRAINER_5, BIKER, 2, .before_battle_text, .battle_won_text

	ctxt "I still don't like"
	line "you!"
	done

.before_battle_text
	ctxt "I don't like you,"
	line "but let's battle."
	done

.battle_won_text
	ctxt "Now I really don't"
	line "like you."
	done

Route48_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 4
	signpost 51,  9, SIGNPOST_LOAD, Route48BorderSign
	signpost 87,  9, SIGNPOST_LOAD, Route48IlexForestSign
	signpost 141, 11, SIGNPOST_LOAD, Route48UphillSign
	signpost 25,  8, SIGNPOST_ITEM, Route48HiddenItem

.ObjectEvents: db 6
	person_event SPRITE_FRUIT_TREE, 98, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, CYAN_APRICORN_TREE_1, -1
	person_event SPRITE_BIKER, 91,  4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route48_Trainer_1, -1
	person_event SPRITE_BIKER, 39,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route48_Trainer_2, -1
	person_event SPRITE_BIKER, 63,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route48_Trainer_3, -1
	person_event SPRITE_BIKER, 19,  9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, Route48_Trainer_4, -1
	person_event SPRITE_BIKER, 119,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route48_Trainer_5, -1
