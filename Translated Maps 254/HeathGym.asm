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
	ctxt "Herausforderer!"
	para "Rinji nimmt sein"
	line "Amt als Arena-"
	cont "leiter sehr ernst."
	para "Er ist von Natur"
	line "aus sehr motiviert"
	para "und wird durch die"
	line "natürliche Umge-"
	cont "bung nur stärker!"
	done

.after_badge_text
	ctxt "Gut gemacht!"
	para "Rinji ist der"
	line "Meister des Fokus,"
	cont "doch du hast ihn"
	cont "geschlagen!"
	done

HeathGym_Trainer_1:
	trainer EVENT_HEATH_GYM_TRAINER_1, BEAUTY, 1, .before_battle_text, .battle_won_text
	ctxt "Mein Leben lief"
	line "eigentlich super <...>"
	para "Zumindest bis"
	line "gerade eben <...>"
	done

.before_battle_text
	ctxt "Hehe!"
	para "Pflanzen-#mon"
	line "sind unschlagbar!"
	done

.battle_won_text
	ctxt "Ich bin Verlieren"
	line "nicht gewohnt!"
	done

HeathGym_Trainer_2:
	trainer EVENT_HEATH_GYM_TRAINER_2, YOUNGSTER, 3, .before_battle_text, .battle_won_text
	ctxt "Das bleibt jetzt"
	line "aber unter uns <...>"
	para "Ich bin nur wegen"
	line "der Mädchen hier!"
	done

.before_battle_text
	ctxt "Pflanzen-#mon"
	line "sind unterschätzt."
	para "Ich beweise es"
	line "dir!"
	done

.battle_won_text
	ctxt "Du hast deine"
	line "Stärke bewiesen <...>"
	done

HeathGym_Trainer_3:
	trainer EVENT_HEATH_GYM_TRAINER_3, SCHOOLBOY, 1, .before_battle_text, .battle_won_text
	ctxt "Ich muss noch"
	line "viel lernen!"
	done

.before_battle_text
	ctxt "So eine Schule"
	line "liebe ich!"
	done

.battle_won_text
	ctxt "Urrgggh!"
	done

HeathGym_Trainer_4:
	trainer EVENT_HEATH_GYM_TRAINER_4, TWINS, 1, .before_battle_text, .battle_won_text
	ctxt "Amy: Du bist sehr"
	line "gut! Gib Acht."
	done

.before_battle_text
	ctxt "Amy: Hi!"
	para "Willst du unsere"
	line "#mon sehen?"
	done

.battle_won_text
	ctxt "Amy & May:"
	line "Zwei gegen einen <...>"
	para "Klingt das fair?"
	done

HeathGym_Trainer_4_OutOfRangeTwin:
	ctxt "May: Wir sollten"
	line "Rinji um Hilfe"
	cont "bitten."
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
	ctxt "Ich bin Rinji."
	para "Ich bin eins mit"
	line "der Natur <...>"
	para "Und du?"
	para "Fühlst du die"
	line "Natur um dich"
	cont "herum?"
	para "Du musst lernen,"
	line "mit ihr zu leben,"
	cont "nicht nur in ihr."
	sdone

.battle_won_text
	ctxt "Hmm <...>"
	para "Ich hoffe, du hast"
	line "gelernt, die Welt"
	cont "zu lieben."
	para "Nimm diesen Orden"
	line "an dich."
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "den Naturorden."
	done

.after_badge_text
	ctxt "Der Naturorden"
	line "erlaubt dir, die"
	cont "Natur bis Level 40"
	cont "zu bändigen."
	para "Ach und das noch."
	done

.got_TM_text
	ctxt "TM57 enthält"
	line "Rasierblatt!"
	para "Die Kraft der"
	line "Natur steckt in"
	cont "dieser Attacke."
	para "Zudem hat sie eine"
	line "hohe Quote für"
	cont "Volltreffer!"
	done

.already_defeated_text
	ctxt "Früher war hier"
	line "alles Natur <...>"
	para "Davon sieht man"
	line "nicht mehr viel."
	para "Inakzeptabel!"
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