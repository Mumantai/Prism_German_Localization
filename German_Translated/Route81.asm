Route81_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, Route81Bridge

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
	ctxt "<UP> Akania Hafen"
	next "<LEFT> Provinz"
	nl   "  Park"
	next "<RIGHT> Route 80"
	done

Route81_Trainer_1:
	trainer EVENT_ROUTE_81_TRAINER_1, BIRD_KEEPER, 4, .before_battle_text, .battle_won_text

	ctxt "Die Bauarbeiten"
	line "auf der Brücke"
	para "sind noch nicht"
	line "fertiggestellt <...>"

	para "Zum Glück helfen"
	line "mir meine #mon"
	cont "beim Überqueren."
	done

.before_battle_text
	ctxt "Meine Flug-#mon"
	line "fliegen mich"
	cont "einfach rüber!"
	done

.battle_won_text
	ctxt "Bei einem Kampf"
	line "sind sie weniger"
	cont "hilfreich."
	done

Route81_Trainer_2:
	trainer EVENT_ROUTE_81_TRAINER_2, BLACKBELT_T, 6, .before_battle_text, .battle_won_text

	ctxt "Diesen Pfad hier"
	line "habe ich mit"
	para "meinen eigenen"
	line "Händen geebnet!"

	para "Damit beeindrucke"
	line "ich meinen Idol,"
	cont "richtig?"
	done

.before_battle_text
	ctxt "HAAAAAAAAAAAAAAAAA"
	line "AAAAAAAAAAAAAAAAA!"

	para "<...>"

	para "Ich trainiere, um"
	line "eines Tages Andres"
	cont "Jünger zu werden!"
	done

.battle_won_text
	text "WAS?"
	done

Route81_Trainer_3:
	trainer EVENT_ROUTE_81_TRAINER_3, PICNICKER, 5, .before_battle_text, .battle_won_text

	ctxt "Wenn du die VM03"
	line "Surfer findest,"
	para "kannst du damit"
	line "auf deinen #mon"
	para "schwimmen und das"
	line "Wasser überqueren!"
	done

.before_battle_text
	ctxt "Weiter nördlich"
	line "liegt der Akania-"
	para "Hafen. Was ist nur"
	line "mit der Brücke <...>"
	done

.battle_won_text
	ctxt "Das war hart!"
	done

Route81_Trainer_4:
	trainer EVENT_ROUTE_81_TRAINER_4, PICNICKER, 8, .before_battle_text, .battle_won_text

	ctxt "Der Bau dieses"
	line "#mon-Centers,"
	cont "machte meinen"
	para "#mon sehr viel"
	line "Angst."
	done

.before_battle_text
	ctxt "Das war hier mein"
	line "Lieblingsort zum"
	para "Picknicken, bis"
	line "sie das dumme"
	para "#mon-Center"
	line "hier bauten <...>"
	done

.battle_won_text
	ctxt "Nun ab zum dummen"
	line "#mon-Center."
	done

Route81_Trainer_5:
	trainer EVENT_ROUTE_81_TRAINER_5, SUPER_NERD, 3, .before_battle_text, .battle_won_text

	ctxt "Ich könnte seine"
	line "Dienste gut"
	cont "gebrauchen."
	done

.before_battle_text
	ctxt "Ich habe gehört,"
	line "es gäbe einen"
	para "Forscher, der die"
	line "natürlichen"
	para "Fähigkeiten von"
	line "#mon verstärken"
	cont "kann."
	done

.battle_won_text
	ctxt "WIRKLICH?!"
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
	ctxt "Ich dachte, meine"
	line "#mon würden"
	para "hiermit ein gutes"
	line "Team werden, aber"
	cont "ich lag falsch!"

	para "Hier, nimm es!"
	sdone

.after_TM_given_text
	ctxt "TM32 ist"
	line "Doppelteam."

	para "Lass dich nicht"
	line "vom Namen täu-"
	para "schen, es hebt nur"
	line "den Fluchtwert."
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
	para "das #mon"
	line "aufzuhalten, das"
	para "Naljo zerstören"
	line "könnte?"

	para "Hört sich realisch"
	line "an, glaube ich <...>"

	para "Ich brauche 20"
	line "Ziegelsteine, um"
	para "den Hafen von"
	line "unten zu stützen."

	para "Es gibt einen"
	line "Markt, der sie"
	cont "verkauft <...>"

	para "Wo genau weiß"
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
	line "Fertigstellen"
	cont "sollte."
	done

.bridge_built_text
	ctxt "Ich habe dir die"
	line "Brücke gebaut, nun"
	para "lass mich bitte"
	line "in Ruhe."
	done

.got_bricks_text
	ctxt "Hast du paar"
	line "Ziegelsteine?"

	para "Gibst du sie mir,"
	line "damit ich die"
	cont "Brücke bauen kann?"
	done

.enough_bricks_text
	ctxt "Danke. Nun ab an"
	line "die Arbeit!"
	prompt

.after_building_bridge_text
	ctxt "Wie belebend!"

	para "Das war mein"
	line "Workout für die"
	cont "Woche."

	para "Ich bin durch,"
	line "Ciao."
	done

.refused_text
	ctxt "Dann verschwende"
	line "nicht meine Zeit."
	done

.not_enough_bricks_text
	ctxt "Ich brauche 20!"

	para "Lass es mich"
	line "buchstabieren."

	para "Z"

	para "W"

	para "A<...>"

	para "Hör mit dem"
	line "Facepalm auf,"
	para "währendich mit"
	line "dir rede!"
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
	signpost 47, 7, SIGNPOST_JUMPSTD, pokecentersign

.ObjectEvents: db 9
	person_event SPRITE_BIRDKEEPER, 22, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route81_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 28, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route81_Trainer_2, -1
	person_event SPRITE_PICNICKER, 37, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route81_Trainer_3, -1
	person_event SPRITE_PICNICKER, 43, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, Route81_Trainer_4, -1
	person_event SPRITE_COOLTRAINER_M, 49, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, Route81_Trainer_5, -1
	person_event SPRITE_BIRDKEEPER, 29, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route81DoubleTeamTMDude, -1
	person_event SPRITE_FRUIT_TREE, 34, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, 12, -1
	person_event SPRITE_POKE_BALL, 11, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DAMP_ROCK, EVENT_ROUTE_81_ITEM_DAMP_ROCK
	person_event SPRITE_BLACK_BELT, 16, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route81BridgeBuilder, -1
