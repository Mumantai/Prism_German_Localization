OwsauriGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

OwsauriGymSign:
	ctxt "Owsauri Arena"
	line "Leiter: Lily"
	done

OwsauriGymGuide:
	ctxt "Ist es für dich"
	line "kalt genug?"

	para "Lily liebt Ihre"
	line "Eis-#mon, also"
	para "brauchst du etwas"
	line "heißes, um Ihr"
	para "Team zum schmelzen"
    line "zu bringen!"
	done

OwsauriGym_Trainer_1:
	trainer EVENT_OWSAURI_GYM_TRAINER_1, BOARDER, 6, .before_battle_text, .battle_won_text

	ctxt "Selbst mit 2 Lagen"
	line "Klamoten bekomme"
	para "ich immer noch"
	line "Schüttelfrost."

	para "Ich denke, die"
	line "#mon mögen es."
	done

.before_battle_text
	ctxt "Chill, warum so"
	line "schnell unterwegs?"

	para "Entspann dich und"
	line "kämpfe!"
	done

.battle_won_text
	ctxt "Vielleicht war das"
	line "zu kalt für mich."
	done

OwsauriGym_Trainer_2:
	trainer EVENT_OWSAURI_GYM_TRAINER_2, BOARDER, 4, .before_battle_text, .battle_won_text

	ctxt "Ich habe meine"
	line "#mon auch hier"
	cont "in der Umgebung"
	cont "gefangen!"
	done

.before_battle_text
	ctxt "Die Abhänge von"
	line "Klathrit sind so"
	cont "heftig Alter!"
	done

.battle_won_text
	ctxt "Boooaahhhhh Alter!"
	done

OwsauriGym_Trainer_3:
	trainer EVENT_OWSAURI_GYM_TRAINER_3, BOARDER, 5, .before_battle_text, .battle_won_text

	ctxt "Digga, wusstest du"
	line "das Lily ein DJ"
	para "war, als Sie noch"
	line "in Lavandia lebte?"
	done

.before_battle_text
	ctxt "Lily ist so Heiß!"
	line "Ich möchte Ihr"
	cont "Herz gewinnen!"
	done

.battle_won_text
	ctxt "Sie mag gute Trai-"
	line "ner, also bleibe"
	cont "ich drann!"
	done

OwsauriGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_HAILBADGE
	sif true
		jumptext .already_battled_text
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer LILY, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_GYM
	writetext .before_giving_TM_text
	givetm TM_FREEZE_BURN + RECEIVED_TM
	setflag ENGINE_HAILBADGE
	jumptext .after_giving_TM_text

.already_battled_text
	ctxt "Wenn der Radioturm"
	line "in Dukatia City"
	para "repariert wurde,"
	line "könnte ich dort"
	cont "als DJ auflegen?"

	para "Ich wohne gerne"
	line "hier und"
	para "Dukatia City ist"
	line "viel näher als"
	cont "Lavandia es ist."
	done

.introduction_text
	ctxt "Hi!"

	para "Willst du dich mit"
	line "mir anlegen?"

	para "Läuft bei dir!"

	para "Ich habe immer Eis"
	line "#mon geliebt,"
	para "natürlich auch in"
	line "den Wintermonaten!"

	para "Ich bin von Kanto"
	line "hergezogen, als"
	para "diese Arena einen"
	line "Leiter brauchte!"

	para "Mein Team zerstört"
	line "dich jetzt!"
	sdone

.battle_won_text
	ctxt "Ich bin traurig,"
	line "zur gleichen Zeit"
	cont "auch fröhlich."

	para "Vielen Dank für"
	line "deine Hilfe, mich"
	para "als Arenaleiter"
	line "zu verbessern!"

	para "Hier der Orden!"
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "den Hagel Orden."
	done

.before_giving_TM_text
	ctxt "Du solltest auch"
	line "diese spezielle TM"
	cont "an dich nehmen."
	sdone

.after_giving_TM_text
	ctxt "Dieser spezielle"
	line "Angriff heißt"
	cont "Freeze Burn!"

	para "Dies ist ein eis-"
	line "iger Angriff, der"
	para "den Gegner verbr-"
	line "ennen, oder ein-"
	cont "frieren kann!"
	done

OwsauriGym_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $13, $4, 4, OWSAURI_CITY
	warp_def $13, $5, 4, OWSAURI_CITY

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 17, 2, SIGNPOST_TEXT, OwsauriGymSign
	signpost 17, 7, SIGNPOST_TEXT, OwsauriGymSign

	;people-events
	db 5
	person_event SPRITE_MISTY, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OwsauriGymLeader, -1
	person_event SPRITE_BOARDER, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OwsauriGym_Trainer_1, -1
	person_event SPRITE_BOARDER, 8, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, OwsauriGym_Trainer_2, -1
	person_event SPRITE_BOARDER, 7, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OwsauriGym_Trainer_3, -1
	person_event SPRITE_GYM_GUY, 17, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OwsauriGymGuide, -1
