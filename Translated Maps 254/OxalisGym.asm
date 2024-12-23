OxalisGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OxalisGym_Trainer_1:
	trainer EVENT_OXALIS_GYM_TRAINER_1, COOLTRAINERM, 1, .before_battle_text, .battle_won_text
	ctxt "Diese Schande kann"
	line "ich nur mit einem"
	cont "Lavabad abspülen."
	done

.before_battle_text
	ctxt "<...> ein Kind?"
	para "Ist das ein Witz?"
	para "Das sollte nicht"
	line "schwer werden <...>"
	done

.battle_won_text
	ctxt "Unfassbar!"
	done

OxalisGym_Trainer_2:
	trainer EVENT_OXALIS_GYM_TRAINER_2, DELINQUENTM, 1, .before_battle_text, .battle_won_text

	ctxt "Scheinbar kannst"
	line "du mit der Hitze"
	cont "umgehen."

	para "Aber <...> kannst du"
	line "auch mit Josiah"
	cont "umgehen?"
	done

.before_battle_text
	ctxt "Wo liegt das"
	line "Problem?"

	para "Kannst du es nicht"
	line "ertragen, in der"
	para "Nähe von"
	line "brodelnder Lava zu"
	para "sein bei @"
	start_asm
	ld a, [wOptions2]
	and 1 << 2
	ld hl, .metric_text
	ret z
	ld hl, .imperial_text
	ret
.metric_text
	ctxt "700"
	line "Grad Celsius?"
	done
.imperial_text
	ctxt "1,300"
	line "Grad Fahrenheit?"
	done

.battle_won_text
	ctxt "Gaaah!"
	done

OxalisGymGuide:
	checkflag ENGINE_PYREBADGE
	sif true
		jumptextfaceplayer .after_badge_text
	jumptextfaceplayer .before_badge_text

.before_badge_text
	ctxt "Ich habe auf deine"
	line "Ankunft gewartet."
	para "Prof. Ilk hat mich"
	line "gebeten, dir zu"
	cont "helfen."
	para "Daher gebe ich dir"
	line "alle Insider-"
	para "Informationen, die"
	line "du brauchst!"
	para "Also gut, Josiah"
	line "hat Feuer-Pokemon."
	para "Aber das kannst du"
	line "an der Umgebung"
	para "hier erkennen,"
	line "richtig? Brennend!"
	para "Ein Wasser-Typ"
	line "Pokemon wäre eine"
	cont "super Wahl."
	para "Der Gestein-Typ"
	line "wäre eine weitere"
	cont "gute Wahl!"
	para "Wenn dein Team zu"
	line "oft verbrennt,"
	para "versuche ein"
	line "Brandheilmittel im"
	cont "Markt zu kaufen."
	done

.after_badge_text
	ctxt "Gute Arbeit!"

	para "Ohne meine Tipps"
	line "hättest du es aber"
	cont "niemals geschafft!"
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
	ctxt "Was geht."

	para "Man nennt mich"
	line "Josiah."

	para "Alter, Ich werds"
	line "dir nicht leicht"
	cont "machen."

	para "Also lass uns die"
	line "Arena zum Beben"
	cont "bringen!"
	sdone

.battle_won_text
	ctxt "<...> Whoa!"

	para "Du bist Bombe!"

	para "Mein Orden haste"
	line "dir verdient."
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "den Pyro-Orden!"
	done

.before_giving_TM_text
	ctxt "Der Pyro-Orden"
	line "erhöht den"
	cont "Angriffs-Wert."

	para "Es erlaubt dir"
	line "außerdem Blitz"
	para "außerhalb eines"
	line "Kampfes einzu-"
	cont "setzen."

	para "Ist das nicht"
	line "Krass???"

	para "Also nimm es."
	sdone

.after_giving_TM_text
	ctxt "Yo, das ist ne TM"
	line "und das steht für"
	para "irgendwas <...> ähm,"
	line "Technische Machine"
	cont "oder so."

	para "Deine #mon"
	line "können damit eine"
	cont "Attacke lernen."

	para "Diese TM enthält"
	line "Irrlicht."

	para "Es verbennt den"
	line "Gegner!"
	done

.already_battled_text
	ctxt "Digga, die Rijon"
	line "Liga setzt 8 Orden"
	cont "vorraus <...>"

	para "Also geh und"
	line "schnapp sie dir"
	cont "du Champion!"
	done

OxalisGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 15, 5, OXALIS_CITY
	warp_def 21, 2, 5, OXALIS_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_JOSIAH, 6, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED + 8, PERSONTYPE_SCRIPT, 0, OxalisGymLeader, -1
	person_event SPRITE_YOUNGSTER, 9, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, OxalisGym_Trainer_1, -1
	person_event SPRITE_DELINQUENTM, 10, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, OxalisGym_Trainer_2, -1
	person_event SPRITE_GYM_GUY, 18, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OxalisGymGuide, -1

