Route65_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route65HiddenItem:
	dw EVENT_ROUTE_65_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route65Sign:
	ctxt "Talrus Auslauf"
	next "Pfad zur Rijon"
	next "Liga"
	done

Route65_Trainer_1:
	trainer EVENT_ROUTE_65_TRAINER_1, JUGGLER, 4, .before_battle_text, .battle_won_text
	ctxt "Versuche, deinem"
	line "#mon Metronom"
	para "beizubringen,"
	line "wenn du etwas"
	cont "Spannung willst."
	done

.before_battle_text
	ctxt "Was passieren"
	line "wird??"
	para "Keiner weiss das!"
	done

.battle_won_text
	ctxt "Ahaha! wie blöd!"
	done

Route65_Trainer_2:
	trainer EVENT_ROUTE_65_TRAINER_2, POKEMANIAC, 3, .before_battle_text, .battle_won_text
	ctxt "Dieser Ort ist"
	line "super, wenn man"
	para "viele starke"
	line "#mon sehen"
	cont "möchte."
	done

.before_battle_text
	ctxt "Hehehe<...> Eine"
	para "Herausforderung"
	line "kurz vorm Ziel."
	para "Damit rechnet"
	line "niemand!"
	done

.battle_won_text
	ctxt "Damit <...>"
	para "habe ich nicht"
	line "gerechnet<...>"
	done

Route65_Rival:
	trainer EVENT_ROUTE_65_RIVAL, RIVAL1, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Keinen Schritt"
	line "weiter."
	para "Ich sehe die Welt"
	line "mit ganz anderen"
	para "Augen, seit ich"
	line "aus dem Gefängnis"
	cont "entkommen bin."
	para "Das Leben auf der"
	line "Flucht ist hart"
	cont "und einsam."
	para "Wenn ich Nachts"
	line "wach neben"
	para "meinen #mon"
	line "liege, merke"
	para "ich erst, wie"
	line "froh ich bin,"
	para "sie an meiner"
	line "Seite zu haben."
	para "Mein Band zu ihnen"
	line "ist stärker"
	para "geworden und"
	line "dadurch bin auch"
	para "ich stärker"
	line "geworden."
	para "Es ist an der"
	line "Zeit, diese neue"
	cont "Stärke zu testen!"
	done

.battle_won_text
	ctxt "Ich muss noch"
	line "viel lernen."
	done

.after_battle_text
	ctxt "Ich weiß, ich"
	line "habe anderen"
	para "und vor allem"
	line "meinen #mon"
	para "viel Schaden"
	line "zugefügt, doch"
	para "dank dir bin"
	line "ich bereit, neu"
	para "anzufangen und"
	line "ein besserer"
	cont "Trainer zu sein."
	para "Deine Art zu"
	line "kämpfen, spiegelt"
	para "deinen Willen und"
	line "deine Kraft wider."
	para "Trainer wie du,"
	line "sind auserwählt,"
	cont "Champ zu werden."
	para "Also, bis zum"
	line "nächsten Mal,"
	cont "Trainer."
	done

Route65_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $73, $d, 1, ROUTE_67_GATE
	warp_def $8b, $7, 1, JAERU_GATE
	warp_def $8b, $8, 2, JAERU_GATE

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 136, 8, SIGNPOST_LOAD, Route65Sign
	signpost 21, 12, SIGNPOST_LOAD, Route65Sign
	signpost 100, 14, SIGNPOST_ITEM, Route65HiddenItem
	signpost 123, 4, SIGNPOST_JUMPSTD, qrcode, QR_ROUTE_65

	;people-events
	db 3
	person_event SPRITE_JUGGLER, 61, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route65_Trainer_1, -1
	person_event SPRITE_POKEMANIAC, 42,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route65_Trainer_2, -1
	person_event SPRITE_SILVER, 15, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 5, Route65_Rival, -1