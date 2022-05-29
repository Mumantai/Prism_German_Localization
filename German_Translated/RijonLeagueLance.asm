RijonLeagueLance_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueLance_Lance:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer CHAMPION, 2
	selse
		loadtrainer CHAMPION, 1
	sendif
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .after_battle_text
	special FadeOutPalettes
	wait 20
	warpfacing UP, RIJON_LEAGUE_PARTY, 11, 7
	opentext
	writetext .family_gathering_text_1
	writetext .family_gathering_text_2
	writetext .family_gathering_text_3
	checkevent EVENT_RIJON_LEAGUE_WON
	sif false, then
		writetext .give_pass_text
		verbosegiveitem RIJON_PASS, 1
		setevent EVENT_RIJON_LEAGUE_WON
		waitbutton
	sendif
	showtext .family_gathering_text_end
	special FadeOutPalettes
	;reset legendary spawns
	checkcode VAR_BADGES
	sif =, 20, then
		;birds
		writebyte EVENTMONRESPAWN_ARTICUNO
.loop
		pushvar
		callasmf DoRespawnableEventMonFlagActionFromScript
		sif false, then
			pullvar
			sif =, EVENTMONRESPAWN_VARANEOUS, then
				special InitRoamMons
			selse
				addvar -1
				loadarray .EventMonRespawnEventFlagArray
				readarrayhalfword 0
				clearevent -1
			sendif
		sendif
		popvar
		addvar 1
		if_less_than NUM_EVENTMONRESPAWNS, .loop
	sendif
	special HealParty
	wait 30
	warpfacing UP, RIJON_LEAGUE_CHAMPION_ROOM, 5, 10
	follow 2, PLAYER
	applymovement 2, .lanceWalksUp
	opentext
	writetext .hall_of_fame_text
	writebyte 2
	special HealMachineAnim
	callasm RunHallOfFameFromScript
	end

.EventMonRespawnEventFlagArray:
	dw EVENT_PHANCERO
.EventMonRespawnEventFlagArrayEntrySizeEnd:
	dw EVENT_ARTICUNO
	dw EVENT_ZAPDOS
	dw EVENT_MOLTRES
	dw EVENT_FAMBACO
	dw EVENT_LIBABEEL
	dw EVENT_RAIWATO

.lanceWalksUp
	step_up
	step_up
	step_up
	step_up
	step_left
	step_end

.before_battle_text
	ctxt "Mein Kind!" 

	para "Wie sehr habe ich"
	line "dich vermisst." 

	para "Als ich hörte, was"
	line "damals in der"
	para "Höhle passierte,"
	line "kam ich so schnell"
	para "ich konnte und"
	line "suchte unter jedem"
	cont "Stein nach dir!"
	
	para "Da traf ich auf"
	line "Professor Ilk, der"
	para "in dieser Höhle"
	line "die seismischen"
	para "Aktivitäten"
	line "untersuchte."

	para "Er beschrieb mir"
	line "einen jungen"
	para "Trainer, welcher"
	line "auf der Naljo-"
	para "Seite des Berges"
	line "festsitzt und sich"
	para "mit einem Larvitar"
	line "befreundet hat, um"
	para "ein Abenteuer zu"
	line "erleben!"

	para "Ich wusste gleich,"
	line "dass du gemeint"
	para "warst und war so"
	line "stolz auf dich!" 

	para "Ich wusste, dass"
	line "du das alleine"
	para "schaffen wirst und"
	line "auf dieser Reise"
	para "an dir wachsen"
	line "wirst."

	para "Ich musste darauf"
	line "setzten, dass du"
	para "weise"
	line "Entscheidungen,"
	para "treffen kannst"
	line "ohne, dass ich"
	cont "dir helfen muss."

	para "Deshalb werde ich"
	line "es dir auch hier"
	para "nicht einfach"
	line "machen, damit du"
	para "dir diesen Titel"
	line "auch verdienst!"
	sdone

.battle_won_text
	ctxt "Großartig!"

	para "Es gibt niemanden,"
	line "bei dem ich mich"
	para "so freuen würde,"
	line "den Titel an ihn"
	cont "abzutreten!"
	done

.after_battle_text
	ctxt "Deine #mon"
	line "kämpfen an deiner"
	para "Seite mit einer"
	line "Zuneigung, wie ich"
	para "sie schon lange"
	line "nicht gesehen"
	cont "habe."

	para "Dein Potenzial ist"
	line "grenzenlos und du"
	para "wirst sogar noch"
	line "weiter wachsen!"

	para "Du hast deinen"
	line "alten Herren in so"
	para "einem jungen Alter"
	line "bezwungen!"

	para "Lass uns direkt"
	line "mal zur"
	cont "Ruhmeshalle gehen!"

	para "<...>"

	para "Gibt es noch was,"
	line "das du vorher"
	cont "machen möchtest?"

	para "<...> <...> <...>"

	para "Nunja <...>"
	line "OK."

	para "Alles, was du dir"
	line "wünschst."
	sdone

.family_gathering_text_1
	ctxt "Mom: Mein Kind!"
	line "Was für ein Weg!"

	para "Ich habe Tag und"
	line "Nacht gebetet,"
	para "dass du gesund"
	line "wieder nach Hause"
	cont "kommst!"

	para "Und eines Tages"
	line "Rijon-Champion"
	cont "wirst <...>"

	para "Du bist genau wie"
	line "dein Vater!"
	sdone

.family_gathering_text_2
	ctxt "Siegfried: Ja,"
	line "<PLAYER> hat sehr"
	para "viel auf dieser"
	line "Reise gelernt."

	para "Ich hatte meine"
	line "Abstammung aus"
	para "Naljo vergessen"
	line "gehabt."

	para "Ich war einfach zu"
	line "beschäftigt <...>"
	para "<...> Aber ich muss"
	line "alles dafür tun,"
	para "um Naljo in"
	line "Sicherheit zu"
	cont "bringen."

	para "Die Wächter kennen"
	line "das Naljo von"
	cont "heute noch nicht."

	para "Ich will nicht,"
	line "dass sie jemandem"
	cont "schaden."

	para "Ich kenne ein paar"
	line "in Rijon, die uns"
	para "hierbei helfen"
	line "könnten."
	sdone

.family_gathering_text_3
	ctxt "Mom: Das ist sehr"
	line "anständig von dir."

	para "Vielleicht hast du"
	line "dich ja echt"
	cont "verändert <...>"
	sdone

.give_pass_text
	ctxt "Siegfried: Treffen"
	line "wir uns bei Ge-"
	para "legenheit in der"
	line "Rijon-Region."

	para "Ich werde beim"
	line "Kraftwerk sein."

	para "Dieser Pass wird"
	line "uns gewähren, den"
	para "Tunnel nach Rijon"
	line "zu passieren."
	sdone

.family_gathering_text_end
	ctxt "Siegfried:"
	line "<PLAYER>."

	para "Sag mir bescheid,"
	line "wenn du die"
	para "Ruhmeshalle"
	line "betreten möchtest."

	para "Aber <...>"

	para "<...> keine Eile."

	para "Wir haben genug"
	line "Zeit <...>"
	sdone

.hall_of_fame_text
	ctxt "Alle Trainer, die"
	line "die Ehre haben,"
	para "sich Champion der"
	line "Rijon-Liga nennen"
	para "zu dürfen, sind in"
	line "diesem Computer"
	cont "gespeichert."

	para "Du und deine"
	line "#mon werden"
	para "jetzt in die"
	line "Geschichte"
	para "eingehen und von"
	line "Generationen nach"
	para "euch bewundert"
	line "werden."
	done

RijonLeagueLance_MapEventHeader:: db 0, 0

.Warps: db 1
	dummy_warp 19, 3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LANCE, 3, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RijonLeagueLance_Lance, -1
