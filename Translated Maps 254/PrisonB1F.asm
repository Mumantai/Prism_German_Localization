PrisonB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .unlock_opened_doors

.unlock_opened_doors
	copy wCageKeyDoorsArrayBank
	dba PrisonB1FChangeBlockArray
	db (PrisonB1FChangeBlockArrayEnd - PrisonB1FChangeBlockArray) / 5
	endcopy
	farjump UpdateCageKeyDoorsScript

PrisonB1FChangeBlockArray:
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_1, 2, 6, $18
PrisonB1FChangeBlockArrayEntrySizeEnd:
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_2, 14, 6, $18
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_3, 24, 6, $18
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_4, 2, 20, $18
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_5, 14, 20, $18
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_6, 24, 20, $18
	eventflagchangeblock EVENT_PRISON_B1F_DOOR_7, 14, 16, $18
PrisonB1FChangeBlockArrayEnd:

PrisonB1FPasswordDoor:
	dw EVENT_PRISON_B1F_PASSWORD_DOOR
	opentext
	checkevent EVENT_PRISON_B1F_KNOW_PASSWORD
	sif false
		jumptext .door_needs_password_text
	setevent EVENT_PRISON_B1F_PASSWORD_DOOR
	writetext .door_password_text
	playsound SFX_ENTER_DOOR
	setevent EVENT_PRISON_B1F_DOOR_7
	closetext
	farscall UpdateCageKeyDoorsScript
	refreshscreen 0
	reloadmappart
	end

.door_needs_password_text
	ctxt "Die Tür ist"
	line "verschlossen."
	para "Es braucht einen"
	line "Passwort zum"
	cont "öffnen."
	done

.door_password_text
	ctxt "<PLAYER> gibt"
	line "das Passwort ein."
	para "<``>BAKLAVA<''>"
	para "Die Tür ist offen!"
	sdone

PrisonB1FRival:
	trainer EVENT_PRISON_B1F_TRAINER_1, RIVAL1, RIVAL1_4, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	faceplayer
	opentext
	checkevent EVENT_DEFEATED_RIVAL_IN_PRISON
	sif true
		jumptext .after_giving_HM_text
	writetext .after_winning_text
	givetm HM_STRENGTH + RECEIVED_TM
	setevent EVENT_DEFEATED_RIVAL_IN_PRISON
	jumptext .got_HM_text

.before_battle_text
	ctxt "Suchst du etwa"
	line "auch einen Weg"
	cont "hier raus?"
	para "Dieses Gefängnis"
	line "wird von einem"
	para "faulen"
	line "Geschäftsmann"
	para "geleitet und von"
	line "unfähigen Wärtern"
	cont "bewacht."
	para "Ich wurde für"
	line "meine harten"
	para "Kampf- und"
	line "Trainingsmethoden"
	para "eingesperrt, aber"
	line "<...>"
	para "Glücklicherweise"
	line "bin ich in einer"
	para "Welt voller"
	line "Schwächlinge viel"
	para "zu stark, um von"
	line "Mauern aus"
	para "einfachem Beton"
	line "aufgehalten zu"
	cont "werden!"
	para "Ich kämpfe mit"
	line "meinen Kreaturen"
	para "so, wie es von"
	line "Gott gewollt ist."
	para "Glaubst du etwa,"
	line "diese Wesen können"
	para "Feuer speien,"
	line "Felsen werfen und"
	para "ihre Gegner"
	line "aufschlitzen, nur"
	cont "aus Spaß am Sport?"
	para "Natürlich nicht!"
	para "Ich kämpfe so, wie"
	line "es die Natur"
	para "verlangt:"
	line "ERBARMUNGSLOS."
	para "Du erlangst"
	line "absolute Macht,"
	para "wenn du die"
	line "Schwäche deiner"
	para "Gegner kennst und"
	line "die Kontrolle über"
	para "das Schlachtfeld"
	line "behältst!"
	para "Komm her und spüre"
	line "die rohe Gewalt"
	cont "der Natur!"
	para "Muhahaha!"
	done

.battle_won_text
	ctxt "Unmöglich!"
	done

.after_winning_text
	ctxt "Du tust mir schon"
	line "etwas leid."
	para "Du wirst niemals"
	line "wissen wie es ist,"
	para "hier drinn kämpfen"
	line "zu müssen wie"
	cont "ich <...>"
	para "Daher nimm diese"
	line "VM an dich!"
	sdone

.got_HM_text
	ctxt "Das werde ich zum"
	line "flüchten nutzen."
	para "Ich werde dir"
	line "nicht zeigen wie"
	para "man es nutzt, das"
	line "wirst du selbst"
	para "herausfinden"
	line "müssen!"
	done

.after_giving_HM_text
	ctxt "Ich verspreche"
	line "dir, das nächste"
	para "Mal, wenn wir uns"
	line "sehen, wird der"
	para "Kampf genau so"
	line "enden, wie ICH es"
	cont "will!"
	done

PrisonB1FMetagross:
	faceplayer
	setevent EVENT_PRISON_B1F_NPC_1
	cry METAGROSS
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon METAGROSS, 50
	startbattle
	reloadmapafterbattle
	disappear 3
	end

PrisonB1FFambaco:
	faceplayer
	setevent EVENT_PRISON_B1F_NPC_2
	clearevent EVENT_FAMBACO
	cry FAMBACO
	applymovement 4, .step_aside
	spriteface PLAYER, RIGHT
	applymovement 4, .leave
	disappear 4
	end

.step_aside
	fast_jump_step_right
	step_end

.leave
	fast_slide_step_right
	fast_slide_step_right
	fast_slide_step_up
	fast_slide_step_up
	fast_slide_step_up
	fast_slide_step_up
	fast_slide_step_up
	step_end

PrisonB1FHariyama:
	cry HARIYAMA
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon HARIYAMA, 45
	startbattle
	reloadmapafterbattle
	end

PrisonB1FHariyama1:
	faceplayer
	setevent EVENT_PRISON_B1F_NPC_3
	scall PrisonB1FHariyama
	disappear 5
	end

PrisonB1FHariyama2:
	faceplayer
	setevent EVENT_PRISON_B1F_NPC_4
	scall PrisonB1FHariyama
	disappear 6
	end

PrisonB1FMachoke:
	faceplayer
	setevent EVENT_PRISON_B1F_NPC_5
	cry MACHOKE
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon MACHOKE, 45
	startbattle
	reloadmapafterbattle
	disappear 7
	end

PrisonB1FBronzong:
	faceplayer
	setevent EVENT_PRISON_B1F_NPC_6
	cry BRONZONG
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon BRONZONG, 50
	startbattle
	reloadmapafterbattle
	disappear 8
	end

PrisonB1F_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $e, $f, 7, PRISON_F1

.CoordEvents
	db 0

.BGEvents
	db 7
	signpost 7, 3, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 0
	signpost 7, 15, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 1
	signpost 7, 25, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 2
	signpost 21, 3, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 3
	signpost 21, 15, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 4
	signpost 21, 25, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 5
	signpost 17, 15, signpost_reset SIGNPOST_READ, PrisonB1FPasswordDoor

.ObjectEvents
	db 7
	person_event SPRITE_SILVER, 18, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 0, PrisonB1FRival, EVENT_PRISON_B1F_TRAINER_1
	person_event SPRITE_METAGROSS, 24, 26, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PrisonB1FMetagross, EVENT_PRISON_B1F_NPC_1
	person_event SPRITE_FAMBACO, 22, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PrisonB1FFambaco, EVENT_PRISON_B1F_NPC_2
	person_event SPRITE_HARIYAMA, 24, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PrisonB1FHariyama1, EVENT_PRISON_B1F_NPC_3
	person_event SPRITE_HARIYAMA, 4, 26, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PrisonB1FHariyama2, EVENT_PRISON_B1F_NPC_4
	person_event SPRITE_MACHOKE, 4, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PrisonB1FMachoke, EVENT_PRISON_B1F_NPC_5
	person_event SPRITE_BRONZONG, 4, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PrisonB1FBronzong, EVENT_PRISON_B1F_NPC_6