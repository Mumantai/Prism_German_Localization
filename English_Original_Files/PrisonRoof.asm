PrisonRoof_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_OBJECTS, .Callback

.Callback
	checkevent EVENT_PRISON_ROOF_TRAINER_2
	sif false
		appear 2
	return

PrisonRoof_Trainer_1:
	trainer EVENT_PRISON_ROOF_TRAINER_1, OFFICER, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptextfaceplayer .after_battle_text

.before_battle_text
	ctxt "What, what, what?"
	done

.battle_won_text
	text "Uh<...>"
	done

.after_battle_text
	ctxt "What happened?"
	done

PrisonRoof_Trainer_2:
	trainer EVENT_PRISON_ROOF_TRAINER_2, OFFICER, 6, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	faceplayer
	showtext .after_battle_text_1
	showtext .after_battle_text_2
	jumptext .after_battle_text_3

.before_battle_text
	ctxt "Dangit, Grady,"
	line "stay focused."

	para "I hate taking care"
	line "of this guy<...>"
	done

.battle_won_text
	ctxt "Wait, aren't you"
	line "an inmate?"
	done

.after_battle_text_1
	ctxt "This is seriously"
	line "one of the worst"
	cont "prisons ever."

	para "These prisoners"
	line "could break out"
	para "at any time if"
	line "they wanted to."

	para "Grady and I dang"
	line "near run the whole"
	para "security in this"
	line "place nowadays."

	para "Isn't that right,"
	line "huh, Grady?"
	sdone

.after_battle_text_2
	ctxt "Grady: Huh?"
	sdone

.after_battle_text_3
	ctxt "Anyway, you're just"
	line "a kid."

	para "They should've sent"
	line "you to juvie."

	para "Go down to the"
	line "workout room and"
	para "ask Paulie for"
	line "the new password"
	cont "to the basement."

	para "It's because of"
	line "his incompetence"
	para "that we gotta"
	line "keep changing the"
	cont "darn password<...>"
	done

PrisonRoof_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $b, $d, 2, PRISON_F2

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 11, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, PrisonRoof_Trainer_1, -1
	person_event SPRITE_OFFICER, 11, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, PrisonRoof_Trainer_2, -1
