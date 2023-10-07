MoragaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaGymSign:
	ctxt "Moraga Town"
	line "#mon Gym"

	para "Leader: Lois"
	done

MoragaGym_Trainer_1:
	trainer EVENT_MORAGA_GYM_TRAINER_1, TEACHER, 1, .before_battle_text, .battle_won_text

	ctxt "Lois has a twin"
	line "sister who's also"
	para "a Gym Leader, but"
	line "she lives in"
	cont "Kanto."

	para "I can't remember"
	line "her name<...> is it"
	cont "Erin?"
	done

.before_battle_text
	ctxt "Did you know Lois"
	line "has a twin?"
	done

.battle_won_text
	ctxt "I only asked a"
	line "question!"
	done

MoragaGym_Trainer_2:
	trainer EVENT_MORAGA_GYM_TRAINER_2, LASS, 8, .before_battle_text, .battle_won_text

	ctxt "I'm really shy"
	line "about newcomers."
	done

.before_battle_text
	ctxt "You're not ready"
	line "for Lois."
	done

.battle_won_text
	ctxt "Perhaps you are."
	done

MoragaGym_Trainer_3:
	trainer EVENT_MORAGA_GYM_TRAINER_3, COOLTRAINERM, 5, .before_battle_text, .battle_won_text

	ctxt "They don't let"
	line "just any guy hang"
	cont "out here."

	para "Only the best is"
	line "allowed to chill."
	done

.before_battle_text
	ctxt "I'm a cool dude"
	line "that loves hanging"
	cont "with the girls!"
	done

.battle_won_text
	ctxt "Josiah, forgive"
	line "me!"
	done

MoragaGym_Trainer_4:
	trainer EVENT_MORAGA_GYM_TRAINER_4, LASS, 7, .before_battle_text, .battle_won_text

	ctxt "I want to be a Gym"
	line "Leader just like"
	cont "her one day!"
	done

.before_battle_text
	ctxt "Lois is so"
	line "inspiring!"
	done

.battle_won_text
	ctxt "Whoops!"
	done

MoragaGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_SPROUTBADGE
	sif true
		jumptext .after_getting_badge_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer LOIS, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_JOHTO_GYM
	writetext .before_TM_text
	givetm TM_GIGA_DRAIN + RECEIVED_TM
	waitbutton
	setflag ENGINE_SPROUTBADGE
	jumptext .after_TM_text

.after_getting_badge_text
	ctxt "Best of luck on"
	line "getting the Rijon"
	cont "badges."
	done

.before_battle_text
	ctxt "Ahhh<...> hello."

	para "I'm just so happy<...>"

	para "My garden smells"
	line "wonderful."

	para "Oh, yes, sorry. I'm"
	line "Lois, the Gym"
	para "leader of this"
	line "place."

	para "I suppose you want"
	line "to battle?"

	para "Wonderful!"
	sdone

.battle_won_text
	ctxt "So much bliss out"
	line "of that battle!"

	para "You have earned"
	line "this badge!"
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Sprout Badge."
	done

.before_TM_text
	ctxt "You've earned this"
	line "TM too."
	sdone

.after_TM_text
	ctxt "TM19 is Giga"
	line "Drain!"

	para "Your #mon will"
	line "recover half of"
	para "the damage it"
	line "deals to its foe."
	done

MoragaGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $4, 4, MORAGA_TOWN
	warp_def $11, $5, 4, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 15, 3, SIGNPOST_TEXT, MoragaGymSign
	signpost 15, 6, SIGNPOST_TEXT, MoragaGymSign

.ObjectEvents
	db 5
	person_event SPRITE_LOIS, 3, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MoragaGymLeader, -1
	person_event SPRITE_TEACHER, 6, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, MoragaGym_Trainer_1, -1
	person_event SPRITE_LASS, 10, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, MoragaGym_Trainer_2, -1
	person_event SPRITE_COOLTRAINER_M, 7, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, MoragaGym_Trainer_3, -1
	person_event SPRITE_LASS, 11, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, MoragaGym_Trainer_4, -1
