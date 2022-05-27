IlksLab_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

IlksLabBookshelfFortran:
	ctxt "<PLAYER> liest"
	line "das Buch vom"
	cont "obersten Regal <...>"

	para "'Visual-Basic für"
	line "Dummies'"
	done

IlksLabBookshelfKalos:
	ctxt "<PLAYER> liest ein"
	line "zufälliges Buch <...>"

	para "'Auslandsstudium"
	line "gefällig?'"
	done

IlksLabBookshelfFairyTales:
	ctxt "<PLAYER> fand ein"
	line "altes Buch, stark"
	cont "verstaubt<...>"

	para "'Naljo Märchen"
	line "von Varaneous'"
	done

IlksLabBookshelfSpeakNormally:
	ctxt "<PLAYER> liest ein"
	line "Buch, welches"
	cont "benutzt wirkt <...>"

	para "'Wie redet man"
	line "normal, ohne an-"
	cont "dere zu nerven?'"
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

	para "<...> Hm, ja <...>"

	para "<...> Ja, das"
	line "macht Sinn <...>"

	para "Es sollte hier ein"
	line "Buch über Naljo"
	cont "rumliegen <...>"
	sdone

.first_encounter_text
	ctxt "<...>!"

	para "Was, was ist das?"

	para "Wer bist du?"

	para "Wer ICH BIN?"

	para "Professor Ilk"
	line "natürlich!"

	para "Ich bin der füh-"
	line "rende #mon-"
	cont "Forscher!"

	para "<...>"

	para "Oh, das ist mein"
	line "Larvitar!"

	para "Ich konnte es"
	line "nirgends finden."

	para "Komisch, Larvitar"
	line "scheint dich sehr"
	cont "zu mögen."

	para "<...>"

	para "<...> Ich frage"
	line "ungerne, aber <...>"

	para "<...> tust du mir"
	line "einen Gefallen?"

	para "Schaust du nach"
	line "meinem Bruder?"

	para "Er geht nicht an"
	line "sein Telefon <...>"

	para "Er lebt nördlich"
	line "von hier auf"
	cont "Route 69."

	para "Nimm mein Larvitar"
	line "mit, damit du"
	cont "sicher bist."
	done

.waiting_for_brother_text
	ctxt "Bitte schau nach"
	line "meinem Bruder."

	para "Er ist in Route 69"
	line "nördlich von hier."
	done

.after_saving_brother_text
	ctxt "<PLAYER>!"

	para "Danke, dass du"
	line "meinen Bruder ge-"
	cont "rettet hast!"

	para "Er hat mich ange-"
	line "rufen und mir von"
	para "dir und Larvitar"
	line "erzählt, wie ihr"
	para "das verückte Kind"
	line "besiegt habt!"

	para "Weißt du was?"

	para "Behalte Larvitar."

	para "Du solltest sogar"
	line "meine neue Erfin-"
	cont "dung erhalten."
	prompt

.got_pokedex_text
	ctxt "<PLAYER> erhält"
	line "einen #dex!"
	done

.pokedex_explanation_text
	ctxt "Das ist ein"
	line "#dex."

	para "Es verzeichnet"
	line "alle #mon, die"
	cont "du gesehen oder"
	cont "gefangen hast."

	para "Stell dir ein Team"
	line "zusammen und führe"
	para "deines Vaters Ver-"
	line "mächtnis fort!"
	done

.became_champion_text
	ctxt "<PLAYER>!"

	para "Ich habe die gute"
	line "Nachricht gehört!"

	para "Du bist der Champ"
	line "der Rijon Liga!"

	para "Ich bin nicht"
	line "überascht."

	para "Wie ich sagte,"
	line "#mon Trainer zu"
	para "sein, liegt in"
	line "deinen Genen!"

	para "Wenn du nach"
	line "weiteren Heraus-"
	para "forderungen suchst"            
	line "besuche Rijon!"

	para "Da ist ein Tunnel"
	line "nach Rijon nörd-"
	cont "lich von hier."

	para "Viel Glück,"
	line "mein Freund!"
	done

.earthquake_explanation_text
	ctxt "Oh, <PLAYER>!"

	para "Etwas her seit"
	line "unserem ersten"
	cont "Treffen oder?"

	para "Da gibt es etwas,"
	line "worüber ich mit"
	cont "dir reden muss."

	para "Erdbeben treten"
	line "vermehrt auf."

	para "Laut dem 'Hayward"
	line "Labor für"
	cont "Paläoseismologie'"
	cont "sind diese Beben"
	cont "nicht natürlich."

	para "Das erste komische"
	line "Beben traf Dukatia"
	cont "City in Johto <...>"
	para "War das nicht vor"
	line "fünf Jahren?"

	para "Es ist dasselbe"
	line "Beben, das du"
	cont "in Naljo erlebt"
	cont "hast <...>"

	para "Mein Anhaltspunkt"
	line "ist Untergrund-"
	cont "City wegen den"
	cont "vielen Minen und"
	cont "Geologen."

	para "Vieleicht hat es"
	line "was mit den Beben"
	cont "zu tun ..."

	para "Untergrund City"
	line "findest du im"
	cont "Süden von Torenia"
	cont "City."

	para "Ich brauche dich"
	line "zum Untersuchen"
	cont "dieser künstlichen"
	cont "Erdbeben."

	para "<...>"

	para "Oh, du warst"
	line "vor Kurzem in"
	cont "Torenia City?"

	para "<...>"

	para "Ich sehe."

	para "Ich sage dem Wäch-"
	line "ter bescheid, dann"
	cont "kommst du durch!"
	done

.already_explained_earthquakes_text
	ctxt "Überprüfe bitte"
	line "die Störungen in"
	cont "Untergrund City."
	done

IlksLab_HowsMyLarvitarText:
	ctxt "Wie geht es meinem"
	line "Larvitar denn so?"

	para "Hoffe, alles gut!"
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
