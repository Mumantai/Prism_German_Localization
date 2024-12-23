Route78_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route78HiddenItem:
	dw EVENT_ROUTE_78_HIDDENITEM_HYPER_POTION
	db HYPER_POTION

Route78DirectionsSign:
	stxt "<UP>  Phacelia"
	next "<DOWN><LEFT> Ruinen"
	next "<DOWN><RIGHT> Route 79"
	done

Route78IslandSign:
	signpostheader 7
	done

Route78NPC:
	ctxt "Wenn du das Wasser"
	line "nicht überqueren"
	para "kannst, musst du"
	line "leider zurück in"
	para "den Steinbruch und"
	line "von da nach Osten."
	done

Route78_Trainer_1:
	trainer EVENT_ROUTE_78_TRAINER_1, SWIMMERM, 3, .before_battle_text, .battle_won_text
	ctxt "Diese Route, sieht"
	line "bei Dämmerung am"
	cont "schönsten aus <...>"
	done

.before_battle_text
	ctxt "In der Bucht zu"
	line "treiben ist super." 
	para "Manche Mädchen,"
	line "finden diesen Ort"
	cont "sehr romantisch."
	done

.battle_won_text
	text "Verdammt!"
	done

Route78_Trainer_2:
	trainer EVENT_ROUTE_78_TRAINER_2, SWIMMERM, 4, .before_battle_text, .battle_won_text
	ctxt "Wenn doch nur"
	line "jemand mutig genug"
	para "wäre, tief in die"
	line "Ruinen zu gehen <...>"
	para "Wer weiß, was es"
	line "direkt unter uns"
	cont "zu entdecken gibt!"
	done

.before_battle_text
	ctxt "Die Ruinen bergen"
	line "eine Menge Rätsel."
	para "So sagt man sich."
	done

.battle_won_text
	ctxt "Na gut. Erkunde"
	line "ich die Gegend"
	cont "halt alleine."
	done

Route78_Trainer_3:
	trainer EVENT_ROUTE_78_TRAINER_3, SWIMMERF, 3, .before_battle_text, .battle_won_text
	ctxt "Ich wünschte, ich"
	line "könnte tief"
	para "tauchen und all"
	line "die süßen Wasser-"
	cont "#mon sehen!"
	done

.before_battle_text
	ctxt "Die #mon hier,"
	line "sind wunderschön."
	done

.battle_won_text
	ctxt "Bewundere ihre"
	line "innere Schönheit,"
	para "nicht ihre"
	line "Kampffähigkeiten."
	done

Route78_Trainer_4:
	trainer EVENT_ROUTE_78_TRAINER_4, SWIMMERF, 4, .before_battle_text, .battle_won_text
	ctxt "Wenn du auf deinem"
	line "#mon surfst,"
	para "denk an seine"
	line "Gefühle. Du willst"
	para "einem guten Freund"
	line "doch nicht wehtun."
	done

.before_battle_text
	ctxt "Mein Surfbrett ist"
	line "zerbrochen <...>!"
	para "Jetzt kann ich"
	line "nicht mehr surfen!"
	done

.battle_won_text
	ctxt "Streu noch Salz"
	line "in die Wunde <...>"
	para "Für wen hälst du"
	line "dich eigentlich <...>"
	done

Route78Guard:
	faceplayer
	opentext
	writetext .require_ID_text
	checkitem FAKE_ID
	sif false
		jumptext .no_ID_text
	setevent EVENT_NALJO_ID_GUARD
	writetext .ID_shown_text
	closetext
	playsound SFX_ENTER_DOOR
	applymovement 10, .enter_cave
	disappear 10
	end

.enter_cave
	step_up
	step_end

.require_ID_text
	ctxt "Ich kann niemanden"
	line "ohne Naljo-Pass"
	cont "hier durchlassen."
	sdone

.ID_shown_text
	ctxt "Ah <...>"
	para "du hast also eins."
	para "Dann darfst du"
	line "natürlich auf die"
	cont "Insel."

	para "Bist du zum ersten"
	line "Mal zu Besuch?"

	para "Saxifragia ist ein"
	line "Ort, an dem wir"
	para "den Abschaum der"
	line "Gesellschaft weg-"
	cont "sperren."

	para "Du kannst Sie dir"
	para "anschauen, aber"
	line "fütter sie nicht."

	para "Im Grunde, ist es"
	line "hier wie im Zoo,"
	para "nur mit weniger"
	line "Rechten <...>"
	sdone

.no_ID_text
	ctxt "Du hast keinen?"
	line "Sei froh, dass ich"
	para "nett zu Minderjäh-"
	line "rigen bin, sonst"
	para "hätte ich dich"
	line "hier und jetzt"
	cont "verhaftet!"
	done

Route78_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 5, 10, 2, PHACELIA_WEST_EXIT
	warp_def 21, 4, 1, RUINS_ENTRY
	warp_def 21, 14, 1, ROUTE_78_EAST_EXIT

.CoordEvents: db 0

.BGEvents: db 3
	signpost 8, 12, SIGNPOST_LOAD, Route78DirectionsSign
	signpost 11, 18, SIGNPOST_ITEM, Route78HiddenItem
	signpost 8, 8, SIGNPOST_LOAD, Route78IslandSign

.ObjectEvents: db 9
	person_event SPRITE_SWIMMER_GUY, 15, 9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, Route78_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 22, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, Route78_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL, 20, 9, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 2, Route78_Trainer_3, -1
	person_event SPRITE_SWIMMER_GIRL, 25, 12, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 3, Route78_Trainer_4, -1
	person_event SPRITE_ROCK, 13, 4, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_LASS, 6, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route78NPC, -1
	person_event SPRITE_POKE_BALL, 15, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DIG, 0, EVENT_ROUTE_78_TM28
	person_event SPRITE_POKE_BALL, 32, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_NOISE_PULSE, 0, EVENT_ROUTE_78_TM78
	person_event SPRITE_OFFICER, 22, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route78Guard, EVENT_NALJO_ID_GUARD