Route80Nobu_MapScriptHeader;trigger count
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
	ctxt "Geh schon!"

	para "Geh zurück an den"
	line "Pfad wo du mich"
	para "gefunden hattest"
	line "und verhindere die"
	cont "Wiederauferstehung"

	para "Wir dürfen keine"
	line "Zeit verlieren!"
	done

.explanation_text_1
	ctxt "Wir sind in einer"
	line "schlechten"
	cont "Situation<...>"

	para "Siegfried ist die"
	line "Reinkarnation des"
	cont "GESANDTEN."
	sdone

.explanation_text_2
	ctxt "<...>Hmm, wer der"
	line "Gesandte war?"

	para "Nunja<...> beginnen"
	line "wir von vorne<...>"

	para "Vor Tausenden von"
	line "Jahren, war Naljo"
	para "eine isolierte"
	line "Region, was der"
	para "Wunsch der Wächter"
	line "war."

	para "Varaneous erschuf"
	line "Naljo als sein"
	para "eigenes Ideales"
	line "Lebensumfeld."

	para "Es wollte eine"
	line "Gesellschafft mit"
	cont "einem System,"
	para "indem alle #mon"
	line "und Menschen frei"
	para "von all den"
	line "Sorgen sind, die"
	para "außerhalb von"
	line "Naljo existierten."

	para "Jeder Wächter"
	line "bekam eine Insel"
	cont "zum herrschen."

	para "Obwohl jeder"
	line "anders regierte,"
	para "war der Konsens,"
	line "die restliche"
	para "Welt von Naljo und"
	line "deren Bewohnern"
	cont "fernzuhalten."

	para "Wo im gegensatz an"
	line "einer gemeinsamen"
	cont "Lösung gearbeitet"
	para "wurde, statt wie"
	line "der Rest der Welt"
	para "Probleme bekämpft"
	line "wurden<...>"
	sdone

.explanation_text_3
	ctxt "Die Namen der"
	line "4 Wächter lauten:"

	para "Varaneous,"

	para "Raiwato,"

	para "Libabeel,"

	para "und Fambaco."

	para "Jeder Wächter hat"
	line "seine eigene Kugel"
	para "welches all Ihre"
	line "Kräfte enthält."

	para "Raiwato schützte"
	line "jeden vor allerlei"
	cont "Problemen und"
	para "Gefahren."
	sdone

.explanation_text_4
	ctxt "Fambaco, der Natur"
	line "Wächter, schützte"
	para "die Natur vor"
	line "allen Gefahren."

	para "Er wollte, dass"
	line "die Natur sich"
	cont "ohne eingriffe von"
	para "aussen entwickeln"
	line "konnte, auch wenn"
	para "es verstanden hat"
	line "das Mensch und"
	para "#mon"
	line "Koexistieren"
	sdone

.explanation_text_5
	ctxt "Libabeel, der"
	line "Feindseeligste"
	cont "unter ihnen,"
	para "Konntrollierte die"
	line "Meere um Naljo."

	para "Entdecker, die"
	line "Naljo zu nah kamen"
	para "wurden nie mehr"
	line "wieder gesehen<...>"
	sdone

.explanation_text_6
	ctxt "Und dann haben"
	line "wir Varaneous,"
	para "welchen du zuletzt"
	line "begegnet bist."

	para "Damals verbrannte"
	line "Varaneous jeden"
	cont "Ausländer, der"
	para "dumm genug war das"
	line "Land zu betreten."

	para "Jene die es"
	line "schafften zu"
	cont "fliehen, waren für"
	para "Ihr leben lang"
	line "entstellt<...>"

	para "Sogar #mon"
	line "waren vor Ihm"
	cont "nicht sicher."
	sdone

.explanation_text_7
	ctxt "Der Gesandte hatte"
	line "die Verantwortung"
	para "die Botschaften"
	line "der Wächter an das"
	cont "Volk zu bringen."

	para "Er war der einzige"
	line "Mensch dem diese"
	cont "Legenden trauten,"
	para "aber<...> die Wächter"
	line "erzählten Ihm nie"
	para "wie sie jeden ab-"
	line "schlachteten, der"
	para "versuchte, die"
	line "Region zu betreten"

	para "Nunja<...>"

	para "Als Er das"
	line "rausfand, stahl er"
	para "den Wächtern Ihre"
	line "Kugeln und"
	para "verteilte sie"
	line "in der Region."

	para "Ohne diese Kugeln,"
	line "verfielen die"
	para "Wächter in einen"
	line "langen Schlaf."

	para "Aber sobald sich"
	line "eine Kugel dem"
	para "Wächter nähert"
	line "wacht es auf."

	para "Varaneous ist nun"
	line "wach, und wird"
	para "alle anderen"
	line "Wächter ebenso"
	cont "aufwachen."
	sdone

.explanation_text_8
	ctxt "Der Mann in Rot"
	line "dachte, nur weil"
	para "er ein nachfahre"
	line "ist, würde er es"
	cont "Zähmen können."

	para "Jedoch!"

	para "Du bist der wahre"
	line "Nachfahre des"
	cont "Gesandten."

	para "Nunja, nach deinem"
	line "Vater zumindest."

	para "Dein Vater hätte"
	line "uns ebenfalls"
	cont "retten können<...>"

	para "Aber<...>"

	para "Dein Vater"
	line "versteht nicht,"
	para "was für eine"
	line "Macht er über"
	cont "Naljo besitzt."

	para "Er könnte damit"
	line "nicht umgehen."

	para "Er ist eher an"
	line "Ruhm und Reichtum"
	cont "interesiert<...>"

	para "Du als sein"
	line "einsames Kind,"
	para "bist die einzige"
	line "hoffnung, Naljo"
	cont "zu retten!"
	sdone

.after_explanation_text
	ctxt "Im Norden ist ein"
	line "Leuchtturm. Dort"
	para "wirst du einen"
	line "guten Freund von"
	cont "mir finden."

	para "Er könnte von da"
	line "oben gesehen haben"
	para "wo Varaneous"
	line "hingegangen sein"
	cont "könnte."

	para "Finde einen Weg"
	line "nach Norden!"
	done

.already_explained_text
	ctxt "Wir können nur"
	line "noch beten, dass"
	para "die Wächter keinem"
	line "was antun werden."
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

	para "Es scheint dich"
	line "für eine kurze"
	para "Zeit begleiten zu"
	line "wollen<...>"
	sdone

.joined_party_text
	ctxt "Stollos ist deinem"
	line "Team beigetreten!"
	done

.party_full_text
	ctxt "Du hast kein Platz"
	line "mehr im Team."
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
