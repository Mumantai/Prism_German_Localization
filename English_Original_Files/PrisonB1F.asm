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
	ctxt "The door is"
	line "locked."

	para "It looks like it"
	line "needs a password"
	cont "to unlock."
	done

.door_password_text
	ctxt "<PLAYER> entered"
	line "the password."

	para "<``>Wigglyjelly!<''>"

	para "The door opened!"
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
	ctxt "So, you're looking"
	line "for a way out of"
	cont "here as well?"

	para "This prison is ma-"
	line "naged by some lazy"
	para "businessman, and"
	line "guarded by fat,"
	cont "useless imbeciles."

	para "I was arrested for"
	line "my battling and"
	para "hard training"
	line "methods, but<...>"
	para "unfortunately for"
	line "this world full of"
	para "weaklings, I'm too"
	line "powerful to be"
	para "locked within"
	line "these walls of"
	cont "crumbling cement."

	para "I battle #mon"
	line "the way these"
	para "creatures have"
	line "been bred to be."

	para "You think these"
	line "tiny cretins have"
	para "developed their"
	line "ability to breathe"
	para "fire, throw"
	line "boulders and slice"
	para "their enemies to"
	line "battle just for"
	cont "sport?"

	para "Of course not!"

	para "I battle these"
	line "creatures the way"
	para "they're meant to"
	line "battle: ruthless."

	para "In battle, the"
	line "only true way to"
	para "achieve absolute"
	line "power is exploit-"
	para "ing the weakness"
	line "of the enemy while"
	para "maintaining com-"
	line "plete control of"
	cont "the entire field."

	para "Come, my humble"
	line "Trainer, and let's"
	cont "do battle! Haha."
	done

.battle_won_text
	ctxt "Impossible!"
	done

.after_winning_text
	ctxt "You know, I feel"
	line "sorry for you."

	para "You're never going"
	line "to experience a"
	para "#mon battle"
	line "like I do being"
	cont "stuck in here."

	para "Take this HM."
	sdone

.got_HM_text
	ctxt "That's what I'm"
	line "using to escape."

	para "I'm not telling"
	line "you how to use it"
	para "to escape; you"
	line "gotta figure that"
	cont "out yourself."
	done

.after_giving_HM_text
	ctxt "The next time we"
	line "meet, I promise."

	para "That battle will"
	line "end the way I"
	cont "desire."
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
