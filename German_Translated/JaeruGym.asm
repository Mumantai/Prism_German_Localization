JaeruGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

JaeruGymTrash:
	ctxt "Nichts außer Müll <...>"
	done

JaeruGymStatue:
	ctxt "Jaeru"
	line "#mon Arena"
	para "Leiter: Sparky"
	done

JaeruGymGuide:
	faceplayer
	checkflag ENGINE_SPARKYBADGE
	sif true
		jumptext .after_defeating_gym_text
	jumptext .before_defeating_gym_text

.before_defeating_gym_text
	ctxt "Wie steht's?"

	para "Sparky ist im"
	line "Laufe der Jahre"
	para "erwachsen geworden"
	line "und hat seine"
	para "Arena in ein Büro"
	line "umgewandelt."

	para "Ich bin mir nicht"
	line "sicher, was sein"
	para "eigenes"
	line "Unternehmen macht"
	para "und ich will's"
	line "auch gar nicht"
	cont "wissen."

	done

.after_defeating_gym_text
	ctxt "Puh!"

	para "Das war ein"
	line "elektrisierender"
	cont "Kampf!"

	para "Ich war wirklich"
	line "nervös."

	done

JaeruGym_Trainer_1:
	trainer EVENT_JAERU_GYM_TRAINER_1, GENTLEMAN, 2, .before_battle_text, .battle_won_text

	ctxt "Ich werde besser"
	line "bezahlt als du."
	cont "Hahaha!"

	done

.before_battle_text
	ctxt "Ich mach grad"
	line "Pause."

	para "Geh ruhig weiter,"
	line "Kindchen!"

	done

.battle_won_text
	ctxt "Ich hoffe, diese"
	line "Überstunden werden"
	cont "bezahlt!"

	done

JaeruGym_Trainer_2:
	trainer EVENT_JAERU_GYM_TRAINER_2, COOLTRAINERM, 8, .before_battle_text, .battle_won_text

	ctxt "Der Chef wird"
	line "darüber nicht"
	cont "erfreut sein!"

	done

.before_battle_text
	ctxt "Der Chef"
	line "akzeptiert im"
	para "Moment keine"
	line "Termine."

	cont "Verschwinde!"

	done

.battle_won_text
	text "Na gut!"

	done

JaeruGym_Trainer_3:
	trainer EVENT_JAERU_GYM_TRAINER_3, SUPER_NERD, 8, .before_battle_text, .battle_won_text

	ctxt "Der Kampf mit mir"
	line "ist jetzt "
	cont "optional."

	para "Vorschriften der"
	line "Gemeinde."

	done

.before_battle_text
	ctxt "Du arbeitest hier"
	line "nicht!"

	cont "Zieh Leine!"

	done

.battle_won_text
	ctxt "Viel zu viele"
	line "Überstunden!"

	done

JaeruGymLeader:
	faceplayer
	checkflag ENGINE_SPARKYBADGE
	sif true
		jumptext .already_defeated_text
	showtext .introduction_text
	winlosstext .battle_won_text, 0
	loadtrainer SPARKY, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext .get_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_GYM
	waitsfx
	setflag ENGINE_SPARKYBADGE
	jumptext .after_badge_text

.introduction_text
	ctxt "Sparky: Was willst"
	line "du?"

	para "Ich arbeite an der"
	line "Verlegung meiner"
	cont "Mitarbeiter."

	para "Bitte sag ihnen"
	line "das nicht."

	para "Oh, ein Kampf?"

	line "Von mir aus."

	sdone

.battle_won_text
	ctxt "Gut, hier hast du"
	line "den Funken Orden."
	para "Und jetzt lass"
	line "mich wieder"
	cont "Arbeiten."

	done

.get_badge_text
	ctxt "<PLAYER> erhält den"
	line "Funken Orden!"

	done

.after_badge_text
	ctxt "Dieser Orden ehöht"
	line "die"
	para "Geschwindigkeit"
	line "deiner #mon."

	para "Nutze es, um hier"
	line "schnell zu"
	cont "verschwinden."

	done

.already_defeated_text
	ctxt "Sparky: Was?"

	para "Ich habe zu tun!"

	done

JaeruGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $4, 3, JAERU_CITY
	warp_def $11, $5, 3, JAERU_CITY

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 11, 9, SIGNPOST_TEXT, JaeruGymTrash
	signpost 9, 3, SIGNPOST_TEXT, JaeruGymTrash
	signpost 0, 9, SIGNPOST_TEXT, JaeruGymTrash
	signpost 15, 3, SIGNPOST_TEXT, JaeruGymStatue
	signpost 15, 6, SIGNPOST_TEXT, JaeruGymStatue

.ObjectEvents
	db 5
	person_event SPRITE_SPARKY, 2, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, JaeruGymLeader, -1
	person_event SPRITE_GENTLEMAN, 10, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, JaeruGym_Trainer_1, -1
	person_event SPRITE_COOLTRAINER_M, 7, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, JaeruGym_Trainer_2, -1
	person_event SPRITE_SUPER_NERD, 11, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, JaeruGym_Trainer_3, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, JaeruGymGuide, -1
