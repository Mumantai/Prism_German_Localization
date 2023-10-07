IlksLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

IlksLabBookshelfFortran:
	ctxt "<PLAYER> opened a"
	line "book on the very"
	cont "top shelf<...>"

	para "<``>Best Fortran"
	line "Practices<''>"
	done

IlksLabBookshelfKalos:
	ctxt "<PLAYER> opened a"
	line "random book<...>"

	para "<``>Why not study"
	line "abroad in Kalos?<''>"
	done

IlksLabBookshelfFairyTales:
	ctxt "<PLAYER> found an"
	line "old book, covered"
	cont "thick in dust<...>"

	para "<``>Naljo Fairy"
	line "Tales - featuring"
	cont "Varaneous<''>"
	done

IlksLabBookshelfSpeakNormally:
	ctxt "<PLAYER> opened a"
	line "book that looked"
	cont "well used<...>"

	para "<``>How to speak"
	line "normally and not"
	cont "annoy others<''>"
	done

IlksLabComputer:
	jumptext .text

.text
	ctxt "A search engine is"
	line "shown."

	para "It looks like the"
	line "professor was"
	para "searching for his"
	line "own name over and"
	cont "over again."
	done

IlksLabProfIlk:
	checkevent EVENT_MET_ILK_PRE
	sif false, then
		setevent EVENT_MET_ILK_PRE
		setevent EVENT_CAPER_SHOVELING_SNOW
		showtext .initial_self_speech
		pause 16
		showemote EMOTE_SHOCK, $2, 16
		pause 16
		jumptextfaceplayer .first_encounter_text
	sendif
	faceplayer
	opentext
	checkevent EVENT_RIVAL_ROUTE_69
	sif false
		jumptext .waiting_for_brother_text
	checkevent EVENT_MET_ILK
	sif false, then
		writetext .after_saving_brother_text
		setflag ENGINE_POKEDEX
		writetext .got_pokedex_text
		playwaitsfx SFX_DEX_FANFARE_230_PLUS
		waitbutton
		setevent EVENT_MET_ILK
		clearevent EVENT_NO_POKEDEX_YET
		jumptext .pokedex_explanation_text
	sendif
	; if no Electron Badge, the player does not have Fly either, so the Electron Badge check is redundant
	checkevent EVENT_GOT_HM02
	sif false
		jumptext IlksLab_HowsMyLarvitarText
	; after Electron Badge
	checkevent EVENT_RIJON_LEAGUE_WON
	sif true
		jumptext .became_champion_text
	checkevent EVENT_ILK_EARTHQUAKE
	sif true
		jumptext .already_explained_earthquakes_text
	setevent EVENT_ILK_EARTHQUAKE
	jumptext .earthquake_explanation_text

.initial_self_speech
	ctxt "<...>"

	para "<...>Hm, yes<...>"

	para "<...>Yes, that"
	line "makes sense<...>"

	para "I should have a"
	line "book about Naljo"
	cont "lore somewhere<...>"
	sdone

.first_encounter_text
	ctxt "<...>!"

	para "What, what is it?"

	para "Who are you?"

	para "Who am I?"

	para "Why, I am"
	line "Professor Ilk!"

	para "I'm the region's"
	line "leading #mon"
	cont "researcher!"

	para "<...>"

	para "Oh, that's my"
	line "Larvitar!"

	para "I couldn't find it"
	line "anywhere."

	para "Strange; Larvitar"
	line "seems to be very"
	cont "fond of you."

	para "<...>"

	para "<...>I'd hate to"
	line "ask, but<...>"

	para "<...>could you do me"
	line "a favor?"

	para "Please check on my"
	line "brother."

	para "He isn't answering"
	line "his phone, so I'm"
	cont "worried."

	para "He lives north of"
	line "here, on Route 69."

	para "Take my Larvitar"
	line "with you just to"
	cont "be safe."
	done

.waiting_for_brother_text
	ctxt "Please make sure"
	line "my brother is"
	cont "safe."

	para "He is on Route 69,"
	line "north of here."
	done

.after_saving_brother_text
	ctxt "<PLAYER>!"

	para "Thank you for"
	line "saving my brother!"

	para "He called me and"
	line "couldn't stop"
	para "talking about how"
	line "you used my"
	para "Larvitar to defeat"
	line "that crazy kid!"

	para "You know what?"

	para "Keep my Larvitar."

	para "In fact, you"
	line "should take this"
	cont "handy invention."
	prompt

.got_pokedex_text
	ctxt "<PLAYER> got"
	line "a #dex!"
	done

.pokedex_explanation_text
	ctxt "This is a #dex."

	para "It records all the"
	line "#mon you've seen"
	cont "and caught!"

	para "Build a team and"
	line "see if you can"
	para "continue your"
	line "father's legacy!"
	done

.became_champion_text
	ctxt "<PLAYER>!"

	para "We heard the good"
	line "news!"

	para "You're the new"
	line "champion of the"
	cont "Rijon League!"

	para "I'm not surprised"
	line "at all."

	para "Like I said,"
	line "#mon training"
	para "talent resides in"
	line "your bloodline!"

	para "If you're looking"
	line "for more battles,"
	para "you should try"
	line "visiting Rijon."

	para "There's a tunnel"
	line "north of here that"
	cont "leads to Rijon."

	para "Best of luck, my"
	line "friend!"
	done

.earthquake_explanation_text
	ctxt "Oh, <PLAYER>!"

	para "It's been a while"
	line "since we first"
	cont "met, hasn't it?"

	para "There's something I"
	line "do need to talk to"
	cont "you about."

	para "There's been a"
	line "recent surge of"
	cont "bad earthquakes."

	para "According to the"
	line "Hayward Lab of"
	para "Paleoseismology,"
	line "these earthquakes"
	cont "aren't authentic."

	para "The first strange"
	line "earthquake hit the"
	para "Johto location of"
	line "Goldenrod City;"
	para "wasn't it around"
	line "five years ago?"

	para "This is the same"
	line "kind of quake that"
	para "trapped you in"
	line "Naljo<...>"

	para "My only lead is an"
	line "underground city,"
	para "full of miners and"
	line "geologists."

	para "It might be linked"
	line "to the earthquakes"
	cont "terrorising Naljo."

	para "You can find the"
	line "underground city"
	para "somewhere south of"
	line "Torenia City."

	para "I need you to go"
	line "down there, and"
	para "investigate these"
	line "artificial quakes."

	para "<...>"

	para "Oh, you went to"
	line "Torenia City very"
	cont "recently?"

	para "<...>"

	para "I see."

	para "I'll let the guard"
	line "know the plan and"
	cont "he'll clear you."
	done

.already_explained_earthquakes_text
	ctxt "Please look into"
	line "the disturbances"
	para "going on in the"
	line "underground city."
	done

IlksLab_HowsMyLarvitarText:
	ctxt "How is my old"
	line "Larvitar doing?"

	para "I hope it's well!"
	done

IlksLabPhillip:
	checkevent EVENT_MET_ILK_PRE
	sif false
		jumptextfaceplayer .not_met_ilk_yet_text
	checkevent EVENT_RIVAL_ROUTE_69
	sif false
		jumptextfaceplayer .waiting_for_brother_in_law_text
	checkevent EVENT_MET_ILK
	sif false
		jumptextfaceplayer .after_saving_brother_in_law_text
	checkevent EVENT_RIJON_LEAGUE_WON
	sif true
		jumptextfaceplayer .after_beating_league_text
	jumptextfaceplayer .after_receiving_dex_text

.not_met_ilk_yet_text
	ctxt "Oh, hello there."

	para "Can I help you?"

	para "<...>"

	para "I assume you are"
	line "here to see the"
	cont "professor."

	para "He's in the other"
	line "room right now."
	done

.waiting_for_brother_in_law_text
	ctxt "He wants you to go"
	line "where?"

	para "Don't take this the"
	line "wrong way, but I"
	para "don't think sending"
	line "a kid you've only"
	para "just met to go"
	line "visit a relative"
	cont "is that smart."

	para "My brother-in-law"
	line "never answers his"
	para "phone. Why is it"
	line "suddenly such a"
	cont "big deal now?"
	done

.after_saving_brother_in_law_text
	ctxt "What?"

	para "That's terrible!"

	para "I knew he shouldn't"
	line "have moved out of"
	para "town to the back"
	line "and beyond."

	para "You should let the"
	line "professor know."
	done

.after_receiving_dex_text
	ctxt "I know my husband"
	line "can be difficult"
	para "to talk to at"
	line "times."

	para "But he is really"
	line "kind and caring"
	cont "deep down."

	para "He believes in"
	line "people."

	para "He's put his faith"
	line "in you."

	para "Please, do him"
	line "proud."
	done

.after_beating_league_text
	ctxt "We heard that you"
	line "won at the Rijon"
	cont "League!"

	para "<PLAYER>, my"
	line "congratulations."

	para "Hector<...> I mean, my"
	line "husband was so"
	para "giddy when he"
	line "heard the news."

	para "You really did him"
	line "proud."

	para "You've no idea how"
	line "nice it was to see"
	cont "him so happy."

	para "Thank you so much!"
	done

IlksLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $4, 5, CAPER_RIDGE
	warp_def $b, $5, 5, CAPER_RIDGE

.CoordEvents
	db 0

.BGEvents
	db 8
	signpost 1, 6, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 1, 7, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 1, 8, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 9, 6, SIGNPOST_TEXT, IlksLabBookshelfFortran
	signpost 9, 7, SIGNPOST_TEXT, IlksLabBookshelfKalos
	signpost 9, 8, SIGNPOST_TEXT, IlksLabBookshelfFairyTales
	signpost 9, 9, SIGNPOST_TEXT, IlksLabBookshelfSpeakNormally
	signpost 2, 4, SIGNPOST_UP, IlksLabComputer

.ObjectEvents
	db 3
	person_event SPRITE_ILK, 2, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlksLabProfIlk, EVENT_MET_ILK
	person_event SPRITE_ILK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlksLabProfIlk, EVENT_NO_POKEDEX_YET
	person_event SPRITE_R_TAMER,  9,  1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, IlksLabPhillip, -1
