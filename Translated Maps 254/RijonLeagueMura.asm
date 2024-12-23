RijonLeagueMura_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueMuraStatue:
	jumptext .text

.text
	ctxt "Eine Statue von"
	line "Muras Despotar!"
	done

RijonLeagueMura_Mura:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer MURA, 2
	selse
		loadtrainer MURA, 1
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
	ctxt "Wer ist da? Ein"
	para "Herausforderer?"
	para "Damit habe ich"
	line "nicht gerechnet."
	para "Normalerweise"
	line "besiegt Sora"
	para "jeden, oder die"
	line "Leute schlafen"
	para "während Daichis"
	line "Meditationskurs"
	cont "ein."
	para "Aber genau darum"
	line "geht es beim"
	para "Trainerdasein: Das"
	line "Unerwartete zu"
	para "erwarten und sich"
	line "darauf"
	cont "einzustellen!"
	para "Ein Trainer"
	line "muss wissen,"
	para "wann es Zeit"
	line "ist, zum"
	para "finalen Schlag"
	line "auszuholen, und"
	para "wann er sich"
	line "zurückhalten"
	para "sollte, um"
	line "seine #mon vor"
	para "Verletzungen zu"
	line "schützen."
	para "Als ich den"
	line "Champ"
	para "herausgefordert"
	line "habe, konnte"
	para "ich mich nicht"
	line "an sein"
	para "einzigartiges"
	line "Team"
	para "herausragender"
	line "#mon anpassen."
	para "Meine Unfähigkeit,"
	line "meine Strategie zu"
	para "ändern, hat"
	line "schließlich meine"
	para "Niederlage"
	line "besiegelt."
	para "Mal sehen, ob du"
	line "das gewisse Etwas"
	cont "mitbringst!"
	sdone

.battle_won_text
	ctxt "Unglaublich <...>"
	para "Du kämpfst genau"
	line "wie er!"
	para "Du hast alles,"
	line "was einen wahren"
	para "Champion ausmacht!"
	done

.after_battle_text
	ctxt "Bevor du in den"
	line "nächsten Raum"
	para "gehst, nimm dir"
	line "die Zeit, um über"
	para "dich und deine"
	line "Reise bis hierhin"
	cont "nachzudenken."
	para "Du bist nicht mehr"
	line "die Person, die du"
	para "warst, als du"
	line "dieses Abenteuer"
	cont "gestartet hast." 
	para "Die Prüfungen der"
	line "Top Vier haben"
	para "gezeigt, dass du"
	line "alle Qualitäten"
	para "eines Champions"
	line "in dir trägst!"
	para "Du hast Disziplin,"
	line "du hast Stärke, du"
	para "hast Balance und"
	line "du kannst dich"
	para "jeder Situation"
	line "anpassen!"
	sdone

RijonLeagueMura_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $3, $a, 1, RIJON_LEAGUE_LANCE
	warp_def $3, $b, 1, RIJON_LEAGUE_LANCE
	dummy_warp $9, $5

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 5, 7, SIGNPOST_READ, RijonLeagueMuraStatue

	;people-events
	db 1
	person_event SPRITE_MURA, 5, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RijonLeagueMura_Mura, -1