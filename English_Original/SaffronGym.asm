SaffronGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaffronGymSign:
	ctxt "Saffron Gym"

	para "Leader: Sabrina"
	done

SaffronGymGuide:
	ctxt "Hey!"

	para "Sabrina made"
	line "changes to her"
	para "warp system"
	line "recently, so try"
	cont "not to get lost!"
	done

SaffronGym_Trainer_1:
	trainer EVENT_SAFFRON_GYM_TRAINER_1, PSYCHIC_T, 6, .before_battle_text, .battle_won_text

	ctxt "Your soul grows"
	line "stronger."
	done

.before_battle_text
	ctxt "What is the power"
	line "of your soul?"
	done

.battle_won_text
	ctxt "Such a strong"
	line "soul!"
	done

SaffronGym_Trainer_2:
	trainer EVENT_SAFFRON_GYM_TRAINER_2, MEDIUM, 6, .before_battle_text, .battle_won_text

	ctxt "Don't bother me"
	line "any more, evil"
	cont "spirit!"
	done

.before_battle_text
	ctxt "Evil spirits?"

	para "Begone!"
	done

.battle_won_text
	ctxt "Ayayayayay!"
	done

SaffronGym_Trainer_3:
	trainer EVENT_SAFFRON_GYM_TRAINER_3, MEDIUM, 7, .before_battle_text, .battle_won_text

	ctxt "Tell me your"
	line "power source!"
	done

.before_battle_text
	ctxt "The power of all"
	line "those you defeated"
	cont "comes from me!"
	done

.battle_won_text
	ctxt "Far too strong!"
	done

SaffronGymSabrina:
	opentext
	checkflag ENGINE_MARSHBADGE
	sif true
		jumptextfaceplayer .already_battled_text
	faceplayer
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	faceplayer
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	writetext .before_giving_TM_text
	givetm TM_SAFEGUARD + RECEIVED_TM
	setflag ENGINE_MARSHBADGE
	jumptext .after_giving_TM_text

.already_battled_text
	ctxt "Your love for"
	line "your #mon"
	para "overwhelmed my"
	line "psychic power."

	para "The power of love"
	line "may also be a"
	para "kind of psychic"
	line "power."
	done

.before_battle_text
	ctxt "I knew you were"
	line "coming."

	para "I had a vision of"
	line "your arrival"
	para "several years"
	line "ago."

	para "It's my duty as a"
	line "Gym Leader to"
	para "provide badges"
	line "to anyone who"
	para "has proven him"
	line "or herself"
	cont "worthy."

	para "Since you want to"
	line "battle, I will"
	para "show you the"
	line "extent of my"
	cont "psychic abilities."
	sdone

.battle_won_text
	ctxt "I was unable to"
	line "foresee this"
	cont "amount of power."

	para "You earned the"
	line "Marsh Badge."
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Marsh Badge."
	done

.before_giving_TM_text
	ctxt "Please take this"
	line "gift as well."
	sdone

.after_giving_TM_text
	ctxt "This TM is"
	line "Safeguard."

	para "This move prevents"
	line "your party from"
	para "being affected by"
	line "common status"
	para "conditions for"
	line "five turns."
	done

SaffronGym_MapEventHeader ;filler
	db 0, 0

;warps
	db 32
	warp_def $5, $1, 2, SAFFRON_GYM
	warp_def $b, $1, 3, SAFFRON_GYM
	warp_def $11, $5, 4, SAFFRON_GYM
	warp_def $f, $b, 5, SAFFRON_GYM ;A
	warp_def $5, $9, 6, SAFFRON_GYM
	warp_def $5, $13, 7, SAFFRON_GYM
	warp_def $9, $1, 8, SAFFRON_GYM
	warp_def $b, $f, 9, SAFFRON_GYM
	warp_def $3, $f, 10, SAFFRON_GYM
	warp_def $f, $5, 11, SAFFRON_GYM
	warp_def $3, $9, 12, SAFFRON_GYM
	warp_def $5, $b, 13, SAFFRON_GYM
	warp_def $b, $5, 14, SAFFRON_GYM
	warp_def $11, $f, 15, SAFFRON_GYM
	warp_def $11, $13, 16, SAFFRON_GYM
	warp_def $3, $13, 17, SAFFRON_GYM
	warp_def $5, $f, 18, SAFFRON_GYM
	warp_def $f, $13, 19, SAFFRON_GYM
	warp_def $9, $b, 4, SAFFRON_GYM ;to A

	warp_def $3, $1, 21, SAFFRON_GYM ;B
	warp_def $9, $f, 22, SAFFRON_GYM
	warp_def $9, $5, 23, SAFFRON_GYM
	warp_def $11, $1, 20, SAFFRON_GYM ;to B

	warp_def $3, $b, 25, SAFFRON_GYM ;C
	warp_def $9, $13, 26, SAFFRON_GYM
	warp_def $b, $13, 24, SAFFRON_GYM ;to C

	warp_def $5, $5, 28, SAFFRON_GYM
	warp_def $f, $f, 29, SAFFRON_GYM
	warp_def $3, $5, 30, SAFFRON_GYM
	warp_def $f, $1, 31, SAFFRON_GYM ;to D

	warp_def $11, $8, 2, SAFFRON_CITY ;D
	warp_def $11, $9, 2, SAFFRON_CITY

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 15, 8, SIGNPOST_TEXT, SaffronGymSign

	;people-events
	db 5
	person_event SPRITE_YOUNGSTER, 4, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_1, -1
	person_event SPRITE_GRANNY, 10, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_2, -1
	person_event SPRITE_GRANNY, 10, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_3, -1
	person_event SPRITE_SABRINA, 8, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronGymSabrina, -1
	person_event SPRITE_GYM_GUY, 14, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGymGuide, -1
