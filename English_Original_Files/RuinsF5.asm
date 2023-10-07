RuinsF5_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RuinsF5GrappleHookSpot:
	opentext
	checkitem GRAPPLE_HOOK
	sif false
		jumptext .no_hook_text
	writetext .use_hook_text
	yesorno
	sif true, then
		playwaitsfx SFX_VICEGRIP
		warp RUINS_ROOF, 6, 7
	sendif
	closetextend

.no_hook_text
	ctxt "There's a hole in"
	line "the ceiling."

	para "It would be quite"
	line "the view if you"
	para "could somehow"
	line "get up there!"
	done

.use_hook_text
	ctxt "You have a"
	line "Grapple Hook."

	para "Want to use it to"
	line "get to the top?"
	done

RuinsF5Chest:
	opentext
	checkevent EVENT_RUINS_OPENED_CHEST
	sif true
		jumptext .empty_text
	checkitem RED_JEWEL
	sif false
.locked
		jumptext .locked_text
	checkitem BLUE_JEWEL
	iffalse .locked
	checkitem BROWN_JEWEL
	iffalse .locked
	checkitem WHITE_JEWEL
	iffalse .locked
	writetext .placed_jewels_text
	playwaitsfx SFX_WALL_OPEN
	writetext .opened_text
	takeitem RED_JEWEL, 1
	takeitem BLUE_JEWEL, 1
	takeitem BROWN_JEWEL, 1
	takeitem WHITE_JEWEL, 1
	setevent EVENT_RUINS_OPENED_CHEST
	verbosegiveitem PRISM_JEWEL
	endtext

.empty_text
	ctxt "It's empty."

	para "No kidding,"
	line "right?"
	done

.locked_text
	ctxt "The chest is"
	line "locked."

	para "It looks like"
	line "four items can"
	cont "fit in front."

	para "Could this be the"
	line "way to unlock"
	cont "this thing?"
	done

.placed_jewels_text
	ctxt "Placed all four"
	line "jewels inside of"
	cont "the front holes."

	para "They all fit"
	line "perfectly!"

	para "The chest was"
	line "unlocked!"
	done

.opened_text
	ctxt "Inside is<...>"

	para "The Prism Jewel!"
	sdone

RuinsF5_PatrollerGreen:
	trainer EVENT_RUINS_F5_PALETTE_GREEN, PATROLLER, 14, .before_battle_text, .battle_won_text

	ctxt "Look, I need to"
	line "get paid, y'know."

	para "Everyone needs to"
	line "make a living<...>"
	cont "somehow."
	done

.before_battle_text
	ctxt "Could you just"
	line "stop already?"

	para "We're looking for"
	line "the shards of the"
	cont "Turtle Guardian."

	para "We'll be wealthy"
	line "if we find them"
	para "and deliver them"
	line "to those"
	cont "scientists!"

	para "We've only found"
	line "some worthless"
	cont "jewels so far."

	para "But you're not"
	line "getting this one."
	done

.battle_won_text
	ctxt "Well, one man's"
	line "trash is another"
	cont "man's delusion."
	done

RuinsF5_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $9, 2, RUINS_F4
	dummy_warp $6, $2

	;xy triggers
	db 0

	;signposts
	db 3
	signpost 6, 2, SIGNPOST_READ, RuinsF5GrappleHookSpot
	signpost 4, 5, SIGNPOST_UP, RuinsF5Chest
	signpost 4, 6, SIGNPOST_UP, RuinsF5Chest

	;people-events
	db 2
	person_event SPRITE_POKE_BALL, 2, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, WHITE_JEWEL, EVENT_RUINS_F5_ITEM_WHITE_JEWEL
	person_event SPRITE_PALETTE_PATROLLER, 4, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, RuinsF5_PatrollerGreen, EVENT_RUINS_F5_PALETTE_GREEN
