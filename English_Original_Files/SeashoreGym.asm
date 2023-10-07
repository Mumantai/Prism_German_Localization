SeashoreGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SeashoreGymHiddenItem_1:
	dw EVENT_SEASHORE_GYM_HIDDENITEM_PRISM_KEY
	db PRISM_KEY

SeashoreGymHiddenItem_2:
	dw EVENT_SEASHORE_GYM_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

SeashoreGymGuide:
	ctxt "Heya!"

	para "This is Sheryl's"
	line "Gym."

	para "Don't be fooled by"
	line "her mind tricks."
	cont "You're in the Gym!"

	para "She uses psychic"
	line "#mon, so"
	para "approach with"
	line "caution."
	done

SeashoreGym_Trainer_1:
	trainer EVENT_SEASHORE_GYM_TRAINER_1, MEDIUM, 4, .before_battle_text, .battle_won_text

	ctxt "Set a spell for"
	line "once!"
	done

.before_battle_text
	ctxt "Shh<...>"
	line "Quiet down, child<...>"
	done

.battle_won_text
	ctxt "Strong<...>"
	line "Far too strong<...>"
	done

SeashoreGym_Trainer_2:
	trainer EVENT_SEASHORE_GYM_TRAINER_2, PSYCHIC_T, 5, .before_battle_text, .battle_won_text

	ctxt "Stress only makes"
	line "us humans weaker."
	done

.before_battle_text
	ctxt "You need to clear"
	line "your mind, dude!"
	done

.battle_won_text
	ctxt "Maybe I should<...>!"
	done

SeashoreGym_Trainer_3:
	trainer EVENT_SEASHORE_GYM_TRAINER_3, MEDIUM, 5, .before_battle_text, .battle_won_text

	ctxt "Please, let me be!"
	done

.before_battle_text
	ctxt "Demons, begone!"
	done

.battle_won_text
	ctxt "The demons won!"
	done

SeashoreGym_Trainer_4:
	trainer EVENT_SEASHORE_GYM_TRAINER_4, PSYCHIC_T, 4, .before_battle_text, .battle_won_text

	ctxt "Huh, why didn't"
	line "that work?"
	done

.before_battle_text
	ctxt "Alright, let's kick"
	line "it up a notch!"
	done

.battle_won_text
	ctxt "I was no match<...>"
	done

SeashoreGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_PSIBADGE
	sif true
		jumptext .already_battled_text
	writetext .before_battle_text
	closetext
	winlosstext .battle_won_text, 0
	loadtrainer SHERYL, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_JOHTO_GYM
	setflag ENGINE_PSIBADGE
	jumptext .after_badge_text

.before_battle_text
	ctxt "Sheryl: Once"
	line "again, another"
	para "Trainer seeking my"
	line "Psi Badge."

	para "I feel that you"
	line "have the heart and"
	cont "soul of a Trainer."

	para "A soul like"
	line "Brown's, the one I"
	para "fought many years"
	line "ago<...>"

	para "This will be fun,"
	line "indeed<...>"
	sdone

.battle_won_text
	ctxt "Sheryl: Just as I"
	line "thought!"

	para "Thank you for the"
	line "battle; go ahead"
	para "and take my Psi"
	line "Badge!"
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Psi Badge."
	done

.after_badge_text
	ctxt "Sheryl: I have a"
	line "feeling your badge"
	para "scavenger hunt"
	line "will never end."

	para "I will support"
	line "your quest. Never"
	cont "give up!"
	done

.already_battled_text
	ctxt "Never give up!"
	line "Show the world how"
	cont "well you train!"
	done

SeashoreGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $d, $20, 5, SEASHORE_CITY
	warp_def $19, $17, 3, SEASHORE_GYM
	warp_def $f, $19, 2, SEASHORE_GYM

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 14, 29, SIGNPOST_ITEM, SeashoreGymHiddenItem_1
	signpost 17, 21, SIGNPOST_ITEM, SeashoreGymHiddenItem_2

	;people-events
	db 6
	person_event SPRITE_SHERYL, 6, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SeashoreGymLeader, -1
	person_event SPRITE_GRANNY, 19, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, SeashoreGym_Trainer_1, -1
	person_event SPRITE_PSYCHIC, 5, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SeashoreGym_Trainer_2, -1
	person_event SPRITE_GRANNY, 20, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, SeashoreGym_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 24, 32, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, SeashoreGym_Trainer_4, -1
	person_event SPRITE_GYM_GUY, 14, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SeashoreGymGuide, -1
