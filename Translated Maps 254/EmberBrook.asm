EmberBrook_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EmberBrookDirectionsSignEast:
	ctxt "<LEFT> Route 67"
	next "<RIGHT> Sevii Eilande"
	next "  via Glutberg"
	done

EmberBrookDirectionsSignWest:
	ctxt "<UP> Glutberg"
	next "<LEFT> Rijon-Grenze"
	next "  (Route 67)"
	done

EmberBrook_Trainer_1:
	trainer EVENT_EMBER_BROOK_TRAINER_1, SWIMMERF, 12, .before_battle_text, .battle_won_text
	ctxt "Östlich von uns"
	line "liegt der"
	cont "Glutberg."
	para "Es ist ein aktiver"
	line "Vulkan, der diese"
	para "großen Steine in"
	line "den Ozean spuckt."
	para "Sie sind großartig"
	line "für das Schwimm-"
	para "training, aber"
	line "nichts für"
	cont "Anfänger."
	done

.before_battle_text
	ctxt "Weißt du wo du"
	line "gerade bist?"
	done

.battle_won_text
	ctxt "Ich wollte dich"
	line "nur warnen."
	done

EmberBrook_Trainer_2:
	trainer EVENT_EMBER_BROOK_TRAINER_2, SWIMMERF, 13, .before_battle_text, .battle_won_text
	ctxt "Manchmal wünschte"
	line "ich, ich könnte"
	para "hier für immer"
	line "schweben und all"
	para "meine Probleme"
	line "vergessen<...>"
	para "Das Leben ist so"
	line "grausam<...>"
	done

.before_battle_text
	ctxt "Dieser Ort ist die"
	line "ruhigste Stelle im"
	cont "Glutbach. Lust auf"
	para "ein Bad?"
	done

.battle_won_text
	ctxt "Hm<...>?"
	para "Entschuldigung,"
	line "ich war zu sehr"
	para "von der"
	line "entspannenden"
	para "Strömung"
	line "abgelenkt."
	done

EmberBrook_Trainer_3:
	trainer EVENT_EMBER_BROOK_TRAINER_3, SWIMMERF, 14, .before_battle_text, .battle_won_text
	ctxt "Ich weiß, ich sehe"
	line "nicht so aus, aber"
	para "bevor ich"
	line "Schwimmer war, war"
	cont "ich ein Fischer."
	para "Die Kraft der"
	line "Wissenschaft ist"
	para "unglaublich,"
	line "findest du nicht?"
	done

.before_battle_text
	ctxt "Hab dich an der"
	line "Leine!"
	done

.battle_won_text
	ctxt "Ah! du hast mich!"
	done

EmberBrook_Trainer_4:
	trainer EVENT_EMBER_BROOK_TRAINER_4, TWINS, 3, .before_battle_text, .battle_won_text
	ctxt "Sal: Ich fürchte,"
	line "dieses Gespräch"
	para "hat keinen Zweck"
	line "mehr."
	para "Auf Wiedersehen."
	done

.before_battle_text
	ctxt "Sal: Du möchtest"
	line "uns passieren?"
	para "Es tut mir leid,"
	line "ich fürchte, das"
	para "können wir nicht"
	line "zulassen<...>"
	done

.battle_won_text
	ctxt "Stop, stop<...>"
	done

EmberBrook_Trainer_4_OtherTwin:
	trainer EVENT_EMBER_BROOK_TRAINER_4, TWINS, 3, .before_battle_text, .battle_won_text
	ctxt "Daisy: Nichts kann"
	line "an meiner"
	para "Schwester"
	line "vorbeischleichen!"
	para "Obwohl sie ein"
	line "bisschen seltsam"
	cont "ist."
	para "Sie singt ständig"
	line "für mich."
	para "Das ist super"
	line "nervig."
	done

.before_battle_text
	ctxt "Daisy: Ups!"
	para "Wolltest du dich"
	line "an uns vorbei-"
	cont "schleichen?"
	done

.battle_won_text
	ctxt "Daisy: Oh nein!"
	para "Du hast deine"
	line "Fähigkeiten gut"
	cont "versteckt."
	done

EmberBrook_Trainer_5:
	trainer EVENT_EMBER_BROOK_TRAINER_5, CHEERLEADER, 3, .before_battle_text, .battle_won_text
	ctxt "Also, ich komme"
	line "von Eiland Eins,"
	para "und das ist meine"
	line "erste Reise ins"
	cont "Ausland."
	para "Mir wurde gesagt,"
	line "dass die Rijish"
	para "einen immer mit"
	line "einem #mon-"
	cont "Kampf grüßen."
	done

.before_battle_text
	ctxt "Oh, endlich!"
	para "Ein freundliches"
	line "Gesicht!"
	para "Ist das die Art,"
	line "wie die Leute aus"
	cont "Rijon grüßen?"
	done

.battle_won_text
	ctxt "Oh Gott, das war"
	line "so dumm<...>"
	done

EmberBrook_Trainer_6:
	trainer EVENT_EMBER_BROOK_TRAINER_6, BURGLAR, 3, .before_battle_text, .battle_won_text
	ctxt "Mir wurde von"
	line "einem Bekannten"
	para "gesagt, dass es"
	line "wertvolle Juwelen"
	para "in diesem Berg"
	line "gibt<...>"
	para "Aber es steckt in"
	line "den Felsen, und"
	para "ich bin kein"
	line "Bergarbeiter!"
	done

.before_battle_text
	ctxt "Hände hoch!"
	para "Das ist ein"
	line "Überfall!"
	done

.battle_won_text
	ctxt "Hilfe, Polizei!"
	done

EmberBrook_Trainer_7:
	trainer EVENT_EMBER_BROOK_TRAINER_7, PICNICKER, 9, .before_battle_text, .battle_won_text
	ctxt "<...>"
	para "Oh, also bist du"
	line "keiner dieser"
	cont "komischen Leute."
	para "Es tut mir"
	line "furchtbar leid."
	para "Ich habe mich"
	line "etwas verlaufen"
	para "und hier sind"
	line "einige seltsame"
	cont "Leute."
	para "Mach dir aber"
	line "keine Sorgen."
	para "Ich finde schon"
	line "den Weg."
	done

.before_battle_text
	ctxt "Iiih! Komm nicht"
	para "näher!"
	done

.battle_won_text
	ctxt "Oh, Nein!"
	done

EmberBrook_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $8, $6, 3, EMBER_BROOK_GATE
	warp_def $9, $6, 4, EMBER_BROOK_GATE
	warp_def $7, $31, 1, MT_EMBER_ENTRANCE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost  9,  9, SIGNPOST_LOAD, EmberBrookDirectionsSignEast
	signpost  8, 48, SIGNPOST_LOAD, EmberBrookDirectionsSignWest

.ObjectEvents
	db 10
	person_event SPRITE_POKE_BALL, 13,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, ULTRA_BALL, EVENT_EMBER_BROOK_ITEM_ULTRA_BALLS
	person_event SPRITE_POKE_BALL,  8, 40, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DAMP_ROCK, EVENT_EMBER_BROOK_ITEM_DAMP_ROCK
	person_event SPRITE_SWIMMER_GIRL, 10, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, EmberBrook_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL, 11, 23, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 4, EmberBrook_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL,  6, 44, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, EmberBrook_Trainer_3, -1
	person_event SPRITE_TWIN, 15, 42, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_4, -1
	person_event SPRITE_TWIN, 15, 43, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_4_OtherTwin, -1
	person_event SPRITE_CHEERLEADER, 12, 31, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_5, -1
	person_event SPRITE_BURGLAR,  5, 27, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_6, -1
	person_event SPRITE_PICNICKER,  4, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, EmberBrook_Trainer_7, -1