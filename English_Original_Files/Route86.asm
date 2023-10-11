Route86_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 2
	dbw 5, .set_fly_flag
	dbw MAPCALLBACK_TILES, .set_route_block

.set_fly_flag
	setflag ENGINE_FLYPOINT_BATTLE_ARCADE
	return

.set_route_block
	checkevent EVENT_FARAWAY_UNLOCKED
	sif false
		changeblock 8, 40, $f4
	return

Route86HiddenItem:
	dw EVENT_ROUTE_86_HIDDENITEM_FULL_RESTORE
	db FULL_RESTORE

Route86BattleArcadeSign:
	ctxt "Battle Arcade"
	done

Route86LockedDoor:
	checkevent EVENT_FARAWAY_UNLOCKED
	sif true
		end
	checkitem PRISM_KEY
	sif false
		jumptext .locked_text
	opentext
	writetext .opened_text
	changeblock 8, 40, $77
	playsound SFX_ENTER_DOOR
	waitbutton
	closetext
	reloadmappart
	setevent EVENT_FARAWAY_UNLOCKED
	end

.locked_text
	ctxt "The door is"
	line "locked."
	done

.opened_text
	ctxt "Opened the door"
	line "with the Prism"
	cont "Key!"
	done

Route86_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 9, 10, 1, BATTLE_ARCADE_LOBBY
	warp_def 21, 9, 1, ROUTE_86_DOCK_EXIT
	warp_def 21, 10, 2, ROUTE_86_DOCK_EXIT
	warp_def 41, 8, 1, ROUTE_86_UNDERGROUND_PATH

.CoordEvents: db 0

.BGEvents: db 3
	signpost 11, 13, SIGNPOST_TEXT, Route86BattleArcadeSign
	signpost 11, 16, SIGNPOST_ITEM, Route86HiddenItem
	signpost 41, 8, SIGNPOST_READ, Route86LockedDoor

.ObjectEvents: db 0
