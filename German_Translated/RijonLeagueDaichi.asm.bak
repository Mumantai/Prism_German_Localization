RijonLeagueDaichi_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueDaichi_Daichi:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer DAICHI, 2
	selse
		loadtrainer DAICHI, 1
	sendif
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	playsound SFX_JUMP_KICK
	applymovement 2, .vanish
	disappear 2
	end

.vanish
	teleport_from
	remove_person
	step_end

.before_battle_text
	ctxt "Auf diesem Boden"
	line "standen so viele,"
	para "die einst vor uns"
	line "gelebt haben."

	para "Es gab viele"
	line "Herausforderer und"
	para "Champions bevor es"
	line "uns beide gab und"
	para "auch nach uns wird"
	line "es weitere geben."

	para "Unsere Existenz"
	line "wirkt unbedeutend"
	para "im Vergleich zu"
	line "der Unendlichkeit"
	para "und der"
	line "Menschheits-"
	cont "geschichte."

	para "Um wie der Boden"
	line "unter unseren"
	para "Füßen ewig zu"
	line "leben, müssen wir"
	para "wie der Boden"
	line "sein."

	para "Ewig lebt, wer"
	line "hart wie der"
	para "Boden bleibt und"
	line "sein Leben in"
	para "vollen Zügen"
	line "genießt, ohne sich"
	para "von seinen"
	line "Problemen in die"
	para "Knie zwingen"
	line "zu lassen!"

	para "Deshalb bleibe"
	line "jetzt standhaft"
	para "wie ein Stein"
	line "und stell dich"
	cont "meiner Macht!"
	sdone

.battle_won_text
	ctxt "Bodenständig zu"
	line "bleiben, heißt"
	para "balanciert zu"
	line "bleiben und das"
	para "heißt zu"
	line "verstehen, dass"
	para "du diszipliniert"
	line "allen Problemen"
	para "entgegentreten"
	line "musst und dein"
	para "Leben so nehmen"
	line "musst, wie es"
	cont "nun mal ist."
	done

.after_battle_text
	ctxt "Du hast noch einen"
	line "weiteren Gegner"
	para "vor dir, bevor"
	line "du um den Titel"
	para "des #mon-"
	line "Meisters Kämpfen"
	cont "darfst."

	para "Viel Glück,"
	line "Trainer."
	sdone

RijonLeagueDaichi_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	dummy_warp $9, $2
	warp_def $1, $5, 3, RIJON_LEAGUE_MURA

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_DAICHI, 2, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RijonLeagueDaichi_Daichi, -1
