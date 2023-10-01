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
	ctxt "Der Weg, den wir"
	line "beschreiten, wurde"
	para "schon von vielen"
	line "vor uns gegangen."

	para "Schon vor uns gab"
	line "es Herausforderer"
	para "und Champions, und"
	line "wenn wir nicht"
	para "mehr sind, wird es"
	line "weitere geben."
	
	para "Unsere Existenz"
	line "wirkt unbedeutend"
	para "im Vergleich zu"
	line "dem schier endlo-"
	para "sen Weg, den wir "
	line "bestreiten."

	para "Beständig wie der"
	line "Boden zu sein,"
	para "bedeutet ewig zu"
	line "sein."

	para "Beständig zu sein"
	line "bedeutet, die"
	para "Natur unserer ver-"
	line "gänglichen Exis-"
	para "tenz zu verändern;"
	line "und um das zu tun,"
	para "müssen zeitliche"
	line "Wesen wie du und"
	para "ich die Schönheit"
	line "der Gegenwart zu"
	cont "schätzen wissen."

	para "Erde dich in"
	line "diesem Moment!"
	cont "Schwanke nich!"
	sdone

.battle_won_text
	ctxt "Bodenständig zu"
	line "sein, heißt aus-"
	para "geglichen zu sein,"
	line "und ausgeglichen"
	para "zu sein, heißt den"
	line "Unterschied zu"
	para "kennen, zwischen"
	line "rücksichtsloser"
	para "Gewalt und"
	line "der nötigen"
	para "Beherrschung, um"
	line "allen Widrigkeiten"
	cont "zu widerstehen."
	done

.after_battle_text
	ctxt "Vor dir liegt nur"
	line "noch ein weiterer"
	para "Gegner, bevor du"
	line "endlich um den"
	para "Titel des Champion"
	line "antreten kannst."

	para "Ich wünsche dir"
	line "alles Gute."
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
