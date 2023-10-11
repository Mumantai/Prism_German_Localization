RijonLeagueLance_MapScriptHeader:
 ;trigger count
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
	dw EVENT_MEW

.lanceWalksUp
	step_up
	step_up
	step_up
	step_up
	step_left
	step_end

.before_battle_text
	ctxt "My child!"

	para "How I have missed"
	line "you."

	para "When I heard about"
	line "the cave in, I"
	para "rushed to clear"
	line "all the under-"
	para "ground pathways to"
	line "search for you."

	para "I eventually"
	line "stumbled upon"
	para "Professor Ilk, who"
	line "had been studying"
	para "the strange seis-"
	line "mic activities"
	para "within the very"
	line "same caves!"

	para "He described to me"
	line "a young Trainer"
	para "who'd been trapped"
	line "on Naljo's side of"
	para "the mountains that"
	line "befriended a tiny"
	para "Larvitar and star-"
	line "ted up an advent-"
	cont "ure in the region."

	para "When I discovered"
	line "it was you, my"
	para "heart swelled with"
	line "pride!"

	para "I trusted that you"
	line "alone would"
	para "survive and"
	line "overcome whatever"
	para "obstacles lay"
	line "before you."

	para "I had to trust"
	line "that you alone"
	para "would make wise"
	line "decisions, without"
	para "needing my"
	line "guidance."

	para "Now that you've"
	line "come to challenge"
	para "me for my title, I"
	line "will do all I can"
	para "to make sure that"
	line "you earn this"
	cont "honor."
	sdone

.battle_won_text
	ctxt "Amazing!"

	para "There is no one I'd"
	line "rather relinquish"
	para "my title to than"
	line "to you!"
	done

.after_battle_text
	ctxt "Your #mon"
	line "battle in a way"
	para "where they antic-"
	line "ipate all commands"
	para "you make while"
	line "trusting your"
	para "ability to read"
	line "the battlefield."

	para "Your potential is"
	line "limitless, and it"
	para "will continue to"
	line "grow as you and"
	para "your #mon grow"
	line "old together."

	para "To think you've"
	line "defeated your old"
	para "man at such a"
	line "young age!"

	para "Let's head to the"
	line "Hall of Fame room"
	cont "right away!"

	para "<...>"

	para "There's something"
	line "else you'd like to"
	cont "do first?"

	para "<...><...><...>"

	para "Well<...>"
	line "OK."

	para "Anything for you."
	sdone

.family_gathering_text_1
	ctxt "Mom: My! What an"
	line "adventure!"

	para "I'm relieved that"
	line "you're back safe"
	cont "and sound."

	para "And becoming the"
	line "Rijon Champion<...>"

	para "You're just like"
	line "your father!"
	sdone

.family_gathering_text_2
	ctxt "Lance: Yes,"
	line "<PLAYER> learned a"
	para "lot on that"
	line "adventure."

	para "I'd forgotten all"
	line "about my Naljo"
	cont "ancestry."

	para "I've just been so"
	line "busy<...>"

	para "<...>but I need to do"
	line "what I can to keep"
	cont "Naljo safe."

	para "The guardians are"
	line "still experiencing"
	para "an unfamiliar"
	line "Naljo."

	para "I don't want them"
	line "to harm anyone."

	para "I know some people"
	line "in Rijon who may"
	para "be able to help"
	line "us."
	sdone

.family_gathering_text_3
	ctxt "Mom: That's very"
	line "noble of you."

	para "Maybe you've"
	line "changed after all."
	sdone

.give_pass_text
	ctxt "Lance: Let's meet"
	line "up in Rijon when"
	para "you get the"
	line "chance."

	para "I'll be at the"
	line "Power Plant."

	para "This pass will let"
	line "you take the"
	cont "tunnel to Rijon."
	sdone

.family_gathering_text_end
	ctxt "Lance: <PLAYER>."

	para "Just let me know"
	line "when you want to"
	para "visit the Hall of"
	line "Fame room."

	para "But I can tell<...>"

	para "<...>that you're not in"
	line "any rush."

	para "No worries."

	para "We have all the"
	line "time in the world<...>"
	sdone

.hall_of_fame_text
	ctxt "All the Trainers"
	line "who have earned"
	para "the honor to be"
	line "Rijon's Champion"
	para "have been entered"
	line "in this computer."

	para "Now you, my child,"
	line "will immortalize"
	para "yourself and the"
	line "#mon who have"
	para "fought by your"
	line "side in the"
	para "history of Rijon's"
	line "Pokemon League."
	done

RijonLeagueLance_MapEventHeader:: db 0, 0

.Warps: db 1
	dummy_warp 19, 3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LANCE, 3, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RijonLeagueLance_Lance, -1
