Route49_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, .set_bike_on

.set_bike_on
	setflag ENGINE_ALWAYS_ON_BIKE
	return

Route49HiddenItem:
	dw EVENT_ROUTE_49_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route49DirectionsSign:
	ctxt "Cycling Foothill"
	next "<UP><LEFT> Rijoh Bridge"
	next "<RIGHT>  Owsauri City"
	done

Route49_Trainer_1:
	trainer EVENT_ROUTE_49_TRAINER_1, BIRD_KEEPER, 5, .before_battle_text, .battle_won_text

	ctxt "My Fearow shall"
	line "grow stronger!"
	done

.before_battle_text
	ctxt "Fear my ferocious"
	line "Fearow force!"
	done

.battle_won_text
	ctxt "Try saying that"
	line "five times fast!"
	done

Route49_Trainer_2:
	trainer EVENT_ROUTE_49_TRAINER_2, BIKER, 1, .before_battle_text, .battle_won_text

	ctxt "Get some wheels!"
	done

.before_battle_text
	ctxt "You don't have the"
	line "legs to get to"
	cont "Johto!"
	done

.battle_won_text
	ctxt "At least I have my"
	line "motorcycle to move"
	cont "me around."
	done

Route49_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $d, $2e, 1, ROUTE_50_GATE
	warp_def $7, $21, 2, ROUTE_49_GATE
	warp_def $d, $2f, 2, ROUTE_50_GATE
	warp_def $7, $28, 4, ROUTE_49_GATE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 5, 41, SIGNPOST_LOAD, Route49DirectionsSign
	signpost 9, 26, SIGNPOST_ITEM, Route49HiddenItem

	;people-events
	db 2
	person_event SPRITE_SUPER_NERD, 6, 45, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, Route49_Trainer_1, -1
	person_event SPRITE_BIKER, 8, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route49_Trainer_2, -1
