OxalisGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OxalisGym_Trainer_1:
	trainer EVENT_OXALIS_GYM_TRAINER_1, COOLTRAINERM, 1, .before_battle_text, .battle_won_text

	ctxt "My shame can only"
	line "be rinsed with a"
	cont "proper lava bath."
	done

.before_battle_text
	ctxt "<...>a kid?"

	para "Is this a joke?"

	para "Well, this should"
	line "be a blast<...>"

	para "For me!"
	done

.battle_won_text
	ctxt "Preposterous!"
	done

OxalisGym_Trainer_2:
	trainer EVENT_OXALIS_GYM_TRAINER_2, DELINQUENTM, 1, .before_battle_text, .battle_won_text

	ctxt "Seems you can"
	line "handle the heat."

	para "But<...> can you"
	line "handle Josiah?"
	done

.before_battle_text
	ctxt "What's the matter?"

	para "Can't handle being"
	line "around steaming"
	para "lava at @"
	start_asm
	ld a, [wOptions2]
	and 1 << 2
	ld hl, .metric_text
	ret z
	ld hl, .imperial_text
	ret
.metric_text
	ctxt "700"
	line "degrees C?"
	done
.imperial_text
	ctxt "1,300"
	line "degrees F?"
	done

.battle_won_text
	ctxt "Gaaah!"
	done

OxalisGymGuide:
	checkflag ENGINE_PYREBADGE
	sif true
		jumptextfaceplayer .after_badge_text
	jumptextfaceplayer .before_badge_text

.before_badge_text
	ctxt "Hello there!"
	line "I've been waiting"
	cont "for your arrival."

	para "Prof. Ilk has"
	line "asked of me to"
	cont "assist you."

	para "I'll give you all"
	line "the inside info"
	cont "you need!"

	para "Alright, Josiah"
	line "has fire #mon,"
	para "but you can tell"
	line "by the scenery,"
	cont "right? Blazing!"

	para "Water would be a"
	line "good choice of"
	cont "#mon to use."

	para "Rock is another"
	line "excellent choice!"

	para "If you're getting"
	line "burned too often,"
	para "try buying a Burn"
	line "Heal at the Mart."
	done

.after_badge_text
	ctxt "Good job!"

	para "You couldn't have"
	line "done it without my"
	cont "advice, though!"
	done

OxalisGymLeader:
	faceplayer
	checkflag ENGINE_PYREBADGE
	sif true
		jumptext .already_battled_text
	showtext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer JOSIAH, JOSIAH_GYM
	startbattle
	reloadmapafterbattle
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_PYREBADGE
	setevent EVENT_ROUTE_73_GUARD
	setevent EVENT_LINK_OPEN
	writetext .before_giving_TM_text
	givetm TM_WILL_O_WISP + RECEIVED_TM
	jumptext .after_giving_TM_text

.before_battle_text
	ctxt "Sup."

	para "It's Josiah."

	para "Yo dawg, I'm not"
	line "going to make it"
	cont "easy for you."

	para "Let's make this"
	line "battle erupt!"
	sdone

.battle_won_text
	ctxt "<...>Whoa!"

	para "You are the bomb!"

	para "You have earned my"
	line "badge."
	done

.got_badge_text
	ctxt "<PLAYER> received"
	line "Pyre Badge!"
	done

.before_giving_TM_text
	ctxt "Pyre Badge"
	line "increases da"
	cont "attack power."

	para "It also lets ya"
	line "use Flash out of"
	cont "battle!"

	para "Now that's thug!"

	para "Also take this."
	sdone

.after_giving_TM_text
	ctxt "Yo, so that's a TM,"
	line "and it means"
	para "somethin'<...> uhm,"
	line "Technical Machine?"
	cont "Yeh, that's it."

	para "Yer #mon can"
	line "learn moves from"
	para "it, and it has"
	line "unlimited uses!"

	para "This TM is for"
	line "Will-O-Wisp."

	para "It inflicts a burn"
	line "on the foe!"
	done

.already_battled_text
	ctxt "So ya, the Rijon"
	line "League requires"
	cont "eight badges, so<...>"

	para "Go for it, bro,"
	line "get them all."
	done

OxalisGym_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 19, 15, 5, OXALIS_CITY
	warp_def 21, 2, 5, OXALIS_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_JOSIAH, 6, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED + 8, PERSONTYPE_SCRIPT, 0, OxalisGymLeader, -1
	person_event SPRITE_YOUNGSTER, 9, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, OxalisGym_Trainer_1, -1
	person_event SPRITE_DELINQUENTM, 10, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, OxalisGym_Trainer_2, -1
	person_event SPRITE_GYM_GUY, 18, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OxalisGymGuide, -1

