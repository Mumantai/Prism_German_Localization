Route72Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route72GateNPC1:
	ctxt "Vor uns liegt"
	line "Route 72."
	para "Eifrige Trainer"
	line "warten dort auf"
	cont "dich."
	para "Ehrlich<...>"
	para "Was für Looser."
	done

Route72GateNPC2:
	ctxt "Ich muss"
	line "nachdenken<...>"
	para "Mein #mon hasst"
	line "mich und Ich weiss"
	cont "nicht wieso<...>"
	done

Route72GateNPC3:
	ctxt "Die Treppen führen"
	line "runter in eine,"
	cont "Höhle."
	done

Route72GateOldMan:
	faceplayer
	checkevent EVENT_BIG_SHINY_BALL_REWARD
	sif true
		jumptext .after_giving_shiny_balls_text
	checkevent EVENT_ROUTE_72_GATE_POKEBALLS
	sif false, then
		opentext
		writetext .before_giving_pokeballs_text
		setevent EVENT_ROUTE_72_GATE_POKEBALLS
		verbosegiveitem POKE_BALL, 5
		waitbutton
	sendif
	checkcode VAR_DEXCAUGHT
	sif <, 253
		jumptext .after_giving_pokeballs_text
	opentext
	writetext .show_all_pokemon_text
	verbosegiveitem SHINY_BALL, 20
	waitbutton
	setevent EVENT_BIG_SHINY_BALL_REWARD
	jumptext .gave_shiny_balls_text

.gave_shiny_balls_text
	ctxt "Diese speziellen"
	line "Bälle machen jedes"
	cont "#mon schillernd"
	para "Es hat einen kom-"
	line "ischen Nebeneffekt"
	cont "bei manchen arten."
	para "Mir ist das aber"
	line "noch nie passiert."
	para "Nutze es sehr"
	line "weise!"
	done

.before_giving_pokeballs_text
	ctxt "Na du."
	para "Du bist interess-"
	line "iert daran den"
	cont "#dex zu füllen?"
	para "In dem Fall kann"
	line "ich dir helfen!"
	para "Ist zwar nicht"
	line "viel, aber besser"
	cont "als nichts."
	prompt

.after_giving_pokeballs_text
	ctxt "Ich will unbedingt"
	line "einen vollen Naljo"
	cont "#dex sehen."
	para "Komm zurück wenn"
	line "es soweit ist!"
	done

.show_all_pokemon_text
	ctxt "Was ist das?!"
	para "253 #mon!"
	para "WUNDERSCHÖN!"
	para "So eine beachtl-"
	line "iche Leistung muss"
	cont "belohnt werden!"
	para "Oh, ich weis wie!"
	para "Pass gut auf die"
	line "auf."
	sdone

.after_giving_shiny_balls_text
	ctxt "Du solltest stolz"
	line "sein auf das, was"
	cont "du erreicht hast."
	para "Den Naljo Dex zu"
	line "füllen ist nicht"
	cont "so einfach!"
	done

Route72Gate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 9
	warp_def $0, $4, 1, ROUTE_72
	warp_def $0, $5, 2, ROUTE_72
	warp_def $7, $4, 1, ROUTE_71_WEST
	warp_def $7, $5, 1, ROUTE_71_WEST
	warp_def $e, $4, 4, OXALIS_CITY
	warp_def $e, $5, 10, OXALIS_CITY
	warp_def $15, $4, 3, ROUTE_72
	warp_def $15, $5, 3, ROUTE_72
	warp_def $7, $8, 6, CLATHRITE_1F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_OFFICER, 4, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route72GateNPC1, -1
	person_event SPRITE_OFFICER, 17, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route72GateNPC2, -1
	person_event SPRITE_GRAMPS, 3, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route72GateNPC3, -1
	person_event SPRITE_POKEFAN_M, 6, 0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route72GateOldMan, -1