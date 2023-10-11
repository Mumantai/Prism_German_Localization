IntroOutside_MapScriptHeader:
;trigger count
	db 4
	maptrigger .play_introduction
	maptrigger GenericDummyScript
	maptrigger GenericDummyScript
	maptrigger GenericDummyScript
;callback count
	db 2
	dbw MAPCALLBACK_NEWMAP, .init_events
	dbw MAPCALLBACK_TILES, .landslide_tiles

.landslide_tiles
	checkevent EVENT_INTRO_LANDSLIDE
	sif true, then
		changeblock 8, 16, $3b
		changeblock 10, 16, $8e
		changeblock 12, 16, $28
	sendif
	return

.init_events
	checkevent EVENT_INITIALIZED_EVENTS
	sif true
		return
	jumpstd initializeevents

.play_introduction
	priorityjump .play_music
	end

.play_music
	playmusic MUSIC_NATIONAL_PARK
	dotrigger 1
	spriteface PLAYER, LEFT
	spriteface 2, RIGHT
	jumptext .mom_intro_text

.mom_intro_text
	ctxt "It's so beautiful"
	line "here, isn't it?"

	para "I'm glad we could"
	line "have a relaxing"
	cont "time together<...>"

	para "I'm sorry you had"
	line "to deal with your"
	cont "father moving on."

	para "No child wants to"
	line "go through that<...>"

	para "<PLAYER>, your"
	line "father has always"
	para "been a great man,"
	line "and, while he's had"
	para "many fans, you're"
	line "still his biggest."

	para "I know you want to"
	line "follow in his"
	cont "footsteps<...>"

	para "But promise me, no"
	line "matter where you"
	para "go in life<...> never"
	line "forget about your"
	cont "dear mother."

	para "Thanks for coming"
	line "with me, <PLAYER>."
	done

StartingGameEarthquake:
	playmusic MUSIC_NONE
	playsound SFX_EMBER
	earthquake 50
	changeblock 08, 16, $3B
	changeblock 10, 16, $8E
	changeblock 12, 16, $28
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, 0, 16
	waitsfx
	dotrigger 3
	setevent EVENT_INTRO_LANDSLIDE
	end

IntroCampsiteFire:
	ctxt "Looks hot!"
	line "Better not touch<...>"
	done

IntroCampsiteMom:
	ctxt "It's so beautiful"
	line "here, isn't it?"

	para "I've missed just"
	line "escaping into the"
	cont "wilderness<...>"

	para "Thanks for coming"
	line "with me, <PLAYER>."
	done

IntroMomLeavingDialogue:
	spriteface PLAYER, UP
	spriteface 2, DOWN
	playmusic MUSIC_MOM
	showtext .leaving_text_1
	checkcode VAR_XCOORD
	sif =, 4, then
		applymovement 2, .approach_far
	selse
		applymovement 2, .approach_near
	sendif
	showtext .leaving_text_2
	playmusic MUSIC_NATIONAL_PARK
	applymovement 2, .walk_back
	dotrigger 2
	end

.leaving_text_1
	text "<PLAYER>!"
	sdone

.leaving_text_2
	ctxt "<...>Oh, heading out"
	line "for a walk?"

	para "Could you try to"
	line "get some firewood"
	cont "for us?"

	para "The fire will need"
	line "some soon to keep"
	para "us nice and warm"
	line "tonight!"

	para "<...>And, <PLAYER><...>"

	para "<...>"

	para "<...>Just, be safe!"
	sdone

.approach_far
	step_down
	step_down
	rept 5
		step_left
	endr
	turn_head_down
	step_end

.approach_near
	step_down
	step_down
	rept 4
		step_left
	endr
	turn_head_down
	step_end

.walk_back
	rept 5
		step_right
	endr
	step_up
	step_up
	turn_head_down
	step_end

BackOffAfterEarthquake:
	opentext
	writetext .text
	closetext
	applymovement PLAYER, .backoff
	end

.text
	ctxt "These rocks could"
	line "keep sliding down"
	cont "at any time<...>"

	para "Better to back off"
	line "for now. Maybe"
	para "there is another"
	line "exit?"
	prompt

.backoff
	step_down
	step_end

IntroOutside_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def 31, 14, 1, INTRO_CAVE

.CoordEvents
	db 6
	xy_trigger 1, 9, 4, IntroMomLeavingDialogue
	xy_trigger 1, 9, 5, IntroMomLeavingDialogue
	xy_trigger 2, 22, 10, StartingGameEarthquake
	xy_trigger 2, 22, 11, StartingGameEarthquake
	xy_trigger 3, 19, 10, BackOffAfterEarthquake
	xy_trigger 3, 19, 11, BackOffAfterEarthquake

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_MOM, 6, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 3, -1, -1, PAL_OW_PLAYER + 8, PERSONTYPE_TEXTFP, 0, IntroCampsiteMom, -1
	person_event SPRITE_FIRE, 6, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, IntroCampsiteFire, -1
