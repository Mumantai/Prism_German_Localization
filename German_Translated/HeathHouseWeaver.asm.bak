HeathHouseWeaver_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HeathShrineNPC:
	checkflag EVENT_VARANEOUS_REVIVED
	sif false
		jumptextfaceplayer .not_awakened_text
	jumptextfaceplayer .awakened_text

.not_awakened_text
	ctxt "Es wäre so auf-"
	line "regend, wenn die"
	para "Legenden wieder"
	line "erwachen würden."

	para "Als ich ein Kind"
	line "war, erzählte mir"
	para "mein Opa wie"
	line "einfach das Leben"
	cont "früher war."

	para "Damals waren sie"
	line "viel glücklicher."
	done

.awakened_text
	ctxt "Die Legenden sind"
	line "erwacht!"

	para "Das ich diese"
	line "Zeiten noch mit-"
	cont "erleben darf<...>"

	para "Wächter! Ich"
	line "freue mich auf"
	cont "eure Visionen!"
	done

HeathShrinePodium:
	ctxt "Vor Jahrhunderten"
	line "war Naljo nichts"
	cont "als ein Ozean."

	para "Während des großen"
	line "Krieges, schufen"
	para "die Legenden neue"
	line "Inseln, welche von"
	para "den Kriegen"
	line "isoliert waren und"
	para "dadurch alle in"
	line "Frieden leben"
	cont "konnten."
	
	para "Varaneous und die"
	line "anderen kamen von"
	para "überall her um"
	line "unsere Heimat"
	cont "aufzubauen"

	para "#mon und Mensch"
	line "lebten schon immer"
	para "in voller Harmonie"
	line "bis ein kranker"
	para "Mann Ihre Kugeln"
	line "gestohlen hat."

	para "Die Kugeln sind"
	line "die Kraftquelle"
	cont "der Wächter."

	para "Ohne diese, fallen"
	line "die Wächter in"
	para "einen tiefen"
	line "schlaf."

	para "Sie schlafen bis"
	line "heute<...>"

	para "Die Region blieb"
	line "ungeschützt und"
	para "Leute von der"
	line "ganzen Welt zogen"
	para "hier hin und"
	line "begannen die Natur"
	para "abzuholzen um hier"
	line "große Städte und"
	para "Dörfer aufzubauen."
	line "Wir nennen sie"
	cont "'Ausenseiter'."

	para "Die Ausenseiter"
	line "brachten die"
	para "Probleme der"
	line "modernen Welt"
	cont "rüber zu uns."

	para "Viele Naljo ein-"
	line "heimische nahmen"
	para "die Ausenseiter"
	line "zwar mit offenen"
	para "Armen auf, aber"
	line "es gibt immer noch"
	para "welche die nach"
	line "den verlorenen"
	cont "Kugeln der Wächter"
	cont "suchen."

	para "Wenn ein Wächter"
	line "seine Kugel zurück"
	para "erlangt, erwacht"
	line "es wieder!"

	para "Die Wächter würden"
	line "unsere Kultur"
	para "wahren und die"
	line "Ausenseiter von"
	cont "uns fernhalten!"
	done

HeathHouseWeaver_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $9, $5, 6, HEATH_VILLAGE
	warp_def $9, $6, 6, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 4, 7, SIGNPOST_TEXT, HeathShrinePodium
	signpost 4, 8, SIGNPOST_TEXT, HeathShrinePodium

.ObjectEvents
	db 1
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HeathShrineNPC, -1
