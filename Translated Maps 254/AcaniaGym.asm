AcaniaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaGym_ToxicCloudText:
	ctxt "Diese Giftgas-"
	line "wolke blockiert"
	cont "den Weg."
	para "Hindurchzugehen"
	line "könnte wirklich"
	cont "gefährlich sein."
	done

AcaniaGymGuide:
	checkflag ENGINE_HAZEBADGE
	sif true
		jumptextfaceplayer .after_badge_text
	jumptextfaceplayer .intro_text

.intro_text
	ctxt "Die Arenaleiterin"
	line "hier heißt Ayaka."
	para "Sie setzt #mon"
	line "vom Gas-Typ ein."
	para "Atme also lieber"
	line "nicht zu viel"
	cont "hier drin <...>"
	done

.after_badge_text
	ctxt "Toll, du hast sie"
	line "besiegen können."
	para "Nur leider bleibt"
	line "der Gestank der"
	cont "Arena erhalten."
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
	ctxt "Ähhhm <...>"
	para "Ich -hust-"
	para "Ich bin bereit"
	line "zu kämpfen, da"
	para "-hust- ich"
	line "muss, oder so."
	done

.battle_won_text
	ctxt "Ughhhhhh<...>"
	done

.clearing_gas_text
	ctxt "Ich mach das"
	line "Gas weg, weil"
	cont "ich muss <...>"
	para "<...> Äh, weil's"
	line "die Leiterin mir"
	cont "so gesagt hat <...>"
	sdone

.gas_cleared_text
	ctxt "Äh, keine Ahnung"
	line "was du noch will-<...>"
	cont "<...> Ich bin so <...>"
	cont "<...> schläfrig <...>"
	done

AcaniaGym_Trainer_2:
	trainer EVENT_ACANIA_GYM_TRAINER_2, DELINQUENTF, 2, .before_battle_text, .battle_won_text, NULL, .script

.script
	checkevent EVENT_ACANIA_GAS_CLOUD_1
	sif true
		jumptext .gas_cleared_text
	showtext .clearing_gas_text
	disappear 2
	setevent EVENT_ACANIA_GAS_CLOUD_1
	end

.before_battle_text
	ctxt "Öhhh <...>"
	para "Lass uns kämpfen,"
	line "okay?"
	done

.battle_won_text
	ctxt "Krass!"
	done

.clearing_gas_text
	ctxt "Das Gas, das dir"
	line "den Weg blockiert"
	cont "hat?"
	para "Das hat sich nun"
	line "verzogen."
	sdone

.gas_cleared_text
	ctxt "Ich werde"
	line "-hust- weiter-"
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
	givetm TM_BURNING_MIST + RECEIVED_TM
	jumptext .got_TM_text

.intro_text
	ctxt "Ist da jemand?"
	para "Ah, okay <...>"
	para "Ein Ritter mit"
	line "einer Schaufel?!"
	para "Ach nee <...>, nur"
	line "so ein Trainer,"
	para "der meinen Orden"
	line "haben will."
	para "Wie öde <...>"
	line "-gähn-"
	para "Nun, nach meinem"
	line "äußerst strengen"
	para "Zeitplan habe ich"
	line "tatsächlich Zeit"
	para "für einen Kampf."
	line "Also los."
	para "Ich bin Ayaka"
	line "und nutze"
	cont "Gas-#mon!"
	para "Ok <...> bringen wir's"
	line "hinter uns <...>"
	sdone

.battle_won_text
	ctxt "-hust-"
	para "Puh, das war"
	line "ja mal was <...>!"
	para "Naja, was soll's?"
	para "Hier hast du den <...>"
	para "Wie hieß das"
	line "Ding nochmal?"
	para "Nebelorden?"
	para "Wer hat sich denn"
	line "diesen dummen"
	cont "Namen ausgedacht?"
	para "Ich war das?"
	para "Oh, na dann."
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "Nebelorden."
	done

.giving_TM_text
	ctxt "Nimm diese TM hier"
	line "auch noch <...>"
	sdone

.got_TM_text
	ctxt "Die TM heißt"
	line "Ätznebel."
	para "Sie, ähh <...>"
	para "Mein Hirn tut weh<...>"
	line "Ach, du findest es"
	cont "schon selbst raus."
	done

.already_battled_text
	ctxt "Ich denke, ich"
	line "werd' erstmal ein"
	para "kleines Nickerchen"
	line "machen, bis der"
	para "nächste Trainer"
	line "hier antanzt <...>"
	para "Wird wohl auch"
	line "noch etwas dauern."
	para "Ach, was soll's!"
	para "Geh' einfach"
	line "mit anderen Leu-"
	cont "ten kämpfen, ja?"
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
	person_event SPRITE_DELINQUENTF, 5, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, AcaniaGym_Trainer_2, -1
	person_event SPRITE_AYAKA, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcaniaGymLeader, -1