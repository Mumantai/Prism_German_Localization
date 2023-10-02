JensLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

JensLabJen:
	faceplayer
	opentext
	checkevent EVENT_PROF_JEN_INTRO
	sif false, then
		setevent EVENT_PROF_JEN_INTRO
		jumptext .introduction_text
	sendif
	copybytetovar wRijonBadges
	sif !=, $ff
		jumptext .not_enough_badges_text
	checkevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	sif true
		jumptext .after_receiving_ticket_text
	writetext .receive_ticket_text
	verbosegiveitem FERRY_TICKET, 1
	setevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	jumptext .free_mon_text

.introduction_text
	ctxt "Hallo, man nennt"
	line "mich Jen. Ich bin"
	para "die Assistentin"
	line "von Prof. Tim."
	para "Prof. Tim ist eine"
	line "ganze Weile weg,"
	para "deshalb habe ich"
	line "seine Forschungen"
	cont "weitergeführt."
	para "Oh, du bist der"
	line "neue Champion der"
	cont "Rijon-Liga?"
	para "Es gibt da diesen"
	line "geheimen Ort zum"
	para "Kämpfen. Man nennt"
	line "ihn Kampfarkaden."
	para "Wenn du alle 8"
	line "Orden in Rijon ge-"
	para "sammelt hast, gebe"
	line "ich dir ein Ticket"
	cont "für die Fähre."
	para "Viel Glück!"
	done

.not_enough_badges_text
	ctxt "Hallöchen!"
	para "Du hast immer noch"
	line "nicht alle Orden"
	cont "von Rijon?"
	para "Na dann, gib nicht"
	line "auf!"
	done

.receive_ticket_text
	ctxt "Unglaublich!"
	para "Du hast es"
	line "geschafft, alle"
	cont "Orden zu sammeln!"
	para "Nimm dieses"
	line "Ticket, geh zum"
	para "Hafen im Castrotal"
	line "und nimm das"
	para "Schiff in Richtung"
	cont "Kampfarkaden."
	sdone

.after_receiving_ticket_text
	ctxt "Es gibt immer neue"
	line "und erstaunliche"
	para "Entdeckungen über"
	line "#mon zu"
	cont "berichten!"
	para "Ich hoffe, dass"
	line "ich eines Tages"
	para "ein genialer"
	line "#mon-Professor"
	para "werde, wie mein"
	cont "Großvater vor mir!"
	done

.free_mon_text
	ctxt "Ich überlasse dir"
	line "auch eines dieser"
	para "frisch geschlüpf-"
	cont "ten #mon."
	para "Ein Trainer, der"
	line "so begabt ist wie"
	para "du, sollte in der"
	line "Lage sein, es"
	para "vernünftig zu"
	line "erziehen!"
	done

JensLabRedBall:
	scall JensLab_CheckFreeMonStatus
	sif true
		jumptext .ball_text
	writebyte CHARMANDER
	scall JensLab_ConfirmMon
	sif false
		end
	disappear 3
	opentext
	writetext .mon_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	givepoke CHARMANDER, 5, NO_ITEM, 0
	setevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent EVENT_PROF_JEN_CHARMANDER
	closetextend

.ball_text
	ctxt "Ein roter"
	line "#ball!"
	done

.mon_text
	ctxt "<PLAYER> erhält"
	line "Glumanda!"
	done

JensLabBlueBall:
	scall JensLab_CheckFreeMonStatus
	sif true
		jumptext .ball_text
	writebyte SQUIRTLE
	scall JensLab_ConfirmMon
	sif false
		end
	disappear 4
	opentext
	writetext .mon_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	givepoke SQUIRTLE, 5, NO_ITEM, 0
	setevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent EVENT_PROF_JEN_SQUIRTLE
	closetextend

.ball_text
	ctxt "Ein blauer"
	line "#ball!"
	done

.mon_text
	ctxt "<PLAYER> erhält"
	line "Schiggy!"
	done

JensLabGreenBall:
	scall JensLab_CheckFreeMonStatus
	sif true
		jumptext .ball_text
	writebyte BULBASAUR
	scall JensLab_ConfirmMon
	sif false
		end
	disappear 5
	opentext
	writetext .mon_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	givepoke BULBASAUR, 5, NO_ITEM, 0
	setevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent EVENT_PROF_JEN_BULBASAUR
	closetextend

.ball_text
	ctxt "Ein grüner"
	line "#ball!"
	done

.mon_text
	ctxt "<PLAYER> erhält"
	line "Bisasam!"
	done
JensLab_CheckFreeMonStatus:
	; returns 0 if the free mon is available, -1 if the ticket hasn't been given away yet, or 1 if it was already picked up
	checkevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	addvar -1
	sif true
		end
	checkevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	end

JensLab_ConfirmMon:
	refreshscreen 0
	pokepic 0
	cry 0
	waitbutton
	closepokepic
	pokenamemem 0, 0
	opentext
	writetext .mon_text
	yesorno
	sif false
		closetextend
	checkcode VAR_PARTYCOUNT
	sif <, 6
		end
	checkcode VAR_BOXSPACE
	sif true
		end
	writebyte 0
	jumptext .no_space_text

.mon_text
	ctxt "Es ist ein"
	line "<STRBF3>!"
	para "Behalten?"
	done

.no_space_text
	ctxt "Bitte mach in"
	line "deiner Gruppe oder"
	cont "Box Platz frei!"
	done

JensLabGoldTokenCollector1:
	writehalfword EVENT_PROF_JEN_PROF_1
	jump JensLabGoldTokenCollector

JensLabGoldTokenCollector2:
	writehalfword EVENT_PROF_JEN_PROF_2
	; fallthrough

JensLabGoldTokenCollector:
	faceplayer
	opentext
	checkevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	sif false
		jumptext .introduction_text
	checkevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	sif false
		jumptext .pending_gift_text
	checkevent -1
	sif true
		jumptext .already_exchanged_text
	writetext .offer_text
	yesorno
	sif false
		jumptext .refused_text
	takeitem GOLD_TOKEN, 8
	sif false
		jumptext .not_enough_tokens_text
	clearevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent -1
	jumptext .pick_one_text

.introduction_text
	ctxt "Ich bin die"
	line "Assistentin von"
	cont "Prof. Tim."
	para "Vielleicht habe"
	line "ich ein Angebot"
	para "für dich, falls du"
	line "Jen dort drüben"
	cont "beeindruckst."
	done

.pending_gift_text
	ctxt "Hol dir zuerst"
	line "dein Geschenk ab!"
	done

.already_exchanged_text
	ctxt "Danke für die"
	line "Münzen, mein"
	cont "Bester!"
	done

.offer_text
	ctxt "Ich bin die"
	line "Assistentin von"
	para "Prof. Tim und"
	line "sammle Goldmünzen."
	para "Wenn du mir acht"
	line "gibst, dann gebe"
	para "ich dir eins von"
	line "diesen #mon"
	cont "auf dem Tisch."
	para "Interesse?"
	done

.refused_text
	ctxt "Wer kann zu neuen"
	line "#mon schon"
	cont "nein sagen?"
	done

.not_enough_tokens_text
	ctxt "Das reicht nicht."
	line "Komm etwas später"
	cont "wieder."
	done

.pick_one_text
	ctxt "Spitze, jetzt nimm"
	line "dir ein #mon"
	cont "vom Tisch da!"
	done

JensLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $4, 3, GRAVEL_TOWN
	warp_def $b, $5, 3, GRAVEL_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 6
	person_event SPRITE_JEN, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, JensLabJen, -1
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JensLabRedBall, EVENT_PROF_JEN_CHARMANDER
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, JensLabBlueBall, EVENT_PROF_JEN_SQUIRTLE
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, JensLabGreenBall, EVENT_PROF_JEN_BULBASAUR
	person_event SPRITE_SCIENTIST, 9, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JensLabGoldTokenCollector1, -1
	person_event SPRITE_SCIENTIST, 9, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JensLabGoldTokenCollector2, -1