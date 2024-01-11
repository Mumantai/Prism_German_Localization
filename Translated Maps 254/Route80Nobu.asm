Route80Nobu_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route80Nobu_Nobu:
	faceplayer
	opentext
	checkevent EVENT_VARANEOUS_REVIVED
	sif false
		jumptext .before_varaneous_revives_text
	checkevent EVENT_NOBU_EXPLAINS_PROTECTORS
	sif true
		jumptext .already_explained_text
	writetext .explanation_text_1
	writetext .explanation_text_2
	writetext .explanation_text_3
	writetext .explanation_text_4
	writetext .explanation_text_5
	writetext .explanation_text_6
	writetext .explanation_text_7
	writetext .explanation_text_8
	setevent EVENT_NOBU_EXPLAINS_PROTECTORS
	jumptext .after_explanation_text

.before_varaneous_revives_text
	ctxt "Geh zurück zu dem"
	line "Pfad, an dem du"
	para "mich gefunden hast"
	line "und setze der"
	para "Wiederauferstehung"
	line "ein Ende!"
	para "Wir dürfen keine"
	line "Zeit verlieren!"
	done

.explanation_text_1
	ctxt "Wir sind in einer"
	line "schlimmen Lage und"
	cont "brauchen deine"
	para "Hilfe. Siegfried"
	line "ist die"
	para "Reinkarnation des"
	line "'Auserwählten'."
	sdone

.explanation_text_2
	ctxt "<...> Hmm, wer der"
	line "'Auserwählte' war?"
	para "Nunja <...> beginnen"
	cont "wir am Anfang."

	para "Vor Tausenden von"
	line "Jahren, war Naljo"
	para "eine isolierte"
	line "Region. So haben"
	para "es sich die"
	cont "Wächter gewünscht."

	para "Varaneous erschuf"
	line "Naljo als Ebenbild"
	para "seines idealen"
	cont "Lebensraums."
	para "Es wollte eine"
	line "Gesellschafft, in"
	para "der Mensch und"
	line "#mon frei von"
	para "den Unruhen und"
	line "Sorgen, die sich"
	para "außerhalb Naljos"
	line "zusammenbrauten,"
	cont "Leben können." ;evtl. Satzbau ändern

	para "Wo man sich nicht"
	line "bekriegt, sondern"
	para "zusammenarbeitet"
	line "und gemeinsam"
	cont "Probleme löst." ;letzter Absatz aus dem Original hierhin verschoben, weil er sonst keinen Sinn ergibt

	para "Jeder Wächter"
	line "bekam eine Insel,"
	cont "zum Regieren."

	para "Obwohl sie alle"
	line "anders herrschten,"
	para "einigten sie sich,"
	line "Naljos Einwohner"
	para "vor dem Rest der"
	line "Welt zu schützen."
	sdone

.explanation_text_3
	ctxt "Die Namen der"
	line "4 Wächter waren:"
	para "Varaneous,"
	para "Raiwato,"
	para "Libabeel,"
	para "und Fambaco."

	para "Jeder der Wächter"
	line "besaß eine Kugel,"
	para "die der Ursprung"
	line "seiner Kräfte war."

	para "Raiwato war es,"
	line "dass jeden vor"
	para "allerlei Problemen"
	line "und Gefahren"
	cont "beschütze." ;evtl. Übersetzung anpassen
	sdone

.explanation_text_4
	ctxt "Fambaco, das der"
	line "Wächter der Natur"
	para "war, sorgte dafür,"
	line "dass die Region"
	cont "abgeschieden war."

	para "Es verstand die"
	line "Notwendigkeit der"
	para "Menschen, #mon"
	line "zu zähmen und es"
	para "wusste das Band"
	line "zwischen Mensch"
	para "und #mon sehr"
	line "zu schätzen."

	para "Dennoch wollte es,"
	line "dass die Natur un-"
	para "gestört ihren Lauf"
	line "nehmen konnte."
	sdone

.explanation_text_5
	ctxt "Libabeel, der"
	line "feindseligste"
	para "Wächter, hatte die"
	line "Kontrolle über die"
	cont "See rund um Naljo."
	para "Entdecker, die zu"
	line "nah an Naljos"
	para "Küste kamen, kamen"
	line "selten mit dem"
	cont "Leben davon."
	sdone

.explanation_text_6
	ctxt "Und zuletzt haben"
	line "wir Varaneous, dem"
	para "du ja bereits"
	line "begegnet bist."

	para "Zu der Zeit, als"
	line "Varaneous noch auf"
	para "Erden wandelte,"
	para "wurden Fremde, die"
	line "so töricht waren,"
	para "in unser Land zu"
	line "kommen, von den"
	para "mächtigen Flammen"
	line "Varaneous zu Asche"
	cont "verbrannt."

	para "Jene, die den Mut"
	line "zur Flucht hatten,"
	cont "trugen am Ende die"
	para "verkohlten Narben"
	line "seines, von Hass"
	para "erfüllten, Blickes"
	line "auf dem Rücken."

	para "Selbst #mon"
	line "waren nicht sicher"
	cont "vor seinem Zorn."
	sdone

.explanation_text_7
	ctxt "Der 'Auserwählte'"
	line "hatte die Aufgabe,"
	para "alle Nachrichten"
	line "der Wächter an das"
	para "Volk zu leiten."

	line "Er war der einzige"
	para "Mensch, dem die"
	line "Wächter vertrauen"
	para "konnten, doch sie"
	line "sagten ihm nicht,"
	para "dass sie jeden"
	line "töteten, der"
	para "versuchte, nach"
    cont "Naljo zu gelangen."

	para "Als er das heraus-"
	para "fand, stahl er die"
	line "mächtigen Kugeln"
	para "und versteckte sie"
	line "in ganz Naljo."

	para "Ohne die Kugeln,"
	line "waren die Wächter"
	para "machtlos und"
	line "schliefen für"
	cont "Jahrhunderte ein."

	para "Aber sobald eine"
	line "Kugel nahe genug"
	para "an einen Wächter"
	line "kommt, kann sie"
	para "dessen wahre Kraft"
	line "wieder entfalten."

	para "Varaneous ist nun"
	line "erwacht und wird"
	para "mit Sicherheit"
	line "auch die anderen"
	cont "Wächter aufwecken."
	sdone

.explanation_text_8
	ctxt "Der Mann in Rot"
	line "glaubte in seiner"
	para "Naivität, dass"
	line "ein Nachfahre zu"
	para "sein ausreicht, um"
	line "die Kreatur zu"
	cont "zu zähmen."

	para "Jedoch bist du,"
	para "der letzte noch"
	line "bekannte Nachfahre"
	cont "des Auserwählten."

	para "Naja, abgesehen"
	line "von deinem Vater."

	para "Dein Vater könnte"
	line "uns tatsächlich"
	cont "retten <...>"

	para "Aber ihm ist nicht"
	line "klar, welche Macht"
	cont "er über Naljo hat."

	para "Er würde damit"
	line "nicht klarkommen."

	para "Er ist heutzutage"
	line "zu sehr von seinem"
	para "Ruhm und Reichtum"
	line "besessen; da kann"
	cont "man nichts machen."

	para "Als sein einziges"
	line "Kind, bist du"
	para "Naljos einzige"
	line "Hoffnung, die"
	cont "Wächter zu zähmen."
	sdone

.after_explanation_text
	ctxt "Im Norden steht"
	line "ein Leuchtturm,"
	para "der von einem"
	line "guten Freund von"
	cont "mir bewacht wird."

	para "Vielleicht hat er"
	line "sehen können,"
	para "wohin Varaneous"
	line "gegangen ist."

	para "Finde einen Weg"
	line "nach Norden."
	done

.already_explained_text
	ctxt "Im Moment können"
	line "wir nur hoffen,"
	para "dass die Wächter"
	line "niemandem mehr"
	cont "Schaden zufügen."
	done

Route80Nobu_Aggron:
	faceplayer
	opentext
	checkevent EVENT_RESCUED_NOBU
	sif true
		writetext .cry_text
	cry AGGRON
	sif true
		endtext
	writetext .found_aggron_text
	checkcode VAR_PARTYCOUNT
	sif =, 6
		jumptext .party_full_text
	special SpecialGiveNobusAggron
	disappear 3
	writetext .joined_party_text
	playwaitsfx SFX_FANFARE_2
	setevent EVENT_NOBUS_AGGRON_IN_PARTY
	closetextend

.cry_text
	ctxt "Stolloss: Rwar!"
	done

.found_aggron_text
	ctxt "Dieses #mon"
	line "klingt besorgt."

	para "Es zieht an deinem"
	line "Fuß <...>. Ich glaube,"
	para "es möchte mit dir"
	line "mitkommen?"
	sdone

.joined_party_text
	ctxt "Stollos ist deinem"
	line "Team beigetreten!"
	done

.party_full_text
	ctxt "Es kann nicht mit,"
	line "wenn dein Team"
	cont "bereits voll ist."
	done

Route80Nobu_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $3, 3, ROUTE_80
	warp_def $7, $4, 3, ROUTE_80

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_SAGE, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route80Nobu_Nobu, EVENT_NOBU_NOT_IN_HOUSE
	person_event SPRITE_AGGRON, 2, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route80Nobu_Aggron, EVENT_NOBUS_AGGRON_IN_PARTY