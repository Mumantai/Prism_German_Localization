GoldenrodGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodGymSign:
	ctxt "Goldenrod Gym"

	para "Leader: Whitney"
	done

GoldenrodGymGuide:
	ctxt "Yo!"

	para "Whitney here has"
	line "always been made"
	cont "out to be a sissy<...>"

	para "<...>but she's really"
	line "toughened up!"

	para "She used to focus"
	line "on Normal types,"
	para "but she now uses"
	line "Fairy types to"
	para "cover their"
	line "weaknesses!"
	done

GoldenrodGym_Trainer_1:
	trainer EVENT_GOLDENROD_GYM_TRAINER_1, BEAUTY, 3, .before_battle_text, .battle_won_text

	ctxt "You must be really"
	line "good to beat me!"

	para "Never stop!"
	done

.before_battle_text
	ctxt "I can't wait to"
	line "see your cute"
	cont "#mon!"

	para "My #mon won't"
	line "hold back!"
	done

.battle_won_text
	ctxt "Oh, is that it?"
	done

GoldenrodGym_Trainer_2:
	trainer EVENT_GOLDENROD_GYM_TRAINER_2, BEAUTY, 4, .before_battle_text, .battle_won_text

	ctxt "Normal #mon can"
	line "learn all sorts of"
	cont "moves from TMs."
	done

.before_battle_text
	ctxt "Give it your best"
	line "shot, 'cause I"
	cont "will!"
	done

.battle_won_text
	ctxt "Oh, no!"
	done

GoldenrodGymLeader:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_HOLDING_MAGNET_PASS
	sif true, then
		writetext .try_give_pass_again_text
		clearevent EVENT_WHITNEY_HOLDING_MAGNET_PASS
	selse
		checkflag ENGINE_PLAINBADGE
		sif true
			jumptext .already_battled_text
		writetext .before_battle_text
		winlosstext .battle_won_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer WHITNEY, 1
		startbattle
		reloadmapafterbattle
		playmapmusic
		opentext
		writetext .got_badge_text
		playwaitsfx SFX_TCG2_DIDDLY_5
		setflag ENGINE_PLAINBADGE
		playmusic MUSIC_JOHTO_GYM
		writetext .after_battle_text
	sendif
	giveitem MAGNET_PASS, 1
	opentext
	writetext .gave_magnet_pass_text
	playwaitsfx SFX_ITEM
	sif true
		jumptext .after_magnet_pass_text
	writetext .full_pack_text
	setevent EVENT_WHITNEY_HOLDING_MAGNET_PASS
	endtext

.before_battle_text
	ctxt "Hi! I'm Whitney!"

	para "I got into #mon"
	line "years ago because"
	cont "everyone else was!"

	para "Guess it wasn't"
	line "just a silly fad!"

	para "I've gotten cuter"
	line "and stronger over"
	para "the years, so if"
	line "you want my badge,"
	para "you're going to"
	line "have to earn it!"
	sdone

.battle_won_text
	ctxt "Hey, that was"
	line "good!"

	para "I'm not going to"
	line "cry. You earned my"
	cont "badge!"
	done

.got_badge_text
	ctxt "<PLAYER> received"
	line "Plain Badge."
	done

.after_battle_text
	ctxt "I'm all out of"
	line "those TMs, so you"
	para "can have this"
	line "instead."
	sdone

.gave_magnet_pass_text
	ctxt "Whitney hands you"
	line "a Magnet Pass!"
	done

.after_magnet_pass_text
	ctxt "The Magnet Pass"
	line "will allow you to"
	para "take the Magnet"
	line "Train back and"
	para "forth from Johto"
	line "to Kanto as many"
	cont "times as you want!"

	para "I would go myself,"
	line "but someone needs"
	cont "to run the Gym!"

	para "Especially if the"
	line "League makes me"
	para "change my Gym's"
	line "type, like Jasmine"
	cont "had to do<...>"

	para "It's not my fault"
	line "they keep changing"
	para "my cute Normal-"
	line "type #mon into"
	cont "different types!"
	done

.full_pack_text
	ctxt "You don't seem to"
	line "have room for"
	para "this, so I'll hold"
	line "onto it for you"
	cont "until you do, OK?"
	done

.try_give_pass_again_text
	ctxt "Have you made room"
	line "for this now?"
	sdone

.already_battled_text
	ctxt "I'm so happy that I"
	line "get the chance to"
	para "battle great"
	line "Trainers like you!"
	done

GoldenrodGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $4, 1, GOLDENROD_CITY
	warp_def $f, $5, 1, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 13, 2, SIGNPOST_TEXT, GoldenrodGymSign
	signpost 13, 7, SIGNPOST_TEXT, GoldenrodGymSign

.ObjectEvents
	db 4
	person_event SPRITE_GYM_GUY, 13, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodGymGuide, -1
	person_event SPRITE_BUENA, 9, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GoldenrodGym_Trainer_1, -1
	person_event SPRITE_BUENA, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GoldenrodGym_Trainer_2, -1
	person_event SPRITE_WHITNEY, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGymLeader, -1
