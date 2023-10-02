SaxifrageGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_lights

.set_lights
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_1
	sif true
		return
	scall SaxifrageGym_LightsOn1
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_2
	sif true
		return
	scall SaxifrageGym_LightsOn2
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_3
	sif true
		return
	scall SaxifrageGym_LightsOn3
	return

SaxifrageGym_LightsOn1:
	changeblock 6, 6, $d
	changeblock 8, 6, $1b
	changeblock 6, 8, $e
	end

SaxifrageGym_LightsOn2:
	changeblock 4, 4, $1d
	changeblock 4, 6, $e
	changeblock 6, 4, $1c
	end

SaxifrageGym_LightsOn3:
	changeblock 2, 0, $5
	changeblock 4, 0, $4
	changeblock 6, 0, $6
	changeblock 2, 2, $10
	changeblock 4, 2, $11
	changeblock 6, 2, $12
	end

SaxifrageGym_Trainer_1:
	trainer EVENT_SAXIFRAGE_GYM_TRAINER_1, GUITARISTF, 1, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_3
	sif false
		jumptext .after_battle_text
	opentext
	writetext .turn_lights_on_text
	playsound SFX_ENTER_DOOR
	scall SaxifrageGym_LightsOn3
	clearevent EVENT_SAXIFRAGE_LIGHT_OFF_3
	reloadmappart
	appear 2
	closetextend

.before_battle_text
	ctxt "Das ist dein"
	line "ENDE!"
	done

.battle_won_text
	ctxt "Was?!"
	done

.turn_lights_on_text
	ctxt "Ich konnte dich"
	line "nicht aufhalten<...>"
	para "Unsere Leiterin"
	line "wird es aber!"
	sdone

.after_battle_text
	ctxt "So, ähm<...>"
	para "Hast du eine Band?"
	para "Kann ich"
	line "mitmachen?"
	done

SaxifrageGym_Trainer_2:
	trainer EVENT_SAXIFRAGE_GYM_TRAINER_2, GUITARISTF, 2, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_2
	sif false
		jumptext .after_battle_text
	opentext
	writetext .turn_lights_on_text
	playsound SFX_ENTER_DOOR
	scall SaxifrageGym_LightsOn2
	reloadmappart
	clearevent EVENT_SAXIFRAGE_LIGHT_OFF_2
	appear 3
	closetextend

.before_battle_text
	ctxt "Ich vermisse die"
	line "täglichen Band"
	para "Auftritte von"
	line "damals."
	para "Daher lasse ich"
	line "ich nun meine"
	para "Agressionen an"
	line "dir raus!"
	done

.battle_won_text
	ctxt "Nicht wütend"
	line "genug!"
	done

.turn_lights_on_text
	ctxt "Ich denke du"
	line "schaffst es gegen"
	cont "den nächsten."
	sdone

.after_battle_text
	ctxt "Cadence wurde mal"
	line "wegen gefährdung"
	para "des Friedens ein-"
	line "gesperrt."
	para "Ihr wurde danach"
	line "diese Arena über-"
	para "geben, weil Sie"
	line "unter den anderen"
	para "insassen die"
	line "jenige war, die"
	para "Ihre #mon"
	line "am besten"
	cont "behandelt hat!"
	done

SaxifrageGym_Trainer_3:
	trainer EVENT_SAXIFRAGE_GYM_TRAINER_3, GUITARIST, 1, .before_battle_text, .battle_won_text, NULL, .Script

.Script:
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_1
	sif false
		jumptext .after_battle_text
	opentext
	writetext .turn_lights_on_text
	playsound SFX_ENTER_DOOR
	scall SaxifrageGym_LightsOn1
	reloadmappart
	clearevent EVENT_SAXIFRAGE_LIGHT_OFF_1
	appear 4
	closetextend

.before_battle_text
	ctxt "Drehen wir die"
	line "Lautstärke hoch!"
	done

.battle_won_text
	ctxt "Rausgeflogen!"
	done

.turn_lights_on_text
	ctxt "Nun enthülle ich"
	line "dir den nächsten"
	cont "Trainer."
	sdone

.after_battle_text
	ctxt "Viel Erfolg!"
	para "Du wirst es "
	line "brauchen HAHAHA!"
	done

SaxifrageGymGuide:
	checkflag ENGINE_RAUCOUSBADGE
	sif true
		jumptextfaceplayer .won_badge_text
	jumptextfaceplayer .guide_text

.guide_text
	ctxt "Hallo nochmal!"
	para "Das ist Cadence."
	para "Damals gründete"
	line "Sie eine Rockband."
	para "Nach mehreren"
	line "niederlagen, haben"
	para "Sie sich dazu"
	line "entschlossen,"
	para "lieber eine Arena"
	line "zu gründen, die"
	para "auf Schall #mon"
	line "spezialisiert ist."
	para "Da es nicht viele"
	line "Schall #mon"
	para "gibt dachten Sie"
	line "sich, das einpaar"
	para "Elektro #mon"
	line "nicht schaden"
	cont "würden."
	done

.won_badge_text
	ctxt "Das war ein"
	line "wilder Kampf!"
	para "Ich musste mir"
	line "sogar einpaar"
	para "3M Gehörschutz-"
	line "Stöpsel einsetzen."
	done

SaxifrageGymLeader:
	checkflag ENGINE_RAUCOUSBADGE
	sif true
		jumptextfaceplayer .already_beaten_text
	faceplayer
	opentext
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer CADENCE, CADENCE_GYM
	startbattle
	reloadmapafterbattle
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	writetext .give_TM_text
	givetm TM_HYPER_VOICE + RECEIVED_TM
	setflag ENGINE_RAUCOUSBADGE
	jumptext .after_TM_text

.introduction_text
	ctxt "Was geht?"
	para "Ich bin Cadence."
	para "Ich nutze die"
	line "Kraft des Schalls."
	para "Die Macht von"
	line "Schall und Musik"
	para "beeinflussen die"
	line "#mon positiv!"
	para "Schau dich an!"
	line "Du kennst noch"
	para "nicht einmal den"
	line "unterschied"
	para "zwischen einer"
	line "Sinusschwingung"
	para "und einem"
	line "Rechtecksignal!"
	para "Wie erbärmlich"
	line "du bist! Nun lass"
	cont "uns Kämpfen!"
	sdone

.battle_won_text
	ctxt "Du hast die Bühne"
	line "gerockt!"
	para "Du hast dir den"
	line "Lärm-Orden redlich"
	cont "verdient!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält"
	line "Lärm Orden."
	done

.give_TM_text
	ctxt "Hier ist eine TM"
	line "mit der du dir"
	para "den Schall zu"
	line "eigen machen"
	cont "kannst!"
	sdone

.after_TM_text
	ctxt "TM79 ist"
	line "Schallwelle!"
	para "Es ist eine sehr"
	line "starke Schall"
	para "Attacke der die"
	line "Ohren des Gegners"
	cont "betäubt!"
	done

.already_beaten_text
	ctxt "Ich werde nun"
	line "weiter neue Songs"
	cont "schreiben!"
	para "Meine #mon"
	line "helfen mir den"
	para "besten ABROCK-"
	line "Song zu schaffen!"
	para "Übrigens wenn du"
	line "im Gefängnis eine"
	para "Pelz-Jacke"
	line "gefunden haben"
	para "solltest, kannst"
	line "du die kalte Zone"
	para "in den Ruinen"
	line "betreten."
	cont "Just sayin."
	done

SaxifrageGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $d, $5, 2, SAXIFRAGE_ISLAND
	warp_def $d, $4, 2, SAXIFRAGE_ISLAND

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 5
	person_event SPRITE_CADENCE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaxifrageGymLeader, EVENT_SAXIFRAGE_LIGHT_OFF_3
	person_event SPRITE_GUITARISTF, 5, 5, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, SaxifrageGym_Trainer_1, EVENT_SAXIFRAGE_LIGHT_OFF_2
	person_event SPRITE_GUITARISTF, 7, 7, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, SaxifrageGym_Trainer_2, EVENT_SAXIFRAGE_LIGHT_OFF_1
	person_event SPRITE_ROCKER, 9, 3, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TRAINER, 0, SaxifrageGym_Trainer_3, -1
	person_event SPRITE_GYM_GUY, 10, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SaxifrageGymGuide, -1