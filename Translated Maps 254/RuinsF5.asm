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
	ctxt "In der Decke ist"
	line "ein Loch."
	para "Wenn man da hoch"
	line "käme, hätte man"
	para "eine gute"
	line "übersicht<...>"
	done

.use_hook_text
	ctxt "Du hast einen"
	line "Enterhaken."
	para "Willst du ihn"
	line "einsetzen?"
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
	ctxt "Es ist leer."
	para "Ist das ein"
	line "Witz?"
	done

.locked_text
	ctxt "Die Truhe ist"
	line "versperrt."
	para "Es sieht so aus,"
	line "als könnte man"
	para "an ihr 4 Items"
	line "platzieren<...>"
	para "Kann man Ihn"
	line "vieleicht so"
	cont "öffnen?"
	done

.placed_jewels_text
	ctxt "4 Juwelen wurden"
	line "eingesetzt<...>"
	para "Sie passen"
	line "perfekt!"
	para "Die Truhe ist"
	line "offen!"
	done

.opened_text
	ctxt "In Ihr ist<...>"
	para "Das Prismajuwel!"
	sdone

RuinsF5_PatrollerGreen:
	trainer EVENT_RUINS_F5_PALETTE_GREEN, PATROLLER, 14, .before_battle_text, .battle_won_text
	ctxt "Schau, ich muss"
	line "bezahlt werden."
	para "Jeder muss schauen"
	line "wie er sich seine"
	cont "Brötchen verdient."
	done

.before_battle_text
	ctxt "Kannst du langsam"
	line "mal aufhören?"
	para "Wir suchen nach"
	line "den Scherben des"
	cont "Kröten-Wächters."
	para "Wir werden Reich,"
	line "wenn wir es finden"
	para "und es diesen"
	line "Forschern"
	cont "übergeben!"
	para "Bisher haben wir"
	line "nur wertlose"
	cont "Juwelen gefunden<...>"
	para "Aber diesen hier,"
	line "kriegst du nicht."
	done

.battle_won_text
	ctxt "Das wars mit der"
	line "Karibik Reise<...>"
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