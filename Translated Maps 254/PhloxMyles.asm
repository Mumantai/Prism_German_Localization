PhloxMyles_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhloxMylesNewspaperArticle:
	ctxt "Mann findet einen"
	line "Mann in einer"
	cont "Höhle:"
	para "Heute, in der"
	line "abgelegenen Stadt"
	para "Flokalis, wurde"
	line "ein Mann in einer"
	cont "Höhle gefunden."
	para "Der Mann leidete"
	line "an Amnesie."
	para "Der andere Mann"
	line "wollte, das wir"
	para "diesen Artikel"
	line "schreiben."
	para "'Allen gehts gut'."
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
	para "die Naljo Region"
	line "wandern?"
	para "Du hast mich"
	line "endlich gefunden!"
	para "Myles der Große!"
	para "Lass mich deine"
	line "ermüdung mit dem"
	para "Klang meiner"
	line "Geschichte über"
	para "meine große"
	line "Heldentat, nehmen."
	done

.tale
	ctxt "Herrlich!"
	para "Da war ich nun,"
	line "kämpfte mich durch"
	para "die Aqua-Minen im"
	line "Norden von"
	cont "Flokalis."
	
	para "Es war nass und"
	line "kalt, doch ich"
	para "drang furchtlos"
	line "immer tiefer in"
	para "die Dunkelheit"
	line "vor."
	
	para "Andere wagen sich"
	line "erst gar nicht"
	para "hinein, wegen der"
	line "Gerüchte über"
	para "Geister, Mörder"
	line "und andere Flüche."
	para "Idioten!"
	
	para "Tief in der"
	line "dunklen Höhle"
	para "hörte ich"
	line "plötzlich die"
	para "Schreie eines"
	line "Lammes, das von"
	para "seinem Hirten"
	line "getrennt worden"
	cont "war."
	para "Also ging ich,"
	line "Myles der Große,"
	para "wie ein Zubat"
	line "durch die"
	para "Dunkelheit und"
	line "fand das arme,"
	cont "schwache Lamm!"
	
	para "Es war ein junger"
	line "Wanderer, der dort"
	para "wohl seit Monaten"
	line "ausharrte."
	para "Zumindest schien"
	line "es mir so."
	
	para "Er lag ruhig"
	line "zusammengerollt"
	para "wie ein Ball und"
	line "dachte wohl, sein"
	cont "Ende sei gekommen."
	
	para "Aber ich schrie:"
	line "NEIN! und trug ihn"
	para "aus der Höhle"
	line "hinaus!"
	
	para "Man hat sogar"
	line "einen Artikel über"
	para "mich in der"
	line "Zeitung verfasst."
	para "Seitdem kennt"
	line "jeder diese"
	cont "Geschichte!"
	
	para "Dieser junge Mann"
	line "tut mir wirklich"
	para "leid, denn durch"
	line "seine Amnesie"
	para "erinnert er sich"
	line "an nichts mehr <...>"
	para "Keine Erinnerung"
	line "an sein Leben vor"
	para "der Höhle oder an"
	line "seine Familie."
	para "Bis heute wandert"
	line "er von Zeit zu"
	para "Zeit durch diese"
	line "Höhle, in der"
	para "Hoffnung, sich"
	line "daran zu erinnern,"
	cont "warum er dort war."
	para "Doch selbst ich,"
	line "ein großer Held,"
	para "kann ihm seine"
	line "Erinnerungen nicht"
	cont "zurückbringen."
	para "Vielleicht kannst"
	line "du es ja"
	cont "versuchen."
	
	para "Ach, und falls du"
	line "den"
	para "Zeitungsartikel"
	line "über meine"
	para "Heldentat lesen"
	line "möchtest: er hängt"
	para "eingerahmt hinter"
	line "mir an der Wand."
	para "LIES IHN, OK?"
	para "BITTE!"
	done

PhloxMyles_MapEventHeader:
	;filler
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