RijonLeagueInside_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .vacation_check
	
.vacation_check
	setevent EVENT_LEAGUE_BLOCKER
	checkevent EVENT_RIJON_LEAGUE_WON
	sif false
		return
	checkcode VAR_BADGES
	sif <, 20
		clearevent EVENT_LEAGUE_BLOCKER
	return

RijonLeagueInsideNPC1:
	ctxt "Pack dich gut"
	line "ein, bevor du"
	cont "rein gehst."

	para "Du wirst es"
	line "brauchen!"
	done

RijonLeagueInsideNPC2:
	ctxt "Yo, zukünftiger"
	line "Champ!"

	para "Der Meister hier"
	line "ist kein leichter"
	cont "Gegner!"

	para "Der eigentliche"
	line "Meister war jedoch"
	para "ein Typ namens"
	line "Braun."

	para "Aber!"

	para "Ein anderer"
	line "legendärer Trainer"
	cont "schlug ihn!"
	done

RijonLeagueInsideGuard:
	ctxt "Die Rijon-Liga"
	line "ist vorübergehend"
	cont "geschlossen."

	para "Die Top-4 nehmen"
	line "sich eine wohl-"
	
	para "verdiente Auszeit"
	line "und werden dabei"
	para "warscheinlich"
	line "trainieren."
	
	para "Komm später"
	line "wieder zurück."
	done

RijonLeagueInside_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $6, 1, RIJON_LEAGUE_OUTSIDE
	warp_def $7, $7, 2, RIJON_LEAGUE_OUTSIDE
	warp_def $0, $7, 1, RIJON_LEAGUE_YUKI

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 5
	person_event SPRITE_ROCKER, 6, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, RijonLeagueInsideNPC1, -1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, RijonLeagueInsideNPC2, -1
	person_event SPRITE_CLERK, 1, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, LEAGUE_STANDARD_MART, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_COOLTRAINER_M, 1, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, RijonLeagueInsideGuard, EVENT_LEAGUE_BLOCKER
