SpurgeGymB2F_MapScriptHeader:
 ;trigger count
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
	ctxt "Du hast mich also"
line "endlich gefunden!"
para "Aber wie ich"
line "sehe, hast du"
para "noch nicht all"
line "eine #mon"
cont "zurück. Komm"
para "wieder, wenn du"
line "sie alle hast."
	done

.introduction_text
	ctxt "Willkommen,"
	line "Trainer!"
	para "Da du dich"
	line "wagemutig meinem"
	para "Test gestellt"
	line "hast, habe ich"
	para "entschieden, deine"
	line "Herausforderung"
	cont "anzunehmen!"
	para "Ich bin Bruce,"
	line "Naljos stolzer"
	cont "Stahl-Arenaleiter!"
	para "Die Abwehrkräfte"
	line "von Stahl-#mon"
	para "sind nicht zu"
	line "übertreffen!"
	para "Bist du bereit?"
	sdone

.battle_won_text
	ctxt "W- <...> Wie?"
	para "Naja, egal."
	para "Du hast dir meinen"
	line "Orden verdient und"
	para "dadurch auch die"
	line "Möglichkeit, die"
	para "Rijon-Liga"
	line "herauszufordern!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält"
	line "den Naljo-Orden!"
	done

.before_giving_TM_text
	ctxt "Ich denke, das"
	line "sollte ich dir"
	cont "auch geben."
	sdone

.after_giving_TM_text
	ctxt "Diese TM enthält"
	line "Lichtkannone!"
	para "Diese starke"
	line "Stahl-Attacke, hat"
	para "die Chance, die"
	line "Spez. Vert. des"
	para "Gegners zu senken!"
	sdone

.parting_text
	ctxt "Nun, es ist Zeit,"
	line "dass wir uns"
	cont "verabschieden."
	para "Lebewohl."
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
	person_event SPRITE_BRUCE, 13, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpurgeGymB2FLeader, -1