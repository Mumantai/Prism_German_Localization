PhloxLab3F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

PHLOX_LAB_CEO EQU 2
PHLOX_LAB_OFFICER EQU 6
PHLOX_LAB_BLACK_PATROLLER EQU 7

PhloxLabHiddenItem_2:
	opentext
	checkevent EVENT_PHLOX_LAB_HIDDENITEM_UP_GRADE
	sif false, then
		setevent EVENT_PHLOX_LAB_HIDDENITEM_UP_GRADE
		verbosegiveitem UP_GRADE
		waitbutton
		closetextend
	selse
		farjumptext TrashCanText
		waitbutton
		closetextend
	sendif

PhloxLabF3CEO:
	faceplayer
	showtext .introduction_text
	checkcode VAR_FACING
	sif =, LEFT, then
		applymovement PLAYER, .player_moves_down
		spriteface PHLOX_LAB_CEO, DOWN
		spriteface PLAYER, UP
	sendif
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SCIENTIST, 13
	startbattle
	reloadmapafterbattle
	playmapmusic
	appear PHLOX_LAB_OFFICER
	appear PHLOX_LAB_BLACK_PATROLLER
	follow PHLOX_LAB_OFFICER, PHLOX_LAB_BLACK_PATROLLER
	applymovement PHLOX_LAB_OFFICER, .officer_walks_up
	stopfollow
	spriteface PHLOX_LAB_BLACK_PATROLLER, RIGHT
	applymovement PLAYER, .player_moves_right
	spriteface PLAYER, LEFT
	applymovement PHLOX_LAB_OFFICER, .officer_and_patroller_walk_right
	applymovement PHLOX_LAB_BLACK_PATROLLER, .officer_and_patroller_walk_right
	spriteface PHLOX_LAB_OFFICER, RIGHT
	opentext
	writetext .officer_appears_text
	spriteface PHLOX_LAB_OFFICER, DOWN
	writetext .officer_talks_to_black_text
	writetext .black_talks_text
	spriteface PHLOX_LAB_OFFICER, RIGHT
	writetext .officer_talks_to_player_text
	special ClearBGPalettes
	disappear PHLOX_LAB_OFFICER
	disappear PHLOX_LAB_BLACK_PATROLLER
	disappear PHLOX_LAB_CEO
	disappear 3
	disappear 4
	disappear 5
	special Special_ReloadSpritesNoPalettes
	playwaitsfx SFX_EXIT_BUILDING
	reloadmap
	setevent EVENT_PHLOX_LAB_CEO
	setevent EVENT_PHLOX_LAB_OFFICER
	end

.officer_and_patroller_walk_right
	step_right
	step_right
.player_moves_right
	step_right
	step_end

.player_moves_down
	step_down
	step_left
	step_end

.officer_walks_up
	step_up
	step_up
	step_up
	step_up
	step_end

.introduction_text
	ctxt "Wie ich sehe, bist"
	line "du hier."
	para "Ein Kind kann"
	line "all die Faktoren,"
	para "die diese Welt"
	line "bewegen, einfach"
	cont "nicht begreifen!"
	para "Als ich noch jung"
	line "war glaubte ich an"
	para "die verbesserung"
	line "von #mon durch"
	para "das Verständnis"
	line "Ihrer Stärken und"
	cont "Schwächen."
	para "Daraufhin klonte"
	line "ich ein #mon um"
	para "meine Theorie zu"
	line "beweisen."
	para "Es kam zu einem"
	line "Unfall und durch"
	para "den Klonungs-"
	line "prozess entstand"
	cont "Mewtu."
	para "Daraufhin wurde"
	line "das Klonen von"
	para "#mon endgültig"
	line "verboten und meine"
	para "Ergebnisse wurden"
	line "mir weggenommen<...>"
	para "Ich wollte nur die"
	line "Stärke in der"
	para "Individualität der"
	line "#mon"
	cont "hervorbringen."
	para "Und genau diese"
	line "Individualität"
	para "eines #mon war"
	line "die Stärke, die"
	para "mir alles im"
	line "Leben nahm."
	para "Seit dem, widmete"
	line "ich mein Leben"
	para "der Gründung eines"
	line "Medizinischen"
	para "Forschungsinstitut"
	line "das den Ziel hat,"
	para "die DNA aller"
	line "#mon in einer"
	para "Datenbank aufzu-"
	line "listen und dadurch"
	para "viel genauer an"
	line "#mon"
	para "experimente"
	line "ausüben zu können."
	para "Dir gefällt es"
	line "sicher nicht, was"
	para "ich hier tuhe,"
	line "aber es sind"
	para "Menschen wie ich,"
	line "die diese Welt"
	para "weiter voran"
	line "schreiten lassen."
	para "#mon sind nur"
	line "Werkzeuge!"
	para "Kämpfe gegen mich"
	line "und spüre die"
	para "Macht der"
	line "genetisch"
	para "modifizierten"
	line "#mon!"
	sdone

.battle_won_text
	text "NEIN!"
	done

.officer_appears_text
	ctxt "Jut Jut."
	para "Freut mich dich"
	line "wieder zu treffen."
	para "Du hast der"
	line "Polizei wieder"
	cont "Arbeit abgenommen."
	para "Ich bin mir sicher"
	line "das du einpaar"
	para "Insider"
	line "Informationen"
	para "bekommen haben"
	line "musst<...>"
	sdone

.officer_talks_to_black_text
	ctxt "Wie dem auch sei<...>"
	line "Gute Arbeit"
	cont "geleistet, Kind."
	para "Sehr gute Arbeit."
	para "Dank dir wird"
	line "diese Firma hohe"
	para "Strafzahlungen"
	line "tätigen müssen und"
	para "alle die daran"
	line "beteiligt waren"
	para "können mit einem"
	line "Aufenthalt in"
	para "Saxifragia Eiland"
	line "rechnen!"
	sdone

.black_talks_text
	ctxt "Schwarz: Und die"
	line "#mon werden"
	para "Rehabilitiert und"
	line "zurück zu Ihren"
	para "echten Trainern"
	line "geschickt."
	sdone

.officer_talks_to_player_text
	ctxt "Polizist: Übrigens"
	line "Kind, du bist aus"
	para "dem Saxifragia"
	line "Gefängnis aus-"
	cont "gebrochen<...>"
	para "Wenn du uns nicht"
	line "geholfen hättest,"
	para "würden wir dich"
	line "glatt zurück dahin"
	cont "schicken!"
	para "Wir begnadigen"
	line "dich dafür, also"
	cont "bist du nun frei."
	para "Da nun dieser Fall"
	line "geschlossen ist,"
	para "ist es Zeit"
	line "nach Hause zu"
	para "gehen und zu tun"
	line "was mir Spaß"
	cont "macht<...>"
	para "<...>Undzwar der"
	line "Einzigwahre Arena"
	para "Leiter von"
	line "Euphorbia City"
	cont "zu sein!"
	para "Ich bin mir"
	line "ziemlich sicher,"
	para "das wir uns dort"
	line "bald sehen werden."
	para "Bis dahin."
	sdone

PhloxLabF3Trainer1:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_1, SCIENTIST, 10, .before_battle_text, .battle_won_text
	ctxt "Kämpfen ist nicht"
	line "mein Spezial-"
	cont "gebiet."
	para "Aber für die da"
	line "oben schon<...>"
	done

.before_battle_text
	ctxt "Seit dem ich so"
	line "viel Geld verdiene"
	para "habe ich"
	line "angefangen mit"
	para "dem Papier-Geld"
	line "meinen Kaminofen"
	para "anzuzünden, wenn"
	line "es draußen so"
	cont "kalt ist."
	done

.battle_won_text
	ctxt "Vor dir steht der"
	line "CEO-wei von"
	cont "Koko-wei!"
	done

PhloxLabF3Trainer2:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_2, SCIENTIST, 11, .before_battle_text, .battle_won_text
	ctxt "Das wollte ich nie"
	line "werden, im ernst<...>"
	done

.before_battle_text
	ctxt "Dafür habe ich"
	line "jetzt echt keine"
	cont "Zeit Kind!"
	para "Ich muss meine"
	line "Arbeitsstunden"
	cont "eintragen<...>"
	done

.battle_won_text
	ctxt "Ich trage einfach"
	line "2 Wochen im"
	cont "vorraus ein."
	done

PhloxLabF3Trainer3:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_3, SCIENTIST, 12, .before_battle_text, .battle_won_text
	ctxt "Ich hätte warten"
	line "sollen, bis du den"
	para "CEO zuerst"
	line "besiegst<...>"
	done

.before_battle_text
	ctxt "Ich bin Froh, dass"
	line "du fast alle in"
	para "dieser Firma"
	line "besiegt hast."
	para "Jetzt komm ich von"
	line "hinten, besiege"
	para "dich und dann"
	line "nur noch den"
	para "CEO und der"
	line "Ruhm gehört"
	cont "MIR!"
	done

.battle_won_text
	ctxt "Na toll<...>"
	done

PhloxLabJournal_13:
	jumptext .text

.text
	ctxt "25. Mai 1999"
	para "Unser ehemaliger"
	line "Investor hat uns"
	cont "kontaktiert. Sie"
	para "behaupten, mit"
	line "Funkwellen die"
	para "Evolution zu"
	line "induzieren. Die"
	para "Prämisse ist"
	line "äußerst"
	cont "interessant. Sie"
	para "haben zugestimmt,"
	line "mehr Testobjekte"
	para "und ihre Daten im"
	line "Austausch für"
	para "einige unserer"
	line "verbesserten"
	cont "#mon zu senden."
	para "Wir haben auch"
	line "viele Jahre"
	para "Finanzierung"
	line "erhalten! Das sind"
	para "sehr aufregende"
	line "Zeiten."
	done
PhloxLabJournal_14:
	jumptext .text

.text
	ctxt "19. August 2000"
	para "Mahagonia City ist"
	line "still geworden."
	para "Ursache unbekannt."
	para "Die letzten"
	line "Testobjekte sind"
	para "eingetroffen und"
	line "die Experimente"
	cont "haben begonnen."
	para "Bisher erhielten"
	line "wir ausgezeichnete"
	para "Ergebnisse mit der"
	line "Funkwellenmethode."
	done
PhloxLabJournal_15:
	jumptext .text

.text
	ctxt "13. Mai 2005"
	para "Der Bestand ist"
	line "fast aufgebraucht."
	para "Nr 05 schlägt vor,"
	line "sich aus aus der"
	para "lokalen"
	line "Bevölkerung zu"
	cont "bedienen."
	para "Sie argumentieren,"
	line "dass niemanden"
	para "dieser Ort"
	line "interessiert, also"
	para "wird auch niemand"
	line "vermisst werden."
	para "Die Logik ist"
	line "stichhaltig."
	para "Wir fahren fort."
	done
PhloxLabJournal_16:
	jumptext .text

.text
	ctxt "20. Juli 2009"
	para "Endlich wurden wir"
	line "von einer neuen"
	para "Gruppe"
	line "kontaktiert."
	para "Sie haben eine"
	line "Partnerschaft"
	cont "vorgeschlagen."
	para "Sie können uns"
	line "finanzieren und"
	para "Testobjekte"
	line "beschaffen."
	para "Dies im Austausch"
	line "für unsere ver-"
	cont "besserten #mon."
	para "Wir haben"
	line "zugestimmt."
	para "Die Produktion"
	line "beginnt sofort."
	done
PhloxLabJournal_17:
	jumptext .text

.text
	ctxt "1. Januar 2010"
	para "Lieferung von 6"
	line "verbesserten Evoli"
	para "aus beiden Produk-"
	line "tionsmethoden"
	cont "abgeschlossen."
	para "Alle zeigen"
	line "herausragende"
	cont "Leistungen!"
	para "Uns wird die Ware"
	line "nicht mehr"
	cont "ausgehen."
	para "Wir haben unser"
	line "Design endlich"
	cont "perfektioniert."
	para "Wir werden reich!"
	done
PhloxLabJournal_18:
	jumptext .text

.text
	ctxt "Das Datum in"
	line "diesem Tagebuch"
	para "ist aktuell, es"
	line "sieht so aus, als"
	para "wäre es noch nicht"
	line "fertiggestellt"
	cont "<...>"
	para "Jemand ist in"
	line "unser Labor"
	para "eingebrochen und"
	line "hat unsere besten"
	para "Testobjekte"
	line "freigelassen!"
	para "Unsere"
	line "Einrichtungen"
	para "wurden erheblich"
	line "beschädigt."
	para "Ich fürchte, was"
	line "in den letzten"
	para "Jahren mit den"
	line "anderen Laboren"
	para "passiert ist,"
	line "passiert nun auch"
	cont "uns."
	para "Ich werde nicht"
	line "zulassen, dass"
	para "unsere Bemühungen"
	line "umsonst waren!"
	para "Ich habe gerade"
	line "Kopien unserer"
	para "Pläne, Designs und"
	line "Forschungen an"
	para "alle versendet,"
	line "die ich erreichen"
	cont "konnte."
	para "Sie werden"
	line "vollenden, was wir"
	para "begonnen haben,"
	line "zum Wohl der"
	cont "Menschheit!"
	para "Selbst wenn ich"
	line "verhaftet werde,"
	para "können sie mir"
	line "nichts beweisen."
	para "Die Testobjekte"
	line "können schließlich"
	para "nicht"
	line "sprechen(zumindest"
	para "nicht mehr), und"
	line "selbst wenn sie"
	para "könnten, wer würde"
	line "überhaupt glau-"
	cont "<...> Die Datei"
	para "endet hier."
	done

PhloxLab3F_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 16, 16, 2, PHLOX_LAB_2F

.CoordEvents: db 0

.BGEvents: db 7
	signpost  1, 13, SIGNPOST_READ, PhloxLabHiddenItem_2
	signpost 16, 13, SIGNPOST_UP, PhloxLabJournal_13
	signpost 16,  9, SIGNPOST_UP, PhloxLabJournal_14
	signpost  8,  3, SIGNPOST_UP, PhloxLabJournal_15
	signpost  4,  3, SIGNPOST_UP, PhloxLabJournal_16
	signpost  8, 13, SIGNPOST_UP, PhloxLabJournal_17
	signpost  4, 13, SIGNPOST_UP, PhloxLabJournal_18

.ObjectEvents: db 6
	person_event SPRITE_SCIENTIST, 5, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PhloxLabF3CEO, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 17, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, PhloxLabF3Trainer1, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 16, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF3Trainer2, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 12, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF3Trainer3, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_BRUCE, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_OFFICER
	person_event SPRITE_PALETTE_PATROLLER, 11, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_OFFICER