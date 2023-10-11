Route76_MapScriptHeader:
	;trigger count
	db 0
 ;callback count
	db 0

Route76HiddenItem:
	dw EVENT_ROUTE_76_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route76DirectionsSign:
	ctxt "<UP> Laurel City"
	next "<RIGHT> Laurel Forest"
	next "<RIGHT><DOWN>Torenia City"
	done

Route76_Trainer_1:
	trainer EVENT_ROUTE_76_TRAINER_1, TWINS, 2, .before_battle_text, .battle_won_text

	ctxt "Lily: -sniffs-"

	para "Please find it<...>"
	done

.before_battle_text
	ctxt "Where is our"
	line "Shinx?!"
	done

.battle_won_text
	ctxt "Liz & Lily: You're"
	line "mean!"
	done

Route76_Trainer_1_OtherTwin:
	ctxt "Liz: We loved"
	line "playing with"
	cont "our Shinx."

	para "I hope he's OK."
	done

Route76_Trainer_2:
	trainer EVENT_ROUTE_76_TRAINER_2, PSYCHIC_T, 2, .before_battle_text, .battle_won_text

	ctxt "I don't know why"
	line "the #mon in"
	para "this town keep"
	line "vanishing<...>"
	done

.before_battle_text
	ctxt "I'm looking for"
	line "my lost #mon."
	done

.battle_won_text
	ctxt "That's sad too<...>"
	done

Route76_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 11, 14, 6, LAUREL_FOREST_GATES

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 11, SIGNPOST_LOAD, Route76DirectionsSign
	signpost 11, 16, SIGNPOST_ITEM, Route76HiddenItem

.ObjectEvents: db 4
	person_event SPRITE_TWIN, 12, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 1, Route76_Trainer_1_OtherTwin, -1
	person_event SPRITE_TWIN, 12, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route76_Trainer_1, -1
	person_event SPRITE_PSYCHIC, 6, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 4, Route76_Trainer_2, -1
	person_event SPRITE_POKE_BALL, 3, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, GREAT_BALL, EVENT_ROUTE_76_ITEM_GREAT_BALLS
