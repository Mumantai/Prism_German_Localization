SaffronGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronGymSign:
	ctxt "Saffronia Arena"
	line "Leiterin: Sabrina"
	done

SaffronGymGuide:
	ctxt "Hey!"
	para "Sabrina ist die"
	line "stärkste Arena"
	cont "Leiterin in Kanto!"
	para "Sie hat viele"
	line "Einladungen zur"
	para "Elite Vier"
	line "abgelehnt."
	para "Einige sagen"
	line "sogar, ihre Psycho"
	para "Kräfte seien dem"
	line "Liga-Champion"
	cont "ebenbürtig!"
	done

SaffronGym_Trainer_1:
	trainer EVENT_SAFFRON_GYM_TRAINER_1, PSYCHIC_T, 6, .before_battle_text, .battle_won_text
	ctxt "Das Warpsystem"
	line "dieser Arena wurde"
	cont "kürzlich geändert."
	para "Du wirst eine"
	line "entschlossene"
	para "Seele benötigen,"
	line "um Sabrina zu"
	cont "erreichen!"
	done

.before_battle_text
	ctxt "Wird deine Seele"
	line "dich durch dieses"
	cont "Labyrinth führen?"
	done

.battle_won_text
	ctxt "So eine starke "
	line "Seele!"
	done

SaffronGym_Trainer_2:
	trainer EVENT_SAFFRON_GYM_TRAINER_2, MEDIUM, 6, .before_battle_text, .battle_won_text
	ctxt "Du hast einen"
	line "recht langen Weg"
	para "hinter dir, junger"
	line "Mensch."
	para "Wird dein Aufstieg"
	line "jemals seinen"
	para "Höhepunkt"
	line "erreichen?"
	done

.before_battle_text
	ctxt "Die Kraft all"
	line "derer, die du"
	para "besiegt hast,"
	line "fließt durch mich!"
	done

.battle_won_text
	ctxt "Zu viel!"
	line "Viel zu viel!"
	done

SaffronGym_Trainer_3:
	trainer EVENT_SAFFRON_GYM_TRAINER_3, MEDIUM, 7, .before_battle_text, .battle_won_text
	ctxt "Als Sabrina"
	line "erstmals Arena"
	para "Leiterin wurde,"
	line "war sie ganz die"
	cont "Eis-Königin!"
	para "Trotzdem hat Sie"
	line "sich schnell mit"
	para "Erika aus"
	line "Prismania City"
	cont "befreundet."
	para "Ich vermute,"
	line "Erikas mitfühlende"
	para "Natur hat im Laufe"
	line "der Jahre auf sie"
	cont "abgefärbt."
	para "Vielleicht ist das"
	line "der Grund, warum"
	para "sie sich weigert,"
	line "Saffronia City zu"
	cont "verlassen<...>"
	para "Fufufufu<...>"
	done

.before_battle_text
	ctxt "Fufufufu<...> ich"
	para "kann deine"
	line "gedanken lesen."
	done

.battle_won_text
	ctxt "So standhaft!"
	done

SaffronGym_Trainer_4:
	trainer EVENT_SAFFRON_GYM_TRAINER_4, PSYCHIC_T, 7, .before_battle_text, .battle_won_text
	ctxt "Koichi war der"
	line "Arena-Leiter von"
	para "Saffronia City,"
	line "bevor er den Titel"
	para "vor über einem"
	line "Jahrzehnt an"
	cont "Sabrina verlor."
	para "Nachdem sie viele"
	line "Einladungen zur"
	para "Elite Vier"
	line "abgelehnt hatte,"
	para "sagte Sabrina den"
	line "Liga-Offiziellen,"
	para "sie sollten Koichi"
	line "an ihrer Stelle"
	cont "wählen. Er erhielt"
	para "später eine"
	line "Einladung, die er"
	para "auf der Stelle"
	line "annahm, ohne zu"
	para "wissen, warum er"
	line "ausgewählt wurde."
	done

.before_battle_text
	ctxt "Kennst du Koichi"
	line "den Karate"
	cont "Meister?"
	done

.battle_won_text
	ctxt "So schwach<...>"
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
	ctxt "Ich bin als eine"
	line "der besten in"
	cont "Kanto bekannt."
	para "Du solltest"
	line "anderswo nach"
	para "Herausforderungen"
	line "suchen."
	para "Die Liebe, die du"
	line "mit deinem #mon"
	para "teilst, hat meine"
	line "Psycho-Kraft"
	cont "überwältigt."
	para "Die Kraft der"
	line "Liebe<...>"
	para "Vielleicht ist es"
	line "die stärkste<...>"
	done

.before_battle_text
	ctxt "Du<...> ich habe"
	para "deine Ankunft"
	line "erwartet."
	para "Ich habe sie vor"
	line "Jahren"
	cont "vorausgesehen."
	para "Als Arena Leiterin"
	line "ist es meine"
	para "Pflicht,"
	line "Herausforderer"
	para "dazu zu bringen,"
	line "sich zu beweisen."
	para "Ich weiß, wie weit"
	line "du gekommen bist."
	para "Da du es wünschst,"
	line "werde ich dir das"
	para "volle Ausmaß"
	line "meiner"
	para "Psycho-Kräfte"
	line "zeigen!"
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

SaffronGym_MapEventHeader:
	;filler
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
	db 6
	person_event SPRITE_PSYCHIC, 4, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_1, -1
	person_event SPRITE_GRANNY, 10, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_2, -1
	person_event SPRITE_GRANNY, 10, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 16, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SaffronGym_Trainer_4, -1
	person_event SPRITE_SABRINA, 8, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronGymSabrina, -1
	person_event SPRITE_GYM_GUY, 14, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGymGuide, -1