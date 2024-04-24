TunodWaterway_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

TunodWaterwayHiddenItem:
	dw EVENT_TUNOD_WATERWAY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

TunodWaterway_Trainer_1:
	trainer EVENT_TUNOD_WATERWAY_TRAINER_1, SWIMMERM, 11, .before_battle_text, .battle_won_text
	ctxt "Du solltest"
	line "dankbar sein,"
	para "dass wie die"
	line "Technologie"
	para "haben, um #mon"
	line "zu zähmen."
	done

.before_battle_text
	ctxt "Schwimm gefälligst"
	line "selber, wie ich!"
	done

.battle_won_text
	ctxt "Ich dachte, meine"
	line "#mon hätten"
	para "mehr Energie, wenn"
	line "sie mich nicht"
	cont "tragen müssen<...>"
	done

TunodWaterway_Trainer_2:
	trainer EVENT_TUNOD_WATERWAY_TRAINER_2, SWIMMERF, 8, .before_battle_text, .battle_won_text
	ctxt "Das Fortschreiten"
	line "der Zivilisation"
	para "zerstört ruhige"
	line "Orte, wie diesen"
	cont "hier."
	done

.before_battle_text
	ctxt "Das war mal mein"
	line "geheimer Ort, bis"
	para "Suntia City diesen"
	line "Pfad eröffnet hat<...>"
	done

.battle_won_text
	ctxt "Siehst du jetzt,"
	line "warum ich diesen"
	para "Ort nur für mich"
	line "haben wollte?"
	done

TunodWaterway_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def  7,  4, 1, OLCAN_CHINE_ENTRANCE

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 12, 50, SIGNPOST_ITEM, TunodWaterwayHiddenItem

	;people-events
	db 3
	person_event SPRITE_FRUIT_TREE,  5, 38, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, RAWST_TREE_1, -1
	person_event SPRITE_SWIMMER_GUY, 11, 41, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TunodWaterway_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL,  7, 60, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TunodWaterway_Trainer_2, -1