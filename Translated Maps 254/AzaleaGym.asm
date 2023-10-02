AzaleaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AzaleaGymSign:
	ctxt "Azalea City"
	line "#mon-Arena"
	para "Leiter: Kai"
	done

AzaleaGym_Trainer_1:
	trainer EVENT_AZALEA_GYM_TRAINER_1, LASS, 4, .before_battle_text, AzaleaGym_OhMyGoodnessText
	ctxt "Du hast ein"
	line "starkes Team."
	para "Ich bewundere das."
	done

.before_battle_text
	ctxt "Du kommst nicht an"
	line "uns vorbei!"
	done

AzaleaGym_Trainer_2:
	trainer EVENT_AZALEA_GYM_TRAINER_2, BUG_CATCHER, 8, .before_battle_text, .battle_won_text
	ctxt "Ich trainiere wohl"
	line "noch etwas!"
	done

.before_battle_text
	ctxt "Käfer-#mon"
	line "entwickeln sich"
	cont "eher als andere."
	para "Sie sind somit"
	line "früher stärker."
	done

.battle_won_text
	ctxt "Wie du siehst, ist"
	line "Entwickeln nicht"
	cont "alles!"
	done

AzaleaGym_Trainer_3:
	trainer EVENT_AZALEA_GYM_TRAINER_3, BUG_CATCHER, 7, .before_battle_text, .battle_won_text
	ctxt "Ich traf ein"
	line "Mädchen die Käfer-"
	cont "#mon liebt."
	done

.before_battle_text
	ctxt "Käfer-#mon"
	line "sind krass!"
	para "Hier kommt der"
	line "Beweis!"
	done

.battle_won_text
	ctxt "Du bist auch"
	line "voll krass."
	done

AzaleaGym_Trainer_4:
	trainer EVENT_AZALEA_GYM_TRAINER_4, LASS, 5, .before_battle_text, AzaleaGym_OhMyGoodnessText
	ctxt "Wie beschähmend <...>"
	done

.before_battle_text
	ctxt "Warte!"
	para "Wenn du zu Kai"
	line "willst, musst du"
	cont "an uns vorbei!"
	done

AzaleaGym_Trainer_5:
	trainer EVENT_AZALEA_GYM_TRAINER_5, BUG_CATCHER, 9, .before_battle_text, .battle_won_text
	ctxt "Wir können nur"
	line "wachsen und"
	cont "stärker werden!"
	done

.before_battle_text
	ctxt "Ich bin mit meinem"
	line "Team aufgewachsen."
	para "Sie sind wie meine"
	line "Familie für mich."
	done

.battle_won_text
	ctxt "Aaaargggh!"
	done

AzaleaGymBugsy:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	sif true
		jumptext .after_battle_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer BUGSY, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_HIVEBADGE
	playmusic MUSIC_JOHTO_GYM
	writetext .before_giving_TM_text
	givetm TM_MEGAHORN + RECEIVED_TM
	jumptext .after_giving_TM_text

.before_battle_text
	ctxt "Ich bin Kai."
	para "Wenn es um Käfer-"
	line "#mon geht, bin"
	cont "ich der King!"
	para "Ich bin sowas wie"
	line "eine Autorität"
	cont "bei Käfer-#mon!"
	para "Lass mich dir"
	line "zeigen, was ich"
	cont "damit meine!"
	sdone

.battle_won_text
	ctxt "Du bist stark!"
	para "Es gibt immer was"
	line "zu lernen über"
	cont "Käfer-#mon!"
	para "Hier, der"
	line "Insektorden!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält"
	line "den Insektorden."
	done

.before_giving_TM_text
	ctxt "Nimm bitte noch"
	line "dieses Geschenk."
	sdone

.after_giving_TM_text
	ctxt "Diese TM enthält"
	line "eine Käfer-Attacke"
	para "die nur #mon"
	line "mit Hörnern lernen"
	cont "können."
	para "Lass deine Gegner"
	line "die Macht der"
	para "Käfer-#mon"
	line "spüren!"
	done

.after_battle_text
	ctxt "Käfer-#mon"
	line "sind komplex."
	para "Es gibt noch so"
	line "Vieles zu lernen."
	done

AzaleaGymGuide:
	ctxt "Hey, Trainer!"
	para "Kais Erfahrung"
	line "bei Käfer-#mon"
	cont "ist enorm!"
	para "Nutz am besten"
	line "Feuer- oder Flug-"
	cont "#mon gegen ihn!"
	done

AzaleaGym_OhMyGoodnessText:
	ctxt "Oh nein<...>"
	done

AzaleaGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $4, 4, AZALEA_TOWN
	warp_def $f, $5, 4, AZALEA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 13, 3, SIGNPOST_TEXT, AzaleaGymSign
	signpost 13, 6, SIGNPOST_TEXT, AzaleaGymSign

.ObjectEvents
	db 7
	person_event SPRITE_LASS, 10, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_1, -1
	person_event SPRITE_BUG_CATCHER, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_2, -1
	person_event SPRITE_BUG_CATCHER, 2, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_3, -1
	person_event SPRITE_LASS, 10, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, AzaleaGym_Trainer_4, -1
	person_event SPRITE_BUG_CATCHER, 8, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, AzaleaGym_Trainer_5, -1
	person_event SPRITE_BUGSY, 7, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AzaleaGymBugsy, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, AzaleaGymGuide, -1