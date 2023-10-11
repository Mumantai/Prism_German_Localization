AcaniaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaGym_ToxicCloudText:
	ctxt "This toxic gas"
	line "cloud is blocking"
	cont "the way."

	para "Trying to go"
	line "through it could"
	cont "be dangerous."
	done

AcaniaGymGuide:
	checkflag ENGINE_HAZEBADGE
	sif true
		jumptextfaceplayer .after_badge_text
	jumptextfaceplayer .intro_text

.intro_text
	ctxt "This Gym Leader's"
	line "name is Ayaka."

	para "She specializes"
	line "in Gas-types."

	para "Do refrain from"
	line "breathing too"
	cont "much in here<...>"
	done

.after_badge_text
	ctxt "Great, you managed"
	line "to defeat her."

	para "But sadly, the"
	line "horrible scent of"
	cont "this Gym remains!"
	done

AcaniaGym_Trainer_1:
	trainer EVENT_ACANIA_GYM_TRAINER_1, BEAUTY, 5, .before_battle_text, .battle_won_text, NULL, .script

.script
	checkevent EVENT_ACANIA_GAS_CLOUD_2
	sif true
		jumptext .gas_cleared_text
	showtext .clearing_gas_text
	disappear 3
	setevent EVENT_ACANIA_GAS_CLOUD_2
	end

.before_battle_text
	ctxt "Uhhh<...>"

	para "I'm -cough-"

	para "I'm all ready to"
	line "battle since I"

	para "-cough- have"
	line "to or whatever."
	done

.battle_won_text
	ctxt "Ughhhhhh<...>"
	done

.clearing_gas_text
	ctxt "I'll clear the"
	line "gas because I'm"
	cont "supposed to<...>"

	para "<...> because the"
	line "leader told me"
	cont "to do it<...> yeah."
	sdone

.gas_cleared_text
	ctxt "Uhhh, I don't know"
	line "what else to say."

	para "I'm sleepy<...>"
	done

AcaniaGym_Trainer_2:
	trainer EVENT_ACANIA_GYM_TRAINER_2, DELINQUENTF, 2, .before_battle_text, .battle_won_text, NULL, .script

.script
	checkevent EVENT_ACANIA_GAS_CLOUD_1
	sif true
		jumptext .gas_cleared_text
	showtext .clearing_gas_text
	disappear 2
	setevent EVENT_ACANIA_GAS_CLOUD_1
	end

.before_battle_text
	ctxt "Uhhh<...>"

	para "Oh yeah, let's"
	line "battle, why not?"
	done

.battle_won_text
	ctxt "Hmph!"
	done

.clearing_gas_text
	ctxt "You know that gas"
	line "blocking your way?"

	para "That problem just"
	line "got blown away."
	sdone

.gas_cleared_text
	ctxt "I'm going to"
	line "-cough-"
	cont "keep training."
	done

AcaniaGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_HAZEBADGE
	sif true
		jumptext .already_battled_text
	writetext .intro_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer AYAKA, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_HAZEBADGE
	writetext .giving_TM_text
	givetm TM_BURNING_MIST + RECEIVED_TM
	jumptext .got_TM_text

.intro_text
	ctxt "Someone's here?"

	para "OK, I see<...>"

	para "You're a knight"
	line "wielding a shovel?"

	para "No<...> you're just a"
	line "Trainer out to get"
	cont "my Gym badge."

	para "How boring<...>"
	line "-yawn-"

	para "Well, according to"
	line "my very demanding"
	para "schedule, I have"
	line "time for a battle."
	cont "So, sure, OK."

	para "I'm Ayaka, and I"
	line "use Gas #mon."

	para "OK, let's get this"
	line "over with already."
	sdone

.battle_won_text
	ctxt "-cough-"

	para "Well, that was"
	line "different."

	para "Meh."

	para "Oh, fine, here is"
	line "your, wait<...>"

	para "What's the badge's"
	line "name again?"

	para "Haze?"

	para "Who came up with"
	line "that stupid name?"

	para "Me?"

	para "Oh, OK then."
	done

.got_badge_text
	ctxt "<PLAYER> received"
	line "Haze Badge."
	done

.giving_TM_text
	ctxt "Take this TM too."
	sdone

.got_TM_text
	ctxt "This TM is called"
	line "Burning Mist."

	para "It, uhh<...>"

	para "My brain hurts."
	line "You figure it out."
	done

.already_battled_text
	ctxt "Well, I think I'm"
	line "just going to lie"
	para "down for a bit,"
	line "until the next"
	cont "Trainer comes in."

	para "That could be a"
	line "while."

	para "Oh, well!"

	para "Just go battle"
	line "other people,"
	cont "please."
	done

AcaniaGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $d, $4, 5, ACANIA_DOCKS
	warp_def $d, $5, 5, ACANIA_DOCKS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 6
	person_event SPRITE_SUDOWOODO, 7, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXT, 0, AcaniaGym_ToxicCloudText, EVENT_ACANIA_GAS_CLOUD_1
	person_event SPRITE_SUDOWOODO, 5, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXT, 0, AcaniaGym_ToxicCloudText, EVENT_ACANIA_GAS_CLOUD_2
	person_event SPRITE_GYM_GUY, 11, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcaniaGymGuide, -1
	person_event SPRITE_BUENA, 4, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, AcaniaGym_Trainer_1, -1
	person_event SPRITE_DELINQUENTF, 5, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, AcaniaGym_Trainer_2, -1
	person_event SPRITE_AYAKA, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcaniaGymLeader, -1
