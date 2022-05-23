HauntedMansion_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HauntedMansionGranddaughter:
	ctxt "Diese Villa"
	line "gehörte früher"
	cont "meiner Oma."

	para "Sie sagte mir"
	line "andauernd, dass"
	para "die Farben des"
	line "Regenbogens in"
	cont "dieser Reihenfolge"
	para "sind: Rot, Grau,"
	line "Blau, Gelb, Braun"
	cont "und Türkis."

	para "Ich wüsste gerne,"
	line "warum sie mir das"
	para "nur immer wieder"
	line "erklärt hat <...>"
	done

HauntedMansionBlockingBasementGranny:
	ctxt "Du bist noch nicht"
	line "bereit für den"
	cont "Keller <...>"

	para "Die #mon da"
	line "unten sind zu"
	cont "stark für dich!"

	para "Komm später wieder"
	done

HauntedMansion_Trainer_1:
	trainer EVENT_HAUNTED_MANSION_TRAINER_1, MEDIUM, 2, .before_battle_text, .battle_won_text

	ctxt "Wir gehen hier"
	line "nicht weg. Egal,"
	para "ob die Geister uns"
	line "plagen."
	done

.before_battle_text
	ctxt "Wie hast du raus-"
	line "gefunden, wie man"
	para "an den Ersatz-"
	line "schlüssel gelangt?"
	done

.battle_won_text
	ctxt "Ach, mein Plapper-"
	line "maul von Enkelin <...>"
	done

HauntedMansion_Trainer_2:
	trainer EVENT_HAUNTED_MANSION_TRAINER_2, MEDIUM, 3, .text, .text

.text
	text "<...>"
	done

HauntedMansion_Trainer_3:
	trainer EVENT_HAUNTED_MANSION_TRAINER_3, SAGE, 3, .before_battle_text, .battle_won_text

	ctxt "Die Geister, die"
	line "hier weilen, sind"
	para "zwar nervig, tun"
	line "aber keinem was"
	cont "zu Leide."
	done

.before_battle_text
	ctxt "Die Geister wollen"
	line "ihr rechtmäßiges"
	cont "Land <...>"
	done

.battle_won_text
	ctxt "Diese Geister sind"
	line "echt zu friedlich!"
	done

HauntedMansionChestKey1:
	writehalfword EVENT_GOT_BEDROOM_KEY_1
	selse

HauntedMansionChestKey2:
	writehalfword EVENT_GOT_BEDROOM_KEY_2
	sendif

;fallthrough
	opentext
	writetext .opened_text
	checkevent -1
	sif true
		jumptext .empty_text
	verbosegiveitem BEDROOM_KEY, 1
	setevent -1
	endtext

.opened_text
	ctxt "<PLAYER> öffnet"
	line "die Truhe <...>"
	sdone

.empty_text
	ctxt "Die Truhe ist"
	line "leer!"
	done

HauntedMansionGengar:
	faceplayer
	showtext .text
	playsound SFX_PERISH_SONG
	special Special_BattleTowerFade
	waitsfx
	warp DREAM_SEQUENCE, 34, 2
	end

.text
	ctxt "Hehehe! Kommt zu"
	line "Papi, leckere"
	cont "Träume!"

	para "Ich bin am"
	line "Verhungern!"

	para "Für dich heißt"
	line "es jetzt"
	cont "Schlafenszeit <...>"

	para "Hehehe!"
	sdone

HauntedMansionMansionDoor:
	checkitem MANSION_KEY
	sif false
		jumptext .locked_text
	opentext
	writetext .opened_text
	playsound SFX_ENTER_DOOR
	special Special_BattleTowerFade
	waitsfx
	warpfacing UP, HAUNTED_MANSION, 42, 15
	closetextend

.locked_text
	ctxt "Die Tür ist"
	line "verschlossen."
	done

.opened_text
	ctxt "<PLAYER> öffnet"
	line "die Tür mit dem"
	cont "Villa-Schlüssel."
	sdone

HauntedMansionBedroomDoor:
	checkevent EVENT_GOT_BEDROOM_KEY_1
	iffalse .locked
	checkevent EVENT_GOT_BEDROOM_KEY_2
	sif false
.locked
		jumptext .locked_text
	opentext
	writetext .opened_text
	playsound SFX_ENTER_DOOR
	special Special_BattleTowerFade
	waitsfx
	warpfacing UP, HAUNTED_MANSION, 52, 31
	closetextend

.locked_text
	ctxt "Diese Tür ist"
	line "durch 2 Schlösser"
	cont "verschlossen."
	done

.opened_text
	ctxt "<PLAYER> öffnet"
	line "die Tür mit den"
	cont "beiden Schlüsseln."
	sdone

HauntedMansion_MapEventHeader:: db 0, 0

.Warps
	db 24
	warp_def $29, $6, 3, HAUNTED_FOREST
	warp_def $29, $7, 3, HAUNTED_FOREST
	warp_def $3, $5, 8, HAUNTED_MANSION
	warp_def $4, $d, 1, HAUNTED_MANSION
	warp_def $3, $15, 10, HAUNTED_MANSION
	warp_def $7, $2, 12, HAUNTED_MANSION
	warp_def $7, $16, 15, HAUNTED_MANSION
	warp_def $17, $4, 3, HAUNTED_MANSION
	warp_def $17, $5, 3, HAUNTED_MANSION
	warp_def $17, $12, 5, HAUNTED_MANSION
	warp_def $17, $13, 5, HAUNTED_MANSION
	warp_def $5, $20, 6, HAUNTED_MANSION
	warp_def $3, $27, 20, HAUNTED_MANSION
	warp_def $3, $2f, 21, HAUNTED_MANSION
	warp_def $5, $36, 7, HAUNTED_MANSION
	warp_def $f, $2a, 23, HAUNTED_MANSION
	warp_def $f, $2b, 23, HAUNTED_MANSION
	warp_def $1f, $34, 4, HAUNTED_MANSION
	warp_def $1f, $35, 4, HAUNTED_MANSION
	warp_def $2b, $31, 13, HAUNTED_MANSION
	warp_def $3b, $1c, 14, HAUNTED_MANSION
	warp_def $3b, $1d, 14, HAUNTED_MANSION
	dummy_warp $24, $7
	warp_def $37, $2c, 1, HAUNTED_MANSION_BASEMENT

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 16, 21, SIGNPOST_READ, HauntedMansionChestKey1
	signpost 54, 53, SIGNPOST_READ, HauntedMansionChestKey2
	signpost 35, 7, SIGNPOST_READ, HauntedMansionMansionDoor
	signpost 3, 13, SIGNPOST_READ, HauntedMansionBedroomDoor

.ObjectEvents
	db 11
	person_event SPRITE_TEACHER, 37, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HauntedMansionGranddaughter, -1
	person_event SPRITE_POKE_BALL, 7, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, SUPER_REPEL, EVENT_HAUNTED_MANSION_ITEM_SUPER_REPELS
	person_event SPRITE_POKE_BALL, 16, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DREAM_EATER, 0, EVENT_HAUNTED_MANSION_TM
	person_event SPRITE_POKE_BALL, 50, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SPELL_TAG, EVENT_HAUNTED_MANSION_ITEM_SPELL_TAG
	person_event SPRITE_POKE_BALL, 7, 50, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, RARE_CANDY, EVENT_HAUNTED_MANSION_ITEM_RARE_CANDY
	person_event SPRITE_POKE_BALL, 7, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, REAPER_CLOTH, EVENT_HAUNTED_MANSION_ITEM_REAPER_CLOTH
	person_event SPRITE_GENGAR, 24, 52, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HauntedMansionGengar, EVENT_HAUNTED_FOREST_GENGAR
	person_event SPRITE_GRANNY, 12, 42, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, HauntedMansion_Trainer_1, -1
	person_event SPRITE_GRANNY, 20, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, HauntedMansion_Trainer_2, -1
	person_event SPRITE_SAGE, 44, 50, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, HauntedMansion_Trainer_3, -1
	person_event SPRITE_GRANNY, 55, 44, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 1, HauntedMansionBlockingBasementGranny, EVENT_RIJON_LEAGUE_WON
