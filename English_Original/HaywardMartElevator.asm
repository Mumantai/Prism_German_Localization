HaywardMartElevator_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HaywardMartElevatorControls:
	opentext
	elevator HaywardMartElevatorHeader
	closetext
	sif false
		end
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	end

HaywardMartElevatorHeader:
	db 6 ; floors
	elevfloor _1F, 4, HAYWARD_MART_F1
	elevfloor _2F, 3, HAYWARD_MART_F2
	elevfloor _3F, 3, HAYWARD_MART_F3
	elevfloor _4F, 3, HAYWARD_MART_F4
	elevfloor _5F, 3, HAYWARD_MART_F5
	elevfloor _6F, 2, HAYWARD_MART_F6
	db -1

HaywardMartElevator_MapEventHeader:: db 0, 0

.Warps
	db 2
	dummy_warp 3, 1
	dummy_warp 3, 2

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 0, 3, SIGNPOST_READ, HaywardMartElevatorControls

	;people-events
.ObjectEvents
