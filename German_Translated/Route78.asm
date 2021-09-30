Route78_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route78HiddenItem:
	dw EVENT_ROUTE_78_HIDDENITEM_HYPER_POTION
	db HYPER_POTION

Route78DirectionsSign:
	ctxt "<UP> Phacelia Dorf"
	next "<DOWN><LEFT>Ruinen"
	next "<DOWN><RIGHT>Route 79"
	done

Route78NPC:
	ctxt "Wenn du das Wasser"
	line "nicht überqueren"
	para "kannst, ist der"
	line "einzige Weg zurück"
	para "in die Minenanlage"
	line "zu gehen und von"
	cont "dort nach Osten."
	done

Route78_Trainer_1:
	trainer EVENT_ROUTE_78_TRAINER_1, SWIMMERM, 3, .before_battle_text, .battle_won_text

	ctxt "Diese Route sieht"
	line "bei Sonnen-"
	para "untergang"
	line "wunderschön aus<...>"
	done

.before_battle_text
	ctxt "Mädchen finden"
	line "diesen Ort sehr"
	cont "romantisch."
	done

.battle_won_text
	text "Mannnn!"
	done

Route78_Trainer_2:
	trainer EVENT_ROUTE_78_TRAINER_2, SWIMMERM, 4, .before_battle_text, .battle_won_text

	ctxt "Wenn doch nur"
	line "jemand mutig genug"
	para "wäre tief in die"
	line "Ruinen vorzu-"
	cont "dringen<...>"

	para "Wer weiss was für"
	line "Schätze da unten"
	cont "auf uns warten!"
	done

.before_battle_text
	ctxt "Die Ruinen haben"
	line "viele Mysterien."

	para "Wurde mir gesagt."
	done

.battle_won_text
	ctxt "Fein."

	para "Ich durchsuche es"
	line "alleine."
	done

Route78_Trainer_3:
	trainer EVENT_ROUTE_78_TRAINER_3, SWIMMERF, 3, .before_battle_text, .battle_won_text

	ctxt "Ich wünschte ich"
	line "könnte tiefer"
	para "tauchen um seltene"
	line "Wasser #mon"
	cont "finden zu können!"
	done

.before_battle_text
	ctxt "Die #mon hier"
	line "sind Wunderschön."
	done

.battle_won_text
	ctxt "Innerlich schön,"
	line "nicht Ihre Kampf"
	cont "Fähigkeiten."
	done

Route78_Trainer_4:
	trainer EVENT_ROUTE_78_TRAINER_4, SWIMMERF, 4, .before_battle_text, .battle_won_text

	ctxt "Wenn du auf einem"
	line "#mon surfst,"
	cont "sei zärtlich."

	para "Es ist schließlich"
	line "ein Lebewesen."
	done

.before_battle_text
	ctxt "Mein Surfbrett"
	line "brach<...> wieder!"

	para "Jetzt kann ich"
	line "nicht mehr surfen!"
	done

.battle_won_text
	ctxt "Streu noch Salz"
	line "in die Wunde<...>"
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
	ctxt "Ohne einen Naljo-"
	line "Pass, kann ich"
	para "keinen passieren"
	line "lassen."
	sdone

.ID_shown_text
	ctxt "Danke für den"
	line "Naljo-Pass."

	para "Ich lass dich nun"
	line "auf die Insel."

	para "Ist das dein 1."
	line "mal hier?"

	para "Nun Saxifragia ist"
	line "ein Ort wo"
	para "Kriminelle einge-"
	line "sperrt werden!"

	para "Du kannst Sie dir"
	line "anschauen, aber"
	cont "nicht füttern."

	para "Im Endeffekt ist"
	line "das auch ein Zoo"
	para "nur mit weniger"
	line "rechten<...>"
	sdone

.no_ID_text
	ctxt "Du hast keinen?"

	para "Sei froh das du"
	line "noch klein bist."

	para "Sonst hätte ich"
	line "dich auf dieser"
	para "Insel dafür"
	line "eingesperrt!"
	done

Route78_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 5, 10, 2, PHACELIA_WEST_EXIT
	warp_def 21, 4, 1, RUINS_ENTRY
	warp_def 21, 14, 1, ROUTE_78_EAST_EXIT

.CoordEvents: db 0

.BGEvents: db 2
	signpost 8, 12, SIGNPOST_LOAD, Route78DirectionsSign
	signpost 11, 18, SIGNPOST_ITEM, Route78HiddenItem

.ObjectEvents: db 9
	person_event SPRITE_SWIMMER_GUY, 15, 9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, Route78_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 22, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 5, Route78_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL, 20, 9, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 2, Route78_Trainer_3, -1
	person_event SPRITE_SWIMMER_GIRL, 25, 12, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 3, Route78_Trainer_4, -1
	person_event SPRITE_ROCK, 13, 4, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_LASS, 6, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route78NPC, -1
	person_event SPRITE_POKE_BALL, 15, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DIG, 0, EVENT_ROUTE_78_TM28
	person_event SPRITE_POKE_BALL, 32, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_NOISE_PULSE, 0, EVENT_ROUTE_78_TM78
	person_event SPRITE_OFFICER, 22, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route78Guard, EVENT_NALJO_ID_GUARD
