SaxifrageIsland_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SAXIFRAGE_ISLAND
	return

SaxifrageIslandHiddenItem:
	dw EVENT_SAXIFRAGE_ISLAND_HIDDENITEM_REVIVE
	db REVIVE

SaxifrageIslandDescriptionSign:
	ctxt "Die Insel in der"
	next "Kriminelle vom"
	next "Rest der Welt"
	next "isoliert werden."
	done

SaxifrageIslandNPC1:
	ctxt "Die Gefangenen aus"
	line "diesem Gefängnis"
	para "erzählen die"
	line "wildesten Märchen."
	para "Ein Insasse meinte"
	line "mal, er hätte in"
	para "einer Nacht mitten"
	line "im Flur rote Augen"
	cont "aufleuchten sehen."
	done

SaxifrageIslandNPC2:
	ctxt "Ich warte auf"
	line "meinen Freund bis"
	para "er freigelassen"
	line "wird."
	para "Ich würde sogar"
	line "für immer auf Ihn"
	cont "warten!"
	done

SaxifrageIslandNPC3:
	ctxt "Ich habe eine"
	line "Mauer gebaut, die"
	para "den Eingang"
	line "blockiert, damit"
	para "keiner fliehen"
	line "kann."
	done

SaxifrageIslandNPC4:
	ctxt "Hier ein heißer"
	line "Tipp für dich."
	para "Du kennst den"
	line "Höhleneingang, der"
	para "auf der Westseite"
	line "dieser Ruinen an"
	para "Route 78 versteckt"
	line "ist?"
	para "Geh nicht hinein,"
	line "ohne dich warm"
	cont "anzuziehen!"
	done

SaxifrageIslandArrest:
	checkevent EVENT_ARRESTED
	sif true
		end
	applymovement 11, .guard_approaches_player
	opentext
	writetext .show_ID_text
	takeitem FAKE_ID, 1
	waitbutton
	warp PRISON_F1, 20, 6
	showtext .arrested_text
	setevent EVENT_ARRESTED
	applymovement 4, .guard_leaves
	blackoutmod PRISON_F1
	disappear 4
	end

.guard_approaches_player
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end

.guard_leaves
	rept 7
		step_right
	endr
	step_end

.show_ID_text
	ctxt "Halt!"
	para "Zeig mir deinen"
	line "Ausweis!"
	para "<...>"
	para "Haha, du denkst"
	line "auch ich bin blöd"
	cont "was?"
	para "Mit einem Fake"
	line "Ausweis kannst du"
	para "deine Oma täuschen"
	line "aber nicht mich!"
	para "Komm nun schön"
	line "mit mir mit."
	done

.arrested_text
	ctxt "Du wirst nun hier"
	line "warten."
	para "Du stehst nicht"
	line "unter Arrest,"
	cont "keine sorge!"
	para "Wir wissen noch"
	line "nicht, was wir mit"
	cont "dir machen sollen."
	para "Es kommen nicht"
	line "viele Kinder nach"
	cont "Saxifragia."
	para "Normalerweise<...>"
	para "Es kommen sonst"
	line "Kerle her, die"
	para "sagen sie würden"
	line "Cadence heraus-"
	para "fordern wollen,"
	line "aber versuchen"
	para "dann ihre Freunde"
	line "aus den Gefängnis"
	para "zu befreien."
	para "Deshalb weis ich"
	line "nicht warum du nun"
	para "genau hier bist"
	line "und was du vor"
	para "hast, aber wir"
	line "finden das morgen"
	cont "heraus."
	sdone

SaxifrageIslandPaletteBlue:
	faceplayer
	opentext
	checkevent EVENT_PALETTE_BLUE
	sif true
		jumptext .already_gave_key_text
	writetext .introduction_text
	verbosegiveitem CAGE_KEY, 1
	sif false
		jumptext .no_space_text
	setevent EVENT_PALETTE_BLUE
	endtext

.introduction_text
	ctxt "Haben Sie dich"
	line "auch geschnappt?"
	para "Ich wurde hier her"
	line "gebracht, Pink"
	para "nach Aegolia City"
	line "und Rot<...> schaffte"
	cont "es zu entkommen."
	para "<...>"
	para "Wie ich hier nur"
	line "gelandet bin?"
	para "Nunja<...>"
	para "Nachdem ich hier"
	line "gelandet bin, kam"
	para "Varaneous, der von"
	line "Rot erweckt wurde,"
	para "und erschuf diesen"
	line "Pfad da hinten."
	para "Rot sagte, dass"
	line "Varaneous weis, wo"
	para "die anderen"
	line "Wächter sind."
	para "Es will bestimmt"
	line "den anderen"
	para "Wächtern Ihre"
	line "Kugeln zurück-"
	cont "bringen."
	para "Ich konnte durch"
	line "diesen Pfad"
	para "fliehen und bin"
	line "nun hier."
	para "Ach und das hier"
	line "habe ich in der"
	para "Kabine des"
	line "Aufsehers"
	cont "gefunden<...>"
	para "Nimms ruig."
	para "Varaneous ist"
	line "vieleicht noch"
	cont "in der nähe."
	para "Ich habe das"
	line "Gefühl, dass du es"
	cont "zähmen könntest."
	sdone

.already_gave_key_text
	ctxt "Such bitte nach"
	line "den Wächtern."
	done

.no_space_text
	ctxt "Mach etwas platz"
	line "in deinem Beutel"
	cont "frei!"
	done

SaxifrageIsland_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 23, 16, 1, PRISON_F1
	warp_def 35, 2, 2, SAXIFRAGE_GYM
	warp_def 11, 25, 1, SAXIFRAGE_POKECENTER
	warp_def 37, 27, 1, SAXIFRAGE_MART
	warp_def 19, 2, 4, SAXIFRAGE_EXITS
	warp_def 3, 26, 1, SAXIFRAGE_EXITS
	warp_def 3, 7, 1, SAXIFRAGE_WARDENS_HOUSE

.CoordEvents: db 1
	xy_trigger 0, 20, 2, SaxifrageIslandArrest

.BGEvents: db 2
	signpost 30, 18, SIGNPOST_LOAD, SaxifrageIslandDescriptionSign
	signpost 17, 8, SIGNPOST_ITEM, SaxifrageIslandHiddenItem

.ObjectEvents: db 11
	person_event SPRITE_PALETTE_PATROLLER, 20, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SaxifrageIslandPaletteBlue, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_OFFICER, 31, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC1, -1
	person_event SPRITE_LASS, 22, 21, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC2, -1
	person_event SPRITE_OFFICER, 24, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC3, -1
	person_event SPRITE_BOULDER, 25, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 13, 7, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 24, 8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 6, 13, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 8, 28, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 22, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ARRESTED
	person_event SPRITE_HIKER, 39, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC4, -1