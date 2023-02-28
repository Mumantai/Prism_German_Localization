Route51_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route51HiddenItem:
	dw EVENT_ROUTE_51_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route51DirectionsSign:
	ctxt "<RIGHT> Route 50"
	next "<DOWN> Heuhofen"
	done

Route51_Trainer:
	trainer EVENT_ROUTE_51_TRAINER_1, SUPER_NERD, 4, .before_battle_text, .battle_won_text

	ctxt "Ich schätze, ich"
	line "hätte diese tollen"
	para "#mon nicht"
	line "gefunden, wenn man"
	para "den Weg hier"
	line "gemäht hätte."

	done

.before_battle_text
	ctxt "Jemand sollte"
	line "hier mal mähen!"

	para "Es ist doch un-"
	line "verantwortlich,"
	para "die Leute durch so"
	line "viel hohes Gras"
	para "laufen zu lassen!"

	done

.battle_won_text
	ctxt "Gut, das kann man"
	line "wohl auch anders"
	cont "sehen."

	done

Route51_MapEventHeader ;filler
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
