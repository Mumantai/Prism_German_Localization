Route47_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, .set_bike_on

.set_bike_on
	setflag ENGINE_ALWAYS_ON_BIKE
	return

Route47HiddenItem:
	dw EVENT_ROUTE_47_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route47DirectionsSign:
	ctxt "Cycling Peak"
	next "<RIGHT><UP> Route 34"
	next "<RIGHT><DOWN> Ilex Forest"
	next "<DOWN>  Rijoh Bridge"
	done

Route47_Trainer_1:
	trainer EVENT_ROUTE_47_TRAINER_1, BIKER, 8, .before_battle_text, .battle_won_text

	ctxt "Don't push it."
	done

.before_battle_text
	ctxt "You cannot enter"
	line "this gate."
	done

.battle_won_text
	ctxt "Well, now you can."
	done

Route47_Trainer_2:
	trainer EVENT_ROUTE_47_TRAINER_2, BIKER, 7, .before_battle_text, .battle_won_text

	ctxt "Just gonna chill."
	done

.before_battle_text
	ctxt "I'm about to"
	line "coast down."
	done

.battle_won_text
	ctxt "Screw it."
	done

Route47_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $5, $19, 2, ROUTE_34_GATE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 9, 11, SIGNPOST_ITEM, Route47HiddenItem
	signpost 15, 5, SIGNPOST_LOAD, Route47DirectionsSign

	;people-events
	db 2
	person_event SPRITE_BIKER, 6, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route47_Trainer_1, -1
	person_event SPRITE_BIKER, 11, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route47_Trainer_2, -1
