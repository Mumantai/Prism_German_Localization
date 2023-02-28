Route85_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route85DirectionsSign:
	ctxt "<LEFT> Phacelia"
	next "<RIGHT> Leuchtfeuer-"
	nl   "  höhle"
	done

Route85EntranceSign:
	ctxt "Leuchtfeuerhöhle"
	next "Eingang"
	done

Route85_Trainer_1:
	trainer EVENT_ROUTE_85_TRAINER_1, BIRD_KEEPER, 3, .before_battle_text, .battle_won_text, NULL, .Script

.Script:
	end_if_just_battled
	opentext
	checkevent EVENT_ARRESTED_PALETTE_BLACK
	sif false
		jumptext .after_battle_undercover_text
	jumptext .after_battle_not_undercover_text

.before_battle_text
	ctxt "Bist du auch eine"
	line "Paletten"
	cont "Patrouille?"
	done

.battle_won_text
	ctxt "Ich glaub nicht,"
	line "dass ich gegen"
	para "eine Paletten"
	line "Patrouille"
	cont "verloren habe!"
	done

.after_battle_not_undercover_text
	ctxt "Ich bin erschöpft"
	line "seitdem ich gegen"
	para "eine Paletten"
	line "Patrouille"
	cont "verloren habe."
	done

.after_battle_undercover_text
	ctxt "Es sieht so aus"
	line "als ob eure Truppe"
	para "nur Zeit schinden"
	line "will."

	para "<...>"

	para "<...> Warte."

	para "Warum sucht die"
	line "Polizei dann nach"
	cont "euch Typen?"
	done

Route85_Trainer_2:
	trainer EVENT_ROUTE_85_TRAINER_2, PSYCHIC_T, 3, .before_battle_text, .battle_won_text, NULL, .Script

.Script:
	end_if_just_battled
	checkevent EVENT_ARRESTED_PALETTE_BLACK
	sif false
		jumptext .after_battle_undercover_text
	jumptext .after_battle_not_undercover_text

.before_battle_text
	ctxt "Suchst du nach"
	line "deinem Kumpel?"
	done

.battle_won_text
	ctxt "OK, ich stehe dir"
	line "nicht mehr im Weg."
	done

.after_battle_not_undercover_text
	ctxt "Ich habe Angst vor"
	line "diesen Paletten"
	cont "Patrouillen."

	para "Ich hörte, Sie"
	line "fürchten keine"
	cont "Konsequenzen<...>"
	done

.after_battle_undercover_text
	ctxt "Solange es mich"
	line "nicht betrifft,"
	para "werde ich keinem"
	line "von euren machen-"
	cont "schaften erzählen."
	done

Route85Officer:
	faceplayer
	opentext
	writetext .officer_text
	writetext .black_text
	stopfollow
	warp PHACELIA_POLICE_F2, 3, 1
	spriteface PLAYER, LEFT
	spriteface 2, RIGHT
	opentext
	writetext .need_suit_back_text
	callasm .restore_sprite
	setevent EVENT_ROUTE_85_POLICEMAN_GONE
	clearevent EVENT_IN_UNDERCOVER_MISSION
	clearevent EVENT_PALETTE_BLACK_FOLLOWING
	setevent EVENT_ARRESTED_PALETTE_BLACK
	closetext
	callasm CancelMapSign
	opentext
	writetext .after_arrest_text
	givetm HM_ROCK_SMASH + RECEIVED_TM
	jumptext .after_giving_HM_text

.restore_sprite
	ld a, [wSavedPlayerCharacteristics2]
	ld [wPlayerGender], a
	ret

.officer_text
	ctxt "Polizist: Gute"
	line "Arbeit, Ich wusste"
	para "auf dich ist"
	line "verlass."
	sdone

.black_text
	ctxt "Schwarz: Wie"
	line "konnte ich nur"
	cont "darauf reinfallen?"
	sdone

.need_suit_back_text
	ctxt "Ich brauche den"
	line "Anzug zurück."
	sdone

.after_arrest_text
	ctxt "Der Wächter vor"
	line "der Höhlen-Arena"
	para "lässt dich nun"
	line "passieren."

	para "Nimm bitte noch"
	line "das hier."
	sdone

.after_giving_HM_text
	ctxt "VM05 ist"
	line "Zertrümmerer."
	
	para "Damit kannst du"
	line "felsen aus dem"
	cont "Weg räumen."
	
	para "Jedoch brauchst du"
	line "hierzu den lokalen"
	cont "Orden."
	done

Route85PaletteBlack:
	faceplayer
	checkevent EVENT_PALETTE_BLACK_FOLLOWING
	sif true
		jumptext .already_following_text
	setevent EVENT_PALETTE_BLACK_FOLLOWING
	clearevent EVENT_ROUTE_85_POLICEMAN_GONE
	follow PLAYER, 7
	appear 6
	jumptext .text

.text
	ctxt "Hey."

	para "Ich mach gerade ne"
	line "Raucherpause."

	para "<...>"

	para "Oh, Was?"

	para "Du hast den Boss"
	line "gefunden?"

	para "Zeig mir den Weg."
	done

.already_following_text
	ctxt "Gehen wir nun,"
	line "oder watt?"
	done

Route85_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 7, 2, PHACELIA_EAST_EXIT
	warp_def 6, 61, 2, ROUTE_82_MONKEY
	warp_def 3, 57, 1, FIRELIGHT_F1

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 16, SIGNPOST_LOAD, Route85DirectionsSign
	signpost 7, 56, SIGNPOST_LOAD, Route85EntranceSign

.ObjectEvents: db 9
	person_event SPRITE_BIRDKEEPER, 8, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, Route85_Trainer_1, -1
	person_event SPRITE_PSYCHIC, 9, 44, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8, PERSONTYPE_TRAINER, 2, Route85_Trainer_2, -1
	person_event SPRITE_ROCK, 7, 57, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 15, 40, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_OFFICER, 8, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 5, Route85Officer, EVENT_ROUTE_85_POLICEMAN_GONE
	person_event SPRITE_PALETTE_PATROLLER, 9, 52, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 5, Route85PaletteBlack, EVENT_ARRESTED_PALETTE_BLACK
	person_event SPRITE_POKE_BALL, 13, 61, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DRAGON_FANG, EVENT_ROUTE_85_ITEM_DRAGON_FANG
	person_event SPRITE_POKE_BALL, 15, 43, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ROLLOUT, 0, EVENT_ROUTE_85_TM
	person_event SPRITE_FRUIT_TREE, 6, 44, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 3, 19, -1
