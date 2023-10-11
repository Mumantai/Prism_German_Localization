SoutherlyGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyGymSign:
	ctxt "Southerly Gym"

	para "Leader: Ernest"
	done

SoutherlyGymFlame:
	ctxt "This flame is"
	line "really hot."

	para "It'd be unwise to"
	line "walk through it."
	done

SoutherlyGymGuide:
	checkflag ENGINE_BLAZEBADGE
	sif false
		jumptextfaceplayer .before_getting_badge_text
	jumptextfaceplayer .after_getting_badge_text

.after_getting_badge_text
	ctxt "You came from"
	line "Naljo, huh?"

	para "Is that region"
	line "really as troubled"
	cont "as everyone says?"
	done

.before_getting_badge_text
	ctxt "Woo, is it hot in"
	line "here, or what?"

	para "If you couldn't"
	line "tell, Ernest uses"
	cont "Fire-type #mon!"

	para "Using Grass or"
	line "Bug-type #mon"
	para "would not work"
	line "well here."
	done

SoutherlyGym_Trainer_1:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_1, HIKER, 12, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_SOUTHERLY_GYM_FLAME_2
	sif false, then
		writetext .before_removing_flame_text
		disappear 4
		setevent EVENT_SOUTHERLY_GYM_FLAME_2
	sendif
	jumptext .removed_flame_text

.before_battle_text
	ctxt "Can you stand the"
	line "heat?"
	done

.battle_won_text
	ctxt "You're tougher"
	line "than you look."
	done

.before_removing_flame_text
	ctxt "Well, here, let me"
	line "create a shortcut"
	cont "for you."
	sdone

.removed_flame_text
	ctxt "That should help"
	line "you get back here"
	cont "easier."
	done

SoutherlyGym_Trainer_2:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_2, FIREBREATHER, 6, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_SOUTHERLY_GYM_FLAME_1
	sif false, then
		writetext .before_removing_flame_text
		disappear 3
		setevent EVENT_SOUTHERLY_GYM_FLAME_1
	sendif
	jumptext .removed_flame_text

.before_battle_text
	ctxt "I'm the strongest"
	line "Gym minion!"

	para "Beat me and I'll"
	line "let you fight"
	cont "Ernest."
	done

.battle_won_text
	ctxt "Down and out!"
	done

.before_removing_flame_text
	ctxt "I'll get rid of the"
	line "fire for you."
	sdone

.removed_flame_text
	ctxt "You won't be able"
	line "to defeat Ernest"
	cont "anyway!"
	done

SoutherlyGym_Trainer_3:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_3, CAMPER, 4, .before_battle_text, .battle_won_text

	ctxt "People in this"
	line "area are more"
	para "friendly than"
	line "where you come"
	cont "from."
	done

.before_battle_text
	ctxt "Are you prepared"
	line "to experience"
	para "third-degree"
	line "burns?"
	done

.battle_won_text
	ctxt "Whoa, no need for"
	line "hostility!"
	done

SoutherlyGym_Trainer_4:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_4, FIREBREATHER, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_SOUTHERLY_GYM_FLAME_3
	sif false, then
		writetext .before_removing_flame_text
		disappear 5
		setevent EVENT_SOUTHERLY_GYM_FLAME_3
	sendif
	jumptext .removed_flame_text

.before_battle_text
	ctxt "I'll help you get"
	line "to the leader if"
	cont "you beat me."
	done

.battle_won_text
	ctxt "That was a hot"
	line "battle!"
	done

.before_removing_flame_text
	ctxt "I'll douse the"
	line "nearby fire."
	sdone

.removed_flame_text
	ctxt "Good luck with the"
	line "rest of your"
	cont "battles!"
	done

SoutherlyGymLeader:
	faceplayer
	checkflag ENGINE_BLAZEBADGE
	sif true
		jumptext .already_defeated_text
	showtext .introduction_text
	winlosstext .battle_won_text, 0
	loadtrainer ERNEST, ERNEST_GYM
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_JOHTO_GYM
	writetext .have_a_TM_text
	givetm TM_FIRE_BLAST + RECEIVED_TM
	setflag ENGINE_BLAZEBADGE
	jumptext .after_TM_text

.already_defeated_text
	ctxt "If you're looking"
	line "for more of a"
	para "challenge, the"
	line "airport might be"
	para "able to take you"
	line "to a place with"
	cont "stronger Trainers."

	para "You'll need a"
	line "special ticket to"
	cont "get there, though."

	para "That area is so"
	line "exclusive, that"
	para "even I don't know"
	line "where it is."
	done

.introduction_text
	ctxt "Hello, youngster!"

	para "I think I've heard"
	line "of you before."

	para "Lance is your"
	line "father, right?"

	para "Well, I'm the Gym"
	line "Leader around"
	cont "these parts."

	para "If you defeat me,"
	line "I'll hand over the"
	cont "Blaze Badge."

	para "Let's do this!"
	sdone

.battle_won_text
	ctxt "The fire in my"
	line "#mon's fighting"
	para "spirit has been"
	line "reduced to mere"
	cont "embers."

	para "You are truly"
	line "worthy of this"
	cont "badge!"
	done

.got_badge_text
	ctxt "Obtained the Blaze"
	line "Badge!"
	done

.have_a_TM_text
	ctxt "Here's a bonus TM"
	line "for you!"
	sdone

.after_TM_text
	ctxt "TM38 contains Fire"
	line "Blast!"

	para "It's a burning hot"
	line "fire move that has"
	para "a chance to burn"
	line "the opponent."

	para "It's immensely"
	line "strong, just like"
	para "you and your"
	line "father are."
	done

SoutherlyGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def 19, 8, 5, SOUTHERLY_CITY
	warp_def 19, 9, 5, SOUTHERLY_CITY

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 17, 11, SIGNPOST_TEXT, SoutherlyGymSign
	signpost 17, 6, SIGNPOST_TEXT, SoutherlyGymSign

	;people-events
	db 10
	person_event SPRITE_P0, -3, -3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, FIRE_RING, EVENT_SOUTHERLY_GYM_ITEM_FIRE_RING
	person_event SPRITE_FIRE, 3, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SoutherlyGymFlame, EVENT_SOUTHERLY_GYM_FLAME_1
	person_event SPRITE_FIRE, 12, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SoutherlyGymFlame, EVENT_SOUTHERLY_GYM_FLAME_2
	person_event SPRITE_FIRE, 8, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SoutherlyGymFlame, EVENT_SOUTHERLY_GYM_FLAME_3
	person_event SPRITE_GYM_GUY, 17, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SoutherlyGymGuide, -1
	person_event SPRITE_FISHER, 13, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, SoutherlyGym_Trainer_1, -1
	person_event SPRITE_FISHER, 0, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, SoutherlyGym_Trainer_2, -1
	person_event SPRITE_YOUNGSTER, 6, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SoutherlyGym_Trainer_3, -1
	person_event SPRITE_FISHER, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, SoutherlyGym_Trainer_4, -1
	person_event SPRITE_COOLTRAINER_M, 0, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SoutherlyGymLeader, -1
