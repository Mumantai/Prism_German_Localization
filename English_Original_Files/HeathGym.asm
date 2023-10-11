HeathGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGym_GoldToken:
	dw EVENT_HEATH_GYM_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

HeathGymGuide:
	checkflag ENGINE_NATUREBADGE
	sif false
		jumptextfaceplayer .before_badge_text
	jumptextfaceplayer .after_badge_text

.before_badge_text
	ctxt "Yo, challenger!"

	para "Rinji takes his"
	line "Gym Leader duties"
	cont "very seriously."

	para "He is motivated"
	line "by nature, and"
	cont "the natural world"
	cont "surrounding him."
	done

.after_badge_text
	ctxt "Well done!"

	para "Rinji is a master"
	line "of focus, but you"
	cont "bested him!"
	done

HeathGym_Trainer_1:
	trainer EVENT_HEATH_GYM_TRAINER_1, BEAUTY, 1, .before_battle_text, .battle_won_text

	ctxt "Everything always"
	line "goes perfectly"
	cont "for me in life<...>"

	para "Except this time."
	done

.before_battle_text
	ctxt "Hehe!"

	para "You can't beat my"
	line "Grass #mon!"
	done

.battle_won_text
	ctxt "I'm not used to"
	line "failure!"
	done

HeathGym_Trainer_2:
	trainer EVENT_HEATH_GYM_TRAINER_2, YOUNGSTER, 3, .before_battle_text, .battle_won_text

	ctxt "This stays between"
	line "you and me<...>"

	para "I'm only here for"
	line "the cute girls!"
	done

.before_battle_text
	ctxt "Grass-type #mon"
	line "are so underrated."

	para "Look!"
	done

.battle_won_text
	ctxt "You proved how"
	line "tough you were<...>"
	done

HeathGym_Trainer_3:
	trainer EVENT_HEATH_GYM_TRAINER_3, SCHOOLBOY, 1, .before_battle_text, .battle_won_text

	ctxt "I could learn a"
	line "thing or two!"
	done

.before_battle_text
	ctxt "This school is"
	line "my favorite kind!"
	done

.battle_won_text
	ctxt "Urrgggh!"
	done

HeathGym_Trainer_4:
	trainer EVENT_HEATH_GYM_TRAINER_4, TWINS, 1, .before_battle_text, .battle_won_text

	ctxt "Emy: You are real"
	line "good! Take care."
	done

.before_battle_text
	ctxt "Emy: Hi!"

	para "Want to meet our"
	line "#mon?"
	done

.battle_won_text
	ctxt "Emy & Mary:"
	line "2 against 1<...>"

	para "Fair?"
	done

HeathGym_Trainer_4_OutOfRangeTwin:
	ctxt "Mary: Perhaps we"
	line "should ask Rinji"
	cont "to help us more."
	done

HeathGymLeader:
	faceplayer
	checkflag ENGINE_NATUREBADGE
	sif true
		jumptext .already_defeated_text
	showtext .introduction_text
	winlosstext .battle_won_text, 0
	loadtrainer RINJI, RINJI_GYM
	startbattle
	reloadmapafterbattle
	setflag ENGINE_NATUREBADGE
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	waitbutton
	playmapmusic
	writetext .after_badge_text
	playmusic MUSIC_HEATH_GYM
	buttonsound
	givetm TM_RAZOR_LEAF + RECEIVED_TM
	jumptext .got_TM_text

.introduction_text
	ctxt "I'm Rinji."

	para "I am one with the"
	line "nature, and nature"
	cont "is one with me."

	para "How about you?"

	para "Do you feel the"
	line "nature around you?"

	para "You must learn"
	line "to live with it,"
	cont "not just in it."
	sdone

.battle_won_text
	ctxt "Hmm<...>"

	para "I hope you learned"
	line "to appreciate the"
	cont "world as it is."

	para "Take this badge"
	line "with you."
	done

.got_badge_text
	ctxt "<PLAYER> got"
	line "Nature Badge."
	done

.after_badge_text
	ctxt "Nature Badge will"
	line "make the nature"
	cont "appreciate you up"
	cont "to level 40."

	para "Also, take this."
	done

.got_TM_text
	ctxt "TM57 contains"
	line "Razor Leaf!"

	para "The power of"
	line "nature will aid"
	cont "you with this."

	para "It also has a"
	line "better chance of"
	cont "critical hits!"
	done

.already_defeated_text
	ctxt "This region was"
	line "once all nature,"
	cont "but it's almost"
	cont "all gone now."

	para "Unacceptable!"
	done

HeathGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 3, 9, 1, HEATH_GYM_GATE
	warp_def 15, 35, 1, HEATH_GYM_HOUSE

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 9, 33, SIGNPOST_ITEM, HeathGym_GoldToken

.ObjectEvents
	db 7
	person_event SPRITE_BUGSY, 6, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, HeathGymLeader, -1
	person_event SPRITE_BEAUTY, 24, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, HeathGym_Trainer_1, -1
	person_event SPRITE_YOUNGSTER, 32, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, HeathGym_Trainer_2, -1
	person_event SPRITE_SCHOOLBOY, 20, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, HeathGym_Trainer_3, -1
	person_event SPRITE_TWIN, 16, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, HeathGym_Trainer_4, -1
	person_event SPRITE_TWIN, 16, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 1, HeathGym_Trainer_4_OutOfRangeTwin, -1
	person_event SPRITE_GYM_GUY, 4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, HeathGymGuide, -1
