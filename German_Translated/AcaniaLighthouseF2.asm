AcaniaLighthouseF2_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AcaniaLighthouseF2OldMan:
	faceplayer
	opentext
	checkevent EVENT_GIVEN_HM03
	sif true
		jumptextfaceplayer .thanks_text
	writetext .give_HM_text
	givetm HM_SURF + RECEIVED_TM
	setevent EVENT_GIVEN_HM03
	jumptext .explain_HM_text

.thanks_text
    ctxt "Danke, dass du dir"
    line "dir Zeit dafür"
    para "nimmst, dich mit"
    line "einem alten Mann"
    para "zu unterhalten"
    line "der nichts mehr"
    para "hat, außer"
    line "diesen Leucht-"
    cont "turm."
	done

.give_HM_text
    ctxt "Hey!"

    para "Nobu hat dich"
    line "geschickt?"
	
	para "<...>"

	para "Ob ich den"
    line "Naljo Wächter,"
    cont "Varaneous sah?"
 
    para "Habe ich!"
 
    para "Ich bin für den"
    line "Leuchtturm zu-"
    para "ständig und"
    line "sehe alles."
 
    para "Varaneous ist"
    line "nach Südosten"
    para "zu der Gefängnis-"
    line "insel Steinbruch"
    cont "gereist."
 
    para "Es scheint, als"
    line "wolle er den,"
    para "seit jahrhunderten"
    line "schlafenden"
    cont "Fambaco wieder-"
    cont "erwecken."
 
    para "Hmm... scheint,"
    line "also könntest du"
    para "Hilfe gebrauchen,"
    line "dort hin zu"
    cont "gelangen."
 
    para "Diese VM wird"
    line "dir nützlich sein."
    sdone

.explain_HM_text
    ctxt "VM03 enthält"
    line "Surfer."
 
    para "Damit kann dein"
    line "#mon auf Gewäs-"
    cont "sern schwimmen-"
    sdone

AcaniaLighthouseF2FireWithDisc:
	opentext
	writetext .askWater
	yesorno
	sif false
.exit
		closetextend
	checkpokemontype WATER
	anonjumptable
	dw .notWater
	dw .foundWater
	dw .exit

.askWater
    ctxt "Das Feuer erhellt"
    line "den Leuchtturm."
 
    para "Macht lieber"
    line "keinen Blödsinn"
    cont "damit!"

    para "Moment mal<...>"
 
    para "Es scheint sich"
    line "etwas im Inneren"
    cont "zu befinden."
 
    para "Das Feuer mit"
    line "einem Wasser #-"
    cont "mon löschen?"
    done

.notWater
	jumptext .notWaterText
.notWaterText
    ctxt "Das ist kein"
    line "Wasser #mon."
	done

.foundWater
	giveitem DUBIOUS_DISC, 1
	sif false
		jumptext .fullBagText
	writetext .doused
	disappear 3
	waitbutton
	setevent EVENT_ACANIA_LIGHTHOUSE_FIRE
	jumptext .gotDisc

.fullBagText
	ctxt "Dein Beutel ist"
	line "voll<...>"
	done

.doused
    ctxt "Feuer gelöscht!"
	done

.gotDisc
    ctxt "Wow, eine"
    line "Dubiosdisc!"
 
    para "Sie muss wirklich"
    line "robust sein, dass"
 
    para "sie nicht ver-"
    line "brannt ist<...>"
 
    para "Es muss einen"
    line "Grund geben, warum"
    para "jemand versuchte"
    line "sie zu verbrennen."
	done

AcaniaLighthouseF2Fire:
    ctxt "Das Feuer erhellt"
    line "den Leuchtturm."

	para "Mach kein Blödsinn"
	line "damit!"
	done

AcaniaLighthouseF2_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def 7, 9, 3, ACANIA_LIGHTHOUSE_F1

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 9
	person_event SPRITE_SAGE, 13, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AcaniaLighthouseF2OldMan, -1
	person_event SPRITE_FIRE, 6, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcaniaLighthouseF2FireWithDisc, EVENT_ACANIA_LIGHTHOUSE_FIRE
	person_event SPRITE_FIRE, 11, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 15, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 15, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 11, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 6, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 2, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 2, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
