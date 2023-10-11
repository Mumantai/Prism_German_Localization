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

	para "Who are you<...>?"

	para "<...>"

	para "Ah, that's right."

	para "I'm a Gym Leader,"
	line "and this is a Gym."

	para "I suppose you are"
	line "here for my badge."

	para "Well, truth is<...>"

	para "I haven't accepted"
	line "Gym challenges for"
	cont "3 full years now."

	para "I used to dream<...>"

	para "But now I don't,"
	line "and it depresses"
	cont "me oh so greatly."

	para "I used to go on so"
	line "many adventures"
	cont "with my #mon."

	para "The wide green"
	line "fields I enjoyed"
	para "as a young lad are"
	line "starting to vanish"
	cont "from my mind<...>"

	para "Those dreams used"
	line "to be what pushed"
	cont "me to move on."

	para "But now<...>"

	para "No motivation to"
	line "do anything<...>"

	para "So, until I find a"
	line "way to dream once"
	para "again, you're not"
	line "going to get a"
	cont "shot at my badge."
	done

.before_battle_text
	ctxt "Hiya!"

	para "I just awakened"
	line "from the most"
	cont "pleasant dream."

	para "<...>"

	para "What? A Gengar"
	line "from Botan City"
	para "was devouring my"
	line "sweet dreams?"

	para "<...>"

	para "Ah, you sacrificed"
	line "yourself for me."

	para "How nice of you."

	para "Well, this isn't a"
	line "fictional anime,"
	para "so I can't just"
	line "give you my badge."

	para "You're still going"
	line "to have to prove"
	cont "your worth to me."
	sdone

.battle_won_text
	ctxt "Marvelous!"
	done

.got_badge_text
	ctxt "<PLAYER> got the"
	line "Midnight Badge!"
	done

.before_giving_TM_text
	ctxt "I won't be needing"
	line "this TM anymore"
	cont "either!"
	sdone

.after_giving_TM_text
	ctxt "TM51 is Dark"
	line "Pulse!"

	para "It's a strong dark"
	line "attack that can"
	para "cause your foe to"
	line "flinch!"
	done

.already_defeated_text
	ctxt "Thank you for"
	line "allowing me to"
	cont "dream again."
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
