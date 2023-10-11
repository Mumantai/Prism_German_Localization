Route49Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route49NoBike:
	checkitem BICYCLE
	sif true
		end
	faceperson PLAYER, 2
	showtext Route49NoBikeText
	applymovement PLAYER, Route49GateNoBikeLeave
	end

Route49GateNoBikeLeave:
	step_right
	step_end

Route49NoBikeText:
	ctxt "This is a steep"
	line "road."

	para "I can't let you"
	line "through without a"
	cont "Bicycle."
	sdone

Route49BikeText:
	ctxt "Be careful."

	para "Don't bike off of"
	line "the docks."
	done

Route49Gate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $4, $0, 2, ROUTE_49
	warp_def $5, $0, 2, ROUTE_49
	warp_def $4, $7, 4, ROUTE_49
	warp_def $5, $7, 4, ROUTE_49

	;xy triggers
	db 4
	xy_trigger 0, 3, 3, Route49NoBike
	xy_trigger 0, 4, 3, Route49NoBike
	xy_trigger 0, 5, 3, Route49NoBike
	xy_trigger 0, 6, 3, Route49NoBike

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, Route49BikeText, -1
