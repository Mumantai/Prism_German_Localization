LaurelGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelGymPrincessStatues:
	ctxt "Prinzessin"
	line "Brooklyn"
	done

LaurelGymLeader:
	faceplayer
	checkevent EVENT_POKEONLY_TOTODILE
	sif false
		jumptext .totodile_missing_text
	checkevent EVENT_LAUREL_CITY_GOT_TOTODILE
	sif true
		jumptext .player_got_totodile_text
	checkflag ENGINE_CHARMBADGE
	sif true
		jumptext .after_badge_text
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer BROOKLYN, 1
	startbattle
	reloadmapafterbattle
	setflag ENGINE_CHARMBADGE
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	special RestartMapMusic
	writetext .after_battle_text
	givetm TM_ATTRACT + RECEIVED_TM
	setevent EVENT_MAN_BLOCKING_MAGIKARP_CAVERNS
	closetextend

.totodile_missing_text
	ctxt "HEY!"
	para "Wer sagt, dass du"
	line "hier einfach so"
	cont "rein kannst?"
	para "<...>"
	para "WAS?"
	para "'Sei nett?'"
	para "Mein Baby wird"
	line "VERMISST, du <...>"
	para "<...>"
	para "Naja <...> mit 'Baby'"
	line "meine ich mein"
	cont "Karnimani."
	para "Ich Kämpfe gegen"
	line "keinen, bis mein"
	cont "Baby zurück ist!"
	para "Du willst also"
	line "meinen Orden?"
	para "Dann findest du"
	line "besser schnell"
	cont "mein Karnimani!"
	para "Worauf wartest du?"
	done

.player_got_totodile_text
	ctxt "MEIN KARNIMANI IST"
	line "WIEDER WEG!!!"
	para "<...>"
	para "Wie, du hilfst mir"
	line "nicht?"
	para "DANN VERSCHWINDE!"
	done

.after_badge_text
	ctxt "Wenn du mich ent-"
	line "schuldigst. Ich"
	para "muss mich für mein"
	line "süßes Karnimani"
	cont "hübsch machen."
	done

.before_battle_text
	ctxt "Danke, dass du"
	line "mein süßes"
	cont "kleines Karnimani"
	cont "gefunden hast!"
	para "Später werde ich"
	line "es schminken und"
	para "hübsch anziehen"
	line "und es den ganzen"
	cont "Tag lang knuddeln!"
	para "Ach stimmt, du"
	line "willst den Orden?"
	para "Dann gehen wir es"
	line "an."
	para "Ich bin Brooklyn"
	line "und trainiere"
	cont "Feen-#mon."
	para "Sie sind einfach"
	line "so zuckersüß. Ich"
	para "kann ihnen einfach"
	line "nicht widerstehen!"
	prompt

.battle_won_text
	ctxt "Na gut, na gut."
	line "Du hast gewonnen."
	para "Nimm das Stück"
	line "Metall und geh."
	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "den Charmeorden!"
	done

.after_battle_text
	ctxt "Der Charmeorden"
	line "lässt dich"
	para "'Stärke' auch"
	line "außerhalb von"
	cont "Kämpfen einsetzen."
	para "Und weil ich so"
	line "ein süßer Engel"
	para "bin, gebe ich dir"
	line "noch das hier."
	sdone

LaurelGym_Trainer_1:
	trainer EVENT_LAUREL_GYM_TRAINER_1, CHEERLEADER, 2, .before_battle_text, .battle_won_text
	ctxt "Dein guter Ruf ist"
	line "jetzt im Eimer!"
	done

.before_battle_text
	ctxt "Ein Kampf mit mir?"
	para "Du Glückspilz!"
	done

.battle_won_text
	ctxt "Unser Band ist"
	line "auf ewig zerissen."
	done

LaurelGym_Trainer_2:
	trainer EVENT_LAUREL_GYM_TRAINER_2, CHEERLEADER, 1, .before_battle_text, .battle_won_text
	ctxt "OK, <...>"
	para "Was auch immer."
	done

.before_battle_text
	ctxt "Es ist unhöflich,"
	line "unangemeldet hier"
	cont "reinzuplatzen."
	done

.battle_won_text
	ctxt "Das ist total"
	line "respektlos!"
	done

LaurelGymGuide:
	faceplayer
	opentext
	checkevent EVENT_POKEONLY_TOTODILE
	sif false
		jumptext .initial_intro_text
	checkevent EVENT_LAUREL_CITY_GOT_TOTODILE
	sif true
		jumptext .player_got_totodile_text
	jumptext .after_saving_totodile_text

.after_saving_totodile_text
	ctxt "Danke, dass du ihr"
	line "Karnimani gerettet"
	cont "hast."
	para "Von ihrem Geheule"
	line "bekam ich schon"
	para "Kopfschmerzen <...>"
	done

.initial_intro_text
	ctxt "Hi!"
	para "Die Arenaleiterin"
	line "hier ist Brooklyn."
	para "Sie wird laut und"
	line "nervig, wenn sie"
	para "nicht das kriegt,"
	line "was sie will."
	para "<...>"
	para "Oh, du willst also"
	line "Brooklyns Orden?"
	cont "nun ja <...>"
	para "Sie hat gerade"
	line "persönliche Prob-"
	cont "leme. Mehr weiß"
	cont "ich leider nicht."
	para "Alles, woran ich"
	line "mich erinnere,"
	para "ist, dass es in"
	line "letzter Zeit viele"
	para "Entführungen in"
	line "der Stadt gab."
	para "Jemand sagte mal,"
	line "dass einer der"
	para "Entführer wie ein"
	line "Wissenschaftler"
	cont "aussah."
	para "Ein anderer sagte,"
	line "es wäre eine"
	para "dunkle Gestalt,"
	line "die #mon in den"
	para "Wald, im Süden der"
	line "Stadt, entführt."
	para "Du solltest es dir"
	line "mal anschauen <...>"
	done

.player_got_totodile_text
	ctxt "Oh nein, nicht"
	line "schon wieder <...>"
	done

LaurelGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $8, 8, LAUREL_CITY
	warp_def $11, $9, 8, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 3, 4, SIGNPOST_TEXT, LaurelGymPrincessStatues
	signpost 3, 13, SIGNPOST_TEXT, LaurelGymPrincessStatues

.ObjectEvents
	db 4
	person_event SPRITE_WHITNEY, 2, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LaurelGymLeader, -1
	person_event SPRITE_CHEERLEADER, 6, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, LaurelGym_Trainer_1, -1
	person_event SPRITE_CHEERLEADER, 10, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, LaurelGym_Trainer_2, -1
	person_event SPRITE_GYM_GUY, 12, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelGymGuide, -1