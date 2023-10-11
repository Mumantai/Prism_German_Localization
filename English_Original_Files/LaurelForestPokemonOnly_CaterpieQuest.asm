LaurelForestPokemonOnlyMotherButterfree:
	faceplayer
	cry BUTTERFREE
	opentext
	checkevent EVENT_POKEONLY_FINISHED_CATERPIE_QUEST
	sif true, then
		checkevent EVENT_BUTTERFREE_GAVE_CURO_SHARD
		sif true
			jumptext .after_rescuing_caterpie_text
		jump LaurelForestPokemonOnly_ButterfreeTryGiveCuroShard
	sendif
	writetext .cant_find_caterpie_text
	checkevent EVENT_POKEONLY_CATERPIE_IN_PARTY
	iftrue .returnCaterpieToButterfree
	buttonsound
	writetext .asking_for_help_text
	yesorno
	sif false
		jumptext .denied_butterfree_text
	writetext .lets_look_for_it_text
	checkcode VAR_PARTYCOUNT
	if_not_equal 1, LaurelForestPokemonOnly_NotEnoughRoomInParty
	writetext .butterfree_joined_party_text
	playwaitsfx SFX_CHOOSE_A_CARD
	waitbutton
	givepoke BUTTERFREE, 20, SILK, 1, .butterfree_name, LaurelForestOTName
	disappear 4
	setevent EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	closetextend

.after_rescuing_caterpie_text
	ctxt "I always worry"
	line "about my baby."

	para "I don't know what"
	line "I would do if"
	cont "something awful"
	cont "happened to it."
	done

.cant_find_caterpie_text
	ctxt "Oh no!"

	para "Where in the world"
	line "did my baby go?"
	done

.asking_for_help_text
	ctxt "Please help me"
	line "find it, please!"
	done

.denied_butterfree_text
	ctxt "No?"

	para "But anything could"
	line "be happening to"
	cont "my baby right now!"
	done

.lets_look_for_it_text
	ctxt "Oh, thank you."

	para "Let's look for my"
	line "baby!"
	sdone

.butterfree_joined_party_text
	ctxt "Butterfree joined"
	line "the party!"
	done

.butterfree_name
	db "Butterfree@"

.returnCaterpieToButterfree
	waitbutton
	closetext
	callasm RemoveSecondPartyMember
	pushvar
	assert METAPOD == (CATERPIE + 1)
	assert BUTTERFREE == (CATERPIE + 2)
	addvar -CATERPIE
	loadarray .CaterpieEndMovementArray
	readarray 0
	setlasttalked -1
	moveperson LAST_TALKED, 13, 31
	appear LAST_TALKED
	checkcode VAR_FACING
	sif =, UP, then
		spriteface LAST_TALKED, UP
	selse
		spriteface LAST_TALKED, LEFT
	sendif
	popvar
	cry 0
	showtext LaurelForestPokemonOnly_Text_ButterfreeFoundCaterpie
	checkcode VAR_FACING
	sif =, UP, then
		applymovement LAST_TALKED, .CaterpieMovesUp
	selse
		applymovement LAST_TALKED, .CaterpieMovesLeft
	sendif
	faceperson LAST_TALKED, 4
	faceperson 4, LAST_TALKED
	showtext .caterpie_explains_text
	faceperson 4, PLAYER
	cry BUTTERFREE
	scall LaurelForestPokemonOnly_ButterfreeTryGiveCuroShard
	checkcode VAR_FACING
	sif =, UP, then
		readarrayhalfword 1
	selse
		readarrayhalfword 3
	sendif
	applymovement LAST_TALKED, -1
	clearevent EVENT_POKEONLY_CATERPIE_IN_PARTY
	setevent EVENT_POKEONLY_FINISHED_CATERPIE_QUEST
	end

.caterpie_explains_text
	ctxt "Mommy! This nice"
	line "#mon helped me"
	cont "find you!"
	sdone

.CaterpieEndMovementArray
	dbww 14, .CaterpieEndMovement_Right, .CaterpieEndMovement_Bottom
.CaterpieEndMovementArrayEntrySizeEnd:
	dbww 5, .MetapodEndMovement_Right, .MetapodEndMovement_Bottom
	dbww 10, .ButterfreeEndMovement_Right, .ButterfreeEndMovement_Bottom

.CaterpieMovesUp
	step_up
	step_end

.CaterpieMovesLeft
	step_left
	step_end

.CaterpieEndMovement_Bottom
	step_right
	step_right
	step_up
	turn_head_down
	step_end

.CaterpieEndMovement_Right
	step_right
	turn_head_down
	step_end

.ButterfreeEndMovement_Bottom
	step_down
.MetapodEndMovement_Bottom
	step_right
	step_right
	turn_head_down
	step_end

.ButterfreeEndMovement_Right
	step_down
.MetapodEndMovement_Right
	step_right
	step_down
	step_end

LaurelForestPokemonOnlyCaterpie:
	faceplayer
	cry CATERPIE
	opentext
	writetext .cant_find_mommy_text
	checkevent EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	iftrue .broughtButterfreeToCaterpie
	buttonsound
	writetext .asking_for_help_text
	yesorno
	sif false
		jumptext .denied_text
	checkcode VAR_PARTYCOUNT
	sif >, 1
		jumptext .no_room_in_party_text
	writetext .joined_party_text
	playwaitsfx SFX_CHOOSE_A_CARD
	givepoke CATERPIE, 4, SILK, 1, .caterpie_name, LaurelForestOTName
	setevent EVENT_POKEONLY_CATERPIE_IN_PARTY
	setevent EVENT_POKEONLY_CATERPIE_PICKED_UP
	disappear 6
	closetextend

.cant_find_mommy_text
	ctxt "Help!"

	para "I can't find my"
	line "mommy anywhere!"
	done

.asking_for_help_text
	ctxt "Can you please"
	line "help me find my"
	cont "mommy?"
	done

.denied_text
	ctxt "No? But I'm lost!"

	para "Please don't leave"
	line "me here alone!"
	done

.no_room_in_party_text
	ctxt "Oh, I can't join"
	line "you if you're with"
	cont "someone already<...>"
	done

.joined_party_text
	ctxt "Oh, thank you!"

	para "Please find my"
	line "mommy for me!"

	para "Caterpie joined"
	line "the party!"
	done

.caterpie_name
	db "Caterpie@"

.broughtButterfreeToCaterpie
	waitbutton
	closetext
	moveperson 4, 33, 51
	appear 4
	checkcode VAR_FACING
	sif =, RIGHT, then
		spriteface 4, RIGHT
	selse
		spriteface 4, DOWN
	sendif
	cry BUTTERFREE
	opentext
	writetext LaurelForestPokemonOnly_Text_ButterfreeFoundCaterpie
	closetext
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement 4, .ButterfreeMovesRightMovement
	selse
		applymovement 4, .ButterfreeMovesDownMovement
	sendif
	faceperson 6, 4
	faceperson 4, 6
	cry CATERPIE
	showtext .mommy_you_found_me_text
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement 4, .ButterfreeMovesLeftMovement
	selse
		applymovement 4, .ButterfreeMovesUpMovement
	sendif
	faceperson 4, PLAYER
	faceperson PLAYER, 4
	scall LaurelForestPokemonOnly_ButterfreeTryGiveCuroShard
	checkcode VAR_FACING
	sif =, UP, then
		applymovement 4, .ButterfreeMovesRightMovement
		follow 4, 6
		applymovement 4, .ButterfreeExits_AboveCaterpie
	selse
		applymovement 4, .ButterfreeMovesDownMovement
		follow 4, 6
		applymovement 4, .ButterfreeExits_LeftOfCaterpie
	sendif
	stopfollow
	clearevent EVENT_POKEONLY_CATERPIE_NOT_IN_NEST
	setevent EVENT_POKEONLY_CATERPIE_PICKED_UP
	setevent EVENT_POKEONLY_FINISHED_CATERPIE_QUEST
	callasm RemoveSecondPartyMember
	disappear 4
	moveperson 4, 12, 30
	appear 4
	appear 14
	disappear 6
	end

.ButterfreeMovesLeftMovement
	step_left
	step_end

.ButterfreeMovesUpMovement
	step_up
	step_end

.ButterfreeMovesRightMovement
	step_right
	step_end

.ButterfreeMovesDownMovement
	step_down
	step_end

.ButterfreeExits_AboveCaterpie
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.ButterfreeExits_LeftOfCaterpie
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.mommy_you_found_me_text
	ctxt "Mommy! You found"
	line "me!"
	sdone

LaurelForestPokemonOnly_ButterfreeTryGiveCuroShard:
	opentext
	writetext .thanks_text
	giveitem CURO_SHARD, 1
	sif false, then
		waitbutton
		writetext .no_room_text
	selse
		playwaitsfx SFX_ITEM
		waitbutton
		setevent EVENT_BUTTERFREE_GAVE_CURO_SHARD
	sendif
	closetextend

.thanks_text
	ctxt "Thank you for"
	line "finding my baby!"

	para "I was so worried."

	para "Here is a Curo"
	line "Shard!"
	done

.no_room_text
	ctxt "You have no room"
	line "for this item."

	para "Come to me later"
	line "when you have"
	cont "space."
	sdone

LaurelForestPokemonOnlyRescuedCaterpie:
	faceplayer
	cry CATERPIE
	jumptext .text

.text
	ctxt "I hope one day"
	line "I can become as"
	cont "strong as you."
	done

LaurelForestPokemonOnlyRescuedMetapod:
	faceplayer
	cry METAPOD
	jumptext .text

.text
	ctxt "I feel this hard"
	line "shell suits me"
	cont "better anyway!"

	para "That was one great"
	line "adventure, and"
	para "it sure made me"
	line "stronger!"
	done

LaurelForestPokemonOnlyRescuedButterfree:
	faceplayer
	cry BUTTERFREE
	jumptext .text

.text
	ctxt "Whee!"

	para "I love these"
	line "beautiful wings!"

	para "I can fly around"
	line "just like mommy!"
	done

LaurelForestPokemonOnly_Text_ButterfreeFoundCaterpie:
	ctxt "Oh!"

	para "It's my baby!"
	sdone
