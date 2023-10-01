Route63_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route63HiddenItem:
	dw EVENT_ROUTE_63_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route63DirectionsSign:
	ctxt "<LEFT> Heuhofen"
	next "<RIGHT> Seidentunnel"
	done

Route63_Trainer_1:
	trainer EVENT_ROUTE_63_TRAINER_1, BUG_CATCHER, 10, .before_battle_text, .battle_won_text

	ctxt "Käfer #mon sind"
	line "super effektiv"
	para "gegen Psycho und"
	line "Schatten #mon."

	para "Cool, was?"

	done

.before_battle_text
	ctxt "Zeit für meinen"
	line "Käferschwarm "
	cont "anzugreifen!"

	done

.battle_won_text
	ctxt "Du hast nicht"
	line "einmal"
	para "Insektenspray "
	line "verwendet!"

	done

Route63_Trainer_2:
	trainer EVENT_ROUTE_63_TRAINER_2, LASS, 6, .before_battle_text, .battle_won_text

	ctxt "Dieser Tunnel wird"
	line "Seidentunnel"
	para "genannt, weil er"
	line "früher die größte"
	para "Raupy Wildnis-"
	line "quelle war."

	para "Alle enthlielten"
	line "Seide, aus der"
	para "Menschen Kleider "
	line "herstellten."

	para "Hat dir deine"
	line "Geschichtsstunde "
	cont "gefallen?"

	done

.before_battle_text
	ctxt "Weißt du, warum"
	line "dieser Tunnel"
	para "Seidentunnel"
	line "genannt wird?"

	done

.battle_won_text
	ctxt "Neugierig?"

	done

Route63_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 7, 54, 1, SILK_TUNNEL_1F

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 3, SIGNPOST_LOAD, Route63DirectionsSign
	signpost 11, 24, SIGNPOST_ITEM, Route63HiddenItem

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 10, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_IRON_HEAD, 0, EVENT_ROUTE_63_TM
	person_event SPRITE_YOUNGSTER, 2, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route63_Trainer_1, -1
	person_event SPRITE_LASS, 6, 40, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route63_Trainer_2, -1
	person_event SPRITE_FRUIT_TREE, 7, 47, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_FRUITTREE, 0, 6, -1
