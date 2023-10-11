AzaleaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AzaleaGymSign:
	ctxt "Azalea Town"
	line "#mon Gym"

	para "Leader: Bugsy"
	done

AzaleaGym_Trainer_1:
	trainer EVENT_AZALEA_GYM_TRAINER_1, LASS, 4, .before_battle_text, AzaleaGym_OhMyGoodnessText

	ctxt "You really built a"
	line "strong team."

	para "I admire that."
	done

.before_battle_text
	ctxt "There's no way we're"
	line "letting you battle"
	cont "the leader!"
	done

AzaleaGym_Trainer_2:
	trainer EVENT_AZALEA_GYM_TRAINER_2, BUG_CATCHER, 8, .before_battle_text, .battle_won_text

	ctxt "I guess I'd better"
	line "train a bit more!"
	done

.before_battle_text
	ctxt "Bug #mon evolve"
	line "young."

	para "So they get"
	line "stronger faster."
	done

.battle_won_text
	ctxt "However, just"
	line "evolving isn't"
	cont "enough!"
	done

AzaleaGym_Trainer_3:
	trainer EVENT_AZALEA_GYM_TRAINER_3, BUG_CATCHER, 7, .before_battle_text, .battle_won_text

	ctxt "I met a cool girl"
	line "who loves bug"
	cont "#mon."
	done

.before_battle_text
	ctxt "Bug #mon are"
	line "rad!"

	para "Here's the proof"
	line "coming at ya!"
	done

.battle_won_text
	ctxt "Well, you're tough,"
	line "that's for sure."
	done

AzaleaGym_Trainer_4:
	trainer EVENT_AZALEA_GYM_TRAINER_4, LASS, 5, .before_battle_text, AzaleaGym_OhMyGoodnessText

	ctxt "I'm ashamed of my"
	line "loss."
	done

.before_battle_text
	ctxt "Wait!"

	para "Don't rush to"
	line "Bugsy, battle us"
	cont "first!"
	done

AzaleaGym_Trainer_5:
	trainer EVENT_AZALEA_GYM_TRAINER_5, BUG_CATCHER, 9, .before_battle_text, .battle_won_text

	ctxt "All we can do is"
	line "grow and get"
	cont "better as a team."
	done

.before_battle_text
	ctxt "I grew up with my"
	line "#mon."

	para "I couldn't imagine"
	line "it any other way."
	done

.battle_won_text
	ctxt "Urrgggh!"
	done

AzaleaGymBugsy:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	sif true
		jumptext .after_battle_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer BUGSY, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_HIVEBADGE
	playmusic MUSIC_JOHTO_GYM
	writetext .before_giving_TM_text
	givetm TM_MEGAHORN + RECEIVED_TM
	jumptext .after_giving_TM_text

.before_battle_text
	ctxt "I'm Bugsy."

	para "I never lose when"
	line "it comes to bug"
	cont "#mon!"

	para "You can consider"
	line "me the authority"
	cont "on bug #mon!"

	para "I've learned a"
	line "lot over the"
	para "years - let me"
	line "show you."
	sdone

.battle_won_text
	ctxt "You are amazing!"

	para "There will always"
	line "be something new"
	para "to learn about"
	line "bug #mon!"

	para "Please take the"
	line "Hive Badge!"
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Hive Badge."
	done

.before_giving_TM_text
	ctxt "Please take this"
	line "gift as well;"
	cont "you deserve it."
	sdone

.after_giving_TM_text
	ctxt "This bug TM works"
	line "for all #mon"
	cont "with horns."

	para "That way, even"
	line "more #mon can"
	para "harness the"
	line "power of bugs!"
	done

.after_battle_text
	ctxt "Bug #mon are"
	line "deep."

	para "There's an"
	line "endless amount"

	para "of mysteries to"
	line "be explored."
	done

AzaleaGymGuide:
	ctxt "Yo, challenger!"

	para "Bugsy's knowledge"
	line "of insect #mon"
	cont "is enormous!"

	para "Try taking them"
	line "down with fire and"
	cont "flying #mon!"
	done

AzaleaGym_OhMyGoodnessText:
	; this is used by more than one trainer
	ctxt "Oh my goodness<...>"
	done

AzaleaGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $4, 4, AZALEA_TOWN
	warp_def $f, $5, 4, AZALEA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 13, 3, SIGNPOST_TEXT, AzaleaGymSign
	signpost 13, 6, SIGNPOST_TEXT, AzaleaGymSign

.ObjectEvents
	db 7
	person_event SPRITE_LASS, 10, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_1, -1
	person_event SPRITE_BUG_CATCHER, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_2, -1
	person_event SPRITE_BUG_CATCHER, 2, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_3, -1
	person_event SPRITE_LASS, 10, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_4, -1
	person_event SPRITE_BUG_CATCHER, 8, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, AzaleaGym_Trainer_5, -1
	person_event SPRITE_BUGSY, 7, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AzaleaGymBugsy, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, AzaleaGymGuide, -1
