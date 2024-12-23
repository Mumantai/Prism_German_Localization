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
	line "Ende!"
	done

.battle_won_text
	ctxt "Was?!"
	done

.turn_lights_on_text
	ctxt "Ich konnte dich"
	line "nicht aufhalten <...>"
	para "Unsere Leiterin"
	line "wird es aber!"
	sdone

.after_battle_text
	ctxt "Also, ähm <...>"
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
	ctxt "Ich vermisse"
	line "unsere täglichen"
	para "Jam-Sessions von"
	line "früher."
	para "Daher lasse ich"
	line "nun meine"
	para "Agressionen an"
	line "dir raus!"
	done

.battle_won_text
	ctxt "Nicht wütend"
	line "genug!"
	done

.turn_lights_on_text
	ctxt "Ich denke du"
	line "schaffst es, gegen"
	cont "den Nächsten."
	sdone

.after_battle_text
	ctxt "Cadence wurde mal"
	line "wegen Ruhestörung"
	cont "verhaftet."
	para "Man hat ihr diese"
	line "Arena anvertraut,"
	para "weil sie die"
	line "Insassin war, die"
	para "ihre #mon am"
	line "besten behandelt."
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
	ctxt "Zu laut!"
	done

.turn_lights_on_text
	ctxt "Nun enthülle ich"
	line "dir den nächsten"
	cont "Trainer."
	sdone

.after_battle_text
	ctxt "Viel Glück!"
	para "Du wirst es"
	line "brauchen, hahaha!"
	done

SaxifrageGymGuide:
	checkflag ENGINE_RAUCOUSBADGE
	sif true
		jumptextfaceplayer .won_badge_text
	jumptextfaceplayer .guide_text

.guide_text
	ctxt "Hallo nochmal!"
	para "Die Leiterin hier"
	line "heißt Cadence."
	para "Sie hat früher"
	line "eine Rockband"
	cont "gegründet."
	para "Nach vielen"
	line "Misserfolgen,"
	para "beschlossen sie,"
	line "ihre eigene Arena"
	para "zu gründen,"
	line "die sich auf"
	para "Schall-#mon"
	line "spezialisiert hat."
	para "Aber es gibt halt"
	line "nicht so viele von"
	para "denen, also haben"
	line "sie noch ein paar"
	para "Elektro-#mon"
	line "dazugepackt."
	done

.won_badge_text
	ctxt "Was für ein"
	line "aufregender Kampf!"
	para "Ich musste mir"
	line "sogar extra starke"
	cont "Ohropax einsetzen!"
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
	ctxt "Was geht ab?!"
	para "Ich bin Cadence."
	para "Ich benutze die"
	line "Kraft des"
	para "Schalls, um die"
	line "Fähigkeiten"
	para "meiner #mon zu"
	line "verstärken!"
	para "Die Musik"
	line "verleiht mir"
	para "und meinen #mon"
	line "völlig neue"
	cont "Kräfte!"
	para "Doch als Laie,"
	line "verstehst du davon"
	cont "sicher nichts!"
	para "Egal. Ich mach"
	line "dich jetzt fertig!"
	sdone

.battle_won_text
	ctxt "Nun, mein Gig ist"
	line "vorbei und ich bin"
	cont "ausgelaugt."
	para "Du hast dir den"
	line "Krawallorden"
	cont "redlich verdient!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält"
	line "den Krawallorden."
	done

.give_TM_text
	ctxt "Hier ist eine TM,"
	line "die dir die Kraft"
	para "des Schalls"
	line "verleiht!"
	sdone

.after_TM_text
	ctxt "TM79 enthält"
	line "Schallwelle!"
	para "Diese starke"
	line "Schall-Attacke,"
	para "wird die Ohren"
	line "deiner Gegner"
	cont "betäuben!"
	done

.already_beaten_text
	ctxt "Hätte ich bloß"
	line "während meiner"
	para "Zeit im Gefängnis"
	line "meine wärmende"
	para "Pelzjacke nicht"
	line "verloren, könnte"
	para "ich endlich die"
	line "kalten, eisigen"
	para "Pfade der von hier"
	line "aus westlich"
	para "gelegenen"
	line "Naljo-Ruine"
	para "überqueren und so"
	line "die Stadt Flokalis"
	para "erreichen, um"
	line "endlich meinen"
	para "Freund zu"
	line "besuchen <...>"
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