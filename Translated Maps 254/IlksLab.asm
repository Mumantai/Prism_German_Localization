IlksLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

IlksLabBookshelfFortran:
	ctxt "<PLAYER> öffnet ein"
	line "Buch aus dem Regal"
	cont "ganz oben <...>"
	para "'Visual-Basic für"
	line "Dummies'"
	done

IlksLabBookshelfKalos:
	ctxt "<PLAYER> liest ein"
	line "zufälliges Buch <...>"
	para "'Tipps für dein"
	line "Studium in Kalos'"
	done

IlksLabBookshelfFairyTales:
	ctxt "<PLAYER> findet"
	line "ein altes, stark"
	cont "verstaubtes Buch <...>"
	para "'Varaneous - Die"
	line "Legende von Naljo'"
	done

IlksLabBookshelfSpeakNormally:
	ctxt "<PLAYER> liest ein"
	line "Buch mit starken"
	cont "Gebrauchsspuren <...>"
	para "'Wie man normal"
	line "redet und Andere"
	cont "dabei nicht nervt'"
	done

IlksLabComputer:
	jumptext .text

.text
	ctxt "Eine Suchmaschine"
	line "ist offen."
	para "Sieht so aus, als"
	line "hätte der Prof."
	para "mehrmals nach"
	line "seinem Namen"
	cont "gesucht."
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
	para "<...> Hm, ja <...>"
	para "<...> Ja, das"
	line "macht Sinn <...>"
	para "Hier sollte"
	line "irgendwo ein"
	para "Buch über die"
	line "Naljo-Region"
	cont "rumliegen <...>"
	sdone

.first_encounter_text
	ctxt "<...> !"
	para "Wer, wie wo!?"
	para "Wer bist du?"
	para "Wer ICH bin???"
	para "Professor Ilk,"
	line "natürlich!"
	para "Ich bin Naljos"
	line "führender"
	cont "Forscher!"
	para "<...>"
	para "Moment mal <...>"
	para "Oh, das ist ja"
	line "mein Larvitar!"
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
	line "der Stadt, auf"
	cont "Route 69."
	para "Nimm mein Larvitar"
	line "mit, damit du"
	cont "sicher bist."
	done

.waiting_for_brother_text
	ctxt "Bitte schau nach"
	line "meinem Bruder."
	para "Du findest ihn auf"
	line "Route 69."
	done

.after_saving_brother_text
	ctxt "<PLAYER>!"
	para "Danke, dass du"
	line "meinen Bruder"
	cont "gerettet hast!"
	para "Er hat mich ange-"
	line "rufen und mir"
	para "erzählt, wie du"
	line "und mein Larvitar"
	para "das verückte Kind"
	line "besiegt habt!"
	para "Weißt du was?"
	para "Behalte Larvitar."
	para "Du solltest sogar"
	line "meine neueste Er-"
	cont "findung erhalten."
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
	line "zusammen und mach"
	para "deinem Vater"
	line "alle Ehre!"
	done

.became_champion_text
	ctxt "<PLAYER>!"
	para "Ich habe die gute"
	line "Nachricht gehört!"
	para "Du bist der Champ"
	line "der Rijon-Liga!"
	para "Ich bin nicht"
	line "überascht."
	para "Wie ich sagte,"
	line "#mon-Trainer zu"
	para "sein, liegt dir"
	line "im Blut!"
	para "Wenn du nach neuen"
	line "Herausforderungen"
	para "suchst, solltest"            
	line "du nach Rijon!"
	para "Es gibt, nördlich"
	line "von hier, einen"
	cont "Tunnel nach Rijon."
	para "Viel Glück,"
	line "mein Freund!"
	done

.earthquake_explanation_text
	ctxt "Oh, <PLAYER>!"
	para "Wir haben uns eine"
	line "ganze Weile nicht"
	cont "gesehen oder?"
	para "Da gibt es etwas,"
	line "worüber ich mit"
	cont "dir reden muss."
	para "Es treten vermehrt"
	line "Erdbeben auf."
	para "Laut dem 'Heuhofen"
	line "Labor für Paläo-"
	para "seismologie', sind"
	line "diese Erdbeben"
	cont "nicht natürlich."
	para "Das erste seiner"
	line "Art, traf Dukatia"
	cont "City in Johto <...>"
	para "Das war vor etwa"
	line "fünf Jahren."
	para "Es ist dasselbe"
	line "Beben, das du"
	para "in Naljo gespürt"
	line "hast <...>"
	para "Mein einziger"
	line "Anhaltspunkt, ist"
	para "eine unterirdische"
	line "Stadt voller"
	para "Geologen und"
	line "Minenarbeitern."
	para "Vieleicht findest"
	line "du dort etwas, das"
	cont "uns weiterhilft <...>"
	para "Die unterirdische"
	line "Stadt, findest du"
	para "im Süden von"
	line "Torenia City."
	para "Ich möchte, dass"
	line "du da runtergehst"
	para "und der Sache auf"
	line "den Grund gehst."
	para "<...>"
	para "Oh, du warst"
	line "vor Kurzem in"
	cont "Torenia City?"
	para "<...>"
	para "Ich verstehe."
	para "Ich sage dem Wär-"
	line "ter bescheid, dann"
	cont "kommst du durch!"
	done

.already_explained_earthquakes_text
	ctxt "Untersuch bitte,"
	line "was es mit dieser"
	para "seltsamen Stadt"
	line "auf sich hat."
	done

IlksLab_HowsMyLarvitarText:
	ctxt "Wie geht es meinem"
	line "Larvitar denn so?"
	para "Hoffe alles gut!"
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
	ctxt "Oh, Hallo."
	para "Kann ich helfen?"
	para "<...>"
	para "Ah, du willst"
	line "zum Professor?"
	para "Er ist nebenan in"
	line "seinem Bereich."
	done

.waiting_for_brother_in_law_text
	ctxt "Was sagte er, wo"
	line "du hin sollst???"
	para "Versteh mich nicht"
	line "falsch, aber ein"
	para "Kind loszuschicken"
	line "um nach seinen"
	para "Verwandten zu"
	line "sehen, ist doch"
	cont "nicht normal oder?"
	para "Sein Bruder geht"
	line "nie an sein Handy,"
	para "aber jetzt ist es"
	line "plötzlich ein"
	cont "Problem?"
	done

.after_saving_brother_in_law_text
	ctxt "Was?"
	para "Schrecklich!"
	para "Er hätte die Stadt"
	line "nie verlassen"
	cont "dürfen!"
	para "Lass das den"
	line "Professor bitte"
	cont "sofort wissen."
	done

.after_receiving_dex_text
	ctxt "Ich weiß er kann"
	line "manchmal sehr"
	cont "schwierig sein."
	para "Aber er ist eine"
	line "herzensgute"
	cont "Person."
	para "Er vertraut viel"
	line "zu schnell."
	para "Auch dir!"
	para "Mach ihn also"
	line "bitte stolz!"
	done

.after_beating_league_text
	ctxt "Wir hörten, dass"
	line "du die Rijon Liga"
	cont "bezwungen hast!"
	para "<PLAYER>, mein"
	line "Glückwunsch."
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