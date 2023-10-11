Route34Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, .set_bike_off

.set_bike_off
	clearflag ENGINE_ALWAYS_ON_BIKE
	return

Route34GateHiddenItem:
	dw EVENT_ROUTE_34_GATE_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route34Gate_CyclingRoadBikeCheck1:
	writehalfword Route34Gate_CyclingRoadBikeCheck_PlayerWalksToGuard1
	selse

Route34Gate_CyclingRoadBikeCheck2:
	writehalfword Route34Gate_CyclingRoadBikeCheck_PlayerWalksToGuard2

	sendif
	checkitem BICYCLE
	sif true
		end
	showtext .Route34GateHaltText
	applymovement PLAYER, -1
	scall Route34Gate_CyclingRoadBikeCheck_EntryPoint
	applymovement PLAYER, Route34GateNoBikeLeave
	end

.Route34GateHaltText:
	ctxt "Halt!"
	sdone

Route34Gate_CyclingRoadBikeCheck_PlayerWalksToGuard2:
	step_up
Route34Gate_CyclingRoadBikeCheck_PlayerWalksToGuard1:
	step_end

Route34GateCyclingRoadGuard:
	checkitem BICYCLE
	sif true, then
		faceplayer
		farjumptext Route49BikeText
	sendif

Route34Gate_CyclingRoadBikeCheck_EntryPoint:
	faceplayer
	faceperson PLAYER, 4
	opentext
	farwritetext Route49NoBikeText
	closetextend

Route34GateNoBikeLeave:
	step_right
	step_end

Route34GateNPC:
	faceplayer
	opentext
	checkevent EVENT_TM88
	sif true
		jumptext .after_giving_TM_text
	writetext .give_TM_text
	givetm TM_SIGNAL_BEAM + RECEIVED_TM
	setevent EVENT_TM88
	closetextend

.give_TM_text
	ctxt "Oh, honey. You're"
	line "not from Johto?"

	para "I have a TM that"
	line "you can take as"
	cont "a welcome gift."
	sdone

.after_giving_TM_text
	ctxt "TM88 is Signal"
	line "Beam, my"
	para "Butterfree's"
	line "favorite move!"
	done

Route34GateButterfree:
	faceplayer
	opentext
	writetext .text
	cry BUTTERFREE
	endtext

.text
	ctxt "Butterfree:"
	line "Freeh!"
	done

Route34Gate_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $4, $0, 1, ROUTE_47
	warp_def $5, $0, 1, ROUTE_47
	warp_def $0, $e, 1, ROUTE_34
	warp_def $0, $f, 2, ROUTE_34
	warp_def $7, $e, 1, ILEX_FOREST
	warp_def $7, $f, 1, ILEX_FOREST

.CoordEvents
	db 2
	xy_trigger 0, 4, 3, Route34Gate_CyclingRoadBikeCheck1
	xy_trigger 0, 5, 3, Route34Gate_CyclingRoadBikeCheck2

.BGEvents
	db 1
	signpost 1, 19, SIGNPOST_ITEM, Route34GateHiddenItem

.ObjectEvents
	db 3
	person_event SPRITE_TEACHER, 3, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route34GateNPC, -1
	person_event SPRITE_BUTTERFREE, 4, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route34GateButterfree, -1
	person_event SPRITE_OFFICER, 3, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route34GateCyclingRoadGuard, -1
