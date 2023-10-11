FirelightPalletPathB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FirelightPalletPathB1FNobu:
	faceplayer
	opentext
	checkevent EVENT_NOBUS_AGGRON_IN_PARTY
	sif false
		jumptext .intro_text
	writetext .found_aggron_text
	special SpecialReturnNobusAggron
	anonjumptable
	dw .not_aggron
	dw .not_aggron
	dw .gave_back_aggron
	dw .only_mon

.intro_text
	ctxt "Young one, please!"
	line "Can you help?"

	para "<...>ugh."

	para "I can't move<...>"

	para "My friend possess-"
	line "es a strong body,"
	cont "made of steel."

	para "He'd be able to"
	line "carry me home."

	para "Please, could you"
	line "bring him here?"

	para "He's currently at"
	line "our home on Route"
	para "80, likely taking"
	line "a rest."

	para "Please hurry!"
	done

.found_aggron_text
	ctxt "Did you manage to"
	line "find my friend?"

	para "<...>"

	para "Thank goodness!"
	sdone

.not_aggron
	jumptext .not_aggron_text

.not_aggron_text
	ctxt "It's unwise to"
	line "tease an old man."
	done

.only_mon
	jumptext .only_mon_text

.only_mon_text
	ctxt "Even though I'm in"
	line "pain right now, I"
	para "know that it could"
	line "be dangerous to be"
	para "in this cave"
	line "without a #mon."

	para "Bring some more"
	line "#mon with you"
	cont "and come back."
	done

.gave_back_aggron
	closetext
	appear 3
	cry AGGRON
	showtext .give_back_aggron_text
	applymovement PLAYER, .player_move_away
	applymovement 3, .aggron_approaches
	follow 3, 2
	applymovement 3, .aggron_nobu_leave
	stopfollow
	disappear 3
	disappear 2
	playsound SFX_EXIT_BUILDING
	setevent EVENT_AGGRON_NOT_IN_FIRELIGHT
	clearevent EVENT_NOBUS_AGGRON_IN_PARTY
	clearevent EVENT_NOBU_NOT_IN_HOUSE
	waitsfx
	end

.player_move_away
	step_down
	step_right
	step_end

.aggron_approaches
	step_left
	step_end

.aggron_nobu_leave
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

.give_back_aggron_text
	ctxt "Thank you; my"
	line "friend will now"
	cont "return me home."

	para "However, I still"
	line "need your help."

	para "At the end of this"
	line "tunnel lie the"
	para "resting grounds of"
	line "a powerful Naljo"
	cont "guardian."

	para "Fools wearing"
	line "traditional Naljo"
	para "garbs are trying"
	line "to revive it!"

	para "They desire to"
	line "awaken the Naljo"
	para "Guardians, in"
	line "order to bring"
	para "Naljo back to what"
	line "it used to be"
	para "hundreds of years"
	line "ago."

	para "They don't know"
	line "that the Guardians"
	para "will kill everyone"
	line "in Naljo who"
	para "doesn't possess the"
	line "bloodline of the"
	para "first Naljo"
	line "generation."

	para "Innocent people"
	line "and #mon will"
	para "all perish if it"
	line "wakes up!"

	para "Please, stop them"
	line "at all costs!"
	sdone

FirelightPalletPathB1F_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $21, $25, 1, FIRELIGHT_ROOMS
	warp_def $9, $7, 3, FIRELIGHT_PALLETPATH_1F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 5
	person_event SPRITE_SAGE, 23, 36, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 1, FirelightPalletPathB1FNobu, EVENT_RESCUED_NOBU
	person_event SPRITE_AGGRON, 24, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_AGGRON_NOT_IN_FIRELIGHT
	person_event SPRITE_POKE_BALL, 5, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_FIRELIGHT_PALLETPATH_B1F_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 17, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DUST_DEVIL, 0, EVENT_FIRELIGHT_PALLETPATH_B1F_TM_DUST_DEVIL
	person_event SPRITE_BOULDER, 21, 33, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
