MoragaGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MoragaGymSign:
	ctxt "Moragadorf"
	next "#mon-Arena"
	next "Leiterin: Lois"
	done

MoragaGym_Trainer_1:
	trainer EVENT_MORAGA_GYM_TRAINER_1, TEACHER, 1, .before_battle_text, .battle_won_text

	ctxt "Lois hat eine"
	line "Zwillingsschwester"
	para "die auch Arena-"
	line "Leiterin ist, aber"
	cont "sie lebt in Kanto."

	para "Ich kann mich"
	line "nicht an ihren"
	para "Namen erinnern <...>"
	line "War es Erin?"

	done

.before_battle_text
	ctxt "Wusstest du, dass"
	line "Lois einen"
	cont "Zwilling hat?"

	done

.battle_won_text
	ctxt "Ich habe nur eine"
	line "Frage gestellt!"

	done

MoragaGym_Trainer_2:
	trainer EVENT_MORAGA_GYM_TRAINER_2, LASS, 8, .before_battle_text, .battle_won_text

	ctxt "Ich bin wirklich"
	line "schüchtern"
	para "gegenüber"
	line "Neulingen."

	done

.before_battle_text
	ctxt "Für Lois bist du"
	line "nicht bereit <...>"
	done

.battle_won_text
	ctxt "Oder vielleicht"
	line "doch?"

	done

MoragaGym_Trainer_3:
	trainer EVENT_MORAGA_GYM_TRAINER_3, COOLTRAINERM, 7, .before_battle_text, .battle_won_text

	ctxt "Die lassen hier"
	line "nicht jeden rein."

	para "Nur die Besten"
	line "dürfen sich hier"
	cont "aufhalten."

	done

.before_battle_text
	ctxt "Ich bin ein cooler"
	line "Typ, der es liebt,"
	para "mit den Mädels"
	line "abzuhängen!"

	done

.battle_won_text
	ctxt "Josiah, verzeih"
	line "mir!"

	done

MoragaGym_Trainer_4:
	trainer EVENT_MORAGA_GYM_TRAINER_4, LASS, 7, .before_battle_text, .battle_won_text

	ctxt "Ich möchte"
	line "irgenwann auch"
	para "Arena-Leiter"
	line "werden!"

	cont "Genau wie sie!"

	done

.before_battle_text
	ctxt "Lois ist so"
	line "inspirierend!"

	done

.battle_won_text
	ctxt "Huch!"

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
	playmusic MUSIC_GYM
	writetext .before_TM_text
	givetm TM_GIGA_DRAIN + RECEIVED_TM
	waitbutton
	setflag ENGINE_SPROUTBADGE
	jumptext .after_TM_text

.after_getting_badge_text
	ctxt "Viel Glück beim"
	line "Sammeln der"
	cont "Rijon-Orden."

	done

.before_battle_text
	ctxt "Ahhh <...> Hallo."

	para "Ich bin einfach so"
	line "glücklich <...> Mein"
	para "Garten duftet"
	line "wunderbar."

	cont "Oh, ja, sorry."

	para "Ich bin Lois, die"
	line "Leiterin der Arena"
	cont "hier."

	para "Ich nehme an, du"
	line "möchtest kämpfen?"

	para "Wunderbar!"

	sdone

.battle_won_text
	ctxt "Der Kampf war"
	line "entzückend!"

	para "Diesen Orden hast"
	line "du dir wirklich"
	cont "verdient!"

	done

.received_badge_text
	ctxt "<PLAYER> erhält den"
	line "Sprossen-Orden."

	done

.before_TM_text
	ctxt "Ich möchte dir"
	line "noch diese TM"
	cont "geben."

	sdone

.after_TM_text
	ctxt "Dein #mon heilt"
	line "sich für die"
	para "Hälfte des"
	line "verursachten"
	para "Schadens an einem"
	line "Gegner."

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
