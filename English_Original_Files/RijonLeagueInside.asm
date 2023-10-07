RijonLeagueInside_MapScriptHeader:
 ;trigger count
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
	ctxt "Stock on supplies"
	line "before heading"
	cont "in."

	para "You'll need them!"
	done

RijonLeagueInsideNPC2:
	ctxt "Yo, Champ in the"
	line "making!"

	para "The Champion here"
	line "is no pushover!"

	para "The Trainer known"
	line "as Brown was once"
	cont "the Champion."

	para "But!"

	para "Another legendary"
	line "Trainer bested"
	cont "him!"
	done

RijonLeagueInsideGuard:
	ctxt "The Rijon League"
	line "is temporarily"
	cont "closed."

	para "The league members"
	line "are taking a well-"
	para "deserved vacation"
	line "after a crushing"
	cont "defeat."

	para "Come back later."
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
