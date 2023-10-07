MysteryZoneLeagueBrown_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_blocks

.set_blocks
	checkevent EVENT_0
	sif false
		return
	changeblock 6, 12, $2C
	checkevent EVENT_1
	sif true
		changeblock 6, 4, $1
	return

MysteryZoneBrownBattle:
	setevent EVENT_FOUGHT_BROWN
	faceplayer
	checkevent EVENT_1
	sif false, then
		opentext
		writetext .before_battle_text
		winlosstext .battle_won_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer BROWN, 1
		startbattle
		reloadmapafterbattle
		playmapmusic
		closetext
		setevent EVENT_1
		changeblock 6, 4, $1
		playsound SFX_WALL_OPEN
		reloadmappart
	sendif
	jumptext .defeated_text

.before_battle_text
	ctxt "Wow!"

	para "We don't see many"
	line "visitors."

	para "Are you confused?"

	para "<...><PLAYER>, is it?"

	para "Well, this is the"
	line "Mystery League."

	para "I, along with the"
	line "help of two other"
	para "famous trainers,"
	line "created this"
	cont "secret league."

	para "My name is Brown,"
	line "and it's a pleasure"
	cont "to meet you."

	para "If you want to"
	line "become a member of"
	para "our league, you"
	line "must defeat all"
	para "three of us in a"
	line "#mon Battle."

	para "Let's begin!"
	sdone

.battle_won_text
	ctxt "Incredible!"
	done

.defeated_text
	ctxt "That was something"
	line "else!"

	para "Let's see if you"
	line "can handle what's"
	cont "up ahead!"
	done

MysteryZoneBrownKillBridge:
	checkevent EVENT_0
	sif true
		end
	setevent EVENT_0
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 12, $2C
	reloadmappart
	closetextend

MysteryZoneLeagueBrown_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 15, 6, 3, MYSTERY_ZONE_LEAGUE_LOBBY
	warp_def 15, 7, 3, MYSTERY_ZONE_LEAGUE_LOBBY
	warp_def 2, 6, 1, MYSTERY_ZONE_GOLD
	warp_def 2, 7, 2, MYSTERY_ZONE_GOLD

.CoordEvents: db 2
	xy_trigger 0, 11, 6, MysteryZoneBrownKillBridge
	xy_trigger 0, 11, 7, MysteryZoneBrownKillBridge

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_BROWN, 8, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MysteryZoneBrownBattle, -1
