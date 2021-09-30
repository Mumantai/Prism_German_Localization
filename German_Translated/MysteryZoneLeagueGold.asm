MysteryZoneLeagueGold_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_blocks

.set_blocks
	checkevent EVENT_0
	sif false
		return
	changeblock 6, 10, $2C
	checkevent EVENT_1
	sif true
		changeblock 6, 4, $01
	return

MysteryZoneGoldBattle:
	faceplayer
	checkevent EVENT_1
	sif false, then
		opentext
		writetext .text
		waitbutton
		winlosstext .text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer GOLD, 1
		startbattle
		reloadmapafterbattle
		playmapmusic
		closetext
		setevent EVENT_1
		changeblock 6, 4, $1
		playsound SFX_WALL_OPEN
		reloadmappart
	sendif
	jumptext .text

.text
	text "<...>"
	line "<...>"
	done

MysteryZoneGoldKillBridge:
	checkevent EVENT_0
	sif true
		end
	setevent EVENT_0
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 10, $2C
	reloadmappart
	closetextend

MysteryZoneLeagueGold_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 13, 6, 3, MYSTERY_ZONE_BROWN
	warp_def 13, 7, 4, MYSTERY_ZONE_BROWN
	warp_def 2, 6, 1, MYSTERY_ZONE_RED
	warp_def 2, 7, 2, MYSTERY_ZONE_RED

.CoordEvents: db 2
	xy_trigger 0, 9, 6, MysteryZoneGoldKillBridge
	xy_trigger 0, 9, 7, MysteryZoneGoldKillBridge

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GOLD, 7, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MysteryZoneGoldBattle, -1
