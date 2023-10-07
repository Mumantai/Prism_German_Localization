OwsauriGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OwsauriGymSign:
	ctxt "Owsauri Gym"
	line "Leader: Lily"
	done

OwsauriGymGuide:
	ctxt "Cold enough for"
	line "ya?"

	para "Lily loves her ice"
	line "#mon, so if you"
	para "bring something"
	line "hot, her team will"
	cont "melt away!"
	done

OwsauriGym_Trainer_1:
	trainer EVENT_OWSAURI_GYM_TRAINER_1, BOARDER, 6, .before_battle_text, .battle_won_text

	ctxt "Even with two"
	line "layers of coats,"
	para "I'm still getting"
	line "chills."

	para "I guess the"
	line "#mon like it."
	done

.before_battle_text
	ctxt "Hang on, what's the"
	line "rush?"

	para "Chill out and"
	line "battle, will ya?"
	done

.battle_won_text
	ctxt "Maybe that was too"
	line "cold."
	done

OwsauriGym_Trainer_2:
	trainer EVENT_OWSAURI_GYM_TRAINER_2, BOARDER, 4, .before_battle_text, .battle_won_text

	ctxt "I also caught"
	line "these #mon over"
	cont "there!"
	done

.before_battle_text
	ctxt "The slopes on top"
	line "of Clathrite are"
	cont "so gnarly, dude!"
	done

.battle_won_text
	ctxt "Whooooaaaaa!"
	done

OwsauriGym_Trainer_3:
	trainer EVENT_OWSAURI_GYM_TRAINER_3, BOARDER, 5, .before_battle_text, .battle_won_text

	ctxt "Did'ya know that"
	line "Lily used to be a"
	para "DJ way off in"
	line "Lavender?"
	done

.before_battle_text
	ctxt "Lily's so hot; I'm"
	line "gonna win her"
	cont "heart!"
	done

.battle_won_text
	ctxt "She likes good"
	line "Trainers, so I'll"
	cont "keep at it!"
	done

OwsauriGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_HAILBADGE
	sif true
		jumptext .already_battled_text
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer LILY, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_JOHTO_GYM
	writetext .before_giving_TM_text
	givetm TM_FREEZE_BURN + RECEIVED_TM
	setflag ENGINE_HAILBADGE
	jumptext .after_giving_TM_text

.already_battled_text
	ctxt "Maybe when the"
	line "Goldenrod Tower is"
	para "repaired, I could"
	line "start DJing there?"

	para "I love living"
	line "here, and"
	para "Goldenrod's a lot"
	line "closer than"
	cont "Lavender is."
	done

.introduction_text
	ctxt "Hi! You're here to"
	line "face me?"

	para "Great!"

	para "I've always loved"
	line "ice #mon, as"
	para "well as the winter"
	line "months!"

	para "I moved here from"
	line "Kanto when this"
	para "Gym needed a"
	line "leader!"

	para "Here's my team,"
	line "comin' at ya!"
	sdone

.battle_won_text
	ctxt "I'm sad, but glad"
	line "at the same time."

	para "Thanks to our"
	line "battle, I now know"
	para "how I can improve"
	line "as a Gym Leader!"

	para "Here is my badge!"
	done

.got_badge_text
	ctxt "<PLAYER> received"
	line "Hail Badge."
	done

.before_giving_TM_text
	ctxt "You should take"
	line "this special TM"
	cont "too."
	sdone

.after_giving_TM_text
	ctxt "This is a special"
	line "move called Freeze"
	cont "Burn!"

	para "It's an ice move"
	line "that has a chance"
	para "to either freeze"
	line "or burn!"
	done

OwsauriGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $13, $4, 4, OWSAURI_CITY
	warp_def $13, $5, 4, OWSAURI_CITY

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 17, 2, SIGNPOST_TEXT, OwsauriGymSign
	signpost 17, 7, SIGNPOST_TEXT, OwsauriGymSign

	;people-events
	db 5
	person_event SPRITE_LILY, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OwsauriGymLeader, -1
	person_event SPRITE_BOARDER, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OwsauriGym_Trainer_1, -1
	person_event SPRITE_BOARDER, 8, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, OwsauriGym_Trainer_2, -1
	person_event SPRITE_BOARDER, 7, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OwsauriGym_Trainer_3, -1
	person_event SPRITE_GYM_GUY, 17, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OwsauriGymGuide, -1
