SoutherlyGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyGymSign:
	ctxt "Suntia Arena"
	line "Leiter: Ernest"
	done

SoutherlyGymFlame:
	ctxt "Diese Flamme ist"
	line "wirklich heiß."
	para "Es wär unklug, da"
	line "durch zu gehen."
	done

SoutherlyGymGuide:
	checkflag ENGINE_BLAZEBADGE
	sif false
		jumptextfaceplayer .before_getting_badge_text
	jumptextfaceplayer .after_getting_badge_text

.after_getting_badge_text
	ctxt "Du kommst also aus"
	line "Naljo, ja?"
	para "Herrscht dort"
	line "wirklich so eine"
	cont "Unruhe?"
	done

.before_getting_badge_text
	ctxt "Wow ist es heiß"
	line "hier, oder was?"
	para "Falls du es dir"
	line "nicht denken"
	para "konntest,"
	line "Ernest benutzt"
	cont "Feuer-#mon!"
	para "Pflanzen- oder"
	line "Käfer-#mon"
	para "haben es hier"
	line "schwer."
	done

SoutherlyGym_Trainer_1:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_1, HIKER, 12, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_SOUTHERLY_GYM_FLAME_2
	sif false, then
		writetext .before_removing_flame_text
		disappear 4
		setevent EVENT_SOUTHERLY_GYM_FLAME_2
	sendif
	jumptext .removed_flame_text

.before_battle_text
	ctxt "Kannst du der"
	line "Hitze standhalten?"
	done

.battle_won_text
	ctxt "Du bist taffer,"
	line "als du aussiehst."
	done

.before_removing_flame_text
	ctxt "Na dann. Lass mich"
	para "eine Abkürzung für"
	line "dich öffnen."
	sdone

.removed_flame_text
	ctxt "Das sollte dir"
	line "helfen, einfacher "
	cont "zurückzukommen."
	done

SoutherlyGym_Trainer_2:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_2, FIREBREATHER, 6, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_SOUTHERLY_GYM_FLAME_1
	sif false, then
		writetext .before_removing_flame_text
		disappear 3
		setevent EVENT_SOUTHERLY_GYM_FLAME_1
	sendif
	jumptext .removed_flame_text

.before_battle_text
	ctxt "Ich bin Ernest"
	line "stärkster Gehilfe!"
	para "Besieg mich und"
	line "ich lass dich"
	cont "gegen ihn kämpfen."
	done

.battle_won_text
	ctxt "Ich bin fertig!"
	done

.before_removing_flame_text
	ctxt "Ich schaffe das"
	line "Feuer aus dem Weg."
	sdone

.removed_flame_text
	ctxt "Du wirst Ernest eh"
	line "nicht besiegen!"
	done

SoutherlyGym_Trainer_3:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_3, CAMPER, 4, .before_battle_text, .battle_won_text
	ctxt "Die Leute in"
	line "dieser Gegend,"
	para "sind freundlicher"
	line "als dort, wo du"
	cont "herkommst."
	done

.before_battle_text
	ctxt "Bist du bereit,"
	line "Verbrennungen"
	para "dritten Grades zu"
	line "erleiden?"
	done

.battle_won_text
	ctxt "Hey, kein Grund"
	line "für Aggressivität!"
	done

SoutherlyGym_Trainer_4:
	trainer EVENT_SOUTHERLY_GYM_TRAINER_4, FIREBREATHER, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_SOUTHERLY_GYM_FLAME_3
	sif false, then
		writetext .before_removing_flame_text
		disappear 5
		setevent EVENT_SOUTHERLY_GYM_FLAME_3
	sendif
	jumptext .removed_flame_text

.before_battle_text
	ctxt "Ich helfe dir zu"
	line "Ernest zu kommen,"
	para "wenn du mich"
	line "besiegst."
	done

.battle_won_text
	ctxt "Das war ein echt "
	line "heißer Kampf!"
	done

.before_removing_flame_text
	ctxt "Ich lösche das"
	line "Feuer dort."
	sdone

.removed_flame_text
	ctxt "Viel Glück bei"
	line "deinen nächsten"
	cont "Kämpfen!"
	done

SoutherlyGymLeader:
	faceplayer
	checkflag ENGINE_BLAZEBADGE
	sif true
		jumptext .already_defeated_text
	showtext .introduction_text
	winlosstext .battle_won_text, 0
	loadtrainer ERNEST, ERNEST_GYM
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	playmusic MUSIC_JOHTO_GYM
	writetext .have_a_TM_text
	givetm TM_FIRE_BLAST + RECEIVED_TM
	setflag ENGINE_BLAZEBADGE
	jumptext .after_TM_text

.already_defeated_text
	ctxt "Falls du nach"
	line "einer größeren"
	para "Herausforderung"
	line "suchst, könntest"
	para "du am Flughafen"
	line "Erfolg haben."
	para "Angeblich gibt es"
	line "dort einen Flug zu"
	para "einem geheimen"
	line "Ort, an dem die"
	para "stärksten Trainer"
	line "leben."
	para "Du brauchst dafür"
	line "aber ein"
	cont "spezielles Ticket."
	para "Die Gegend ist so"
	line "exklusiv, dass"
	para "selbst ich nicht"
	line "weiß, wo genau das"
	cont "sein soll."
	done

.introduction_text
	ctxt "Hallo, Kindchen!"
	para "Ich glaube, ich"
	line "habe schon von dir"
	cont "gehört."
	para "Dein Vater ist"
	line "Siegfried, oder?"
	para "Nun, ich bin der"
	line "Arenaleiter hier."
	para "Wenn du mich"
	line "besiegst, gehört"
	cont "der Loheorden dir."
	para "Los geht's!"
	sdone

.battle_won_text
	ctxt "Der brennende"
	line "Kampfesgeist"
	para "meiner #mon,"
	line "ist bloß noch ein"
	cont "schwaches Glimmen."
	para "Du bist dieses"
	line "Ordens wirklich"
	cont "würdig!"
	done

.got_badge_text
	ctxt "Loheorden"
	line "erhalten."
	done

.have_a_TM_text
	ctxt "Hier, nimm noch"
	line "diese TM!"
	sdone

.after_TM_text
	ctxt "TM38 enthält"
	line "Feuersturm!"
	para "Das ist eine"
	line "brennend heiße"
	para "Attacke, die deine"
	line "Gegner verbrennen"
	cont "kann."
	para "Sie ist enomr"
	line "stark. Genau wie"
	para "du und dein Vater."
	done

SoutherlyGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def 19, 8, 5, SOUTHERLY_CITY
	warp_def 19, 9, 5, SOUTHERLY_CITY

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 17, 11, SIGNPOST_TEXT, SoutherlyGymSign
	signpost 17, 6, SIGNPOST_TEXT, SoutherlyGymSign

	;people-events
	db 10
	person_event SPRITE_P0, -3, -3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, FIRE_RING, EVENT_SOUTHERLY_GYM_ITEM_FIRE_RING
	person_event SPRITE_FIRE, 3, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SoutherlyGymFlame, EVENT_SOUTHERLY_GYM_FLAME_1
	person_event SPRITE_FIRE, 12, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SoutherlyGymFlame, EVENT_SOUTHERLY_GYM_FLAME_2
	person_event SPRITE_FIRE, 8, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SoutherlyGymFlame, EVENT_SOUTHERLY_GYM_FLAME_3
	person_event SPRITE_GYM_GUY, 17, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SoutherlyGymGuide, -1
	person_event SPRITE_FISHER, 13, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, SoutherlyGym_Trainer_1, -1
	person_event SPRITE_FISHER, 0, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, SoutherlyGym_Trainer_2, -1
	person_event SPRITE_YOUNGSTER, 6, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SoutherlyGym_Trainer_3, -1
	person_event SPRITE_FISHER, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, SoutherlyGym_Trainer_4, -1
	person_event SPRITE_COOLTRAINER_M, 0, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SoutherlyGymLeader, -1