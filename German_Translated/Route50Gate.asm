Route50Gate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route50NoBike:
	checkitem BICYCLE
	sif true
		end
	faceperson PLAYER, 2
	showtext Route50NoBikeText
	applymovement PLAYER, Route50GateNoBikeLeave
	end

Route50GateNoBikeLeave:
	step_down
	step_end

Route50NoBikeText:
	ctxt "Dies ist eine"
	line "steile Straße."

	para "Ohne Fahrrad kann"
	line "ich dich nicht"
	cont "durchlassen."

	sdone

Route50GateGuardText:
	ctxt "Wir hatten"
	line "Probleme mit"
	para "Vandalismus auf"
	line "der Aussichts-"
	cont "plattform."

	para "Also haben wir sie"
	line "abgeschottet."

	para "Jetzt besprühen"
	line "Leute die Wand mit"
	cont "Farbe <...>"
	done

Route50Gate_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def $0, $4, 1, ROUTE_49
	warp_def $0, $5, 3, ROUTE_49
	warp_def $7, $4, 1, ROUTE_50
	warp_def $7, $5, 1, ROUTE_50

	;xy triggers
	db 4
	xy_trigger 0, 4, 3, Route50NoBike
	xy_trigger 0, 4, 4, Route50NoBike
	xy_trigger 0, 4, 5, Route50NoBike
	xy_trigger 0, 4, 6, Route50NoBike

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXT, 0, Route50GateGuardText, -1
