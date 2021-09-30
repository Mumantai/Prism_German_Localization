SaffronGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaffronGymSign:
	ctxt "Saffronia Arena"
	line "Leiter: Sabrina"
	done

SaffronGymGuide:
	ctxt "Hey!"

	para "Sabrina hat vor"
	line "Kurzem ihr"
	para "Teleportations"
	line "System verändert."

	para "Pass also auf,"
	line "dass du dich nicht"
	cont "verirst!"

	done

SaffronGym_Trainer_1:
	trainer EVENT_SAFFRON_GYM_TRAINER_1, PSYCHIC_T, 6, .before_battle_text, .battle_won_text

	ctxt "Deine Seele wird "
	line "stäker."

	done

.before_battle_text
	ctxt "Was ist die Kraft"
	line "deiner Seele?"

	done

.battle_won_text
	ctxt "So eine starke "
	line "Seele!"

	done

SaffronGym_Trainer_2:
	trainer EVENT_SAFFRON_GYM_TRAINER_2, MEDIUM, 6, .before_battle_text, .battle_won_text

	ctxt "Nerv mich nicht"
	line "weiter, böser "
	cont "Geist!"

	done

.before_battle_text
	ctxt "Böse Geister?"

	para "Verschwindet!"

	done

.battle_won_text
	ctxt "Ayayayayay!"
	done

SaffronGym_Trainer_3:
	trainer EVENT_SAFFRON_GYM_TRAINER_3, MEDIUM, 7, .before_battle_text, .battle_won_text

	ctxt "Welche"
	line "Energiequelle"
	cont "nutzt du?"

	done

.before_battle_text
	ctxt "Die Macht all"
	line "derer, die du"
	para "besiegt hast,"
	line "kommt von mir!"

	done

.battle_won_text
	ctxt "Viel zu stark!"

	done

SaffronGymSabrina:
	opentext
	checkflag ENGINE_MARSHBADGE
	sif true
		jumptextfaceplayer .already_battled_text
	faceplayer
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	faceplayer
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	writetext .before_giving_TM_text
	givetm TM_SAFEGUARD + RECEIVED_TM
	setflag ENGINE_MARSHBADGE
	jumptext .after_giving_TM_text

.already_battled_text
	ctxt "Deine Liebe zu"
	line "deinen #mon hat"
	para "meine psychische"
	line "Kraft übertroffen."

	para "Die Kraft der"
	line "Liebe könnte auch"
	para "eine Art von"
	line "Psychischer Kraft "
	cont "sein."

	done

.before_battle_text
	ctxt "Ich wusste, dass"
	line "du kommen würdest."

	para "Ich hatte vor"
	line "einigen Jahren"
	para "eine Vision von"
	line "Deiner Ankunft."

	para "Es ist meine"
	line "Pflicht als Arena"
	para "Leiterin, jedem,"
	line "der sich als"
	para "würdig erwiesen"
	line "hat, den Orden zu "
	cont "geben."

	para "Da du kämpfen"
	line "willst, werde ich"
	para "dir das Ausmaß"
	line "meiner psychischen"
	cont "Kräfte zeigen."

	sdone

.battle_won_text
	ctxt "Ich war nicht in"
	line "der Lage, dieses"
	para "Ausmaß an Macht"
	line "voraussehen zu "
	cont "können."

	para "Du hast dir den"
	line "Sumpforden "
	cont "verdient."

	done

.received_badge_text
	ctxt "<PLAYER> erhält den"
	line "Sumpf Orden."

	done

.before_giving_TM_text
	ctxt "Bitte nimm auch"
	line "dies als Geschenk"
	cont "an."
	sdone

.after_giving_TM_text
	ctxt "Diese TM enthält "
	line "Bodyguard."

	para "Dieser Angriff"
	line "negiert 5 Runden"
	para "lang jeden"
	line "negativen Status"
	para "Effekt deines"
	line "ganzen Teams!"

	done

SaffronGym_MapEventHeader ;filler
	db 0, 0

;warps
	db 32
	warp_def $5, $1, 2, SAFFRON_GYM
	warp_def $b, $1, 3, SAFFRON_GYM
	warp_def $11, $5, 4, SAFFRON_GYM
	warp_def $f, $b, 5, SAFFRON_GYM ;A
	warp_def $5, $9, 6, SAFFRON_GYM
	warp_def $5, $13, 7, SAFFRON_GYM
	warp_def $9, $1, 8, SAFFRON_GYM
	warp_def $b, $f, 9, SAFFRON_GYM
	warp_def $3, $f, 10, SAFFRON_GYM
	warp_def $f, $5, 11, SAFFRON_GYM
	warp_def $3, $9, 12, SAFFRON_GYM
	warp_def $5, $b, 13, SAFFRON_GYM
	warp_def $b, $5, 14, SAFFRON_GYM
	warp_def $11, $f, 15, SAFFRON_GYM
	warp_def $11, $13, 16, SAFFRON_GYM
	warp_def $3, $13, 17, SAFFRON_GYM
	warp_def $5, $f, 18, SAFFRON_GYM
	warp_def $f, $13, 19, SAFFRON_GYM
	warp_def $9, $b, 4, SAFFRON_GYM ;to A

	warp_def $3, $1, 21, SAFFRON_GYM ;B
	warp_def $9, $f, 22, SAFFRON_GYM
	warp_def $9, $5, 23, SAFFRON_GYM
	warp_def $11, $1, 20, SAFFRON_GYM ;to B

	warp_def $3, $b, 25, SAFFRON_GYM ;C
	warp_def $9, $13, 26, SAFFRON_GYM
	warp_def $b, $13, 24, SAFFRON_GYM ;to C

	warp_def $5, $5, 28, SAFFRON_GYM
	warp_def $f, $f, 29, SAFFRON_GYM
	warp_def $3, $5, 30, SAFFRON_GYM
	warp_def $f, $1, 31, SAFFRON_GYM ;to D

	warp_def $11, $8, 2, SAFFRON_CITY ;D
	warp_def $11, $9, 2, SAFFRON_CITY

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 15, 8, SIGNPOST_TEXT, SaffronGymSign

	;people-events
	db 5
	person_event SPRITE_YOUNGSTER, 4, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_1, -1
	person_event SPRITE_GRANNY, 10, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_2, -1
	person_event SPRITE_GRANNY, 10, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_3, -1
	person_event SPRITE_SABRINA, 8, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronGymSabrina, -1
	person_event SPRITE_GYM_GUY, 14, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGymGuide, -1
