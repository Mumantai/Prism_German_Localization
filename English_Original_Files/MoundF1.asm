MoundF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_TILES, .swap_map

.swap_map
	checkevent EVENT_BLEW_UP_DYNAMITE
	sif true
		changemap MoundF1_BlownUp_BlockData
	return

MoundF1Rival:
	showtext .during_phone_call_text
	faceplayer
	showemote 3, 6, 32
	spriteface 6, 2
	opentext
	writetext .noticed_player_text
	playwaitsfx SFX_HANG_UP
	closetext
	faceplayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext .engaged_player_text
	loadtrainer RIVAL1, RIVAL1_2
	winlosstext .battle_won_text, 0
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext .after_battle_text
	applymovement 6, .leave
	special RestartMapMusic
	disappear 6
	setevent EVENT_MOUND_CAVE_RIVAL
	end

.leave
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end

.during_phone_call_text
	ctxt "I can't hear you<...>"

	para "OK, now I get you."

	para "Alright, you want"
	line "me to go where?"
	sdone

.noticed_player_text
	ctxt "<...>"

	para "I'll call you back."
	done

.engaged_player_text
	ctxt "I told you to stay"
	line "out of my way."

	para "Can't you follow"
	line "the most basic"
	cont "instructions?"

	para "<...>"

	para "I guess it's time"
	line "to see if these"
	para "new #mon can"
	line "slice your team up"
	cont "real good!"
	sdone

.battle_won_text
	ctxt "What was that for,"
	line "huh?"
	done

.after_battle_text
	ctxt "These worthless"
	line "pests are just a"
	cont "waste of my time."

	para "Now I am off to"
	line "find new #mon"
	para "that suit my"
	line "specific needs."

	para "<...>"

	para "What those are?"

	para "Hah! That's not"
	line "your concern."
	sdone

MoundF1DynamiteGuy:
	opentext
	checkevent EVENT_SPOKE_DYNAMITE_GUY
	sif false, then
		writetext .intro_text
		setevent EVENT_SPOKE_DYNAMITE_GUY
	sendif
	takeitem DYNAMITE, 5
	sif false, then
		checkitem POKE_BALL
		sif true, then
			writetext .theres_dynamite_left_text
			jumptext .still_waiting_text
		selse
			writetext .no_balls_text
			verbosegiveitem POKE_BALL, 3
			closetextend
		sendif
	sendif
	giveitem DYNAMITE, 5
	writetext .need_fire_mon_text
	findpokemontype FIRE
	waitbutton
	sif false
		closetextend
	getpartymonname 0
	writetext .try_mon_text
	addvar -1
	copyvartobyte wCurPartyMon
	yesorno
	closetext
	sif false
		end
	fieldmovepokepic
	showtext .lit_the_fuse_text
	applymovement PLAYER, .player_steps_aside
	applymovement 3, .guy_steps_aside
	applymovement 3, .guy_moves_back
	showemote EMOTE_SHOCK, PLAYER, 32
	applymovement PLAYER, .player_moves_back
	changemap MoundF1_BlownUp_BlockData
	playsound SFX_EGG_BOMB
	earthquake 24
	playsound SFX_EGG_BOMB
	earthquake 24
	playsound SFX_EGG_BOMB
	earthquake 24
	playsound SFX_EGG_BOMB
	earthquake 24
	spriteface 3, UP
	spriteface PLAYER, LEFT
	loademote EMOTE_HAPPY
	showemote EMOTE_HAPPY, 3, 32
	showtext .after_blowing_up_text
	playsound SFX_JUMP_OVER_LEDGE
	applymovement 3, .guy_leaves
	takeitem DYNAMITE, 5
	disappear 3 ; sets EVENT_BLEW_UP_DYNAMITE
	end

.player_steps_aside
	step_right
	step_end

.guy_moves_back
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_right
	run_step_right
	run_step_down
	step_end

.player_moves_back
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_right
	run_step_right
	run_step_right
	step_end

.guy_leaves
	jump_step_left
	run_step_left
	run_step_left
	hide_person
	step_down
	step_down
	step_down
.guy_steps_aside
	step_down
	step_end

.intro_text
	ctxt "Ah, hello there!"

	para "I'd like to leave"
	line "this place."

	para "However<...>"

	para "These rocks are"
	line "blocking the exit."

	para "I almost have"
	line "enough dynamite to"
	para "get rid of these"
	line "darn things, but"
	para "I'd need about five"
	line "more to get them"
	cont "out of my way<...>"

	para "Forever. Hehe."
	sdone

.theres_dynamite_left_text
	ctxt "Hmm. If I'm not"
	line "mistaken, there"
	para "should be some"
	line "dynamite left."

	para "It should be"
	line "spread out on the"
	cont "bottom floors."

	para "However, I saw a"
	line "bunch of multi-"
	para "colored freaks"
	line "hang around there."

	para "If you want to"
	line "help me out and"
	para "deal with them, be"
	line "my guest."
	sdone

.still_waiting_text
	ctxt "I'm still waiting"
	line "for the dynamite."

	para "I need 5 sticks to"
	line "blast us through."
	done

.no_balls_text
	ctxt "You don't have any"
	line "#balls?"

	para "Well<...>"

	para "To get through the"
	line "cave, you're going"
	para "to need Electric"
	line "and Fire #mon."

	para "Here."

	para "Have a couple of"
	line "#balls!"
	sdone

.need_fire_mon_text
	ctxt "Great, you got all"
	line "of the sticks!"

	para "However, we need"
	line "some real fire to"
	cont "light the fuse."

	para "Maybe a Fire-type"
	line "#mon or move"
	cont "could do it<...>"
	done

.try_mon_text
	ctxt "Try with"
	line "<STRBF2>?"
	done

.lit_the_fuse_text
	ctxt "Great, it lit the"
	line "fuse! Let's stand"
	cont "back!"
	sdone

.after_blowing_up_text
	ctxt "Whoo hoo!"

	para "I'm free!"

	para "Thanks, kid."
	sdone

MoundF1_BlownUp_BlockData: INCBIN "./maps/blk/MoundF1_BlownUp_BlockData.ablk.lz"

MoundF1_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 25, 17, 3, ROUTE_73
	warp_def 43, 3, 3, MOUND_F1
	warp_def 89, 3, 2, MOUND_F1
	warp_def 59, 17, 5, MOUND_F1
	warp_def 5, 15, 4, MOUND_F1
	warp_def 13, 17, 1, MOUND_B3F
	warp_def 49, 9, 1, MOUND_B1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 31, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_AERIAL_ACE, 0, EVENT_MOUND_CAVE_TM43
	person_event SPRITE_R_HIKER, 2, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoundF1DynamiteGuy, EVENT_BLEW_UP_DYNAMITE
	person_event SPRITE_POKE_BALL, 73, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MINING_PICK, EVENT_MOUND_F1_ITEM_MINING_PICK
	person_event SPRITE_ROCK, 37, 11, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_SILVER, 27, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoundF1Rival, EVENT_MOUND_CAVE_RIVAL
	person_event SPRITE_POKE_BALL, 60, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_PROTECT, 0, EVENT_MOUND_CAVE_TM17
	person_event SPRITE_POKE_BALL, 87, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SUPER_POTION, EVENT_MOUND_F1_ITEM_SUPER_POTION
