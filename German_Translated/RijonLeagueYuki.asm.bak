RijonLeagueYuki_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueYuki_Yuki:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer YUKI, 2
	selse
		loadtrainer YUKI, 1
	sendif
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	applymovement 2, .step_away
	disappear 2
	end

.step_away
	teleport_from
	remove_person
	step_end

.before_battle_text
	ctxt "Willkommen,"
	line "Trainer!"

	para "Was du auf deiner"
	line "Reise erlebt hast,"
	cont "ist einzigartig!"

	para "Jeder könnte sich"
	line "die Orden verdie-"
	para "nen und die Sene-"
	line "za-Höhlen durch-"
	para "queren, aber kei-"
	line "ner könnte es so,"
	cont "wie du es hast."

	para "Deine Art ist wie"
	line "die einer Schnee-"
	para "flocke <...> Keine"
	line "Schneeflocke in"
	para "diesem Universum"
	line "gleicht einer"
	cont "anderen <...>"
	para "Krass, oder?"
	para "So, wie du auch!"

	para "Ich bin Yuki, die"
	line "Meisterin aller"
	para "Eis-#mon,"
	line "Trainer, und auch"
	para "dein 1. Gegner"
	line "der Rijon-Liga."

	para "Gib dein Bestes!"
	sdone

.battle_won_text
	ctxt "Was fürn Weg, das"
	line "Eis zu brechen."
	done

.after_battle_text
	ctxt "Dadurch, dass du"
	line "meinen eisigen"
	para "Sturm überstanden"
	line "hast, hast du"
	para "bewiesen, dass du"
	line "standfest bist."

	para "Deshalb, schreite"
	line "voran in den"
	para "nächsten Raum, wo"
	line "dein nächster"
	para "Gegner schon auf"
	line "dich wartet."
	sdone

RijonLeagueYuki_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	dummy_warp $11, $2
	warp_def $5, $d, 1, RIJON_LEAGUE_SORA

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_YUKI, 8, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RijonLeagueYuki_Yuki, -1
