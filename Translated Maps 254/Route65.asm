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
	ctxt "This really is a"
	line "great spot if you"
	para "like to see lots"
	line "of powerful"
	cont "#mon come by."
	done

.before_battle_text
	ctxt "Fufufu<...>"
	line "The home stretch."
	para "When approaching"
	line "trainers are at"
	para "their most"
	line "vulnerable!"
	done

.battle_won_text
	ctxt "I suppose it was"
	line "I<...>"
	para "<...>who was"
	line "vulnerable<...>"
	done

Route65_Rival:
	trainer EVENT_ROUTE_65_RIVAL, RIVAL1, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Bleib stehen!"
	para "Seit ich aus dem"
	line "Gefängnis raus bin"
	para "sehe ich diese"
	line "Welt mit anderen"
	cont "Augen!"
	para "Das Leben als"
	line "Flüchtling ist"
	cont "sehr schwer."
	para "Wenn ich nachts"
	line "mit meinen #mon"
	para "liege merke ich,"
	line "dass ich sehr"
	para "froh darum bin,"
	line "das sie gerade"
	cont "da sind."
	para "Mein Band zu Ihnen"
	line "ist gewachsen und"
	para "damit auch meine"
	line "Kraft."
	para "Es ist Zeit diese"
	line "Kraft in einem"
	cont "Kampf auszutesten!"
	done

.battle_won_text
	ctxt "Ich muss noch"
	line "viel lernen."
	done

.after_battle_text
	ctxt "Ich weiss ich habe"
	line "viel schaden"
	para "angerichtet aber"
	line "dank dir weiß ich" 
	para "dass ich ein guter"
	line "Trainer sein"
	para "möchte<...>"
	line "Ein Besserer"
	cont "Trainer!"
	para "Die art wie du" 
	line "kämpfst, spiegelt"
	para "deine innere"
	line "stärke und ruhe"
	cont "wieder."
	para "Ein Trainer wie du"
	line "ist wie dafür"
	para "geschaffen Champ"
	line "der Rijon Liga"
	cont "zu werden!"	
	para "Ich hoffe wir"
	line "sehen uns wieder"
	cont "Trainer<...>"
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