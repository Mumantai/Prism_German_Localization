Route77_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route77HiddenItem:
	dw EVENT_ROUTE_77_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route77IslandSignNorth:
	signpostheader 5
	done

Route77IslandSignSouth:
	signpostheader 7
	done

Route77Guard_AfterIlk:
	faceplayer
	checkevent EVENT_GOT_HM02
	sif false, then
		opentext
		writetext .give_HM_text
		givetm HM_FLY + RECEIVED_TM
		setevent EVENT_GOT_HM02
	sendif
	jumptext .regular_text

.regular_text
	ctxt "Oh, Hallo nochmal!"
	
	para "Prof. Ilk hat mir"
	line "alles erzählt."
	
	para "Viel Glück!"
	done

.give_HM_text
	ctxt "Sieht so aus, als"
	line "hättest du nun die"
	cont "Freigabe erhalten."
	
	para "Benutze diese VM,"
	line "um schneller nach"
	para "Capparia City zu"
	line "kommen!"
	sdone

Route77Guard_BeforeIlk:
	faceplayer
	checkflag ENGINE_MIDNIGHTBADGE
	sif false
		jumptext .no_badge_text
	checkevent EVENT_GOT_HM02
	sif false, then
		opentext
		writetext .no_clearance_text
		givetm HM_FLY + RECEIVED_TM
		setevent EVENT_GOT_HM02
	sendif
	jumptext .after_HM_text

.no_clearance_text
	ctxt "Es gab hier ein"
	line "schweres Erdbeben."

	para "Ohne eine gültige"
	line "Freigabe, kann ich"
	para "dich leider selbst"
	line "mit den Orden hier"
	cont "nicht durchlassen."
	
	para "Wenn uns doch nur"
	line "ein Experte unter-"
	cont "stützen könnte <...>"
	
	para "Wie dieser <...>"
	line "Wie hieß er noch?"
	cont "'Prof. Silk'?"
	
	para "<...>"
	
	para "Was? Oh, er heißt"
	line "also Prof. Ilk?"
	
	para "Du kennst den ver-"
	line "rückten Professor?"
	
	para "Vieleicht kann er"
	line "uns helfen?"
	
	para "Er weiß mehr über"
	line "diese seltsame"
	cont "Region, als ich."
	
	para "<...>"
	
	para "Perfekt, wir haben"
	line "nun einen Deal."
	
	para "Damit du schneller"
	line "nach Capparia City"
	para "zum Prof gelangst,"
	line "gebe ich dir eine"
	cont "VM."
	sdone

.after_HM_text
	ctxt "VM02 enthält"
	line "Fliegen."
	
	para "Damit, können dich"
	line "deine #mon an"
	para "Orte fliegen, die"
	line "du schon einmal"
	cont "besucht hast!"
	
	para "Jetzt sprich mit"
	line "Prof. Ilk und"
	para "besorge dir die"
	line "Freigabe."
	done

.no_badge_text
	ctxt "Ich soll hier,"
	line "fürs Erste, die"
	cont "Brücke bewachen."
	
	para "Wenn du mehr Orden"
	line "hättest, könnte"
	para "ich dich guten"
	line "Gewissens hier"
	cont "vorbeilassen."
	done

Route77_Trainer_1:
	trainer EVENT_ROUTE_77_TRAINER_1, FISHER, 2, .before_battle_text, .battle_won_text
	ctxt "Zeit, noch mehr"
	line "zu angeln."
	done

.before_battle_text
	ctxt "Heute beißen die"
	line "Fische echt gut!"
	done

.battle_won_text
	ctxt "Platsch!"
	done

Route77_Trainer_2:
	trainer EVENT_ROUTE_77_TRAINER_2, FISHER, 3, .before_battle_text, .battle_won_text
	ctxt "Nicht groß genug?"
	done

.before_battle_text
	ctxt "Ein GROSSER Fang!"
	
	para "Guck ihn dir an!"
	done

.battle_won_text
	ctxt "Uh <...> Was?"
	done

Route77_Trainer_3:
	trainer EVENT_ROUTE_77_TRAINER_3, FISHER, 4, .before_battle_text, .battle_won_text
	ctxt "Vergiss Trainig."
	line "Ich fange einfach"
	cont "starke #mon!"
	done

.before_battle_text
	ctxt "Hab zwei große"
	line "#mon gefangen!"
	done

.battle_won_text
	text "AU!"
	done

Route77_Trainer_4:
	trainer EVENT_ROUTE_77_TRAINER_4, YOUNGSTER, 4, .before_battle_text, .battle_won_text
	ctxt "Hab sie wieder"
	line "freigelassen."
	done

.before_battle_text
	ctxt "Die musste ich"
	line "einfach fangen <...>"
	done

.battle_won_text
	ctxt "Ugh, nicht fair."
	done

Route77_Trainer_5:
	trainer EVENT_ROUTE_77_TRAINER_5, CAMPER, 1, .before_battle_text, .battle_won_text
	ctxt "Hmm <...> mir wird"
	line "kalt, ohne meine"
	cont "warmen #mon."
	
	para "<...>"
	
	para "Du meinst, ich"
	line "sollte zu einem"
	cont "#mon-Center?"
	
	para "Kein Bedarf. Ich"
	line "heile sie auf die"
	cont "natürliche Art!"
	done

.before_battle_text
	ctxt "Camping in der"
	line "Wildnis ist toll!"
	done

.battle_won_text
	ctxt "Wer wärmt mich"
	line "denn jetzt auf?"
	done

Route77_Trainer_6:
	trainer EVENT_ROUTE_77_TRAINER_6, PICNICKER, 4, .before_battle_text, .battle_won_text
	ctxt "Ich hätte sie erst"
	line "trainieren sollen."
	done

.before_battle_text
	ctxt "Ich habe mir"
	line "#mon gefangen!"
	
	para "Zeit sie kämpfen"
	line "zu lassen!"
	done

.battle_won_text
	ctxt "Wenigstens hat es"
	line "Spaß gemacht."
	done

Route77_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 73, 10, 1, MILOS_F1
	warp_def 21, 13, 1, ROUTE_77_JEWELERS
	warp_def 51, 7, 3, ROUTE_77_DAYCARE_HOUSE
	warp_def 69, 5, 1, ROUTE_77_POKECENTER
	warp_def 73, 9, 1, MILOS_F1
	warp_def 5, 11, 3, TORENIA_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 9, 13, SIGNPOST_JUMPSTD, qrcode, QR_ROUTE_77
	signpost 25, 4, SIGNPOST_ITEM, Route77HiddenItem
	signpost 23,  9, SIGNPOST_LOAD, Route77IslandSignNorth
	signpost 43,  9, SIGNPOST_LOAD, Route77IslandSignSouth

.ObjectEvents: db 13
	person_event SPRITE_FISHER, 30, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route77_Trainer_1, -1
	person_event SPRITE_FISHER, 37, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_2, -1
	person_event SPRITE_FISHER, 44, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_3, -1
	person_event SPRITE_YOUNGSTER, 63, 1, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_4, -1
	person_event SPRITE_YOUNGSTER, 23, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route77_Trainer_5, -1
	person_event SPRITE_PICNICKER, 57, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, Route77_Trainer_6, -1
	person_event SPRITE_BOULDER, 69, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 50, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 3, Route77Guard_AfterIlk, -1
	person_event SPRITE_OFFICER, 40, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route77Guard_BeforeIlk, EVENT_ILK_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 73, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_CURSE, 0, EVENT_ROUTE_77_TM03
	person_event SPRITE_FRUIT_TREE, 15, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, LEPPA_TREE_1, -1
	person_event SPRITE_POKE_BALL, 13, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, TWISTEDSPOON, EVENT_ROUTE_77_ITEM_TWISTEDSPOON
	person_event SPRITE_POKE_BALL, 7, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HYPER_POTION, EVENT_ROUTE_77_ITEM_HYPER_POTION