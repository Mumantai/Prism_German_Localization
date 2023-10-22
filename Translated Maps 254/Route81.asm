Route81_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 2
	dbw MAPCALLBACK_NEWMAP, .set_fly_flag
	dbw MAPCALLBACK_TILES, Route81Bridge

.set_fly_flag
	setflag ENGINE_FLYPOINT_ROUTE_81
	return

Route81Bridge:
	checkevent EVENT_BUILT_BRIDGE
	sif false
		return_if_callback_else_end
	changeblock 6, 12, $f
	changeblock 8, 12, $f
	changeblock 6, 14, $f
	changeblock 8, 14, $f
	return_if_callback_else_end

Route81DirectionsSign:
	ctxt "<UP> Akania Docks"
	next "<LEFT> Provinzial-"
	nl   "  park"
	next "<RIGHT> Route 80"
	done

Route81IslandSign:
	signpostheader 7
	done

Route81_Trainer_1:
	trainer EVENT_ROUTE_81_TRAINER_1, BIRD_KEEPER, 4, .before_battle_text, .battle_won_text
	ctxt "Die Baurarbeiten"
	line "an der Brücke sind"
	cont "noch nicht fertig."
	para "Zum Glück, helfen"
	line "meine #mon mir"
	cont "beim Überqueren."
	done

.before_battle_text
	ctxt "Meine Flug-#mon"
	line "können mich"
	cont "rüberfliegen!"
	done

.battle_won_text
	ctxt "Im Kampf, helfen"
	line "sie mir wohl"
	cont "nocht so viel."
	done

Route81_Trainer_2:
	trainer EVENT_ROUTE_81_TRAINER_2, BLACKBELT_T, 6, .before_battle_text, .battle_won_text
	ctxt "Den Weg hier, habe"
	line "ich selber aus dem"
	cont "Fels geschlagen!" ;alt.: eigenhändig gebaut  o. Ä.

	para "Das muss Andre"
	line "beeindrucken!"
	done

.before_battle_text
	ctxt "HAAAAAAAAAAAAAAAAA"
	line "AAAAAAAAAAAAAAAAA!"
	para "<...>"
	para "Ich trainiere, um"
	line "eines Tages Andres"
	cont "Schüler zu werden!"
	done

.battle_won_text
	text "WAS?"
	done

Route81_Trainer_3:
	trainer EVENT_ROUTE_81_TRAINER_3, PICNICKER, 5, .before_battle_text, .battle_won_text
	ctxt "Wenn dein #mon"
	line "Surfer kann,"
	para "kannst du auf"
	line "ihm übers Meer"
	cont "reiten!"
	done

.before_battle_text
;ctxt "Im Norden würdest"
;line "du nach Akania"
;para "kommen, wäre die"
;line "Brücke nicht"
;cont "gesperrt."

	ctxt "Wenn du nach"
	line "Norden gehst,"
	para "würdest du direkt"
	line "nach Akania"
	para "kommen <...>"
para"Wäre die Brücke"
	line "nicht kaputt."
	done

.battle_won_text
	ctxt "Das war hart!"
	done

Route81_Trainer_4:
	trainer EVENT_ROUTE_81_TRAINER_4, PICNICKER, 7, .before_battle_text, .battle_won_text
	ctxt "Der Bau dieses"
	line "#mon-Centers,"
	para "hat meinen #mon"
	line "Angst gemacht." ;alt.: Angst eingedagt.
	done

.before_battle_text
	ctxt "Das hier, war mein"
	line "Lieblingsplatz zum"
	para "Picknicken, bis"
	line "sie das dumme"
	para "#mon-Center"
	line "gebaut haben <...>"
	done

.battle_won_text
	ctxt "Und ab zum dummen"
	line "#mon-Center."
	done

Route81_Trainer_5:
	trainer EVENT_ROUTE_81_TRAINER_5, SUPER_NERD, 3, .before_battle_text, .battle_won_text
	ctxt "Ich könnte deren"
	line "Hilfe echt gut"
	cont "gebrauchen."
	done

.before_battle_text
	ctxt "Ich habe gehört,"
	line "es gäbe Wissen-"
	para "schaftler, die die"
	line "natürlichen Fähig-"
	para "keiten von #mon"
	line "verbessern wollen."
	para "Das ist so cool."
	done

.battle_won_text
	text "Wirklich?!"
	done

Route81DoubleTeamTMDude:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_81_TM32
	sif true
		jumptext .after_TM_given_text
	writetext .give_TM_text
	givetm TM_DOUBLE_TEAM + RECEIVED_TM
	sif true
		setevent EVENT_ROUTE_81_TM32
	closetextend

.give_TM_text
;ctxt "Ich dachte, meine"
;line "#mon würden"
;para "hiermit ein gutes"
;line "Team werden, aber"
;cont "ich lag falsch!"
;para "Hier, nimm es!"

	ctxt "Ich dachte, mein"
	line "Team würde sich"
	para "mit dieser TM"
	line "verdoppeln, aber"
	cont "ich lag falsch!"
	para "Hier, nimm sie!"
	sdone

.after_TM_given_text
	ctxt "TM32 enthält"
	line "Doppelteam."
	para "Lass dich nicht"
	line "vom Namen beirren."
	para "Sie erhöht nur den"
	line "Fluchtwert."
	done

Route81MegaphoneGirl:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_81_MEGAPHONE
	sif true
		jumptext .after_megaphone_given_text
	writetext .give_megaphone_text
	verbosegiveitem MEGAPHONE, 1
	waitbutton
	sif false
		jumptext .no_room_text
	setevent EVENT_ROUTE_81_MEGAPHONE
	closetextend

.give_megaphone_text
	ctxt "HEY, DU!"
	para "HÄTTEST DU"
	line "INTERESSE DARAN,"
	para "MIR DIESES MEGAFON"
	line "ABZUNEHMEN?"
	sdone

.after_megaphone_given_text
	ctxt "Bitte entschuldige"
	line "den Lärm, aber ich"
	para "kann mir gut"
	line "vorstellen, dass"
	para "ein Schall-#mon"
	line "etwas mit diesem"
	para "Megafon anfangen"
	line "könnte."
	done

.no_room_text
	ctxt "KEIN PLATZ?"
	para "DANN MUSST DU DIE"
	line "LAUTSTÄRKE WEITER"
	cont "ERTRAGEN."
	done

Route81BridgeBuilder:
	faceplayer
	opentext
	checkevent EVENT_NOBU_EXPLAINS_PROTECTORS
	sif false
		jumptext .before_nobu_text
	checkevent EVENT_BUILT_BRIDGE
	sif true
		jumptext .bridge_built_text
	checkitem BRICK_PIECE
	sif false
		jumptext .introduction_text
	writetext .got_bricks_text
	yesorno
	sif false
		jumptext .refused_text
	takeitem BRICK_PIECE, 20
	sif false
		jumptext .not_enough_bricks_text
	setevent EVENT_BUILT_BRIDGE
	writetext .enough_bricks_text
	special ClearBGPalettes
	special Special_BattleTowerFade
	playwaitsfx SFX_GRASS_RUSTLE
	playwaitsfx SFX_VICEGRIP
	playwaitsfx SFX_DOUBLE_KICK
	playwaitsfx SFX_DOUBLESLAP
	playwaitsfx SFX_STOMP
	scall Route81Bridge
	reloadmap
	special FadeInPalettes
	jumptext .after_building_bridge_text

.introduction_text
	ctxt "OK, nun <...> du bist"
	line "der Sohn von"
	para "Siegfried und"
	line "musst da hoch, um"
	para "verrückte #mon"
	line "abzuhalten, Naljo"
	cont "zu vernichten?"

	para "Klingt glaubwürdig"
	line "genug für mich."

	para "Ich brauche 20"
	line "Ziegelsteine, um"
	para "den Hafen von"
	line "unten zu stützen."

	para "Es gibt einen"
	line "Markt, der sie"
	cont "verkauft <...>"

	para "Wo genau, weiß"
	line "ich leider nicht <...>"
	done

.before_nobu_text
	ctxt "Ich sollte diese"
	line "Brücke eigentlich"
	cont "fertig bauen <...>"
	para "Ich bin aber viel"
	line "zu müde."
	para "Du musst mir schon"
	line "einen triftigen"
	para "Grund nennen,"
	line "warum ich diese"
	para "Brücke genau jetzt"
	line "fertigstellen"
	cont "sollte."
	done

.bridge_built_text
	ctxt "Ich habe dir die"
	line "Brücke gebaut, nun"
	para "lass mich bitte"
	line "in Ruhe."
	done

.got_bricks_text
	ctxt "Hast du ein paar"
	line "Ziegelsteine?"
	para "Gibst du sie mir,"
	line "damit ich die"
	cont "Brücke bauen kann?"
	done

.enough_bricks_text
	ctxt "Danke. Und jetzt"
	line "ab an die Arbeit!"
	prompt

.after_building_bridge_text
	ctxt "Wie Belebend!"
	para "Das war mein"
	line "Workout für die"
	para "Woche. Ich bin"
	line "hier fertig, ciao."
	done

.refused_text
	ctxt "Dann verschwende"
	line "nicht meine Zeit."
	done

.not_enough_bricks_text
	ctxt "Ich brauche 20!"
	para "Lass es mich"
	line "buchstabieren:"
	para "Z <...>"
	para "W <...>"
	para "A <...>"
	para "Hey! Hör mir zu,"
	line "wenn ich mich"
	cont "beschwere!"
	done

Route81_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 9, 7, 3, ROUTE_81_NORTHGATE
	warp_def 58, 4, 3, PROVINCIAL_PARK_GATE
	warp_def 58, 13, 1, ROUTE_81_EASTGATE
	warp_def 59, 4, 4, PROVINCIAL_PARK_GATE
	warp_def 59, 13, 2, ROUTE_81_EASTGATE
	warp_def 47, 6, 1, ROUTE_81_POKECENTER
	warp_def 43, 17, 1, ROUTE_81_GOODROD

.CoordEvents: db 0

.BGEvents: db 2
	signpost 56, 8, SIGNPOST_LOAD, Route81DirectionsSign
	signpost 22, 10, SIGNPOST_LOAD, Route81IslandSign

.ObjectEvents: db 9
	person_event SPRITE_BIRDKEEPER, 22, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route81_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 28, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route81_Trainer_2, -1
	person_event SPRITE_PICNICKER, 37, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route81_Trainer_3, -1
	person_event SPRITE_PICNICKER, 43, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, Route81_Trainer_4, -1
	person_event SPRITE_SUPER_NERD, 49, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, Route81_Trainer_5, -1
	person_event SPRITE_BIRDKEEPER, 29, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route81DoubleTeamTMDude, -1
	person_event SPRITE_FRUIT_TREE, 34, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, CHESTO_TREE_1, -1
	person_event SPRITE_GUITARISTF, 11, 9, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, Route81MegaphoneGirl, -1
	person_event SPRITE_BLACK_BELT, 16, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route81BridgeBuilder, -1