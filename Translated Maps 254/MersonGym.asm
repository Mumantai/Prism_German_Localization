MersonGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonGymSign:
	ctxt "Merson City"
	line "#mon-Arena"
	done

MersonGymGuide:
	ctxt "Karpman ist ein"
	line "großer Fan von"
	cont "Wasser-#mon."
	para "Du hast in Naljo"
	line "gegen eine"
	para "nervige Leiterin"
	line "einer Wasser-Arena"
	cont "gekämpft?"
	para "Oh wow, ich will"
	line "nicht abfällig"
	para "sein, aber ihr Ruf"
	line "ist schrecklich."
	done

MersonGymTrainer:
	trainer EVENT_MERSON_GYM_TRAINER_1, CAMPER, 2, .before_battle_text, .battle_won_text
	ctxt "Ich dachte, ich"
	line "hätte eine Chance"
	cont "gegen dich!"
	para "Vielleicht sollte"
	line "ich nicht so"
	cont "optimistisch sein."
	done

.before_battle_text
	ctxt "Halt, stop!"
	done

.battle_won_text
	ctxt "Ich muss diese"
	line "Kämpfe gewinnen <...>"
	done

MersonGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_MARINEBADGE
	sif true
		jumptext .already_won_text
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer KARPMAN, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_MARINEBADGE
	playmusic MUSIC_JOHTO_GYM
	writetext .before_TM_text
	givetm TM_STORM_FRONT + RECEIVED_TM
	jumptext .after_TM_text

.already_won_text
	ctxt "Du hast mich"
	line "beeindruckt."
	para "Sammle alle Orden"
	line "hier in Rijon."
	done

.introduction_text
	ctxt "Ich bin Karpman."
	para "Ich trainiere nur"
	line "Wasser-#mon!"
	para "Feuer ist nutzlos"
	line "gegen meine"
	para "mächtigen"
	line "Wasserangriffe!"
	para "Du siehst nicht"
	line "eingeschüchtert"
	para "aus <...> Was ist"
	line "los mit dir?"
	para "Wie auch immer,"
	line "lass uns den Kampf"
	cont "beginnen!"
	sdone

.battle_won_text
	ctxt "Sieht so aus, als"
	line "müsste ich deine"
	para "Autorität"
	line "respektieren!"
	para "Mach weiter und"
	line "nimm den Marine-"
	cont "Orden."
	done

.received_badge_text
	ctxt "<PLAYER> erhält den"
	line "Marine-Orden."
	done

.before_TM_text
	ctxt "Der Marine-Orden"
	line "macht deine"
	para "#mon noch "
	line "stärker!"
	para "Hier, nimm noch"
	line "dieses Geschenk."
	sdone

.after_TM_text
	ctxt "Sturmfront"
	line "beschwört einen"
	para "Regensturm und"
	line "verursacht"
	cont "Schaden."
	para "Perfekt für"
	line "Wasser-#mon."
	done

MersonGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $d, $4, 3, MERSON_CITY
	warp_def $d, $5, 3, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 11, 0, SIGNPOST_TEXT, MersonGymSign

.ObjectEvents
	db 3
	person_event SPRITE_KARPMAN, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MersonGymLeader, -1
	person_event SPRITE_CAMPER, 8, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, MersonGymTrainer, -1
	person_event SPRITE_GYM_GUY, 11, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 1, MersonGymGuide, -1