JaeruGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

JaeruGymTrash:
	ctxt "Nope! Nothing here"
	line "but trash."
	done

JaeruGymStatue:
	ctxt "Jaeru Town"
	line "#mon Gym"

	para "Leader: Sparky"
	done

JaeruGymGuide:
	faceplayer
	checkflag ENGINE_SPARKYBADGE
	sif true
		jumptext .after_defeating_gym_text
	jumptext .before_defeating_gym_text

.before_defeating_gym_text
	ctxt "What's up?"

	para "Sparky has grown"
	line "up over the years,"
	para "and converted his"
	line "Gym into an"
	cont "office."

	para "Not sure what his"
	line "home business"
	para "does, but I don't"
	line "want to find out."
	done

.after_defeating_gym_text
	ctxt "Whew! That was an"
	line "electrifying bout!"
	para "It sure made me"
	line "nervous."
	done

JaeruGym_Trainer_1:
	trainer EVENT_JAERU_GYM_TRAINER_1, GENTLEMAN, 2, .before_battle_text, .battle_won_text

	ctxt "I get paid more"
	line "than you, hahaha!"
	done

.before_battle_text
	ctxt "I'm on my break."
	line "Go ahead, kid!"
	done

.battle_won_text
	ctxt "Better get"
	line "overtime for this!"
	done

JaeruGym_Trainer_2:
	trainer EVENT_JAERU_GYM_TRAINER_2, COOLTRAINERM, 6, .before_battle_text, .battle_won_text

	ctxt "The boss won't be"
	line "happy about this!"
	done

.before_battle_text
	ctxt "The boss is not"
	line "accepting meetings"
	cont "right now."

	para "Go away!"
	done

.battle_won_text
	text "Fine!"
	done

JaeruGym_Trainer_3:
	trainer EVENT_JAERU_GYM_TRAINER_3, SUPER_NERD, 8, .before_battle_text, .battle_won_text

	ctxt "Battles with me"
	line "are now optional."

	para "Union rules."
	done

.before_battle_text
	ctxt "You don't work"
	line "here!"

	para "Begone!"
	done

.battle_won_text
	ctxt "Too much overtime!"
	done

JaeruGymLeader:
	faceplayer
	checkflag ENGINE_SPARKYBADGE
	sif true
		jumptext .already_defeated_text
	showtext .introduction_text
	winlosstext .battle_won_text, 0
	loadtrainer SPARKY, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext .get_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_JOHTO_GYM
	waitsfx
	setflag ENGINE_SPARKYBADGE
	jumptext .after_badge_text

.introduction_text
	ctxt "What do you want?"
	line "I'm working towards"
	para "outsourcing my"
	line "workforce."

	para "Don't tell them"
	line "that, please."

	para "Oh, a battle?"

	para "I suppose."
	sdone

.battle_won_text
	ctxt "Fine, you get the"
	line "Sparky Badge; now"
	para "let me get back to"
	line "work."
	done

.get_badge_text
	ctxt "<PLAYER> received"
	line "Sparky Badge!"
	done

.after_badge_text
	ctxt "This badge raises"
	line "the speed of your"
	cont "#mon."

	para "Use that to get"
	line "out of here."
	done

.already_defeated_text
	ctxt "What?"

	para "I'm busy!"
	done

JaeruGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $4, 3, JAERU_CITY
	warp_def $11, $5, 3, JAERU_CITY

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 11, 9, SIGNPOST_TEXT, JaeruGymTrash
	signpost 9, 3, SIGNPOST_TEXT, JaeruGymTrash
	signpost 0, 9, SIGNPOST_TEXT, JaeruGymTrash
	signpost 15, 3, SIGNPOST_TEXT, JaeruGymStatue
	signpost 15, 6, SIGNPOST_TEXT, JaeruGymStatue

.ObjectEvents
	db 5
	person_event SPRITE_SPARKY, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, JaeruGymLeader, -1
	person_event SPRITE_GENTLEMAN, 10, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, JaeruGym_Trainer_1, -1
	person_event SPRITE_COOLTRAINER_M, 7, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, JaeruGym_Trainer_2, -1
	person_event SPRITE_SUPER_NERD, 11, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, JaeruGym_Trainer_3, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, JaeruGymGuide, -1
