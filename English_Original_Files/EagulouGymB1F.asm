EagulouGymB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .prison_doors

.prison_doors
	copy wCageKeyDoorsArrayBank
	dba EagulouGymB1FChangeBlockArray
	db (EagulouGymB1FChangeBlockArrayEnd - EagulouGymB1FChangeBlockArray) / 5
	endcopy
	farjump UpdateCageKeyDoorsScript

EagulouGymB1FChangeBlockArray:
	eventflagchangeblock EVENT_EAGULOU_DOOR_1, 4, 4, $57
EagulouGymB1FChangeBlockArrayEntrySizeEnd:
	eventflagchangeblock EVENT_EAGULOU_DOOR_2, 16, 4, $57
	eventflagchangeblock EVENT_EAGULOU_DOOR_3, 4, 14, $57
	eventflagchangeblock EVENT_EAGULOU_DOOR_4, 16, 14, $57
EagulouGymB1FChangeBlockArrayEnd:

EagulouGymB1FGuide:
	ctxt "This is pretty"
	line "much an extension"
	para "of Saxifrage"
	line "Island."

	para "They got so filled"
	line "up that they had"
	para "to transfer some"
	line "of their inmates"
	cont "to this prison."
	done

EagulouGymB1FDoor1:
	dw EVENT_EAGULOU_DOOR_1
	writebyte 0
	jump EagulouGymB1FDoor

EagulouGymB1FDoor2:
	dw EVENT_EAGULOU_DOOR_2
	writebyte 1
	jump EagulouGymB1FDoor

EagulouGymB1FDoor4:
	dw EVENT_EAGULOU_DOOR_4
	writebyte 3
	; fallthrough
EagulouGymB1FDoor:
	pushvar
	loadarray .EagulouGymB1FTrainerEventsArray
	readarrayhalfword 0
	checkevent -1
	sif false
		jumptext .keys_wont_work_text
	popvar
	jumpstd cagekeydoor

.EagulouGymB1FTrainerEventsArray:
	dw EVENT_EAGULOU_GYM_B1F_TRAINER_1
.EagulouGymB1FTrainerEventsArrayEntrySizeEnd:
	dw EVENT_EAGULOU_GYM_B1F_TRAINER_3
	dw 0
	dw EVENT_EAGULOU_GYM_B1F_TRAINER_2

.keys_wont_work_text:
	ctxt "None of your keys"
	line "will work on"
	cont "this door."
	done

EagulouGymB1F_Trainer_1:
	trainer EVENT_EAGULOU_GYM_B1F_TRAINER_1, GRUNTM, 1, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	checkevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_1
	sif true
		jumptext .after_key_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	sif false, then
		waitbutton
		jumptext EagulouGymB1F_Text_NoSpace
	sendif
	setevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_1
	closetextend

.before_battle_text
	ctxt "The spirit of Team"
	line "Rocket shall live"
	cont "on!"
	done

.battle_won_text
	ctxt "Ouch, fine; I'll"
	line "take a break."
	done

.give_key_text
	ctxt "If you want to"
	line "annoy that"
	para "pathetic Palette"
	line "Patroller, then"
	cont "take this key."
	sdone

.after_key_text
	ctxt "I'm forever loyal"
	line "to Giovanni."

	para "He'll return one"
	line "day and reunite"
	cont "Team Rocket!"
	done

EagulouGymB1F_Trainer_2:
	trainer EVENT_EAGULOU_GYM_B1F_TRAINER_2, SAILOR, 3, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	checkevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_2
	sif true
		jumptext .after_key_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	sif false, then
		waitbutton
		jumptext EagulouGymB1F_Text_NoSpace
	sendif
	setevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_2
	closetextend

.before_battle_text
	ctxt "Can't blame a guy"
	line "for trying to"
	para "hijack a ship full"
	line "of rare #mon."
	done

.battle_won_text
	ctxt "Guess I gotta"
	line "serve my time."
	done

.give_key_text
	ctxt "Well, here's the"
	line "key to the Rocket"
	cont "cage."
	sdone

.after_key_text
	ctxt "I'll be sentenced"
	line "to life if I make"
	cont "a run for it!"
	done

EagulouGymB1F_Trainer_3:
	trainer EVENT_EAGULOU_GYM_B1F_TRAINER_3, PATROLLER, 20, .before_battle_text, .battle_won_text, NULL, .script
.script
	opentext
	checkevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_3
	sif true
		jumptext .after_key_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	sif false, then
		waitbutton
		jumptext EagulouGymB1F_Text_NoSpace
	sendif
	setevent EVENT_EAGULOU_JAIL_GOT_NPC_KEY_3
	closetextend

.before_battle_text
	ctxt "This jail is so"
	line "icky!"

	para "I know, I'll refuse"
	line "to eat and then"
	cont "they'll let me go!"
	done

.battle_won_text
	ctxt "Come on, now; my"
	line "boyfriend will"
	para "not be happy to"
	line "hear about this!"
	done

.give_key_text
	ctxt "Go bother the"
	line "warden, I'm tired"
	cont "of you."
	sdone

.after_key_text
	ctxt "Can you sneak me"
	line "in some cupcakes?"
	done

EagulouGymB1FLeader:
	faceplayer
	opentext
	checkflag ENGINE_STARBADGE
	sif true
		jumptext .already_battled_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SILVER, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_STARBADGE
	playmusic MUSIC_JOHTO_GYM
	writetext .after_badge_text
	givetm TM_FLASH + RECEIVED_TM
	jumptext .after_TM_text

.already_battled_text
	ctxt "Never forget the"
	line "special bond you"
	para "hold with your"
	line "#mon."
	done

.before_battle_text
	ctxt "<...>My name's"
	line "Silver."

	para "I'm the Warden and"
	line "Gym Leader of"
	cont "Eagulou."

	para "I used to believe"
	line "that having strong"
	para "#mon was the"
	line "bottom line!"

	para "#mon may be"
	line "considered weak,"
	para "but the bond"
	line "between a Trainer"
	para "and a #mon"
	line "has unlimited"
	cont "potential!"

	para "Be patient, and"
	line "your #mon will"
	para "become your"
	line "greatest allies!"

	para "<PLAYER>!"

	para "I challenge you!"
	sdone

.battle_won_text
	ctxt "<...>That's"
	line "impressive."

	para "You share a strong"
	line "bond with your"
	cont "team!"
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Star Badge!"
	done

.after_badge_text
	ctxt "<...>I think you're"
	line "worthy of this."

	para "I earned this"
	line "several years ago"
	para "from Sprout Tower's"
	line "wise Elder."

	para "I understood his"
	line "advice several"
	cont "years later:"
	para "#mon are not"
	line "tools of war."
	sdone

.after_TM_text
	ctxt "<...>This TM is"
	line "called Flash."

	para "It's not a popular"
	line "TM, but it will"
	para "light up dark"
	line "places & lower"
	para "the accuracy of"
	line "the foe during"
	cont "battles."
	done

EagulouGymB1F_Text_NoSpace:
	ctxt "Free up some"
	line "space, will ya?!"
	done

EagulouGymB1F_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $10, $11, 2, EAGULOU_GYM_F1

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 4, 4, signpost_reset SIGNPOST_READ, EagulouGymB1FDoor1
	signpost 4, 16, signpost_reset SIGNPOST_READ, EagulouGymB1FDoor2
	signpost 14, 4, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 2
	signpost 14, 16, signpost_reset SIGNPOST_READ, EagulouGymB1FDoor4

.ObjectEvents
	db 6
	person_event SPRITE_ROCKET, 12, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, EagulouGymB1F_Trainer_1, -1
	person_event SPRITE_SILVER, 2, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EagulouGymB1FLeader, -1
	person_event SPRITE_SAILOR, 12, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, EagulouGymB1F_Trainer_2, -1
	person_event SPRITE_PALETTE_PATROLLER, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, 8 + PAL_OW_PURPLE, PERSONTYPE_TRAINER, 0, EagulouGymB1F_Trainer_3, -1
	person_event SPRITE_OFFICER, 8, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, EagulouGymB1FGuide, -1
	person_event SPRITE_POKE_BALL, 6, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_EAGULOU_GYM_B1F_ITEM_CAGE_KEY
