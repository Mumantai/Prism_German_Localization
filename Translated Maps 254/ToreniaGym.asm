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
	para "Wer bist du<...>?"
	para "<...>"
	para "Ah, richtig."
	para "Ich bin der"
	line "Arenaleiter und"
	para "das hier, ist"
	line "meine Arena."
	para "Ich nehem an, du"
	line "willst meinen"
	cont "Orden haben?"
	para "Die Wahrheit ist <...>"
	para "Ich habe schon"
	line "seit ganzen drei"
	para "Jahren keine"
	line "Herausforderung"
	cont "mehr angenommen."
	para "Weißt du, ich kann"
	line "nicht mehr träumen"
	para "und das macht mir"
	line "echt zu schaffen."
	para "Früher habe ich"
	line "mit meinen #mon"
	para "so viele Abenteuer"
	line "erlebt."
	para "Die weiten grünen"
	line "Felder, die ich"
	para "als Kind so"
	line "geliebt habe,"
	para "verschwinden aus"
	cont "meinem Gedächtnis<...>"
	para "Diese Träume waren"
	line "es, die mich"
	cont "angetrieben haben."
	para "Doch jetzt <...> fehlt"
	para "mir jegliche"
	line "Motivation, etwas"
	cont "zu unternehmen."
	para "Wenn du also"
	line "meinen Orden haben"
	para "willst, solltest"
	line "du es schaffen,"
	para "dass ich wieder"
	line "träumen kann."
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
	para "Aber das ist kein"
	line "Anime, weshalb ich"
	para "dir nicht einfach"
	line "so meinen Orden"
	cont "geben kann."
	para "Du musst mir schon"
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
	ctxt "Diese TM brauche"
	line "ich auch nicht"
	cont "mehr!"
	sdone

.after_giving_TM_text
	ctxt "TM51 enthält"
	line "Finsteraura!"
	para "Es ist eine starke"
	line "Unlicht-Attacke"
	para "die deine Gegner"
	line "zurückschrecken"
	cont "lassen kann!"
	done

.already_defeated_text
	ctxt "Danke, dass du mir"
	line "ermöglicht hast,"
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