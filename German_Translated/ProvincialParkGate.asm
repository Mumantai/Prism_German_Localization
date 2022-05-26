ProvincialParkGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ProvincialParkGateAttendant:
	faceplayer
	opentext
	writetext .introduction_text
.show_options
	getweekday
	iffalse .weekend
	if_equal 6, .weekend
	menuanonjumptable .regular_menu_header
	dw .cancelled
	dw .enter
	dw .instructions
	dw .cancelled

.weekend
	menuanonjumptable .weekend_menu_header
	dw .cancelled
	dw .enter
	dw .weekend_special
	dw .instructions
	dw .cancelled

.enter
	writetext .which_mode_text
	special PlaceMoneyTopRight
	loadmenudata .game_menu_header
	verticalmenu
	closewindow
	iffalse .cancelled
	addvar -1
	jump .joined

.weekend_special
	writetext .weekend_special_text
	special PlaceMoneyTopRight
	yesorno
	sif false
.cancelled
		jumptext .denied_text
	writebyte 3

.joined
	farscall StartParkMinigameScript
	sif true
		end
	jumptext .no_money_text

.instructions
	writetext .instructions_text
	jump .show_options

.regular_menu_header
	db $40 ;flags
	db 4, 1 ;start coordinates; initial y = final y - (2 * items + 1), initial x = final x - (longest item + 3)
	db 11, 19 ;end coordinates, next to the dialogue corner
	dw .regular_menu_options
	db 1 ;default option
.regular_menu_options
	db $80 ;print the text one tile to the right of the border
	db 3 ;option count
	db "START Challenge@"
	db "Anleitung@"
	db "Tschüss@"

.weekend_menu_header
	db $40 ;flags
	db 2, 1 ;start coordinates; initial y = final y - (2 * items + 1), initial x = final x - (longest item + 3)
	db 11, 19 ;end coordinates, next to the dialogue corner
	dw .weekend_menu_options
	db 1 ;default option
.weekend_menu_options
	db $80 ;print the text one tile to the right of the border
	db 4 ;option count
	db "START Challenge@"
	db "Weekend-Spezial@"
	db "Anleitung@"
	db "Tschüss@"

.game_menu_header
	db $40 ;flags
	db 4, 0 ;start coordinates; initial y = final y - (2 * items + 1), initial x = final x - (longest item + 3)
	db 11, 19 ;end coordinates, next to the dialogue corner
	dw .game_menu_options
	db 1 ;default option
.game_menu_options
	db $80 ;print the text one tile to the right of the border
	db 3 ;option count
	db "10 minuten ¥2000@"
	db "20 minuten ¥3500@"
	db "30 minuten ¥5000@"

.introduction_text
	ctxt "Aktuell gibt es"
	line "hier im Park eine"
	cont "Challenge."

	para "Interessiert?"
	done

.denied_text
	ctxt "Nunja, genieß den"
	line "den Park."

	para "<...>"

	para "Was? Ich sollte"
	line "zumindest so"
	para "klingen, als würde"
	line "ich meinen Job"
	cont "lieben?"

	para "Schau mal <...> mir"
	line "wurde nur gezeigt,"
	para "WAS ich sagen soll"
	line "und nicht WIE!"

	para "Wenn du ein Pro-"
	line "blem damit hast,"
	para "kläre das mit"
	line "meinem"
	cont "Vorgesetzten!"
	done

.which_mode_text
	ctxt "Wie lange willst"
	line "du spielen?"
	done

.weekend_special_text
	ctxt "Das Weekend-"
	line "Spezial geht 15"
	para "Minuten für nur"
	line "¥2500. Interesse?"
	done

.no_money_text
	ctxt "Komm schon, das"
	line "hier keine"
	cont "Wohlfahrt <...>"

	para "Wenn du kein Geld"
	line "hast, verschwende"
	cont "nicht unsere Zeit!"
	done

.instructions_text
	ctxt "-Seufz-"

	para "Oh man <...> OK hier"
	line "die Anleitung."

	para "Jeder Fleck"
	line "enthällt Bälle,"
	para "ein #mon oder"
	line "sogar gar nichts."

	para "Wenn du gegen das"
	line "#mon kämpfst oder"
	para "die Items nimmst,"
	line "leert sich der"
	para "Fleck für eine"
	line "kurze weile."

	para "Leere Flecken"
	line "regenerieren sich"
	cont "nach 1 Min oder so."

	para "Die #mon, denen"
	line "du hier begegnest,"
	para "sind stärker als"
	line "die in der Wildnis"
	para "und sind auch"
	line "öfters schillernd."

	para "Du kannst keine"
	line "normalen #bälle"
	cont "nutzen."
	
	para "Stattdessen wirst"
	line "du von uns mit"
	para "Parkbällen aus-"
	line "gestattet und"
	para "kannst die Bälle,"
	line "die du hier"
	para "findest, auch"
	line "einsetzen."

	para "Die Parkbälle, die"
	line "du nicht benutzt,"
	para "gibst du uns"
	line "nachher zurück."
	para "Die Bälle, die du"
	line "hier findest"
	para "bleiben ebenfalls"
	line "bei uns, jedoch"
	para "kannst du sie"
	line "bei deinem"
	para "nächsten Besuch"
	line "wieder nutzen."

	para "Zudem hast du ein"
	line "Zeit-Limit. Wenn"
	para "die Zeit vorbei"
	line "ist, wirst du von"
	para "uns zum Eingang"
	line "gebracht."

	done

ProvincialParkGate_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def $4, $0, 1, PROVINCIAL_PARK
	warp_def $5, $0, 2, PROVINCIAL_PARK
	warp_def $4, $d, 2, ROUTE_81
	warp_def $5, $d, 4, ROUTE_81

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 2, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ProvincialParkGateAttendant, -1
