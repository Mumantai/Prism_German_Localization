GoldenrodMartB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodMartB1F_Rival:
	faceplayer
	opentext
	playmusic MUSIC_RIVAL_ENCOUNTER
	checkevent EVENT_RIVAL_GOLDENROD_BASEMENT
	sif false, then
		writetext .before_battle_text
		winlosstext .defeated_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer RIVAL1, 6
		startbattle
		reloadmapafterbattle
		playmapmusic
		playmusic MUSIC_RIVAL_ENCOUNTER
		opentext
		setevent EVENT_RIVAL_GOLDENROD_BASEMENT
		writetext .give_TM_text
		waitbutton
		givetm TM_THIEF + RECEIVED_TM
		opentext
		writetext .after_TM_text
	selse
		writetext .after_battle_text
	sendif
	playmusic MUSIC_UNION_CAVE
	closetextend

.before_battle_text
	ctxt "Oh, was geht?"
	para "Ich habe diesen"
	line "Keller als meinen"
	para "Unterschlupf"
	line "beansprucht."
	para "Seit Jahren ist"
	line "hier unten niemand"
	cont "mehr gewesen."
	para "Die Leute wollen"
	line "mich für immer"
	para "hinter Gittern"
	line "sehen, aber wir"
	para "wissen beide, dass"
	line "das meinen psychi-"
	para "schen Zustand"
	line "verschlechtern"
	line "würde."
	para "Wenn sie mich"
	line "freilassen, werden"
	para "sie einen Grund"
	line "finden, mich"
	para "wieder hinter"
	line "Gitter zu stecken."
	para "Dieser Ort ist"
	line "perfekt, um sich"
	para "vor den Naljo-"
	line "Bullen zu ver-"
	para "stecken."
	line "Ich glaube nicht,"
	para "dass jemand in"
	line "Johto jemals von"
	cont "mir gehört hätte."
	para "Ich kann mit einem"
	line "neuen Namen neu"
	cont "anfangen."
	para "Wenn du mir nicht"
	line "glaubst, schau,"
	para "wie ich meine"
	line "#mon jetzt"
	cont "behandle."
	done

.defeated_text
	ctxt "Ich muss nur die"
	line "Scherben auf-"
	cont "sammeln <...>"
	done

.give_TM_text
	ctxt "Ich habe wirklich"
	line "keine Verwendung"
	cont "mehr für diese TM."
	para "Vielleicht kannst"
	line "du sie gebrauchen."
	done

.after_TM_text
	ctxt "Wenn mein kleines"
	line "Glumanda mich in"
	para "diesem Moment nur"
	line "sehen könnte <...>"
	para "Ich hoffe, es hat"
	line "nicht das Gefühl,"
	para "dass es seine"
	line "Schuld war."
	para "Es war meine."
	para "Das Leben ist"
	line "nicht fair, aber"
	para "ich hätte nicht"
	line "tun sollen, was"
	cont "ich getan habe."
	sdone

.after_battle_text
	ctxt "Ich kann nichts"
	line "mehr tun <...> Viele"
	para "Menschen werden"
	line "mir nie verzeihen,"
	para "aber es ist"
	line "verständlich."
	sdone

GoldenrodMartB1F_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def 2, 17, 3, GOLDENROD_STORAGE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_SILVER, 15, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodMartB1F_Rival, -1
	person_event SPRITE_POKE_BALL, 2, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DUSK_RING, EVENT_GOLDENROD_MART_BASEMENT_ITEM_DUSK_RING
	person_event SPRITE_POKE_BALL, 15, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_POISON_JAB, 0, EVENT_GOLDENROD_MART_BASEMENT_TM_POISON_JAB