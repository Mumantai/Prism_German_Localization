SaffronGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronGymSign:
	ctxt "Saffron Gym"

	para "Leader: Sabrina"
	done

SaffronGymGuide:
	ctxt "Hey, challenger!"

	para "Sabrina is the"
	line "strongest Gym"
	cont "Leader in Kanto!"

	para "She has declined"
	line "many invitations"
	cont "to the Elite Four."

	para "Some even say her"
	line "psychic powers are"
	para "a match for the"
	line "League Champion!"

	para "Don't let your"
	line "guard down, even"
	cont "for an instant!"
	done

SaffronGym_Trainer_1:
	trainer EVENT_SAFFRON_GYM_TRAINER_1, PSYCHIC_T, 6, .before_battle_text, .battle_won_text

	ctxt "This Gym's warp"
	line "system was changed"
	cont "recently."

	para "You'll need a"
	line "resolute soul to"
	cont "reach Sabrina!"
	done

.before_battle_text
	ctxt "Will your soul"
	line "guide you through"
	cont "this maze?"
	done

.battle_won_text
	ctxt "Such a strong"
	line "soul!"
	done

SaffronGym_Trainer_2:
	trainer EVENT_SAFFRON_GYM_TRAINER_2, MEDIUM, 6, .before_battle_text, .battle_won_text

	ctxt "You have quite a"
	line "long path behind"
	cont "you, young one."

	para "Will your ascent"
	line "ever reach its"
	cont "peak?"
	done

.before_battle_text
	ctxt "The power of all"
	line "those you have"
	para "defeated is chan-"
	line "neling through me!"
	done

.battle_won_text
	ctxt "Too much!"
	line "Far too much!"
	done

SaffronGym_Trainer_3:
	trainer EVENT_SAFFRON_GYM_TRAINER_3, MEDIUM, 7, .before_battle_text, .battle_won_text

	ctxt "When Sabrina first"
	line "became Gym Leader,"
	para "she was quite the"
	line "ice queen!"

	para "Regardless, her"
	line "peer from Celadon"
	para "City, Erika,"
	line "became fast"
	cont "friends with her."

	para "I suspect Erika's"
	line "compassionate"
	para "nature rubbed off"
	line "on her over the"
	cont "years."

	para "Perhaps that is"
	line "the reason she"
	para "refuses to leave"
	line "Saffron City<...>"
	cont "Fufufufu<...>"
	done

.before_battle_text
	ctxt "Fufufufu<...> I can"
	line "read what lies"
	cont "within your soul<...>"
	done

.battle_won_text
	ctxt "Such fortitude!"
	done

SaffronGym_Trainer_4:
	trainer EVENT_SAFFRON_GYM_TRAINER_4, PSYCHIC_T, 7, .before_battle_text, .battle_won_text

	ctxt "Koichi was Saffron"
	line "City's Gym Leader"
	para "before losing the"
	line "title to Sabrina"
	cont "over a decade ago."

	para "After declining"
	line "many invites to"
	para "the Elite Four,"
	line "Sabrina told the"
	para "League officials"
	line "to opt for Koichi"
	cont "instead of her."

	para "He later received"
	line "an invitation,"
	para "which he accepted"
	line "on the spot, none"
	para "the wiser as to"
	line "why he was"
	cont "selected."
	done

.before_battle_text
	ctxt "Do you know about"
	line "Koichi, the"
	cont "Karate Master?"
	done

.battle_won_text
	ctxt "A crushing defeat<...>"
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
	ctxt "In spite of"
	line "myself, I am"
	para "renowned as one of"
	line "Kanto's best."

	para "You may have to"
	line "seek challenge"
	cont "elsewhere."

	para "The love you share"
	line "with your #mon"
	para "overwhelmed my"
	line "psychic power."

	para "The power of love<...>"
	line "Perhaps it is the"
	para "strongest kind of"
	line "psychic power<...>"
	done

.before_battle_text
	ctxt "You<...> I was expec-"
	line "ting your arrival."

	para "I foresaw it years"
	line "ago."

	para "As a Gym Leader,"
	line "my duty is to"
	para "drive challengers"
	line "to prove their"
	cont "worth."

	para "I know how far you"
	line "have come."

	para "Since you wish it,"
	line "I will show you"
	para "the full extent of"
	line "my psychic"
	cont "abilities!"
	sdone

.battle_won_text
	ctxt "I was aware of"
	line "this power."

	para "This battle was as"
	line "much a test for me"
	cont "as it was for you."

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

	para "This move will"
	line "protect your team"
	para "from common status"
	line "conditions for"
	cont "five turns."
	done

SaffronGym_MapEventHeader:
	;filler
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
	db 6
	person_event SPRITE_PSYCHIC, 4, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_1, -1
	person_event SPRITE_GRANNY, 10, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_2, -1
	person_event SPRITE_GRANNY, 10, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 16, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_4, -1
	person_event SPRITE_SABRINA, 8, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronGymSabrina, -1
	person_event SPRITE_GYM_GUY, 14, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGymGuide, -1
