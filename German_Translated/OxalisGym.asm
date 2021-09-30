OxalisGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

OxalisGym_Trainer_1:
	trainer EVENT_OXALIS_GYM_TRAINER_1, COOLTRAINERM, 2, .before_battle_text, .battle_won_text

	ctxt "Du scheinst mit"
	line "der Hitze klar"
	cont "zu kommen."

	para "Aber<...> auch"
	line "mit Josiah?"
	done

.before_battle_text
	ctxt "Na, was ist los?"

	para "Angst, wenn"
	line "dampfende Lava"
	para "dich bei @"
	start_asm
	ld a, [wOptions2]
	and 1 << 2
	ld hl, .metric_text
	ret z
	ld hl, .imperial_text
	ret
.metric_text
	ctxt "700 Grad"
	line "Celsius köchelt?"
	done
.imperial_text
	ctxt "1300 Grad"
	line "Fahrenheit kocht?"
	done

.battle_won_text
	ctxt "Gaaah!"
	done

OxalisGym_Trainer_2:
	trainer EVENT_OXALIS_GYM_TRAINER_2, COOLTRAINERM, 1, .before_battle_text, .battle_won_text

	ctxt "Ich kann die Sch-"
	line "ande nur mit einem"
	cont "Lavabad abspülen."
	done

.before_battle_text
	ctxt "<...>ein Kind?"

	para "Ist das ein Witz?"

	para "Das sollte nicht"
	line "schwer werden<...>"
	done

.battle_won_text
	ctxt "Unfassbar!"
	done

OxalisGymGuide:
	checkflag ENGINE_PYREBADGE
	sif true
		jumptextfaceplayer .after_badge_text
	jumptextfaceplayer .before_badge_text

.before_badge_text
	ctxt "Hey, du da!"
	line "Ich habe auf deine"
	cont "Ankuft gewartet."

	para "Prof. Ilk bat mich"
	line "darum, dich zu"
	cont "unterstützten."

	para "Ich gebe dir alle"
	line "internen Infos"
	cont "die du benötigst!"

	para "Also, Josiah hat"
	line "Feuer #mon aber"
	para "das siehst du ja"
	line "an der Arena hier."

	para "Wasser #mon"
	line "wären eine gute"
	cont "Wahl gegen Ihn."

	para "Gestein #mon"
	line "wären ebenso"
	cont "effektiv!"

	para "Wenn du dich zu"
	line "häufig verbrennst,"
	para "solltest du Feuer-"
	line "heiler kaufen."
	done

.after_badge_text
	ctxt "Gute Arbeit!"

	para "Du hättest es nie"
	line "ohne meiner Hilfe"
	cont "geschafft!"
	done

OxalisGymLeader:
	faceplayer
	checkflag ENGINE_PYREBADGE
	sif true
		jumptext .already_battled_text
	showtext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer JOSIAH, JOSIAH_GYM
	startbattle
	reloadmapafterbattle
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_PYREBADGE
	setevent EVENT_ROUTE_73_GUARD
	setevent EVENT_LINK_OPEN
	writetext .before_giving_TM_text
	givetm TM_WILL_O_WISP + RECEIVED_TM
	jumptext .after_giving_TM_text

.before_battle_text
	ctxt "Was geht ab Bro."

	para "Ich bin Josiah."

	para "Jo Brudi, ich"
	line "werds dir nicht"
	cont "leicht machen."

	para "Lasset diesen"
	line "Kampf beginnen!"
	sdone

.battle_won_text
	ctxt "<...>Uff!"

	para "Du bist ne Bombe!"

	para "Du hast dir mein"
	line "Orden verdient."
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "Fackel Orden!"
	done

.before_giving_TM_text
	ctxt "Der Fackel Orden"
	line "pumpt den Angriff"
	cont "deiner #mon bro"

	para "Digga, du kannst"
	line "jetzt sogar Blitz"
	cont "außerhalb des"
	cont "Kampfes nutzen!"

	para "Ist das nicht "
	line "KRASS???"

	para "Hier nimm auch das"
	line "hier an dich<...>"
	sdone

.after_giving_TM_text
	ctxt "Yo, das ist eine"
	line "TM, was so viel"
	cont "bedeutet wie<...> uhm,"
	para "Technische Maschi-"
	line "ne? Ja, das passt."

	para "Es lehrt deinen"
	line "#mon neue"
	para "Attacken und kann"
	line "unendlich oft"
	cont "eingesetzt werden."

	para "Diese TM bein-"
	line "haltet Irrlicht."

	para "Diese Attacke ver-"
	line "brennt den Gegner!"	
	done

.already_battled_text
	ctxt "Yo, die Rijon"
	line "Liga benötigt 8"
	cont "Orden, von daher<...>"

	para "Schnapp sie dir"
	line "alle, Brudi!"
	done

OxalisGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 15, 5, OXALIS_CITY
	warp_def 21, 2, 5, OXALIS_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_FALKNER, 6, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED + 8, PERSONTYPE_SCRIPT, 0, OxalisGymLeader, -1
	person_event SPRITE_YOUNGSTER, 9, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, OxalisGym_Trainer_1, -1
	person_event SPRITE_YOUNGSTER, 10, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, OxalisGym_Trainer_2, -1
	person_event SPRITE_GYM_GUY, 18, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OxalisGymGuide, -1

