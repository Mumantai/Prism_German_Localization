RijonLeagueOutside_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_RIJON_LEAGUE
	return

RijonLeagueOutsideHiddenItem:
	dw EVENT_RIJON_LEAGUE_OUTSIDE_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

RijonLeagueOutsideSign:
	ctxt "Talrus Heights"
	nl   ""
	next "E pluribus unum."
	done

RijonLeagueOutside_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $5, $9, 1, RIJON_LEAGUE_INSIDE
	warp_def $5, $a, 2, RIJON_LEAGUE_INSIDE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 7, 12, SIGNPOST_LOAD, RijonLeagueOutsideSign
	signpost 6, 6, SIGNPOST_ITEM, RijonLeagueOutsideHiddenItem

	;people-events
	db 0
