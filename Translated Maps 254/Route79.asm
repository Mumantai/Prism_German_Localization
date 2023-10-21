Route79_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route79HiddenItem:
	dw EVENT_ROUTE_79_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route79_Trainer_1:
	trainer EVENT_ROUTE_79_TRAINER_1, COOLTRAINERM, 8, .before_battle_text, .battle_won_text
	ctxt "Viele der einge-"
	line "sperrten #mon,"
	para "wurden von ihren"
	line "Trainern verletzt."
	
	para "Sie tun mir zwar"
	line "Leid, aber es ist"
	para "gut, dass sie ein-"
	line "gesperrt wurden."

	para "So können sie"
	line "immerhin niemanden"
	cont "mehr verletzen."
	done

.before_battle_text
	ctxt "Ein Gefängnis zu"
	line "besuchen, isz"
	cont "aufregend."
	
	para "All diese gefähr-"
	line "lichen #mon!"
	done

.battle_won_text
	ctxt "Ich sollte mir was"
	line "von den gefangenen"
	cont "#mon abgucken."
	done

Route79_Trainer_2:
	trainer EVENT_ROUTE_79_TRAINER_2, BIRD_KEEPER, 6, .before_battle_text, .battle_won_text
	ctxt "Die Knackis hier"
	line "sind wie meine"
	cont "Vögel<...> Im Käfig."
	para "Verstehste?"
	para "<...>"
	para "Jetzt lach endlich"
	line "bevor ich sauer"
	cont "werde!"
	done

.before_battle_text
	ctxt "Ich bin aus dem"
	line "Knast geflüchtet."
	para "Was ich getan habe"
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
	ctxt "Tritt dem Ponita"
	line "Fanclub bei! Wir"
	para "sind alle wirklich"
	cont "super freundlich!"
	done

.before_battle_text
	ctxt "Yooo, mein Bruder!"
	
	para "Ich bin der größte"
	line "Ponita-Fan!"
	done

.battle_won_text
	ctxt "Die anderen Fans"
	line "werden sich das"
	cont "merken!"
	done

Route79_Trainer_4:
	trainer EVENT_ROUTE_79_TRAINER_4, COOLTRAINERM, 7, .before_battle_text, .battle_won_text
	ctxt "Ich hätte dem Kerl"
	line "in der dunklen"
	para "Gasse besser nicht"
	line "trauen sollen <...>"
	done

.before_battle_text
	ctxt "Ich habe meinen"
	line "#mon nen Haufen"
	cont "Protein gegeben."
	
	para "Jetzt machen sie"
	line "dich locker platt!"
	done

.battle_won_text
	ctxt "Das Protein hat"
	line "nicht gewirkt?"
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