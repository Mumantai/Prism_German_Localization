PhloxLab3F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

PHLOX_LAB_CEO EQU 2
PHLOX_LAB_OFFICER EQU 6
PHLOX_LAB_BLACK_PATROLLER EQU 7

PhloxLabF3CEO:
	faceplayer
	showtext .introduction_text
	checkcode VAR_FACING
	sif =, LEFT, then
		applymovement PLAYER, .player_moves_down
		spriteface PHLOX_LAB_CEO, DOWN
		spriteface PLAYER, UP
	sendif
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SCIENTIST, 13
	startbattle
	reloadmapafterbattle
	playmapmusic
	appear PHLOX_LAB_OFFICER
	appear PHLOX_LAB_BLACK_PATROLLER
	follow PHLOX_LAB_OFFICER, PHLOX_LAB_BLACK_PATROLLER
	applymovement PHLOX_LAB_OFFICER, .officer_walks_up
	stopfollow
	spriteface PHLOX_LAB_BLACK_PATROLLER, RIGHT
	applymovement PLAYER, .player_moves_right
	spriteface PLAYER, LEFT
	applymovement PHLOX_LAB_OFFICER, .officer_and_patroller_walk_right
	applymovement PHLOX_LAB_BLACK_PATROLLER, .officer_and_patroller_walk_right
	spriteface PHLOX_LAB_OFFICER, RIGHT
	opentext
	writetext .officer_appears_text
	spriteface PHLOX_LAB_OFFICER, DOWN
	writetext .officer_talks_to_black_text
	writetext .black_talks_text
	spriteface PHLOX_LAB_OFFICER, RIGHT
	writetext .officer_talks_to_player_text
	special ClearBGPalettes
	disappear PHLOX_LAB_OFFICER
	disappear PHLOX_LAB_BLACK_PATROLLER
	disappear PHLOX_LAB_CEO
	disappear 3
	disappear 4
	disappear 5
	special Special_ReloadSpritesNoPalettes
	playwaitsfx SFX_EXIT_BUILDING
	reloadmap
	setevent EVENT_PHLOX_LAB_CEO
	setevent EVENT_PHLOX_LAB_OFFICER
	end

.officer_and_patroller_walk_right
	step_right
	step_right
.player_moves_right
	step_right
	step_end

.player_moves_down
	step_down
	step_left
	step_end

.officer_walks_up
	step_up
	step_up
	step_up
	step_up
	step_end

.introduction_text
	ctxt "Wie ich sehe, bist"
	line "du hier."

	para "Ein Kind kann"
	line "all die Faktoren,"
	para "die diese Welt"
	line "bewegen, einfach"
	cont "nicht begreifen!"

	para "Als ich noch jung"
	line "war glaubte ich an"
	para "die verbesserung"
	line "von #mon durch"
	para "das Verständnis"
	line "Ihrer Stärken und"
	cont "Schwächen."
	
	para "Daraufhin klonte"
	line "ich ein #mon um"
	para "meine Theorie zu"
	line "beweisen."

	para "Es kam zu einem"
	line "Unfall und durch"
	para "den Klonungs-"
	line "prozess entstand"
	cont "Mewtwo."

	para "Daraufhin wurde"
	line "das Klonen von"
	para "#mon endgültig"
	line "verboten und meine"
	para "Ergebnisse wurden"
	line "mir weggenommen<...>"

	para "Ich wollte nur die"
	line "Stärke in der"
	para "Individualität der"
	line "#mon"
	cont "hervorbringen."

	para "Und genau diese"
	line "Individualität"
	para "eines #mon war"
	line "die Stärke, die"
	para "mir alles im"
	line "Leben nahm."

	para "Seit dem, widmete"
	line "ich mein Leben"
	para "der Gründung eines"
	line "Medizinischen"
	para "Forschungsinstitut"
	line "das den Ziel hat,"
	para "die DNA aller"
	line "#mon in einer"
	para "Datenbank aufzu-"
	line "listen und dadurch"
	para "viel genauer an"
	line "#mon"
	para "experimente"
	line "ausüben zu können."

	para "Dir gefällt es"
	line "sicher nicht, was"
	para "ich hier tuhe,"
	line "aber es sind"
	para "Menschen wie ich,"
	line "die diese Welt"
	para "weiter voran"
	line "schreiten lassen."

	para "#mon sind nur"
	line "Werkzeuge!"

	para "Kämpfe gegen mich"
	line "und spüre die"
	para "Macht der"
	line "genetisch"
	para "modifizierten"
	line "#mon!"
	sdone

.battle_won_text
	text "NEIN!"
	done

.officer_appears_text
	ctxt "Jut Jut."
	para "Freut mich dich"
	line "wieder zu treffen."

	para "Du hast der"
	line "Polizei wieder"
	cont "Arbeit abgenommen."

	para "Ich bin mir sicher"
	line "das du einpaar"
	para "Insider"
	line "Informationen"
	para "bekommen haben"
	line "musst<...>"
	sdone

.officer_talks_to_black_text
	ctxt "Wie dem auch sei<...>"
	line "Gute Arbeit"
	cont "geleistet, Kind."

	para "Sehr gute Arbeit."

	para "Dank dir wird"
	line "diese Firma hohe"
	para "Strafzahlungen"
	line "tätigen müssen und"
	para "alle die daran"
	line "beteiligt waren"
	para "können mit einem"
	line "Aufenthalt in"
	para "Saxifragia Eiland"
	line "rechnen!"
	sdone

.black_talks_text
	ctxt "Schwarz: Und die"
	line "#mon werden"
	para "Rehabilitiert und"
	line "zurück zu Ihren"
	para "echten Trainern"
	line "geschickt."
	sdone

.officer_talks_to_player_text
	ctxt "Polizist: Übrigens"
	line "Kind, du bist aus"
	para "dem Saxifragia"
	line "Gefängnis aus-"
	cont "gebrochen<...>"

	para "Wenn du uns nicht"
	line "geholfen hättest,"
	para "würden wir dich"
	line "glatt zurück dahin"
	cont "schicken!"

	para "Wir begnadigen"
	line "dich dafür, also"
	cont "bist du nun frei."

	para "Da nun dieser Fall"
	line "geschlossen ist,"
	para "ist es Zeit"
	line "nach Hause zu"
	para "gehen und zu tun"
	line "was mir Spaß"
	cont "macht<...>"

	para "<...>Undzwar der"
	line "Einzigwahre Arena"
	para "Leiter von"
	line "Euphorbia City"
	cont "zu sein!"

	para "Ich bin mir"
	line "ziemlich sicher,"
	para "das wir uns dort"
	line "bald sehen werden."

	para "Bis dahin."
	sdone

PhloxLabF3Trainer1:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_1, SCIENTIST, 10, .before_battle_text, .battle_won_text

	ctxt "Kämpfen ist nicht"
	line "mein Spezial-"
	cont "gebiet."

	para "Aber für die da"
	line "oben schon<...>"
	done

.before_battle_text
	ctxt "Seit dem ich so"
	line "viel Geld verdiene"
	para "habe ich"
	line "angefangen mit"
	para "dem Papier-Geld"
	line "meinen Kaminofen"
	para "anzuzünden, wenn"
	line "es draußen so"
	cont "Kalt ist."
	done

.battle_won_text
	ctxt "Vor dir steht der"
	line "CEO-wei von"
	cont "Koko-wei!"
	done

PhloxLabF3Trainer2:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_2, SCIENTIST, 11, .before_battle_text, .battle_won_text

	ctxt "Das wollte ich nie"
	line "werden, im ernst<...>"
	done

.before_battle_text
	ctxt "Dafür habe ich"
	line "jetzt echt keine"
	cont "Zeit Kind!"

	para "Ich muss meine"
	line "Arbeitsstunden"
	cont "eintragen<...>"
	done

.battle_won_text
	ctxt "Ich trage einfach"
	line "2 Wochen im"
	cont "vorraus ein."
	done

PhloxLabF3Trainer3:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_3, SCIENTIST, 12, .before_battle_text, .battle_won_text

	ctxt "Ich hätte warten"
	line "sollen, bis du den"
	para "CEO zuerst"
	line "besiegst<...>"
	done

.before_battle_text
	ctxt "Ich bin Froh, dass"
	line "du fast alle in"
	para "dieser Firma"
	line "besiegt hast."

	para "Jetzt komm ich von"
	line "hinten, besiege"
	para "dich und dann"
	line "nur noch den"
	para "CEO und der"
	line "Ruhm gehört"
	cont "MIR!"
	done

.battle_won_text
	ctxt "Na toll<...>"
	done

PhloxLab3F_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 16, 16, 2, PHLOX_LAB_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_SCIENTIST, 5, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PhloxLabF3CEO, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 17, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, PhloxLabF3Trainer1, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 17, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF3Trainer2, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 12, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF3Trainer3, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_CLAIR, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_OFFICER
	person_event SPRITE_PALETTE_PATROLLER, 11, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_OFFICER
