Route51_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route51HiddenItem:
	dw EVENT_ROUTE_51_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route51DirectionsSign:
	ctxt "Nugget Pass"
	next "<RIGHT> Route 50"
	next "<DOWN> Hayward City"
	done

Route51_Trainer:
	trainer EVENT_ROUTE_51_TRAINER_1, SUPER_NERD, 4, .before_battle_text, .battle_won_text

	ctxt "I guess I wouldn't"
	line "have found these"
	para "great #mon if"
	line "it wasn't for this"
	cont "grassy path."
	done

.before_battle_text
	ctxt "Someone should"
	line "clear this path."

	para "Forcing people to"
	line "walk through so"
	para "much grass is just"
	line "poor road design."
	done

.battle_won_text
	ctxt "Well, this puts"
	line "things into"
	cont "perspective."
	done

Route51_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 0

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 5, 11, SIGNPOST_LOAD, Route51DirectionsSign
	signpost 4, 4, SIGNPOST_ITEM, Route51HiddenItem

	;people-events
	db 1
	person_event SPRITE_YOUNGSTER, 14, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route51_Trainer, -1
