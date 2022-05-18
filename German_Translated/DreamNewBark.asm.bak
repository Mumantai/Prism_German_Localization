DreamNewBark_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

DreamNewBarkNPC:
	faceplayer
	opentext
	writetext .main_text
	playsound SFX_PERISH_SONG
	setevent EVENT_HAUNTED_FOREST_GENGAR
	warp HAUNTED_MANSION, 49, 24
	jumptext .gengar_text

.main_text
	ctxt "Grüß dich."

	para "Was?"

	para "Nein, ich bin kein"
	line "Paletten Mitglied."

	para "Ich existiere ja"
	line "noch nicht einmal!"

	para "Du bist in einem"
	line "luziden Traum."

	para "Du hast mich vor"
	line "einpaar minuten"
	para "unbewusst selbst"
	line "erschaffen."

	para "<...>"

	para "Was für eine Rolle"
	line "ich in deinem"
	cont "Traum spiele<...>?"

	para "Naja<...> verstehst"
	line "du die aktuellen"
	para "haupt Probleme der"
	line "Nalo-Region?"

	para "Du und deine"
	line "#mon haben die"
	para "Kraft, diese"
	line "Nation wieder zu"
	para "Ihrem früheren"
	line "Glanz zu verhelfen"

	para "<...>"

	para "Wie ich das weis?"

	para "Du hast mich"
	line "geschaffen, also<...>"

	para "Wusstest du das"
	line "tief in dir nicht"
	cont "schon immer?"

	para "Die Region woher"
	line "du herkommst<...>"

	para "Hat keinerlei"
	line "probleme, richtig?"

	para "Naljo ging es mal"
	line "genau so früher -"
	cont "Ein Paradies."

	para "<...>"

	para "Was passiert ist?"

	para "Korruption."

	para "Geiz."

	para "Depressionen."

	para "<...>"

	para "Noch genauer?"

	para "Das ist doch alles"
	line "was du weisst, du"
	para "hast mir das doch"
	line "erzählt<...>"

	para "Deine Region wird"
	line "die nächste sein,"
	para "gemeinsam mit all"
	line "den anderen"
	cont "Regionen im Umfeld"

	para "<...>"

	para "Was meinst du mit"
	line "'Geiz ruinierte"
	cont "die Naljo Region?'"

	para "<...>"

	para "Gengar: Mmmm!"
	line "Lecker Lecker!"

	para "Viele schmackhafte"
	line "Konflikte in"
	cont "dieser Hirnhälfte<...>"
	
	para "<...>"
	
	para "Schmatz<...> Schmatz<...>"

	para "Es scheint, dass"
	line "du Gengars"
	cont "Mahlzeit bist<...>"

	para "Vergiss nicht was"
	line "ich dir sagte. "

	para "Du kannst ein Held"
	line "werden<...>"

	para "Du wirst alles"
	line "herausfinden und"
	cont "daran wachsen!"

	para "Vertrau mir<...>"

	para "Du musst nur<...>"

	para "In dich Vertauen<...>"
	sdone

.gengar_text
	ctxt "-RÜLPS-"

	para "Das war LECKER!"

	para "Ich muss auf mein"
	line "Gewicht achten."

	para "Keine Träume mehr"
	line "für mich, für"
	para "mindestens eine"
	line "Woche!"
	para "Als erstes höre"
	line "ich auf die"
	para "Träume von diesem"
	line "Leiter Edison zu"
	cont "fressen<...>"
	done

DreamNewBark_MapEventHeader:: db 0, 0

.Warps
	db 0

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_PALETTE_PATROLLER, 14, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PLAYER + 8, PERSONTYPE_SCRIPT, 0, DreamNewBarkNPC, -1
