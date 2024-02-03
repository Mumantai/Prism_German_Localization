SilphCo_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilphCoWorker:
	ctxt "Faulenzen ist"
	line "schlecht. Ich"
	para "liebe die Arbeit!"
	done

SilphCoSecurityOfficer:
	ctxt "Entschuldigung,"
	line "ich kann dich hier"
	cont "nicht hochlassen."
	done

SilphCoBasementGuard:
	ctxt "Du darfst hier "
	line "nicht runter."
	done

SilphCoReceptionist:
	checkevent EVENT_MET_BLUE
	sif true
		jumptext .generic_welcome_text
	setevent EVENT_SILPH_WORKER_NOT_UPSTAIRS
	setevent EVENT_MET_BLUE
	showtext .first_welcome_text
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 32
	appear 6
	applymovement 6, .blue_appears
	spriteface 6, LEFT
	showtext .blue_introduction_text
	disappear 7
	follow 6, PLAYER
	applymovement 6, .blue_chases_after_employee
	stopfollow
	warpfacing UP, SILPH_CO, 7, 39
	showtext .master_ball_project_explanation_text
	showemote EMOTE_QUESTION, 4, 32
	setevent EVENT_BLUE_NOT_ON_FIRST_FLOOR
	setevent EVENT_SEEKING_OUT_SILPH_WORKER
	spriteface PLAYER, LEFT
	spriteface 4, RIGHT
	jumptext .after_employee_runs_away_text

.blue_appears
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

.blue_chases_after_employee
	step_right
	step_right
	step_right
	step_up
	rept 7
		step_right
	endr
	step_up
	step_up
	step_up
	step_end

.generic_welcome_text
	ctxt "Willkommen bei"
	line "der Silph Co."
	done

.first_welcome_text
	ctxt "Willkommen bei der"
	line "Silph Co."
	para "Leider bieten wir"
	line "heute keine"
	cont "Führungen an."
	para "Ich muss Sie also"
	line "bitten zu <...>"
	para "???: Warte, geh"
	para "nicht!"
	sdone

.blue_introduction_text
	ctxt "Erlaube mir, mich"
	line "vorzustellen <...>"
	para "Mein Name ist"
	line "Herr Eich."
	para "Ich habe bereits"
	line "von dir gehört <...>"
	para "Dein Vater ist"
	line "Siegfried, oder?"
	para "Nachdem ich gegen"
	line "ihn gekämpft habe,"
	para "war ich für kurze"
	line "Zeit Champion. Bis"
	para "dieser Rot kam."
	para "Seitdem sind"
	line "Kämpfe für mich"
	cont "Nebensache."
	para "Heute, liegt mein"
	line "Interesse an der"
	para "Entwicklung"
	line "umweltfreundlicher"
	cont "Projekte."
	para "Ich habe in Kalos"
	line "studiert, und als"
	para "ich zurückgekommen"
	line "bin, hat man mir"
	para "diese Stelle"
	line "angeboten."
	para "Mein Opa hat wohl"
	line "seine Beziehungen"
	cont "spielen lassen."
	para "Komm, lass mich"
	line "dir mein neuestes"
	cont "Projekt zeigen!"
	sdone

.master_ball_project_explanation_text
	ctxt "Wir haben etliche"
	line "Prototypen"
	para "durchlaufen,"
	line "bis wir endlich"
	para "den perfekten"
	line "#ball"
	cont "entwickelt haben."
	para "Als ich das"
	line "Unternehmen"
	para "übernommen habe,"
	line "habe ich es"
	para "umweltfreundlich"
	line "gemacht."
	para "Leider hat das die"
	line "Serienproduktion"
	para "des Meisterballs"
	line "verzögert."
	para "Ich denke jedoch,"
	line "dass wir endlich"
	cont "bereit sind!"
	para "Wir haben die"
	line "erste"
	para "Verkaufsversion"
	line "fertig und <...>"
	sdone

.after_employee_runs_away_text
	ctxt "Warte <...>"
	para "Das stimmt nicht."
	para "Es fehlt immer"
	line "noch ein Chip."
	para "Der dafür"
	line "zuständige"
	para "Mitarbeiter, hat"
	line "gesagt, es wäre"
	cont "schon erledigt!"
	para "<PLAYER>, richtig?"
	para "Es tut mir Leid,"
	line "aber könntest du"
	cont "ihn bitte suchen?"
	para "Er ist vermutlich"
	line "irgendwo in"
	cont "Saffronia City."
	para "Keine Sorge. Dein"
	line "Aufwand soll sich"
	cont "lohnen!"
	done

SilphCoBlue:
	faceplayer
	opentext
	checkevent EVENT_WON_AGAINST_BLUE
	sif true
		jumptext .already_battled_text
	checkevent EVENT_APPROACHED_SILPH_WORKER
	sif false
		jumptext .please_find_guy_text
	writetext .want_to_battle_text
	yesorno
	sif false
		closetextend
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	setevent EVENT_WON_AGAINST_BLUE
	jumptext .after_battle_text

.already_battled_text
	ctxt "Nochmals vielen"
	line "Dank für diesen"
	cont "tollen Kampf!"
	para "Ich muss meine"
	line "Fähigkeiten wohl"
	cont "etwas verfeinern."
	para "Ich wollte schon"
	line "immer den"
	para "Kampfbaum in Alola"
	line "besuchen."
	para "Ich könnte dort "
	line "alle möglichen"
	para "Trainer heraus-"
	line "fordern!"
	done

.want_to_battle_text
	ctxt "Oh, hey, bist du "
	line "bereit für einen "
	cont "Kampf?"
	done

.please_find_guy_text
	ctxt "Bitte finde diesen"
	line "Kerl. Wir müssen"
	cont "fertig werden!"
	done

.before_battle_text
	ctxt "Gehen wir's an!"
	sdone

.battle_won_text
	ctxt "Wow!"
	para "Du bist wirklich"
	line "außerordentlich!"
	done

.after_battle_text
	ctxt "Du bist wirklich"
	line "stark und wie du"
	para "deine #mon"
	line "behandelst, ist"
	cont "mitreißend."
	para "Wenn du möchtest,"
	line "gewähre ich dir"
	cont "Zugang zum Keller."
	para "Dort bauen wir die"
	line "Aprokokos an, aus"
	para "denen wir die"
	line "Meisterbälle"
	cont "herstellen."
	para "Nur die aller"
	line "erfahrensten"
	para "Ballmacher, haben"
	line "überhaupt die"
	para "Chance, sich an"
	line "einem Meisterball"
	cont "zu versuchen."
	para "Diese Art Aprikoko"
	line "gilt als fast"
	para "ausgestorben."
	line "Deshalb müssen wir"
	para "aufpassen, dass"
	line "nur vertrauens-"
	para "würdige Personen"
	line "mit ihnen umgehen."
	done

SilphCo_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 7
	warp_def $7, $2, 8, SAFFRON_CITY
	warp_def $7, $3, 8, SAFFRON_CITY
	warp_def $0, $e, 4, SILPH_CO
	warp_def $e, $d, 3, SILPH_CO
	warp_def $e, $b, 6, SILPH_CO
	warp_def $20, $b, 5, SILPH_CO
	warp_def $6, $f, 1, SILPH_CO_B1F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 7
	person_event SPRITE_YOUNGSTER, 39, 8, $7, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphCoWorker, EVENT_SILPH_WORKER_NOT_UPSTAIRS
	person_event SPRITE_OFFICER, 32, 13, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SilphCoSecurityOfficer, -1
	person_event SPRITE_BLUE, 39, 6, $7, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SilphCoBlue, -1
	person_event SPRITE_RECEPTIONIST, 2, 3, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SilphCoReceptionist, -1
	person_event SPRITE_BLUE, 3, 8, $6, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_NOT_ON_FIRST_FLOOR
	person_event SPRITE_OFFICER,  1, 14, $2, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphCoSecurityOfficer, EVENT_SEEKING_OUT_SILPH_WORKER
	person_event SPRITE_OFFICER, 6, 15, $2, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphCoBasementGuard, EVENT_WON_AGAINST_BLUE