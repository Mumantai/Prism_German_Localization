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

	para "Als ich von dem"
	line "Höhleneinsturz ge-"
	para "hört habe, bin ich"
	line "sofort hergeeilt,"
	para "um nach dir zu"
	line "suchen!"
	
	para "Dann hae ich Prof."
	line "Ilk getroffen, der"
	para "die seismischen"
	line "Aktivitäten in"
	para "diesen Höhlen"
	line "untersucht hat."

	para "Er hat mir einen"
	line "jungen Trainer"
	para "beschrieben, der"
	line "auf Naljos Seite"
	para "des Gebirges ge-"
	line "fangen war, sich"
	para "mit einem kleinen"
	line "Larvitar ange-"
	para "freundet hat und"
	line "auf ein Abenteuer"
	para "in der Region auf-"
	line "gebrochen ist."

	para "Ich habe vor Stolz"
	line "nur so gestrotzt,"
	para "als ich erfahren"
	line "habe, dass du"
	cont "gemeint warst!"
	
	para "Mir war klar, dass"
	line "du das alleine"
	para "schaffen wirst und"
	line "auf dieser Reise"
	para "jedes Hindernis"
	line "überwinden kannst."

	para "Ich musste darauf"
	line "setzten, dass du"
	para "weise Entschei-"
	line "dungen triffst und"
	para "auch ohne meine"
	line "Hilfe auskommst."

	para "Deshalb werde ich"
	line "es dir hier auch"
	para "nicht einfach"
	line "machen. Diesen"
	para "Titel, musst du"
	line "dir verdienen!"
	sdone

.battle_won_text
	ctxt "Großartig!"

	para "Es gibt niemanden,"
	line "dem ich meinen"
	para "Titel lieber über-"
	line "lassen würde als"
	cont "dir, mein Kind!"
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

	para "Nun lass uns"
	line "direkt zur"
	cont "Ruhmeshalle gehen!"

	para "<...>"

	para "Es gibt noch was,"
	line "das du vorher"
	cont "machen möchtest?"

	para "<...> <...> <...>"

	para "Nunja <...>"
	line "OK."

	para "Alles, was du dir"
	line "wünschst."
	sdone

.family_gathering_text_1
	ctxt "Mama: Mensch, was"
	line "für ein Abenteuer!"

	para "Ich bin so froh,"
	line "dass du es gesund"
	para "und munter nach"
	line "Hause geschafft"
	cont "hast!"

	para "Dass du jetzt"
	line "sogar Champion"
	cont "bist <...>"

	para "Du bist genau wie"
	line "dein Vater!"
	sdone

.family_gathering_text_2
	ctxt "Siegfried: Ja,"
	line "<PLAYER> hat sehr"
	para "viel auf dieser"
	line "Reise gelernt."

	para "Ich habe meine"
	line "Abstammung aus"
	cont "Naljo vergessen."

	para "Ich war einfach zu"
	line "beschäftigt <...>"
	para "<...> Aber ich muss"
	line "alles Nötige tun,"
	para "um die Sicherheit"
	line "in Naljo wieder"
	cont "zu bewahren."

	para "Die Wächter kennen"
	line "das Naljo von"
	cont "heute noch nicht."

	para "Ich will nicht,"
	line "dass sie jemandem"
	cont "schaden."

	para "Ich kenne einige"
	line "Leute in Rijon,"
	para "die uns dabei"
	line "helfen könnten."
	sdone

.family_gathering_text_3
	ctxt "Mama: Das ist sehr"
	line "anständig von dir."

	para "Vielleicht hast du"
	line "dich ja wirklich"
	cont "verändert <...>"
	sdone

.give_pass_text
	ctxt "Siegfried: Wir"
	line "sollten uns bei"
	para "Gelegenheit in"
	line "Rijon treffen."

	para "Ich warte auf dich"
	line "beim Kraftwerk."

	para "Dieser Pass"
	line "erlaubt dir, den"
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

	para "Wir haben alle"
	line "Zeit der Welt <...>"
	sdone

.hall_of_fame_text
	ctxt "Alle Trainer, die"
	line "die Ehre haben,"
	para "sich Champion der"
	line "Rijon-Liga nennen"
	para "zu dürfen, sind in"
	line "diesem Computer"
	cont "gespeichert."

	para "Nun ist es an der"
	line "Zeit, dass du und"
	para "deine #mon sich"
	line "ebenfalls in den"
	para "Annalen der Rijon-"
	line "Liga verewigen!"
	done

RijonLeagueLance_MapEventHeader:: db 0, 0

.Warps: db 1
	dummy_warp 19, 3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LANCE, 3, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RijonLeagueLance_Lance, -1
