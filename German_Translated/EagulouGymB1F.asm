EagulouGymB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .prison_doors

.prison_doors
	copy wCageKeyDoorsArrayBank
	dba EagulouGymB1FChangeBlockArray
	db (EagulouGymB1FChangeBlockArrayEnd - EagulouGymB1FChangeBlockArray) / 5
	endcopy
	farjump UpdateCageKeyDoorsScript
	
EagulouGymB1FChangeBlockArray:
	eventflagchangeblock EVENT_EAGULOU_DOOR_1, 4, 4, $57
EagulouGymB1FChangeBlockArrayEntrySizeEnd:
	eventflagchangeblock EVENT_EAGULOU_DOOR_2, 16, 4, $57
	eventflagchangeblock EVENT_EAGULOU_DOOR_3, 4, 14, $57
	eventflagchangeblock EVENT_EAGULOU_DOOR_4, 16, 14, $57
EagulouGymB1FChangeBlockArrayEnd:

EagulouGymB1FGuide:
	ctxt "Das hier ist im"
	line "Grunde bloß eine"
	para "Erweiterung von"
	cont "Saxifragia Eiland."

	para "Es wurde zu voll,"
	line "weshalb sie einige"
	para "ihrer Insassen in"
	line "dieses Gefängnis"
	para "verlegen mussten."
	done

EagulouGymB1FDoor1:
	dw EVENT_EAGULOU_DOOR_1
	writebyte 0
	jump EagulouGymB1FDoor

EagulouGymB1FDoor2:
	dw EVENT_EAGULOU_DOOR_2
	writebyte 1
	jump EagulouGymB1FDoor

EagulouGymB1FDoor4:
	dw EVENT_EAGULOU_DOOR_4
	writebyte 3
	; fallthrough
EagulouGymB1FDoor:
	pushvar
	loadarray .EagulouGymB1FTrainerEventsArray
	readarrayhalfword 0
	checkevent -1
	sif false
		jumptext .keys_wont_work_text
	popvar
	jumpstd cagekeydoor

.EagulouGymB1FTrainerEventsArray:
	dw EVENT_EAGULOU_GYM_B1F_TRAINER_1
.EagulouGymB1FTrainerEventsArrayEntrySizeEnd:
	dw EVENT_EAGULOU_GYM_B1F_TRAINER_3
	dw 0
	dw EVENT_EAGULOU_GYM_B1F_TRAINER_2

.keys_wont_work_text:
	ctxt "Keiner deiner"
	line "Schlüssel wird an"
	para "diesem Tor"
	line "funktionieren."

	done

EagulouGymB1F_Trainer_1:
	trainer EVENT_EAGULOU_GYM_B1F_TRAINER_1, GRUNTM, 1, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	checkevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_1
	sif true
		jumptext .after_key_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	sif false, then
		waitbutton
		jumptext EagulouGymB1F_Text_NoSpace
	sendif
	setevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_1
	closetextend

.before_battle_text
	ctxt "Der Geist von Team"
	line "Rocket soll"
	cont "weiterleben!"

	done

.battle_won_text
	ctxt "Autsch! Gut, ich "
	line "mache eine Pause."

	done

.give_key_text
	ctxt "Wenn du diese"
	line "elenden Paletten-"
	para "Ranger nerven"
	line "willst, dann nimm"
	cont "diesen Schlüssel."
	sdone

.after_key_text
	ctxt "Ich bin Giovanni"
	line "für immer treu."

	para "Eines Tages hat"
	line "er sein Comeback!"
	done

EagulouGymB1F_Trainer_2:
	trainer EVENT_EAGULOU_GYM_B1F_TRAINER_2, SAILOR, 3, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	checkevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_2
	sif true
		jumptext .after_key_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	sif false, then
		waitbutton
		jumptext EagulouGymB1F_Text_NoSpace
	sendif
	setevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_2
	closetextend

.before_battle_text
	ctxt "Man kann es einem"
	line "nicht einfach so"
	para "verübeln, dass man"
	line "versucht hat, ein"
	para "Schiff voller"
	line "seltener #mon"
	cont "zu stehlen."

	done

.battle_won_text
	ctxt "Ich muss meine"
	line "Zeit absitzen."

	done

.give_key_text
	ctxt "Nun, hier ist der"
	line "Schlüssel zur"
	cont "Rocket-Zelle."

	sdone

.after_key_text
	ctxt "Wenn ich mich aus"
	line "dem Staub mache,"
	para "kriege ich"
	line "Lebenslang!"

	done

EagulouGymB1F_Trainer_3:
	trainer EVENT_EAGULOU_GYM_B1F_TRAINER_3, PATROLLER, 20, .before_battle_text, .battle_won_text, NULL, .script
.script
	opentext
	checkevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_3
	sif true
		jumptext .after_key_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	sif false, then
		waitbutton
		jumptext EagulouGymB1F_Text_NoSpace
	sendif
	setevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_3
	closetextend

.before_battle_text
	ctxt "Dieser Knast"
	line "ist ekelig!"

	para "Ich hab's!"

	para "Ich weigere mich zu"
	line "essen, dann lassen"
	cont "die mich gehen."
	done

.battle_won_text
	ctxt "Warte ab! Mein"
	line "Freund wird sauer"
	para "sein, wenn ich ihm"
	line "das sage!"
	done

.give_key_text
	ctxt "Keine Lust mehr."

	para "Los, geh jetzt den"
	line "Direktor nerven!"

	sdone

.after_key_text
	ctxt "Kannst du mir"
	line "bitte Cupcakes"
	cont "reinschmuggeln?"

	done

EagulouGymB1FLeader:
	faceplayer
	opentext
	checkflag ENGINE_STARBADGE
	sif true
		jumptext .already_battled_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SILVER, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_STARBADGE
	playmusic MUSIC_GYM
	writetext .after_badge_text
	givetm TM_FLASH + RECEIVED_TM
	jumptext .after_TM_text

.already_battled_text
	ctxt "Vergiss niemals"
	line "den Bund mit"
	cont "deinen #mon!"
	done

.before_battle_text
	ctxt "<...> Mein Name ist"
	line "Silber."

	para "Ich bin der"
	line "Direktor und"
	para "Leiter der Arena"
	line "von Aegolia City."

	para "Ich dachte immer,"
	line "dass die Stärke"
	para "bei #mon das"
	line "Entscheidende ist!"

	para "Aber nein!"

	para "Auch wenn ein"
	line "#mon schwach"
	para "ist, liegt sein"
	line "wahres Potential"
	para "in der Beziehung"
	line "zwischen ihm und"
	cont "seinem Trainer!"

	para "Sei geduldig und"
	line "dein #mon wird "
	para "dein treuester"
	cont "Freund werden!"


	para "<PLAYER>!"

	para "Kampfbereit?"
	sdone

.battle_won_text
	ctxt "<...> Das ist"
	line "beeindruckend."

	para "Du scheinst eine"
	line "starke Bindung zu "
	para "deinem Team aufge-"
	line "baut zu haben."

	done

.received_badge_text
	ctxt "<PLAYER> erhält den"
	line "Sternorden!"

	done

.after_badge_text
	ctxt "<...> Du bist dessen"
	line "Wert."

	para "Das habe ich mir"
	line "vor einigen Jahren"
	para "vom Ältesten des"
	line "Knofensa-Turms"
	cont "verdient."

	para "Ich habe seinen"
	line "Rat nach all den"
	cont "Jahren verstanden:"
	para "#mon sind keine"
	line "Kriegswerkzeuge."

	sdone

.after_TM_text
	ctxt "<...> Diese TM heißt"
	line "Blitz."

	para "Es ist keine"
	line "beliebte TM, aber"
	para "sie wird dunkle"
	line "Orte erhellen"
	para "und die Genauig-"
	line "keit des Gegners"
	para "während des Kampfes"
	line "verringern."

	done

EagulouGymB1F_Text_NoSpace:
	ctxt "Kein Platz mehr"
	line "im Beutel!"

	done

EagulouGymB1F_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $10, $11, 2, EAGULOU_GYM_F1

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 4, 4, signpost_reset SIGNPOST_READ, EagulouGymB1FDoor1
	signpost 4, 16, signpost_reset SIGNPOST_READ, EagulouGymB1FDoor2
	signpost 14, 4, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 2
	signpost 14, 16, signpost_reset SIGNPOST_READ, EagulouGymB1FDoor4

.ObjectEvents
	db 6
	person_event SPRITE_ROCKET, 12, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, EagulouGymB1F_Trainer_1, -1
	person_event SPRITE_SILVER, 2, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EagulouGymB1FLeader, -1
	person_event SPRITE_SAILOR, 12, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, EagulouGymB1F_Trainer_2, -1
	person_event SPRITE_PALETTE_PATROLLER, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, 8 + PAL_OW_PURPLE, PERSONTYPE_TRAINER, 0, EagulouGymB1F_Trainer_3, -1
	person_event SPRITE_OFFICER, 8, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, EagulouGymB1FGuide, -1
	person_event SPRITE_POKE_BALL, 6, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_EAGULOU_GYM_B1F_ITEM_CAGE_KEY
