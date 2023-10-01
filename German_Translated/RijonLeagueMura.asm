RijonLeagueMura_MapScriptHeader;trigger count
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
	line "Herausforderer?"

	para "Damit habe ich"
	line "nicht gerechnet." 

	para "Normalerweise,"
	line "werden alle von"
	para "Sora besiegt oder"
	line "schlafen während"
	para "Daichis Medita-"
	line "tionskurs ein."
	
	para "Aber darum geht's"
	line "beim Trainersein!"

	para "Das Unerwartete"
	line "erwarten und sich"
	cont "daran anzupassen!"

	para "Ein Trainer muss"
	line "wissen, wann er"
	para "zum finalen Schlag"
	line "ansetzt und wann"
	para "er sich zurückhält"
	line "und seine #mon"
	para "vor Verletzungen"
	line "schützt."
	
	para "Als ich den Champ"
	line "herausgefordert"
	para "habe, konnte ich"
	line "mich nicht an sein"
	para "einzigartiges Team"
	line "herausragender Po-"
	cont "kémon anpassen."
	
	para "Meine Unfähigkeit,"
	line "meine Strategie zu"
	para "ändern, hat meine"
	line "Niederlage letzt-"
	cont "endlich besiegelt."

	para "Mal schauen, ob du"
	line "das gewisse Etwas"
	cont "hast!"
	sdone

.battle_won_text
	ctxt "Unglaublich <...>"

	para "Du kämpfst genau"
	line "wie er!"

	para "Du hast alles, was"
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

RijonLeagueMura_MapEventHeader ;filler
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
