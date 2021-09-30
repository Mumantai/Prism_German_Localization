SpurgeGymB2F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SpurgeGymB2FFourthMon:
	setevent EVENT_SPURGE_GYM_POKEMON_4
	jump SpurgeGymGetPokemon

SpurgeGymB2FFirstMon:
	setevent EVENT_SPURGE_GYM_POKEMON_1

SpurgeGymGetPokemon:
	scriptstartasm
	ld hl, wPartyCount
	inc [hl]
	ld c, [hl]
	ld b, 0
	add hl, bc
	ld de, wBackupSecondPartySpecies
	ld a, [de]
	ld [hli], a
	ldh [hScriptVar], a
	ld a, [hl]
	ld [de], a
	ld [hl], $ff
	ld a, c
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	call CopyName2
	scriptstopasm
	opentext
	writetext .found_mon_text
	cry 0
	disappear LAST_TALKED
	closetextend

.found_mon_text
	text "<PLAYER> findet"
	line "<STRBF1>!"
	done

SpurgeGymB2FButton:
	checkevent EVENT_SPURGE_GYM_SWITCH_ENABLED
	sif true
		jumptext .already_pushed_text
	playsound SFX_ENTER_DOOR
	setevent EVENT_SPURGE_GYM_SWITCH_ENABLED
	jumptext .pushed_text

.pushed_text
	ctxt "Schalter betätigt."

	para "Keine Ahnung was"
	line "das gebracht hat<...>"
	done

.already_pushed_text
	ctxt "Der Schalter wurde"
	line "bereits betätigt."
	done

SpurgeGymB2FLeader:
	checkcode VAR_PARTYCOUNT
	sif !=, 6
		jumptextfaceplayer .did_not_find_all_mons_text
	faceplayer
	opentext
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer BRUCE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_NALJOBADGE
	special RestartMapMusic
	writetext .before_giving_TM_text
	givetm TM_FLASH_CANNON + RECEIVED_TM
	opentext
	writetext .after_giving_TM_text
	writetext .parting_text
	setevent EVENT_SPURGE_GYM_DEFEATED
	special Special_BattleTowerFade
	playwaitsfx SFX_WARP_FROM
	clearevent EVENT_ENTERED_SPURGE_GYM
	warp SPURGE_CITY, 34, 6
	end

.did_not_find_all_mons_text
	ctxt "Du hast ja Jahre"
	line "gebraucht um mich"
	cont "zu finden!"

	para "Du hast aber noch"
	line "nicht all deine"
	cont "#mon zurück!"

	para "Komm wieder wenn"
	line "es so weit ist."
	done

.introduction_text
	ctxt "Hallo Trainer!"

	para "Aufgrund deinem"
	line "Mut, welches du"
	cont "in diesem Puzzle"
	para "beweisen konntest,"
	line "akzeptiere ich"
	cont "den Kampf!"

	para "Ich bin Bruce, der"
	line "Stahl Arenaleiter"
	cont "von Naljo!"

	para "Die Verteidigungs-"
	line "stärke von Stahl-"
	para "#mon ist"
	line "unübertreffbar!"

	para "Bist du bereit?"
	sdone

.battle_won_text
	ctxt "W<...>Wie?"

	para "Naja, egal."

	para "Du hast dir den"
	line "Orden verdient und"
	para "dadurch auch die"
	line "möglichkeit, die"
	para "Rijon Liga zu"
	line "bestreiten!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält"
	line "den Naljo Orden!"
	done

.before_giving_TM_text
	ctxt "Ich hab noch etwas"
	line "für dich."
	sdone

.after_giving_TM_text
	ctxt "Diese TM ist"
	line "Lichtkanone!"

	para "Diese starke Stahl"
	line "Attacke hat die"
	para "Chance, die Spez."
	line "Vert. des Gegners"
	cont "etwas zu senken!"
	sdone

.parting_text
	ctxt "Es ist Zeit für"
	line "uns zu gehen."

	para "Wenn du nicht"
	line "weißt wie du zur"
	para "Rijon Liga"
	line "gelangst, sprich"
	para "mich oben nochmal"
	line "an, dann erkläre"
	cont "ich es dir."
	
	para "Bis dahin,"
	line "Lebewohl!"
	sdone

SpurgeGymB2F_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 33, 3, 2, SPURGE_GYM_B2F_SIDESCROLL
	warp_def 3, 3, 3, SPURGE_GYM_B1F
	warp_def 3, 13, 4, SPURGE_GYM_B1F
	warp_def 15, 7, 5, SPURGE_GYM_B1F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 1, 3, SIGNPOST_READ, SpurgeGymB2FButton

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 24, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB2FFirstMon, EVENT_SPURGE_GYM_POKEMON_1
	person_event SPRITE_POKE_BALL, 2, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB2FFourthMon, EVENT_SPURGE_GYM_POKEMON_4
	person_event SPRITE_CLAIR, 13, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpurgeGymB2FLeader, -1
