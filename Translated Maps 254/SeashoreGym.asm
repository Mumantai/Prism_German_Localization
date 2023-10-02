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
	ctxt "He!"
	para "Das ist Sheryl's "
	line "Arena."
	para "Lass dich nicht"
	line "von ihren Tricks"
	para "täuschen, du bist"
	line "in der Arena!"
	para "Sie benutzt Psycho"
	line "#mon, also sei "
	cont "vorsichtig."
	done

SeashoreGym_Trainer_1:
	trainer EVENT_SEASHORE_GYM_TRAINER_1, MEDIUM, 4, .before_battle_text, .battle_won_text
	ctxt "Wirk einmal einen "
	line "Zauber!"
	done

.before_battle_text
	ctxt "Psst<...>"
	para "Sei ruhig,"
	line "Kindchen<...>"
	done

.battle_won_text
	ctxt "Stark<...>"
	line "Viel zu stark<...>"
	done

SeashoreGym_Trainer_2:
	trainer EVENT_SEASHORE_GYM_TRAINER_2, PSYCHIC_T, 5, .before_battle_text, .battle_won_text
	ctxt "Stress schwächt "
	line "Menschen."
	done

.before_battle_text
	ctxt "Komm mal klar, "
	line "Kollege!"
	done

.battle_won_text
	ctxt "Vielleicht sollte ich<...>!"
	done

SeashoreGym_Trainer_3:
	trainer EVENT_SEASHORE_GYM_TRAINER_3, MEDIUM, 5, .before_battle_text, .battle_won_text
	ctxt "Lass mich bitte in"
	line "Ruhe!"
	done

.before_battle_text
	ctxt "Dämonen, hinfort!"
	done

.battle_won_text
	ctxt "Die Dämonen haben "
	line "gewonnen!"
	done

SeashoreGym_Trainer_4:
	trainer EVENT_SEASHORE_GYM_TRAINER_4, PSYCHIC_T, 4, .before_battle_text, .battle_won_text
	ctxt "Was?"
	para "Warum hat das"
	line "nicht geklappt?"
	done

.before_battle_text
	ctxt "Also gut, legen"
	line "wir einen Zahn zu!"
	done

.battle_won_text
	ctxt "Ich hatte keine"
	line "Chance<...>"
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
	ctxt "Sheryl: Wieder"
	line "einmal ein"
	para "weiterer Trainer,"
	line "der mein Psi-Orden"
	cont "begehrt."
	para "Ich habe das"
	line "Gefühl, dass du"
	para "das Herz und die"
	line "Seele eines"
	cont "Trainers hast."
	para "Eine Seele wie die"
	line "von Brown, gegen"
	para "die ich vor vielen"
	line "Jahren gekämpft"
	para "habe<...> Das wird in"
	line "der Tat Spaß"
	cont "machen<...> "
	sdone

.battle_won_text
	ctxt "Sheryl: Genau wie"
	line "ich dachte!"
	para "Danke für den"
	line "Kampf; nur zu,"
	para "nimm den "
	line "Psi-Orden!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält den"
	line "Psi Orden."
	done

.after_badge_text
	ctxt "Sheryl: Ich habe"
	line "das Gefühl, dass"
	para "Deine Jagt auf"
	line "Orden niemals"
	cont "enden wird."
	para "Ich möchte Dich"
	line "bei deinem"
	para "Abenteuer "
	line "unterstützen."
	cont "Gib niemals auf!"
	done

.already_battled_text
	ctxt "Niemals aufgeben!"
	para "Beweis der Welt,"
	line "wie gut du bist!"
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