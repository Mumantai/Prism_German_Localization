Route49_MapScriptHeader;trigger count
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
	ctxt "<UP><LEFT> Route 48-B"
	next "<RIGHT>  Osaria City"
	done

Route49_Trainer_1:
	trainer EVENT_ROUTE_49_TRAINER_1, BIRD_KEEPER, 5, .before_battle_text, .battle_won_text

	ctxt "Mein Ibitak wird"
	line "mal stärker!"

	done

.before_battle_text
	ctxt "Fürchte meine"
	line "Ibitak-Armee!"

	done

.battle_won_text
	ctxt "Ja das lief jetzt"
	line "nicht so gut."

	done

Route49_Trainer_2:
	trainer EVENT_ROUTE_49_TRAINER_2, BIKER, 1, .before_battle_text, .battle_won_text

	ctxt "Besorg dir ein"
	line "Rad!"

	done

.before_battle_text
	ctxt "Diese Beinchen"
	line "schaffen es doch"
	cont "nie nach Johto!"

	done

.battle_won_text
	ctxt "Wenigstens habe"
	line "ich mein Motorrad."

	done

Route49_MapEventHeader ;filler
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
	person_event SPRITE_SUPER_NERD, 6, 45, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route49_Trainer_1, -1
	person_event SPRITE_BIKER, 8, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route49_Trainer_2, -1
