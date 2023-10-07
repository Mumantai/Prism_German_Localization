ClathriteKyogre_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .puzzle_solved

.puzzle_solved
	setevent EVENT_SOLVED_KYOGRE_PUZZLE
	return

ClathriteKyogreSignpost1:
	opentext
	checkitem BLUE_ORB
	sif false
		jumptext .no_orb_text
	writetext .ask_place_orb_text
	yesorno
	sif false
		closetextend
	musicfadeout MUSIC_NONE, 47
	closetext
	playsound SFX_EMBER
	earthquake 31
	playsound SFX_EMBER
	earthquake 31
	special ClearBGPalettes
	playsound SFX_EMBER
	earthquake 31
	special Special_ReloadSpritesNoPalettes
	pause 48
	takeitem BLUE_ORB, 1
	scall .step_and_thunder
	scall .step_and_thunder
	scall .step_and_thunder
	special Special_FadeInQuickly
	cry KYOGRE
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon KYOGRE, 50
	startbattle
	dontrestartmapmusic
	disappear 2
	reloadmapafterbattle
	playmapmusic
	end

.no_orb_text
	ctxt "It looks like"
	line "a sphere can be"
	cont "placed here<...>"
	done

.ask_place_orb_text
	ctxt "It looks like your"
	line "Blue Orb will fit"
	cont "here."

	para "Will you place it?"
	done

.step_and_thunder
	applymovement 2, .step_down_movement
	playsound SFX_THUNDER
	special ClearBGPalettes
	pause 8
	special Special_ReloadSpritesNoPalettes
	pause 32
	end

.step_down_movement
	slow_step_down
	step_end

ClathriteKyogre_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $25, $2, 9, CLATHRITE_B2F

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 8, 10, SIGNPOST_READ, ClathriteKyogreSignpost1

.ObjectEvents
	db 2
	person_event SPRITE_KYOGRE, 4, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_POKE_BALL, 31,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ICY_ROCK, EVENT_CLATHRITE_KYOGRE_ITEM_ICY_ROCK
