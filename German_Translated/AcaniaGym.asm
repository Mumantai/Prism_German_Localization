AcaniaGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AcaniaGym_ToxicCloudText:
    ctxt "Diese Giftgas-"
    line "wolke blockiert"
    cont "den Weg."

    para "Hindurch zu"
    line "gehen könnte ge-"
    cont "fährlich sein."
	done

AcaniaGymGuide:
	checkflag ENGINE_HAZEBADGE
	sif true
		jumptextfaceplayer .after_badge_text
	jumptextfaceplayer .intro_text

.intro_text
    ctxt "Der Name der"
    line "Arenaleiterin"
    cont "ist Ayaka."
 
    para "Sie hat sich auf"
    line "den Gas-Typ"
    cont "Spezialisiert."
 
    para "Atme besser"
    line "nicht zu viel"
    cont "hier drin<...>"
	done

.after_badge_text
    ctxt "Toll, du hast"
    line "Sie besiegt."
 
    para "Nur leider,"
    line "bleibt der Ge-"
    cont "stank der Arena"
    cont "erhalten."
	done

AcaniaGym_Trainer_1:
	trainer EVENT_ACANIA_GYM_TRAINER_1, BEAUTY, 5, .before_battle_text, .battle_won_text, NULL, .script

.script
	checkevent EVENT_ACANIA_GAS_CLOUD_2
	sif true
		jumptext .gas_cleared_text
	showtext .clearing_gas_text
	disappear 3
	setevent EVENT_ACANIA_GAS_CLOUD_2
	end

.before_battle_text
    ctxt "Uhhh<...>"
 
    para "Ich -hust-"
 
    para "Ich bin bereit"
    line "zu kämpfen, da"
 
    para "-hust- ich"
    line "muss oder so."
	done

.battle_won_text
	ctxt "Ughhhhhh<...>"
	done

.clearing_gas_text
    ctxt "Ich mach das"
    line "Gas weg, da"
    cont "ich muss<...>"
 
    para "<...> Äh, weil"
    line "die Leiterin es"
    cont "mir gesagt hat<...>"
	sdone

.gas_cleared_text
	ctxt "Uh, Keine Ahnung"
	line "was du noch wil<...>"

	cont "<...>Ich bin so<...>"
	cont "<...>schläfrig<...>"
	done

AcaniaGym_Trainer_2:
	trainer EVENT_ACANIA_GYM_TRAINER_2, SUPER_NERD, 9, .before_battle_text, .battle_won_text, NULL, .script

.script
	checkevent EVENT_ACANIA_GAS_CLOUD_1
	sif true
		jumptext .gas_cleared_text
	showtext .clearing_gas_text
	disappear 2
	setevent EVENT_ACANIA_GAS_CLOUD_1
	end

.before_battle_text
	ctxt "Öhhh<...>"

	para "Kämpfen?<...>"
	line "Uhhh?<...>"
	done

.battle_won_text
	ctxt "Krass!"
	done

.clearing_gas_text
	ctxt "Erinnerst du dich"
	line "noch an das Gas,"
	cont "dass dir den Weg"
	cont "versperrte?"

	para "Es hat sich nun"
	line "verzogen."
	sdone

.gas_cleared_text
	ctxt "Ich werde"
	line "-hust- weiter"
	cont "trainieren -hust-."
	done

AcaniaGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_HAZEBADGE
	sif true
		jumptext .already_battled_text
	writetext .intro_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer AYAKA, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_HAZEBADGE
	writetext .giving_TM_text
	givetm TM_MUSTARD_GAS + RECEIVED_TM
	jumptext .got_TM_text

.intro_text
	ctxt "Is da wer?"
 
    para "Ahja<...>"
 
    para "Wow! Ein Ritter"
    line "mit einer Schaufel"
    cont "ausgerüstet?"
 
    para "Ach ne<...> nur"
    line "so ein Trainer"
 
    para "der den Orden"
    line "haben will."
 
    para "Wie Öde<...>"
    line "-gähn-"
 
    para "Nun, nach meinem"
    line "äußerst<...> Äh<...>"
    para "anspruchsvollen"
    line "Zeitplan<...>"
    para "<...>habe"
    para "ich Zeit für"
    line "einen Kampf."
 
    para "Ich bin Ayaka"
    line "und nutze<...>"
    cont "Gas-#mon!"
 
    para "Ok<...>"
    line "bringen wir's"
    cont "hinter uns<...>"
	sdone

.battle_won_text
    ctxt "-hust-"
 
    para "Junge, das war"
    line "seltsam<...>"
 
    para "Auch was solls<...>"
 
    para "Naja da hast du"
    line "dein, Ähh<...>"
 
    para "Wie hies das"
    line "Dingens noch?"
 
    para "Nebelorden?"
 
    para "Wer hat sich"
    line "denn so einen"
 
    para "bescheuerten"
    line "Namen ausgedacht?"
 
    para "Ich war das?"
 
    para "Oh, na dann."
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "Nebelorden."
	done

.giving_TM_text
	ctxt "Nimm das hier"
	line "auch noch<...>"
	sdone

.got_TM_text
	ctxt "Die TM heißt"
	line "Senfgas."

    para "Es, ääh<...>"
 
    para "Mein Hirn tut"
    line "weh<...> Ach, du"
 
    para "kommst schon"
    line "selbst darauf<...>"
	done

.already_battled_text
    ctxt "Ich denk ich"
    line "werd erstma ein"
    para "kleines"
    line "Nickerchen"
    para "machen, bis der"
    line "nächste Trainer"
    para "antanzt<...>"
 
    para "Wird wohl auch"
    line "noch etwas dauern."
 
    para "Ach, was solls!"
 
    para "Geh' einfach"
    line "mit anderen"
    cont "Leuten kämpfen,ja?"
	done

AcaniaGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $d, $4, 5, ACANIA_DOCKS
	warp_def $d, $5, 5, ACANIA_DOCKS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 6
	person_event SPRITE_SUDOWOODO, 7, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXT, 0, AcaniaGym_ToxicCloudText, EVENT_ACANIA_GAS_CLOUD_1
	person_event SPRITE_SUDOWOODO, 5, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXT, 0, AcaniaGym_ToxicCloudText, EVENT_ACANIA_GAS_CLOUD_2
	person_event SPRITE_GYM_GUY, 11, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcaniaGymGuide, -1
	person_event SPRITE_BUENA, 4, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, AcaniaGym_Trainer_1, -1
	person_event SPRITE_SUPER_NERD, 5, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, AcaniaGym_Trainer_2, -1
	person_event SPRITE_JASMINE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcaniaGymLeader, -1
