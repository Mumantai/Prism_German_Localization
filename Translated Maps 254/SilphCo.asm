SilphCo_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilphCoWorker:
	ctxt "Faul sein ist"
	line "schlecht! Arbeit"
	cont "ist mein Leben!"
	done

SilphCoSecurityOfficer:
	ctxt "Entschuldigung, "
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
	ctxt "Willkommen bei "
	line "Silph Co."
	done

.first_welcome_text
	ctxt "Willkommen bei "
	line "Silph Co."
	para "Heute ist leider"
	line "kein Tag der "
	para "offenen Tür, gehen"
	line "Sie also<...>"
	para "???: Warte, geh"
	line "noch nicht!"
	sdone

.blue_introduction_text
	ctxt "Gestatten Sie mir,"
	line "mich vorzustellen."
	para "<...> Mein Name ist"
	line "Eich."
	cont "Professor Eich."
	para "Ich habe schon mal"
	line "von dir gehört <...> "
	para "Siegfried ist dein"
	line "Vater, oder?"
	para "Nachdem ich gegen "
	line "ihn gekämpft "
	para "hatte, wurde ich "
	line "für kurze Zeit der"
	para "Champion, bis mir "
	line "dieser Rot in die "
	cont "Quere kam."
	para "Während ich immer "
	line "noch nebenbei "
	para "kämpfe, "
	line "interessiere ich "
	para "mich mehr für die "
	line "Entwicklung "
	para "umweltfreundlicher "
	line "Projekte."
	para "Ich habe in Kalos "
	line "im Ausland "
	para "studiert und als "
	line "ich zurückkam, "
	para "wurde mir diese "
	line "Stelle angeboten."
	para "Gramps hatte "
	line "einige ziemlich "
	para "starke "
	line "Beziehungen!"
	para "Komm, lass mich "
	line "dir mein aktuelles"
	cont "Projekt zeigen."
	sdone

.master_ball_project_explanation_text
	ctxt "Wir haben mehrere "
	line "Prototypen "
	para "durchlaufen, "
	line "während wir "
	para "versucht haben, "
	line "den perfekten "
	para "#ball zu "
	line "entwickeln."
	para "Als ich übernahm, "
	line "machte ich das "
	para "Unternehmen "
	line "umweltfreundlich."
	para "Es verzögerte die "
	line "Verkaufsversion "
	cont "des Meisterballs."
	para "Ich denke jedoch, "
	line "dass wir endlich "
	cont "fertig sind!"
	para "Wir haben die "
	line "erste "
	para "Verkaufsversion "
	line "dieses Balls "
	para "fertiggestellt und"
	line "<...> "
	sdone

.after_employee_runs_away_text
	ctxt "Warte, <...> das ist "
	line "nicht richtig."
	para "Es fehlt ein Chip "
	line "<...> der "
	para "Verantwortliche "
	line "sagte, er hätte "
	cont "das schon getan!"
	para "<PLAYER>, oder?"
	line "Es tut mir leid, "
	para "aber kannst du ihn"
	line "bitte suchen?"
	para "Er ist "
	line "wahrscheinlich "
	para "irgendwo in "
	line "Saffronia City."
	para "Danke dir."
	line "Wenn Du ihn finden"
	para "kannst, lohnt es "
	line "sich vielleicht."
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
	ctxt "Nochmals vielen "
	line "Dank für diesen "
	cont "tollen Kampf!"
	para "Ich muss meine "
	line "Fähigkeiten "
	cont "verfeinern."
	para "Ich wollte schon "
	line "immer Alolas "
	para "Kampfturm "
	line "besuchen."
	para "Ich könnte dort "
	line "gegen alle "
	para "möglichen Trainer "
	line "trainieren!"
	done

.want_to_battle_text
	ctxt "Oh, hey, bist du "
	line "bereit für einen "
	cont "Kampf?"
	done

.please_find_guy_text
	ctxt "Bitte finde diesen"
	line "Kerl; es muss "
	cont "fertig werden!"
	done

.before_battle_text
	ctxt "Machen wir das!"
	sdone

.battle_won_text
	ctxt "Wow, du bist "
	line "wirklich etwas "
	cont "anderes!"
	done

.after_battle_text
	ctxt "Du bist wirklich "
	line "stark; Es ist sehr"
	para "edel, wie du dein "
	line "#mon "
	cont "behandelst."
	para "Wenn Du möchtest, "
	line "werde ich Dir den "
	para "Zugang zum Keller "
	line "gewähren."
	para "Dort bauen wir die"
	line "Aprikosen an, um "
	para "die Meisterbälle "
	line "herzustellen."
	para "Nur die "
	line "erfahrensten "
	para "Ballmacher können "
	line "überhaupt die "
	para "Chance haben, "
	line "Meisterbälle "
	cont "herzustellen."
	para "Der Obstbaum ist "
	line "fast ausgestorben,"
	para "daher müssen wir "
	line "sicherstellen, "
	para "dass nur "
	line "vertrauenswürdige "
	para "Personen damit "
	line "umgehen."
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