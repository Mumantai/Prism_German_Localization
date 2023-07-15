Route57Gym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route57GymInsideSign:
	ctxt "Normalo Arena"
	para "Leiter: Joe"
	done

Route57GymLeader:
	faceplayer
	opentext
	checkflag ENGINE_WHITEBADGE
	sif true
		jumptext .already_defeated_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL ;no pun intended
	loadtrainer JOE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_WHITEBADGE
	playmusic MUSIC_GYM
	writetext .after_badge_text
	givetm TM_HYPER_BEAM + RECEIVED_TM
	jumptext .after_TM_text

.before_battle_text
	ctxt "Hallo, mein Name"
	line "ist Joe, der"
	para "Leiter der Normalo"
	line "Arena in Rijon!"

	para "Ich bin so normal,"
	line "dass alle"
	para "anormalen Menschen"
	line "meine Arena"
	cont "verlassen haben."

	para "Dieser Ort gehört"
	line "jetzt ganz mir und"
	cont "ist sehr normal."

	para "Nun, bist Du"
	line "bereit für einen"
	cont "normalo Kampf?"

	sdone

.battle_won_text
	ctxt "Das ist unnormal!"

	para "Du störst meine"
	line "normalen "
	cont "Schwingungen!"

	para "Bitte, nimm diesen"
	line "Orden und "
	cont "verschwinde!"

	done

.received_badge_text
	ctxt "<PLAYER> erhält den"
	line "Normalo Orden."

	done

.after_badge_text
	ctxt "Nimm dir etwas"
	line "Normalität mit"
	cont "nach Hause!"

	sdone

.after_TM_text
	ctxt "TM15 ist Hyper"
	line "Strahl!"

	para "Ein starker"
	line "normalo Angriff!"

	done

.already_defeated_text
	ctxt "Ich verhalte mich"
	line "normal!"

	done

Route57Gym_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $13, $a, 2, ROUTE_57
	warp_def $13, $b, 2, ROUTE_57

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 17, 8, SIGNPOST_TEXT, Route57GymInsideSign
	signpost 17, 13, SIGNPOST_TEXT, Route57GymInsideSign

	;people-events
	db 1
	person_event SPRITE_BLAINE, 16, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route57GymLeader, -1
