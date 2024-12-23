ToreniaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

ToreniaGymStatue:
	checkflag ENGINE_MIDNIGHTBADGE
	sif false
		jumpstd gymstatue1
	trainertotext 4, 1, 1
	jumpstd gymstatue2

ToreniaGymLeader:
	faceplayer
	checkevent EVENT_HAUNTED_FOREST_GENGAR
	sif false
		jumptext .not_accepting_challenges_text
	checkflag ENGINE_MIDNIGHTBADGE
	sif true
		jumptext .already_defeated_text
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer EDISON, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	special RestartMapMusic
	writetext .before_giving_TM_text
	givetm TM_DARK_PULSE + RECEIVED_TM
	setflag ENGINE_MIDNIGHTBADGE
	jumptext .after_giving_TM_text

.not_accepting_challenges_text
	ctxt "AHHH!"
	para "Wer bist du <...>"
	para "<...>"
	para "Ah, richtig."
	para "Ich bin der"
	line "Arenaleiter und"
	cont "dies ist eine"
	cont "Arena."
	para "Ich schätze du"
	line "bist hier für"
	cont "meinen Orden."
	para "Die Wahrheit ist <...>"
	para "Ich habe seit 3"
	line "Jahren keine"
	cont "Herausforderungen"
	cont "akzeptiert."
	para "Beim schlafen"
	line "hatte ich früher"
	para "schöne lange"
	line "Träume!"
	para "Aber jetzt nicht"
	line "mehr und das"
	cont "deprimiert mich."
	para "Ich erlebte so"
	line "viele Abenteuer"
	para "mit meinem"
	line "#mon."
	para "Die großen grünen"
	line "Felder, die Ich"
	para "als Junge genossen"
	line "habe verschwinden"
	cont "langsam aus meinem"
	para "Gedächtnis <...>"
	para "Diese Träume waren"
	line "das was mich"
	cont "angetrieben hat."
	para "Aber jetzt <...>"
	para "Keine Motivation"
	line "etwas zu tun <...>"
	para "All das begann,"
	line "als ich beim"
	para "Training im"
	line "Spukwald in der"
	para "Rijon-Region auf"
	line "diese"
	para "Schattengestalt"
	line "stieß <...>"
	done

.before_battle_text
	ctxt "Hiya!"
	para "Ich bin gerade aus"
	line "dem tollsten Traum"
	cont "erwacht."
	para "<...>"
	para "Was? Ein Gengar"
	line "aus Botania City"
	para "hat meine schönen"
	line "Träume gefressen?"
	para "<...>"
	para "Ah, du hast dich"
	line "für mich geopfert."
	para "Wie lieb von dir."
	para "Aber dies ist kein"
	line "Anime, weshalb ich"
	para "dir nicht einfach"
	line "meinen Orden geben"
	cont "kann."
	para "Du musst trotzdem"
	line "beweisen, dass du"
	cont "es Wert bist."
	sdone

.battle_won_text
	ctxt "Wunderbar!"
	done

.got_badge_text
	ctxt "<PLAYER> bekommt"
	line "den"
	cont "Mitternachtsorden!"
	done

.before_giving_TM_text
	ctxt "Ich brauche diese"
	line "TM auch nicht"
	cont "mehr!"
	sdone

.after_giving_TM_text
	ctxt "TM51 ist"
	line "Finsteraura!"
	para "Es ist eine starke"
	line "Unlicht-Attacke"
	para "die einen Feind"
	line "zurückschrecken"
	cont "lässt!"
	done

.already_defeated_text
	ctxt "Danke, dass du mir"
	line "ermöglicht hast"
	cont "wieder zu träumen."
	done

ToreniaGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 17, 10, 2, TORENIA_CITY
	warp_def 17, 11, 2, TORENIA_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 15, 9, SIGNPOST_READ, ToreniaGymStatue
	signpost 15, 12, SIGNPOST_READ, ToreniaGymStatue

.ObjectEvents
	db 1
	person_event SPRITE_EDISON, 12, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ToreniaGymLeader, -1