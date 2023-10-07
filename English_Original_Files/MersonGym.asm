MersonGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonGymSign:
	ctxt "Merson City"
	line "#mon Gym"
	done

MersonGymGuide:
	ctxt "Karpman's a big"
	line "fan of water"
	cont "#mon."

	para "You battled an"
	line "annoying water Gym"
	cont "leader in Naljo?"

	para "Oh, wow, I don't"
	line "mean to be"
	para "negative, but she"
	line "sounds awful."
	done

MersonGymTrainer:
	trainer EVENT_MERSON_GYM_TRAINER_1, CAMPER, 2, .before_battle_text, .battle_won_text

	ctxt "I thought I had a"
	line "chance against"
	cont "you!"

	para "Maybe I shouldn't"
	line "be so optimistic."
	done

.before_battle_text
	ctxt "Stop right there!"
	done

.battle_won_text
	ctxt "I have to win"
	line "these battles<...>"
	done

MersonGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_MARINEBADGE
	sif true
		jumptext .already_won_text
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer KARPMAN, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_MARINEBADGE
	playmusic MUSIC_JOHTO_GYM
	writetext .before_TM_text
	givetm TM_STORM_FRONT + RECEIVED_TM
	jumptext .after_TM_text

.already_won_text
	ctxt "You impressed me."

	para "Keep getting those"
	line "Rijon badges."
	done

.introduction_text
	ctxt "I'm Karpman."

	para "I train only"
	line "Water-type"
	cont "#mon!"

	para "Fire is useless"
	line "against my mighty"
	cont "water attacks!"

	para "You don't look"
	line "intimidated<...>"

	para "What's wrong with"
	line "you?"

	para "Well, whatever."

	para "Let the fight"
	line "begin!"
	sdone

.battle_won_text
	ctxt "Looks like I need"
	line "to respect your"
	cont "authority!"

	para "Go ahead and take"
	line "the Marine Badge."
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Marine Badge."
	done

.before_TM_text
	ctxt "The Marine Badge"
	line "will make your"
	para "#mon even"
	line "stronger!"

	para "Also, take this"
	line "gift."
	sdone

.after_TM_text
	ctxt "Storm Front will"
	line "deal damage and"
	cont "start a rainstorm."

	para "It's ideal for all"
	line "water #mon."
	done

MersonGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $d, $4, 3, MERSON_CITY
	warp_def $d, $5, 3, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 11, 0, SIGNPOST_TEXT, MersonGymSign

.ObjectEvents
	db 3
	person_event SPRITE_KARPMAN, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MersonGymLeader, -1
	person_event SPRITE_CAMPER, 8, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, MersonGymTrainer, -1
	person_event SPRITE_GYM_GUY, 11, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 1, MersonGymGuide, -1
