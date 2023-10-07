Route77Jewelers_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route77JewelersRecipeBook:
	ctxt "Recipes for making"
	line "rings:"

	para "Grass Ring:"

	para "One Leaf Stone,"
	line "25 ash."

	para "Fire Ring:"

	para "One Fire Stone,"
	line "25 ash."

	para "Water Ring:"

	para "One Water Stone,"
	line "50 ash."

	para "Thunder Ring:"

	para "Two Thunderstones,"
	line "50 ash."

	para "Shiny Ring:"

	para "Three Shiny Stones"
	line "and 75 ash."

	para "Dawn Ring:"

	para "Three Dawn Stones,"
	line "75 ash."

	para "Dusk Ring:"

	para "Three Dusk Stones,"
	line "100 ash."

	para "Moon Ring:"

	para "Three Moon Stones,"
	line "100 ash."
	done

Route77JewelersExplanationNPC:
	ctxt "Ring making can"
	line "be complicated."

	para "It costs one or"
	line "more elemental"
	para "stones and ash"
	line "for each attempt."

	para "You can collect"
	line "ash by smelting"
	para "coal, or by"
	line "walking around"
	cont "Firelight Caverns."

	para "At level one,"
	line "you can only make"
	para "Grass Rings; but,"
	line "as you get higher"
	para "in level, you'll"
	line "be able to make"
	cont "more rings."

	para "There are seven"
	line "different rings"
	para "you can make, and"
	line "each ring helps"
	para "your #mon a"
	line "different way in"
	cont "battle!"

	para "Or, you can make"
	line "batches of rings"
	para "and sell them"
	line "for profit."

	para "Either way, ring"
	line "making can make"
	para "you broke, but"
	line "if you keep at"
	para "it, it's actually"
	line "possible to make"
	cont "a profit, too."
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
	ctxt "Funny."

	para "Wanting to make"
	line "rings without a"
	cont "Soot Sack."

	para "Well, I have a"
	line "spare, so go ahead"
	cont "and take mine."
	sdone

.already_gave_soot_sack_text
	ctxt "Collect ash in"
	line "that by walking"
	para "around Firelight"
	line "Caverns, or by"
	cont "smelting coal!"
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
