GoldenrodUnderground_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodUnderground_NoEntrySign:
	text "BETRETEN VERBOTEN!"
	done

GoldenrodUnderground_Trainer_1:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_1, SUPER_NERD, 6, .before_battle_text, .defeated_text
	ctxt "Du versuchst, den"
	line "Naljo-Dex zu"
	cont "vervollständigen?"
	para "Wow, das ist ein"
	line "ehrgeiziges Ziel!"
	done

.before_battle_text
	ctxt "Ich will deine"
	line "seltenen #mon "
	cont "sehen!"
	done

.defeated_text
	ctxt "Kein Grund wütend"
	line "zu werden!"
	done

GoldenrodUnderground_Trainer_2:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_2, OFFICER, 2, .before_battle_text, .defeated_text
	ctxt "Haltet die Kämpfe"
	line "hier unten etwas"
	para "ruhiger, sonst"
	line "sperre ich diesen"
	cont "Bereich ab."
	para "Willst du das"
	line "auf dem Gewissen"
	cont "haben?"
	done

.before_battle_text
	ctxt "Ich kenne dich"
	line "nicht."
	para "Ich hoffe, du"
	line "machst keine"
	cont "Probleme."
	done

.defeated_text
	ctxt "Na gut."
	done

GoldenrodUnderground_Trainer_3:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_3, SUPER_NERD, 7, .before_battle_text, .defeated_text
	ctxt "In der Spielhalle"
	line "kann man fünf"
	cont "Spiele spielen!"
	done

.before_battle_text
	ctxt "Warst du schon in"
	line "der neuen"
	cont "Spielhalle?"
	done

.defeated_text
	ctxt "Hab nur gefragt <...>"
	done

GoldenrodUnderground_Trainer_4:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_4, POKEMANIAC, 4, .before_battle_text, .battle_won_text
	ctxt "Füllst du fleißig"
	line "deinen #dex?"
	para "Ein Tipp:"
	para "Besuche mit dem"
	line "Magnetzug andere"
	cont "Regionen."
	para "Ich hörte die"
	line "Naljo-Region ist"
	para "voller seltener"
	line "#mon!"
	done

.before_battle_text
	ctxt "Ich bin mir sicher"
	line "du hast seltene"
	cont "#mon bei dir."
	para "ZEIG SIE MIR!"
	done

.battle_won_text
	ctxt "Gaah! Verloren!"
	line "Nun bin ich Sauer!"
	done

GoldenrodUnderground_Trainer_5:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_5, BURGLAR, 4, .before_battle_text, .battle_won_text
	ctxt "Dieser verlassene"
	line "Ort war seit"
	para "Jahren mein"
	line "Versteck!"
	para "Jetzt taucht hier"
	line "ein Kind auf und"
	para "will mich"
	line "besiegen?"
	para "Privatsphäre,"
	line "schonmal was davon"
	cont "gehört?!"
	done

.before_battle_text
	ctxt "!"
	para "Wer<...>!?"
	done

.battle_won_text
	ctxt "Gnade!"
	done

GoldenrodUnderground_YoungerHaircutBrother:
	opentext
	checkcode VAR_WEEKDAY
	isinsingulararray .workdays_array
	sif false
		jumptext GoldenrodUnderground_HaircutBrothers_NotTodayText
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	sif true
		jumptext .already_cut_hair_text
	special PlaceMoneyTopRight
	writetext .welcome_text
	yesorno
	sif false
		jumptext .declined_text
	checkmoney 0, 300
	sif =, 2
		jumptext .not_enough_money_text
	writetext .select_mon_text
	buttonsound
	special Special_YoungerHaircutBrother
	sif <, 2
		jumptext .declined_text
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	takemoney 0, 300
	special PlaceMoneyTopRight
	writetext .go_text
	closetext
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	opentext
	writetext .done_text
	jump GoldenrodUnderground_HaircutBrothers_Finish

.workdays_array
	db SUNDAY, WEDNESDAY, FRIDAY, -1

.welcome_text
	ctxt "Willkommen im"
	line "#mon-Salon!"
	para "Ich bin der"
	line "jüngere und"
	para "der günstigere"
	line "der beiden"
	cont "Friseur-Brüder."
	para "Für nur 300¥ mache"
	line "ich dein #mon"
	cont "wieder flott."
	para "Na?"
	line "Wie wär's?"
	done

.not_enough_money_text
	ctxt "Sorry, du hast"
	line "nicht genug Geld."
	done

.select_mon_text
	ctxt "OK, welches #mon"
	line "soll's denn sein?"
	done

.already_cut_hair_text
	ctxt "Meine Schicht ist"
	line "für heute zu Ende."
	done

.declined_text
	ctxt "Doch nicht?"
	line "Wie schade."
	done

.go_text
	ctxt "OK!"
	para "Ich lass es gut"
	line "aussehen!"
	sdone

.done_text
	ctxt "So, fertig!"
	sdone

GoldenrodUnderground_OlderHaircutBrother:
	opentext
	checkcode VAR_WEEKDAY
	isinsingulararray GoldenrodUnderground_OlderHaircutBrother_Workdays
	sif false
		jumptext GoldenrodUnderground_HaircutBrothers_NotTodayText
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	sif true
		jumptext GoldenrodUnderground_OlderHaircutBrother_ShiftOverText
	special PlaceMoneyTopRight
	writetext GoldenrodUnderground_OlderHaircutBrother_WelcomeText
	yesorno
	sif false
		jumptext GoldenrodUnderground_OlderHaircutBrother_DeclinedText
	checkmoney 0, 500
	sif =, 2
		jumptext GoldenrodUnderground_OlderHaircutBrother_NeedMoreMoneyText
	writetext GoldenrodUnderground_OlderHaircutBrother_WhichMonText
	buttonsound
	special Special_YoungerHaircutBrother
	sif <, 2
		jumptext GoldenrodUnderground_OlderHaircutBrother_DeclinedText
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	takemoney 0, 500
	special PlaceMoneyTopRight
	writetext GoldenrodUnderground_OlderHaircutBrother_LetsGoText
	closetext
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	opentext
	writetext GoldenrodUnderground_OlderHaircutBrother_DoneText
GoldenrodUnderground_HaircutBrothers_Finish:
	sif =, 2
		writetext .little_happier
	selse
		sif =, 3
			writetext .happy
		selse
			writetext .delighted
		sendif
	sendif
	special PlayCurMonCry
	endtext

.little_happier
	text_from_ram wStringBuffer1
	ctxt " sieht etwas"
	line "zufriedener aus!"
	done

.happy
	text_from_ram wStringBuffer1
	ctxt " sieht zufrieden"
	line "aus!"
	done

.delighted
	text_from_ram wStringBuffer1
	ctxt " sieht glücklich"
	line "aus!"
	done

GoldenrodUnderground_OlderHaircutBrother_Workdays:
	db TUESDAY, THURSDAY, SATURDAY, -1

GoldenrodUnderground_OlderHaircutBrother_WelcomeText:
	ctxt "Willkommen!"
	para "Ich leite den"
	line "#monsalon!"
	para "Ich bin der ältere"
	line "und bessere"
	para "der beiden"
	line "Friseur-Brüder."
	para "Ich kann deine"
	line "#mon für nur"
	cont "500¥ schön machen."
	para "Hättest du daran"
	line "Interesse?"
	done

GoldenrodUnderground_OlderHaircutBrother_NeedMoreMoneyText:
	ctxt "Du brauchst mehr"
	line "Geld."
	done

GoldenrodUnderground_OlderHaircutBrother_WhichMonText:
	ctxt "Welches #mon"
	line "soll es denn sein?"
	done

GoldenrodUnderground_OlderHaircutBrother_ShiftOverText:
	ctxt "Pro Tag gibt's nur"
	line "einen Haarschnitt!"
	para "Komm morgen"
	line "wieder!"
	done

GoldenrodUnderground_OlderHaircutBrother_DeclinedText:
	ctxt "Ah, so läuft das <...>"
	para "Schande!"
	done

GoldenrodUnderground_OlderHaircutBrother_LetsGoText:
	ctxt "OK!"
	para "Schau, wie schön"
	line "es wird!"
	sdone

GoldenrodUnderground_OlderHaircutBrother_DoneText:
	ctxt "Tada!"
	cont "Fertig "
	sdone

GoldenrodUnderground_HaircutBrothers_NotTodayText:
	ctxt "Meine Schicht ist"
	line "für heute vorbei."
	done

GoldenrodUnderground_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $2, $1, 3, GOLDENROD_UNDERGROUND_ENTRY_A
	warp_def $22, $1, 3, GOLDENROD_UNDERGROUND_ENTRY_B
	warp_def $6, $12, 4, GOLDENROD_UNDERGROUND
	warp_def $23, $f, 3, GOLDENROD_UNDERGROUND
	warp_def $23, $10, 3, GOLDENROD_UNDERGROUND
	warp_def $1f, $10, 1, GOLDENROD_SWITCHES

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 6, 19, SIGNPOST_TEXT, GoldenrodUnderground_NoEntrySign

.ObjectEvents
	db 7
	person_event SPRITE_SUPER_NERD, 15, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodUnderground_YoungerHaircutBrother, -1
	person_event SPRITE_SUPER_NERD, 11, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodUnderground_OlderHaircutBrother, -1
	person_event SPRITE_SUPER_NERD, 29,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, GoldenrodUnderground_Trainer_1, -1
	person_event SPRITE_OFFICER, 23,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, GoldenrodUnderground_Trainer_2, -1
	person_event SPRITE_SUPER_NERD,  9,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, GoldenrodUnderground_Trainer_3, -1
	person_event SPRITE_POKEMANIAC, 18,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, GoldenrodUnderground_Trainer_4, -1
	person_event SPRITE_BURGLAR, 33, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GoldenrodUnderground_Trainer_5, -1