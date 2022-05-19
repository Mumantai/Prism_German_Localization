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
	line "Palette-Ranger."

	para "Ich existiere ja"
	line "noch nicht einmal!"

	para "Du bist in einem"
	line "Wachtraum."

	para "Du hast mich vor-"
	line "hin selber unbe-"
	cont "wusst erschaffen."


	para "<...>"

	para "Was für eine Rolle"
	line "ich in deinem"
	cont "Traum spiele <...>?"

	para "Naja <...> verstehst"
	line "du die aktuellen"
	para "Probleme, die"
	line "Naljo plagen?"

	para "Du und deine"
	line "#mon haben die"
	para "Kraft, dieser"
	line "Nation wieder zu"
	para "ihrem früheren"
	line "Glanz zu verhelfen"

	para "<...>"

	para "Wie ich das weiß?"

	para "Du hast mich"
	line "erschaffen, also <...>"

	para "Wusstest du das"
	line "tief in dir nicht"
	cont "schon immer?"

	para "Die Region, aus"
	line "der du kommst <...>"

	para "<...> hat keinerlei"
	line "Probleme, richtig?"

	para "Naljo war einst"
	line "ganz ähnlich -"
	cont "frei von Sorgen."

	para "<...>"

	para "Was passiert ist?"

	para "Korruption."

	para "Geiz."

	para "Depression."

	para "<...>"

	para "Noch genauer?"

	para "Das ist alles,"
	line "was du weißt. Du"
	para "hast es mir doch"
	line "selbst erzählt <...>"

	para "Deine Region wird"
	line "die nächste sein."
	para "Zusammen mit all"
	line "den anderen um"
	cont "sie herum <...>"

	para "<...>"

	para "Was meinst du mit"
	line "'Gier ruinierte"
	cont "die Naljo Region?'"

	para "<...>"

	para "Gengar: Mmmmh!"
	line "Lecker lecker!"

	para "Viele schmackhafte"
	line "Konflikte in die-"
	cont "ser Hirnhälfte <...>"
	
	para "<...>"
	
	para "Schmatz <...> Schmatz <...>"

	para "Es scheint, dass"
	line "du Gengars"
	cont "Mahlzeit bist <...>"

	para "Vergiss nicht, was"
	line "ich dir sagte."

	para "Du kannst ein Held"
	line "werden <...>"

	para "Du wirst alles"
	line "herausfinden und"
	para "es auch bald schon"
	line "verstehen."

	para "Vertrau mir <...>"

	para "Du musst nur <...>"

	para "An dich glauben <...>"
	sdone

.gengar_text
	ctxt "-RÜLPS-"

	para "Das war lecker!"

	para "Ich muss auf mein"
	line "Gewicht achten."

	para "Keine Träume mehr"
	line "für mich, für"
	para "mindestens eine"
	line "Woche!"
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
