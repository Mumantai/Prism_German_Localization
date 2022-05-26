OxalisSalon_MapScriptHeader: ;trigger count
	db 0
 ;callback count
	db 0

OxalisSalonStylistScript:
	opentext
	special PlaceMoneyTopRight
	writetext .introduction_text
	yesorno
	iffalse .no
	checkmoney 0, 1000
	sif =, 2
		jumptext .no_money_text
	waitsfx
	playsound SFX_TRANSACTION
	takemoney 0, 1000
	special PlaceMoneyTopRight
	writetext .said_yes_text
	closetext
	refreshscreen
	callasm OxalisSalonCustomization
	anonjumptable
	dw .giveBackMoney
	dw .done
	dw .didNotChange

.giveBackMoney
	givemoney 0, 1000
.no
	jumptext .said_no_text

.done
	jumptext .done_text

.didNotChange
	givemoney 0, 1000
	jumptext .no_change_text

.introduction_text
	ctxt "Hi, Schatzi!"

	para "Unzufrieden mit"
	line "deinem Aussehen?"

	para "Deine Bedenken"
	line "werden sich legen,"
	para "wenn ich dich neu"
	line "einkleide!"

	para "Für nur ¥1000!" 
	done

.said_yes_text
	ctxt "Wunderbar!"

	para "Lass uns anfangen!"
	sdone

.said_no_text
	ctxt "Das ist eine gro-"
	line "ße Enttäuschung."

	para "Bitte überleg es"
	line "dir nochmal."
	done

.no_money_text
	ctxt "Du kannst nicht"
	line "mit Staub zahlen."

	para "Komm wieder, wenn"
	line "du Geld hast!"
	done

.done_text
	ctxt "Los geht's!"

	para "Du siehst nun"
	line "viel besser aus!"

	para "Beehre uns wieder!"
	done

.no_change_text
	ctxt "Was? Du hast dein"
	line "Aussehen nicht ge-"
	cont "ändert?"

	para "In diesen Fall"
	line "bekommst du eine"
    cont "Rückerstattung."

	para "Komm wieder, wenn"
	line "du dein Aussehen"
	cont "ändern möchtest."
	done

OxalisSalonNPC1:
	ctxt "Dieses Dame ist"
	line "echt ein Genie!"

	para "Unglaublich, wie"
	line "ich vorher aussah!"
	done

OxalisSalonNPC2:
	ctxt "Versuch dich nicht"
	line "zu sehr zu ändern"

	para "Nach meinem Image-"
	line "wechsel erkannten"
	para "mich meine #mon"
	line "nicht mehr!"
	done

OxalisSalonNPC3:
	ctxt "Haare wie diese"
	line "brauchen einige"
	cont "Zeit und Pflege."

	para "Deshalb komme ich"
	line "immer hier her!"
	done

OxalisSalon_MapEventHeader: ;filler
	db 0, 0

;warps
	db 2
	warp_def $9, $6, 1, OXALIS_CITY
	warp_def $9, $7, 1, OXALIS_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_TEACHER, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OxalisSalonStylistScript, -1
	person_event SPRITE_BUENA, 5, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, OxalisSalonNPC1, -1
	person_event SPRITE_POKEFAN_F, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OxalisSalonNPC2, -1
	person_event SPRITE_ROCKER, 6, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, OxalisSalonNPC3, -1
