PhloxMyles_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhloxMylesNewspaperArticle:
	ctxt "Mann findet einen"
	line "Mann anderen in"
	cont "einer Höhle:"

	para "Heute, in der"
	line "abgelegenen Stadt"
	para "Phloxia, wurde ein"
	line "Mann in einer"
	cont "Höhle gefunden."

	para "Der Mann leidete"
	line "an Amnesie."

	para "Der andere Mann"
	line "wollte, dass wir"
	para "diesen Artikel"
	line "schreiben."

	para "Allen geht's gut."

	para "Ende."
	done

PhloxMylesMyles:
	faceplayer
	opentext
	writetext .opening_text
	yesorno
	sif !=, 1
		closetextend
	jumptext .tale

.opening_text
	ctxt "Oh, Hallo!"

	para "Noch ein Fan,"
	line "der von meinen"
	cont "fantastischen"
	para "Geschichten gehört"
	line "hat, welche durch"
	para "die Naljo-Region"
	line "wandern?"

	para "Du hast mich"
	line "endlich gefunden!"

	para "Myles, der Große!"

	para "Lass mich deine"
	line "Ermüdung mit dem"
	para "Klang meiner"
	line "Geschichte über"
	para "meine große"
	line "Heldentat nehmen."
	done

.tale
	ctxt "Herrlich!"

	para "Da war ich nun."

	para "Kämpfte mich durch"
	line "die Wasserminen,"
	para "die im Norden von"
	line "Phloxia City"
	cont "liegen."

	para "Dort war es nass"
	line "und kalt, doch ich"
	para "drang furchtlos"
	line "immer tiefer in"
	para "die Dunkelheit"
	line "vor."

	para "Andere wagten sich"
	line "erst gar nicht"
	para "rein wegen den"
	line "Gerüchten von"
	para "Geistern, Mördern"
	line "und Flüchen."

	para "IDIOTEN!"

	para "Tief in der"
	line "dunklen Höhle"
	para "hörte ich die"
	line "Schreie eines"
	para "Lammes, das von"
	line "seinem Hirten"
	cont "getrennt wurde."

	para "So ging ich, Myles"
	line "der Große, wie ein"
	cont "Zubat durch die"
	para "dunkle Höhle und"
	line "fand das arme,"
	cont "schwache Lamm!"

	para "Es war ein junger"
	line "Wanderer, der"
	para "warscheinlich seit"
	line "Monaten dort aus-"
	para "harrte, zumindest"
	line "nach meiner"
	cont "Meinung."

	para "Der Mann lag dort"
	line "ruhig in einem"
	cont "Ball."

	para "Er dachte wohl,"
	line "dass es das Ende"
	cont "für ihn ist <...>"

	para "Ich schrie:"

	para "NEIN!, und trug"
	line "ihn aus der Höhle!"

	para "Sie haben sogar"
	line "einen Artikel über"
	para "mich in der"
	line "Zeitung verfasst."
	para "Seitdem kennt"
	line "jeder diese"
	cont "Geschichte!"

	para "Dieser junge Mann"
	line "tut mir echt leid,"
	para "weil durch seine"
	line "Amnesie nichts"
	cont "mehr wusste."

	para "Keine Erinnerung"
	line "an sein Leben vor"
	para "der Höhle oder"
	line "seine Familie."

	para "Er wandert bis"
	line "heute von Zeit"
	para "zu Zeit in dieser"
	line "Höhle rum, um sich"
	para "zu erinnern, wieso"
	line "er dort war."

	para "Selbst ich, als"
	line "großer Held, kann"
	para "ihm seine"
	line "Erinnerungen nicht"
	para "zurückbringen <...>"

	para "Versuch du es"
	line "ruhig nochmal."

	para "Wenn du es lesen"
	line "möchtest, der"
	para "Zeitungsartikel"
	line "über meine große"
	para "Heldentat hängt"
	line "eingerahmt hinter"
	para "mir an der Wand."

	para "LIES ES, OK?"
	line "BITTE!"
	done

PhloxMyles_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $2, 6, PHLOX_TOWN
	warp_def $7, $3, 6, PHLOX_TOWN

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 0, 3, SIGNPOST_TEXT, PhloxMylesNewspaperArticle

	;people-events
	db 1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PhloxMylesMyles, -1
