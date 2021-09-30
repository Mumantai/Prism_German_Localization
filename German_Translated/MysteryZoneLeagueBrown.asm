MysteryZoneLeagueBrown_MapScriptHeader;trigger count
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

	para "Wir bekommen nicht"
	line "viele Besucher."

	para "Bist du irritiert?"

	line "<...><PLAYER>, richtig?"

	para "Nun, dies ist die "
	line "Mystik-Liga."

	para "Zusammen mit der"
	line "Hilfe von zwei"
	para "anderen berühmten"
	line "Trainern habe ich"
	para "diese geheime Liga"
	line "gegründet."

	para "Mein Name ist"
	line "Brown, und es ist"
	para "mir ein Vergnügen,"
	line "dich kennen zu "
	cont "lernen."

	para "Wenn du unserer"
	line "Liga beitreten"
	para "willst, musst du"
	line "uns alle drei in"
	para "einem"
	line "#Mon-kampf "
	cont "besiegen."

	para "Lasst uns "
	line "beginnen!"

	sdone

.battle_won_text
	ctxt "Krass!"

	done

.defeated_text
	ctxt "Das war "
	line "erstaunlich!"

	para "Mal sehen ob du"
	line "die anderen"
	para "Herrausforderungen"
	line "auch bewältigen "
	cont "kannst!"

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
