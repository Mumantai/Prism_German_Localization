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
	ctxt "Du solltest dank-"
	line "bar sein, dass wir"
	para "eine Technologie"
	line "haben um #mon"
	cont "zu zähmen."
	done

.before_battle_text
	ctxt "Schwimm gefälligst"
	line "alleine, wie ich!"
	done

.battle_won_text
	ctxt "Wenigstens müssen"
	line "meine #mon mich"
	para "nicht beim"
	line "Schwimmen tragen <...>"
	done

TunodWaterway_Trainer_2:
	trainer EVENT_TUNOD_WATERWAY_TRAINER_2, SWIMMERF, 8, .before_battle_text, .battle_won_text
	ctxt "Wir verlieren mehr"
	line "und mehr Privat-"
	para "spähre, je offener"
	line "die Welt wird."
	done

.before_battle_text
	ctxt "Das war mal mein"
	line "geheimer Ort"
	para "wo ich für mich"
	line "selbst sein konnte"
	para "bevor Südport City"
	line "die Passage hier"
	cont "eröffnete."
	done

.battle_won_text
	ctxt "Siehst du nun,"
	line "wieso ich diesen"
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