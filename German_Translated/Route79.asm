Route79_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route79HiddenItem:
	dw EVENT_ROUTE_79_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route79_Trainer_1:
	trainer EVENT_ROUTE_79_TRAINER_1, COOLTRAINERM, 10, .before_battle_text, .battle_won_text

	ctxt "Viele dieser ein-"
	line "gesperrten #mon"
	para "wurden durch ihre"
	line "Trainer verletzt <...>"

	para "Sie tun mir zwar"
	line "leid, aber es ist"
	para "gut so, dass sie"
	line "eingesperrt wur-"
	para "den, weil sie"
	line "ihre Hass auf"
	para "ihre Trainer auch"
	line "auf andere Men-"
	para "schen proji-"
	line "zieren könnten."
	done

.before_battle_text
	ctxt "Das Gefängnis zu"
	line "besuchen, hat"
	cont "schon was <...>"

	para "Diese gefährlichen"
	line "#mon erzeugen"
	para "bei mir immer eine"
	line "Gänsehaut."
	done

.battle_won_text
	ctxt "<...> Du gehörst"
	line "eingesperrt <...>"
	done

Route79_Trainer_2:
	trainer EVENT_ROUTE_79_TRAINER_2, BIRD_KEEPER, 6, .before_battle_text, .battle_won_text

	ctxt "Die Knackis hier"
	line "sind wie meine"
	cont "Vögel <...> Im Käfig."

	para "Verstehste?"
	
	para "<...>"

	para "Jetzt lach end-"
	line "lich, bevor ich"
	cont "sauer werde!"
	done

.before_battle_text
	ctxt "Ich bin aus dem"
	line "Knast geflüchtet."

	para "Was ich getan hab,"
	line "um dort zu landen?"

	para "Das geht dich"
	line "nichts an!"
	done

.battle_won_text
	ctxt "Meine #mon sind"
	line "wohl etwas"
	cont "eingerostet."
	done

Route79_Trainer_3:
	trainer EVENT_ROUTE_79_TRAINER_3, POKEFANM, 4, .before_battle_text, .battle_won_text

	ctxt "Habibi, tritt"
	line "meinem Ponita-Club"
	para "bei! Ich schwöre,"
	line "wir sind voll"
	cont "freundlich undso!"
	done

.before_battle_text
	ctxt "Yooo, mein Habibi!"

	para "Ich schwör, ich"
	line "liebe Ponitas!"
	done

.battle_won_text
	ctxt "Ich schwör, diese"
	line "anderen Ponita-"
	para "fans werden mich"
	line "auslachen!"
	done

Route79_Trainer_4:
	trainer EVENT_ROUTE_79_TRAINER_4, COOLTRAINERM, 9, .before_battle_text, .battle_won_text

	ctxt "Fake-Protein zu"
	line "kaufen, war wohl"
	para "doch keine gute"
	line "Idee <...>"
	done

.before_battle_text
	ctxt "Ich habe all"
	line "meinen #mon"
	cont "Protein gegeben."

	para "Nun hast du keine"
	line "Chance mehr!"
	done

.battle_won_text
	ctxt "Das Protein hat"
	line "nichts gebracht?"
	done

Route79_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 13, 2, 2, ROUTE_78_EAST_EXIT
	warp_def 3, 32, 3, SAXIFRAGE_EXITS

.CoordEvents: db 0

.BGEvents: db 1
	signpost 16, 27, SIGNPOST_ITEM, Route79HiddenItem

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_M, 5, 29, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route79_Trainer_1, -1
	person_event SPRITE_BIRDKEEPER, 8, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 1, Route79_Trainer_2, -1
	person_event SPRITE_POKEFAN_M, 12, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route79_Trainer_3, -1
	person_event SPRITE_COOLTRAINER_M, 12, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 4, Route79_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 2, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, WATER_RING, EVENT_ROUTE_79_ITEM_WATER_RING
