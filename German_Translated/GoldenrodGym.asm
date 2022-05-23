GoldenrodGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

GoldenrodGymSign:
	ctxt "Dukatia Arena"
	para "Leiterin: Bianka"
	done

GoldenrodGymGuide:
	ctxt "Yo!"

	para "Bianka hier wurde"
	line "immer als Weichei"
	cont "hingestellt <...>"

	para "<...> aber sie ist"
	line "wirklich zäh"
	cont "geworden!"

	para "Nimm dich in Acht"
	line "vor ihren Normal-"
	cont "#mon"

	done

GoldenrodGym_Trainer_1:
	trainer EVENT_GOLDENROD_GYM_TRAINER_1, BEAUTY, 3, .before_battle_text, .battle_won_text

	ctxt "Du musst wirklich"
	line "gut sein, um mich"
	cont "zu schlagen!"

	para "Gib alles!"

	done

.before_battle_text
	ctxt "Ich kann es kaum"
	line "erwarten, deine"
	para "süßen #mon zu"
	line "sehen!"

	para "Wir zeigen keine"
	line "Gnade!"

	done

.battle_won_text
	ctxt "Oh, war's das?"

	done

GoldenrodGym_Trainer_2:
	trainer EVENT_GOLDENROD_GYM_TRAINER_2, BEAUTY, 4, .before_battle_text, .battle_won_text

	ctxt "Normal-#mon"
	line "können alle Sorten"
	para "von Attacken durch"
	line "TMs lernen."

	done

.before_battle_text
	ctxt "Gib dein Bestes!"

	para "Ich werd's auch!"

	done

.battle_won_text
	ctxt "Oh, NEIN!"

	done

GoldenrodGymLeader:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_HOLDING_MAGNET_PASS
	sif true, then
		writetext .try_give_pass_again_text
		clearevent EVENT_WHITNEY_HOLDING_MAGNET_PASS
	selse
		checkflag ENGINE_PLAINBADGE
		sif true
			jumptext .already_battled_text
		writetext .before_battle_text
		winlosstext .battle_won_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer WHITNEY, 1
		startbattle
		reloadmapafterbattle
		playmapmusic
		opentext
		writetext .got_badge_text
		playwaitsfx SFX_TCG2_DIDDLY_5
		setflag ENGINE_PLAINBADGE
		playmusic MUSIC_GYM
		writetext .after_battle_text
	sendif
	giveitem MAGNET_PASS, 1
	opentext
	writetext .gave_magnet_pass_text
	playwaitsfx SFX_ITEM
	sif true
		jumptext .after_magnet_pass_text
	writetext .full_pack_text
	setevent EVENT_WHITNEY_HOLDING_MAGNET_PASS
	endtext

.before_battle_text
	ctxt "Hi!"

	para "Ich bin Bianka!"

	line "Ich wurde Trainer,"
	para "weil es angesagt"
	line "war!"

	para "Ich schätze, es"
	line "ist mehr als nur"
	cont "ein Hype für mich!"

	para "Ich bin über die"
	line "Jahre süßer und"
	para "stärker geworden,"
	line "also wenn du"
	para "meinen Orden haben"
	line "willst, musst du"
	cont "mich besiegen!"

	sdone

.battle_won_text
	ctxt "Heh, du warst gut!"

	para "Ich werde nicht"
	line "weinen, denn du"
	cont "hast es verdient!"

	done

.got_badge_text
	ctxt "<PLAYER> erhält den"
	line "Basisorden."

	done

.after_battle_text
	ctxt "Ich habe zwar"
	line "keine TMs, aber"
	cont "dafür das <...>"
	sdone

.gave_magnet_pass_text
	ctxt "Bianka schenkt dir"
	line "den Fahrschein."

	done

.after_magnet_pass_text
	ctxt "Mit dem Fahrschein"
	line "kannst du mit dem"
	para "Magnetzug zwischen"
	line "Johto und Kanto"
	para "fahren und zwar so"
	line "oft du willst!"

	done

.full_pack_text
	ctxt "Du scheinst keinen"
	line "Platz hierfür zu"
	cont "haben."

	para "Komm wieder, wenn"
	line "du Platz hast."

	done

.try_give_pass_again_text
	ctxt "Hast du nun Platz"
	line "im Beutel?"

	sdone
	
.already_battled_text
	ctxt "Ich bin so"
	line "glücklich, dass"
	para "ich die Chance"
	line "habe, gegen starke"
	para "Trainer wie dich"
	line "zu kämpfen!"

	done

GoldenrodGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $4, 1, GOLDENROD_CITY
	warp_def $f, $5, 1, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 13, 2, SIGNPOST_TEXT, GoldenrodGymSign
	signpost 13, 7, SIGNPOST_TEXT, GoldenrodGymSign

.ObjectEvents
	db 4
	person_event SPRITE_GYM_GUY, 13, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodGymGuide, -1
	person_event SPRITE_BUENA, 9, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GoldenrodGym_Trainer_1, -1
	person_event SPRITE_BUENA, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GoldenrodGym_Trainer_2, -1
	person_event SPRITE_WHITNEY, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodGymLeader, -1
