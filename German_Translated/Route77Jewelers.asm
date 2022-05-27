Route77Jewelers_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route77JewelersRecipeBook:
	ctxt "Ring-Rezepte:"

	para "Pflanzen-Ring:"

	para "2x Blattstein,"
	line "25x Asche."

	para "Feuer-Ring:"

	para "2x Feuerstein,"
	line "25x Asche."

	para "Wasser-Ring:"

	para "2x Wasserstein,"
	line "50x Asche."

	para "Donner-Ring:"

	para "2x Donnerstein,"
	line "50x Asche."

	para "Leucht-Ring:"

	para "3x Leuchtstein,"
	line "75x Asche."

	para "Funkel-Ring:"

	para "3x Funkelstein,"
	line "75x Asche."

	para "Finster-Ring:"

	para "3x Finsterstein,"
	line "100x Asche."

	para "Mond-Ring:"

	para "3x Mondstein,"
	line "100x Asche."
	done

Route77JewelersExplanationNPC:
	ctxt "Ringe herstellen"
	line "ist nicht einfach."

	para "Es kostet element-"
	line "are Steine und"
	para "Asche für jeden"
	line "Versuch."

	para "Asche sammelst du"
	line "beim Schmelzen von"
	para "Kohle oder beim"
	line "Laufen durch die"
	cont "Feuerlichthöhlen."

	para "Auf LV 1 kannst"
	line "du nur Pflanzen-"
	para "Ringe herstellen."
	line "Bei steigendem LV"
	para "kannst du immer"
	line "mehr Ringe"
	cont "herstellen."

	para "Es gibt 7 Ringe,"
	line "die du herstellen"
	para "kannst und jeder"
	line "davon hilft deinen"
	para "#mon auf unter-"
	line "schiedliche Weise"
	cont "im Kampf!"

	para "Oder du stellst"
	line "sie her und"
	para "verkaufst sie dann"
	line "für gutes Geld."

	para "Wenn du dran-"
	line "bleibst, kann sich"
	para "das Ganze echt"
	line "bezahlt machen!"
	done

Route77JewelersJeweler:
	farjump JewelingScript

Route77JewelersSootSackDude:
	checkevent EVENT_GIVEN_SOOT_SACK
	sif true
		jumptextfaceplayer .already_gave_soot_sack_text
	opentext
	faceplayer
	writetext .before_giving_soot_sack_text
	verbosegiveitem SOOT_SACK, 1
	setevent EVENT_GIVEN_SOOT_SACK
	closetextend

.before_giving_soot_sack_text
	ctxt "Lustig."

	para "Wolltest du etwa"
	line "Ringe herstellen,"
	para "obwohl du keinen"
	line "Aschensack hast?"

	para "Na gut, ich habe"
	line "eine zweite für"
	cont "dich übrig."
	sdone

.already_gave_soot_sack_text
	ctxt "Sammle die Asche"
	line "drin, indem du bei"
	para "den Feuerlicht-"
	line "höhlen spazierst"
	para "oder Kohle"
	line "schmilzt!"
	done

Route77Jewelers_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $3, 2, ROUTE_77
	warp_def $7, $4, 2, ROUTE_77

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 4, 7, SIGNPOST_TEXT, Route77JewelersRecipeBook
	signpost 4, 8, SIGNPOST_TEXT, Route77JewelersRecipeBook

	;people-events
	db 3
	person_event SPRITE_ROCKER, 3, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route77JewelersJeweler, -1
	person_event SPRITE_ROCKER, 2, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route77JewelersSootSackDude, -1
	person_event SPRITE_ROCKER, 7, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, Route77JewelersExplanationNPC, -1
