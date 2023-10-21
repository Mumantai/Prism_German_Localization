Route80_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route80ProphetSign:
	ctxt "Der Naljo Prophet"
	done

Route80IslandSign:
	signpostheader 7
	done

Route80_Trainer_1:
	trainer EVENT_ROUTE_80_TRAINER_1, SWIMMERM, 2, .before_battle_text, .battle_won_text

	ctxt "Ich kann sehr"
	line "weit schwimmen."
	para "Einmal bin ich"
	line "sogar @"
	start_asm
	ld a, [wOptions2]
	and 1 << 2
	ld hl, .metric_text
	ret z
	ld hl, .imperial_text
	ret
.metric_text
	ctxt ""
	para "einen Kilometer"
	line "weit geschwommen!"
	done
.imperial_text
	ctxt ""
	para "eine halbe Meile"
	line "weit geschwommen!"
	done

.before_battle_text
	ctxt "Ich bin bereit!"
	done

.battle_won_text
	ctxt "Wie? Keine #mon"
	line "mehr übrig?"
	done

Route80_Trainer_2:
	trainer EVENT_ROUTE_80_TRAINER_2, SWIMMERM, 1, .before_battle_text, .battle_won_text

	ctxt "Jede Runde mehr,"
	line "stärkt meine"
	cont "Muskeln."

	para "Mit diesem Körper,"
	line "kriege ich jedes"
	cont "Mädchen, baby!"
	done

.before_battle_text
	ctxt "Meine 100. Runde"
	line "für heute!"

	para "Zeit für eine"
	line "Pause!"
	done

.battle_won_text
	ctxt "Nunja, zurück zum"
	line "Schwimmen!"
	done

Route80_Trainer_3:
	trainer EVENT_ROUTE_80_TRAINER_3, SWIMMERF, 2, .before_battle_text, Route80_Trainers_3_5_BattleWon_Text

	ctxt "Die Stürme hier,"
	line "haben bereits"
	para "Einigen das"
	line "Leben gekostet."

	para "Wir müssen auf"
	line "dieser Route sehr"
	cont "vorsichtig sein!"
	done

.before_battle_text
	ctxt "Ich versuche, aus"
	line "diesem schreck-"
	para "lichen Gefängniss"
	line "zu entkommen."

	para "Du kannst mich"
	line "niemals aufhalten!"
	done

Route80_Trainer_4:
	trainer EVENT_ROUTE_80_TRAINER_4, FISHER, 5, .before_battle_text, .battle_won_text

	ctxt "Dieser Angler ist"
	line "ein Verwandter des"
	para "bekannten"
	line "Angler-Gurus."
	done

.before_battle_text
	ctxt "Diese #mon,"
	line "habe ich mit"
	para "einer Profiangel"
	line "gefangen!"
	done

.battle_won_text
	ctxt "Dabei bin ich gar"
	line "kein Profi."
	done

Route80_Trainer_5:
	trainer EVENT_ROUTE_80_TRAINER_5, SWIMMERF, 1, .before_battle_text, Route80_Trainers_3_5_BattleWon_Text

	ctxt "In diesem Teil von"
	line "Naljo gibt es oft"
	para "Gewitterstürme."
	
	line "Das macht doch gar"
	cont "keinen Sinn."
	done

.before_battle_text
	ctxt "Diese Route hat"
	line "echt eigenartige"
	cont "Wetterlagen."
	done

Route80_Trainer_6:
	trainer EVENT_ROUTE_80_TRAINER_6, FISHER, 6, .before_battle_text, .battle_won_text

	ctxt "Keiner darf hier"
	line "angeln, außer mir!"
	cont "Hast du kapiert?"
	done

.before_battle_text
	ctxt "Hey, du! Das ist"
	line "mein Angelplatz!"
	done

.battle_won_text
	text "Naja <...>"
	done

Route80_Trainers_3_5_BattleWon_Text:
	ctxt "Man schwimmt bei"
	line "einem Sturm nicht!"
	done

Route80_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 6, 6, 3, ROUTE_81_EASTGATE
	warp_def 7, 6, 4, ROUTE_81_EASTGATE
	warp_def 5, 9, 1, ROUTE_80_NOBU
	warp_def 37, 6, 2, SAXIFRAGE_EXITS

.CoordEvents: db 0

.BGEvents: db 3
	signpost 6, 10, SIGNPOST_TEXT, Route80ProphetSign
	signpost 4, 12, SIGNPOST_JUMPSTD, qrcode, QR_ROUTE_80
	signpost  8,  6, SIGNPOST_LOAD, Route80IslandSign

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 22, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_THUNDER, 0, EVENT_ROUTE_80_TM_THUNDER
	person_event SPRITE_POKE_BALL, 19, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DRAGON_SCALE, EVENT_ROUTE_80_ITEM_DRAGON_SCALE
	person_event SPRITE_SWIMMER_GUY, 22, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route80_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 41, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route80_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL, 45, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route80_Trainer_3, -1
	person_event SPRITE_FISHER, 18, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route80_Trainer_4, -1
	person_event SPRITE_SWIMMER_GIRL, 8, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route80_Trainer_5, -1
	person_event SPRITE_FISHER, 14, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route80_Trainer_6, -1
	person_event SPRITE_BOULDER, 41, 7, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
