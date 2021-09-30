IlksLab_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

IlksLabBookshelfFortran:
	ctxt "<PLAYER> opened a"
	line "book on the very"
	cont "top shelf<...>"

	para "'Best Fortran"
	line "Practices'"
	done

IlksLabBookshelfKalos:
	ctxt "<PLAYER> opened a"
	line "random book<...>"

	para "'Why not study"
	line "abroad in Kalos?'"
	done

IlksLabBookshelfFairyTales:
	ctxt "<PLAYER> found an"
	line "old book, covered"
	cont "thick in dust<...>"

	para "'Naljo Fairy"
	line "Tales - featuring"
	cont "Varaneous'"
	done

IlksLabBookshelfSpeakNormally:
	ctxt "<PLAYER> opened a"
	line "book that looked"
	cont "well used<...>"

	para "'How to speak"
	line "normally and"
	cont "not annoy others'"
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
	checkevent EVENT_GOT_HM02 ; if no electronbadge, the player does not have fly either, so the electronbadge check is redundant
	sif false
		jumptext IlksLab_HowsMyLarvitarText
; after electron badge
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

	para "I couldn't find"
	line "it anywhere."

	para "Strange, Larvitar"
	line "seems to be very"
	cont "fond of you."

	para "<...>"

	para "<...>I'd hate to"
	line "ask, but<...>"

	para "<...>could you do me"
	line "a favor?"

	para "Please check on"
	line "my brother."

	para "He isn't answering"
	line "his phone, so I'm"
	cont "worried."

	para "He lives north of"
	line "the city on"
	cont "Route 69."

	para "Bring my Larvitar"
	line "with you just to"
	cont "be safe."
	done

.waiting_for_brother_text
	ctxt "Please make sure"
	line "my brother is"
	cont "safe."

	para "He is on Route 69,"
	line "north of the city."
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
	cont "or caught!"

	para "Build a team and"
	line "see if you can"
	para "continue your"
	line "father's legacy!"
	done

.became_champion_text
	ctxt "<PLAYER>!"

	para "I heard the good"
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

	para "There's something"
	line "I do need to talk"
	cont "to you about."

	para "There's been a"
	line "recent surge of"
	cont "bad earthquakes."

	para "According to the"
	line "'Hayward Lab of"
	cont "Paleoseismology',"
	para "these earthquakes"
	line "aren't authentic."

	para "The first strange"
	line "earthquake hit the"
	cont "Johto location of"
	cont "Goldenrod City;"
	para "wasn't it around"
	line "five years ago?"

	para "This is the same"
	line "kind of quake that"
	para "trapped you in"
	line "Naljo<...>"

	para "My only lead is an"
	line "underground city,"
	para "full of miners"
	line "and geologists."

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
	line "Torenia City"
	cont "very recently?"

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

IlksLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $4, 5, CAPER_CITY
	warp_def $b, $5, 5, CAPER_CITY

.CoordEvents
	db 0

.BGEvents
	db 7
	signpost 1, 6, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 1, 7, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 1, 8, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 9, 6, SIGNPOST_TEXT, IlksLabBookshelfFortran
	signpost 9, 7, SIGNPOST_TEXT, IlksLabBookshelfKalos
	signpost 9, 8, SIGNPOST_TEXT, IlksLabBookshelfFairyTales
	signpost 9, 9, SIGNPOST_TEXT, IlksLabBookshelfSpeakNormally

.ObjectEvents
	db 2
	person_event SPRITE_ELM, 2, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlksLabProfIlk, EVENT_MET_ILK
	person_event SPRITE_ELM, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlksLabProfIlk, EVENT_NO_POKEDEX_YET
