Route74_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route74HiddenItem:
	dw EVENT_ROUTE_74_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route74DirectionsSign:
	ctxt "<DOWN> Euphorbia City"
	next "<RIGHT> Lauralia City"
	next "<LEFT> Heidenau"
	done

Route74_Trainer_1:
	trainer EVENT_ROUTE_74_TRAINER_1, SAILOR, 1, .before_battle_text, .battle_won_text

	ctxt "Mit meinen #mon"
	line "habe ich die ganze"
	cont "Welt bereist."

	para "Für mich war Alola"
	line "die entspannteste"
	cont "Region von allen."
	done

.before_battle_text
	ctxt "Ich will einen"
	line "richtigen Kampf!"
	done

.battle_won_text
	ctxt "Awaaargh!"
	done

Route74_Trainer_2:
	trainer EVENT_ROUTE_74_TRAINER_2, POKEFANM, 2, .before_battle_text, .battle_won_text

	ctxt "Ich bin nicht der"
	line "einzige Pikachu"
	cont "Fan in Naljo."

	para "Aber!"

	para "Ich mache es vom"
	line "Herzen gerne!"
	done

.before_battle_text
	ctxt "Haha!"

	para "Zeit dir mein"
	line "Pikachu zu zeigen!"
	done

.battle_won_text
	text "Feh!"
	done

Route74_Trainer_3:
	trainer EVENT_ROUTE_74_TRAINER_3, POKEFANF, 1, .before_battle_text, .battle_won_text

	ctxt "Baby #mon sind"
	line "so niedlich!"
	done

.before_battle_text
	ctxt "Zeig mir wie süß"
	line "dein #mon ist!"
	done

.battle_won_text
	ctxt "Das ich verliere"
	line "ist mir egal<...>"
	done

Route74_Trainer_4:
	trainer EVENT_ROUTE_74_TRAINER_4, PSYCHIC_T, 1, .before_battle_text, .battle_won_text

	ctxt "Kein #mon"
	line "gleicht dem"
	cont "anderen!"

	para "Jedes hat seine"
	line "individuellen"
	cont "stärken."
	done

.before_battle_text
	ctxt "Zeig mir dein"
	line "Team!"
	done

.battle_won_text
	ctxt "Wow, deine #mon"
	line "sind talentiert!"
	done

Route74_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 10, 4, 3, HEATH_GATE
	warp_def 11, 4, 4, HEATH_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 5, 9, SIGNPOST_LOAD, Route74DirectionsSign
	signpost 19, 14, SIGNPOST_ITEM, Route74HiddenItem

.ObjectEvents: db 5
	person_event SPRITE_SAILOR, 29, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 5, Route74_Trainer_1, -1
	person_event SPRITE_POKEFAN_M, 13, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route74_Trainer_2, -1
	person_event SPRITE_POKEFAN_F, 19, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 5, Route74_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 22, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route74_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 4, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWEET_SCENT, ObjectEvent, EVENT_ROUTE_74_TM12
