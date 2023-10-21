Route77Jewelers_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route77JewelersRecipeBook:
	ctxt "Ring Rezepte:"
	
	para "Pflanzen Ring:"
	para "1x Blattstein,"
	line "25x Asche."
	
	para "Feuer Ring:"
	para "1x Feuerstein,"
	line "25x Asche."
	
	para "Wasser Ring:"
	para "1x Wasserstein,"
	line "50x Asche."
	
	para "Donner Ring:"
	para "2x Donnerstein,"
	line "50x Asche."
	
	para "Leucht Ring:"
	para "3x Leuchtstein,"
	line "75x Asche."
	
	para "Funkel Ring:"
	para "3x Funkelstein,"
	line "75x Asche."
	
	para "Finster Ring:"
	para "3x Finsterstein,"
	line "100x Asche."
	
	para "Mond Ring:"
	para "3x Mondstein,"
	line "100x Asche."
	done

Route77JewelersExplanationNPC:
	ctxt "Ringe herzustellen"
	line "ist nicht einfach."
	
	para "Jeder Versuch,"
	line "kostet dich"
	para "Evolutionssteine"
	line "und etwas Asche."
	
	para "Asche sammelst du"
	line "beim Schmelzen von"
	para "Kohle oder beim"
	line "Laufen durch die"
	cont "Leuchtfeuerhöhlen."
	
	para "Auf Level 1 kannst"
	line "du nur Blattringe"
	para "herstellen. Aber"
	line "je höher dein"
	para "Level, desto mehr"
	line "Ringe kannst du"
	cont "herstellen."
	
	para "Es gibt sieben"
	line "verschiedene Ringe"
	para "und jeder einzelne"
	line "davon, hilft"
	para "deinen #mon"
	cont "im Kampf!"

	
	para "Oder du stellst"
	line "Sie massig her und"
	para "verkaufst sie dann"
	line "für den Profit."
	
	para "Wie du siehst,"
	line "kann die Ringher-"
	para "stellung dich arm"
	line "machen, aber mit"
	para "dem richtigen Ehr-"
	line "geiz, macht sie"
	cont "dich auch reich."		;Den Absatz evtl. umschreiben
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
	
	para "Willst nen Ring"
	line "herstellen, hast"
	para "aber gar keine"
	line "Aschetasche."
	
	para "Zum Glück, habe"
	line "ich noch eine für"
	cont "dich über."
	sdone

.already_gave_soot_sack_text
	ctxt "Asche sammelst du,"
	line "indem du in der"
	para "Leuchtfeuerhöhle"
	line "herumläufst, oder"
	para "indem du Kohle"
	line "schmilzt!"
	done

Route77Jewelers_MapEventHeader:
	;filler
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