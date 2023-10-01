Route68_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route68HiddenItem:
	dw EVENT_ROUTE_68_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route68DirectionsSign:
	ctxt "<LEFT> Akania-Hafen"
	next "<RIGHT> Rijon-Grenze"
	next "<RIGHT><RIGHT>Faenumia City"
	done

Route68_Trainer_1:
	trainer EVENT_ROUTE_68_TRAINER_1, OFFICER, 4, .before_battle_text, .battle_won_text

	ctxt "Bitte mach keinen"
	line "Aufstand in Rijon."

	para "Naljo hat dort ja"
	line "eh schon einen"
	cont "schlechten Ruf."
	done

.before_battle_text
	ctxt "Du willst Naljo"
	line "verlassen?"

	para "Packst du das?"
	done

.battle_won_text
	ctxt "Sieht so aus."
	done

Route68_Trainer_2:
	trainer EVENT_ROUTE_68_TRAINER_2, SWIMMERM, 15, .before_battle_text, .battle_won_text

	ctxt "Du würdest Naljo"
	line "eher nicht weiter-"
	cont "empfehlen?"
	done

.before_battle_text
	ctxt "Ich bin aus Rijon"
	line "und will Naljo"
	para "hautnah erleben."
	done

.battle_won_text
	ctxt "Oh, ihr aus Naljo"
	line "wisst echt wie man"
	cont "kämpft."
	done

Route68_Trainer_3:
	trainer EVENT_ROUTE_68_TRAINER_3, SWIMMERM, 14, .before_battle_text, .battle_won_text

	ctxt "Das Wasser hier"
	line "ist klarer als"
	cont "sonstwo in Naljo."

	para "Man kann sogar die"
	line "#mon unter uns"
	cont "schwimmen sehen!"
	done

.before_battle_text
	ctxt "Das ist mein"
	line "Lieblingsplatz"
	cont "zum Schwimmen!"
	done

.battle_won_text
	ctxt "Ups."
	done

Route68_Trainer_4:
	trainer EVENT_ROUTE_68_TRAINER_4, SWIMMERF, 10, .before_battle_text, .battle_won_text

	ctxt "Ich tauche meinen"
	line "Kopf niemals unter"
	cont "Wasser. Niemals."

	para "Mein Makeup würde"
	line "sonst verlaufen!"
	done

.before_battle_text
	ctxt "Beim Schwimmen,"
	line "versuche ich den"
	para "Kopf immer über"
	line "Wasser zu halten."
	done

.battle_won_text
	ctxt "Das war gemein."
	done

Route68_Trainer_5:
	trainer EVENT_ROUTE_68_TRAINER_5, SWIMMERF, 11, .before_battle_text, .battle_won_text

	ctxt "Zwischen Fliegen,"
	line "Schaufeln und"
	para "Schwimmen, würde"
	line "ich immer das"
	cont "Schwimmen wählen."
	done

.before_battle_text
	ctxt "Zum Glück gibt es"
	line "diese Hafenstadt."

	para "So kann ich auf"
	line "dem Weg zwischen"
	para "Faenumia City und"
	line "Torenia City eine"
	cont "Pause einlegen."
	done

.battle_won_text
	ctxt "Das hat mich jetzt"
	line "echt ausgepowert."
	done

Route68_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 5, 49, 1, NALJO_BORDER_WEST

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 51, SIGNPOST_LOAD, Route68DirectionsSign
	signpost 14, 22, SIGNPOST_ITEM, Route68HiddenItem

.ObjectEvents: db 7
	person_event SPRITE_OFFICER, 6, 48, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route68_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 13, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route68_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 6, 9, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, Route68_Trainer_3, -1
	person_event SPRITE_SWIMMER_GIRL, 11, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 3, Route68_Trainer_4, -1
	person_event SPRITE_SWIMMER_GIRL, 6, 34, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route68_Trainer_5, -1
	person_event SPRITE_FRUIT_TREE, 11, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, 14, -1
	person_event SPRITE_POKE_BALL, 7, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELIXIR, EVENT_ROUTE_68_ITEM_ELIXIR
