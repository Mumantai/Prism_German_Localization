LaurelForestPokemonOnlyPikachu:
	faceplayer
	cry PIKACHU
	opentext

	checkevent EVENT_POKEONLY_FINISHED_PIKACHU_ROOT_QUEST
	sif true, then
		scall .CheckIfMainMonIsInPikachuLine_SkipEventCheck
		sif true, then
			writetext .thanks_for_the_adventure_text
			checkevent EVENT_POKEONLY_PIKACHU_GAVE_LIGHT_BALL
			sif true
				endtext
			writetext .heres_my_light_ball_text
			jump LaurelForestPokemonOnly_PikachuTryGiveLightBallToPlayer
		sendif
	sendif

	checkevent EVENT_POKEONLY_FINISHED_PIKACHU_QUEST
	sif true, then
		scall .CheckIfMainMonIsInPikachuLine
		iftrue .pikachuAsksForAdventure
		checkevent EVENT_POKEONLY_PIKACHU_MAD
		sif true, then
			checkevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
			sif true
				jumptext .what_are_you_doing_here_text
			writetext .heres_the_junk_you_wanted_text
			jump .angryPikachuGivesCuroShard
		sendif
		checkevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
		iffalse .satisfiedPikachuGivesCuroShard
		jumptext .full_for_now_text
	sendif

	checkevent EVENT_POKEONLY_PIKACHU_DEFEATED
	sif true, then
		scall .CheckIfMainMonIsInPikachuLine
		iftrue .pikachuAsksForAdventure
		checkevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
		iffalse	.defeatedPikachuGivesCuroShard
		jumptext .after_defeated_text
	sendif

	checkevent EVENT_POKEONLY_PIKACHU_MAD
	iftrue .pikachuMadWantsBurntBerries

	checkevent EVENT_POKEONLY_PIKACHU_GAVE_OBJECTIVE
	iftrue .pikachuGaveObjective

	scall .CheckIfMainMonIsInPikachuLine
	iftrue .pikachuAsksForAdventure

	writetext .asking_for_burnt_berries_text
	yesorno
	sif true, then
		setevent EVENT_POKEONLY_PIKACHU_GAVE_OBJECTIVE
		jumptext .cant_wait_to_eat_text
	sendif
	writetext .wanna_fight_text
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon PIKACHU, 25, LIGHT_BALL, SURF, THUNDERBOLT, DOUBLE_TEAM, SIGNAL_BEAM
	startbattle
	reloadmap
	special HealParty
	scriptstartasm
	ld a, [wBattleResult]
	and $3f
	ldh [hScriptVar], a
	scriptstopasm
	sif true, then
		setevent EVENT_POKEONLY_PIKACHU_MAD
		jumptext .must_deliver_two_burnt_berries_text
	sendif
	setevent EVENT_POKEONLY_PIKACHU_DEFEATED
.defeatedPikachuGivesCuroShard
	opentext
	writetext .defeated_text
	giveitem CURO_SHARD, 1
	sif false, then
		waitbutton
		writetext .cant_give_curo_shard_nice_text
	selse
		playwaitsfx SFX_ITEM
		waitbutton
		setevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
	sendif
	closetextend

.thanks_for_the_adventure_text
	ctxt "Thanks for the"
	line "adventure!"

	para "Those roots were"
	line "very tasty too!"
	done

.heres_my_light_ball_text
	ctxt "Oh, you want my"
	line "Light Ball?"

	para "OK! Here you go!"
	prompt

.what_are_you_doing_here_text
	ctxt "<...>Uhm, what are you"
	line "still doing here?"
	done

.heres_the_junk_you_wanted_text
	ctxt "You really want"
	line "that junk I found?"

	para "Fine then, but"
	line "only because I'm"
	cont "being nice."
	prompt

.full_for_now_text
	ctxt "I'm full for now!"
	done

.after_defeated_text
	ctxt "Please, let me be."
	done

.asking_for_burnt_berries_text
	ctxt "Oh, hello there!"

	para "Uh<...>"

	para "It seems like I'm"
	line "pretty hungry!"

	para "Will you go and"
	line "get me something"
	cont "tasty to eat?"

	para "Also, I only eat"
	line "Burnt Berries."
	done

.cant_wait_to_eat_text
	ctxt "Wonderful!"

	para "I can't wait to"
	line "eat, eat, eat!"
	done

.wanna_fight_text
	ctxt "OK, that's it!"

	para "You wanna fight?"

	para "We'll fight!"
	sdone

.defeated_text
	ctxt "OK, OK, OK, sorry!"

	para "You don't have to"
	line "get me anything<...>"

	para "For going easy on"
	line "me, here's a Curo"
	cont "Shard."
	done

.must_deliver_two_burnt_berries_text
	ctxt "YEAH!"

	para "If you don't want"
	line "to get hurt, you"
	para "better deliver two"
	line "Burnt Berries<...>"

	para "<...>or else!"
	done

.cant_give_curo_shard_nice_text
	ctxt "Hey, I can't give"
	line "you the Curo Shard"
	para "if your bag is"
	line "full."
	sdone

.pikachuAsksForAdventure
	writetext -1
	writetext .adventure_request_text
	yesorno
	sif false
		jumptext .no_adventure_text
	checkcode VAR_PARTYCOUNT
	if_not_equal 1, LaurelForestPokemonOnly_NotEnoughRoomInParty
	writetext .accepted_adventure_text
	playwaitsfx SFX_CHOOSE_A_CARD
	waitbutton
	givepoke PIKACHU, 25, SITRUS_BERRY, 1, .pikachu_name, LaurelForestOTName
	disappear 9
	closetextend

.adventure_request_text
	ctxt "How would you"
	line "like to go on"
	cont "adventure with me?"
	done

.accepted_adventure_text
	ctxt "Great!"

	para "Let's find some"
	line "tasty Berries!"

	para "Pikachu joined"
	line "the party!"
	done

.no_adventure_text
	ctxt "Aww, I was really"
	line "looking forward"
	cont "to it!"
	done

.pikachu_name
	db "Pikachu@"

.pikachuGaveObjective
	takeitem BURNT_BERRY, 1
	sif false
		jumptext .where_is_burnt_berry_text
.satisfiedPikachuGivesCuroShard
	writetext .delivered_burnt_berry_text
	giveitem CURO_SHARD, 1
	sif false, then
		waitbutton
		writetext .happy_pikachu_full_bag_text
	selse
		playwaitsfx SFX_ITEM
		waitbutton
		setevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
	sendif
	setevent EVENT_POKEONLY_FINISHED_PIKACHU_QUEST
	closetextend

.where_is_burnt_berry_text
	ctxt "Where is the"
	line "Burnt Berry?"

	para "I can't see it."
	done

.delivered_burnt_berry_text
	ctxt "Thank you for the"
	line "Burnt Berry!"

	para "As thanks, here's"
	line "a Curo Shard."
	done

.happy_pikachu_full_bag_text
	ctxt "Oh, your bag is"
	line "full."

	para "I'll be waiting"
	line "here if you want"
	cont "this Curo Shard."
	sdone

.pikachuMadWantsBurntBerries
	takeitem BURNT_BERRY, 2
	sif false
		jumptext .dont_come_back_without_burnt_berries_text
	writetext .delivered_two_burnt_berries_text
.angryPikachuGivesCuroShard
	writetext .handed_over_text
	giveitem CURO_SHARD, 1
	sif false, then
		waitbutton
		writetext .angry_pikachu_cant_deliver_curo_shard_text
	selse
		playwaitsfx SFX_ITEM
		waitbutton
		setevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
	sendif
	setevent EVENT_POKEONLY_FINISHED_PIKACHU_QUEST
	closetextend

.delivered_two_burnt_berries_text
	ctxt "Finally!"

	para "I'll let you go"
	line "for now, and take"
	para "this junk I found"
	line "earlier."
	prompt

.handed_over_text
	ctxt "Pikachu willfully"
	line "handed over the"
	cont "Curo Shard!"
	done

.dont_come_back_without_burnt_berries_text
	ctxt "Hey, don't come"
	line "back without"
	para "the two Burnt"
	line "Berries!"
	done

.angry_pikachu_cant_deliver_curo_shard_text
	ctxt "Hey, I can't give"
	line "this junk to you"
	para "if your bag is"
	line "full!"
	sdone

.CheckIfMainMonIsInPikachuLine
	checkevent EVENT_POKEONLY_FINISHED_PIKACHU_ROOT_QUEST
	sif true, then
		writebyte 0
		end
	sendif
.CheckIfMainMonIsInPikachuLine_SkipEventCheck
	checkpoke PIKACHU
	writehalfword .another_pikachu_text
	sif true
		end
	checkpoke RAICHU
	writehalfword .raichu_text
	sif true
		end
	checkpoke PICHU
	writehalfword .pichu_text
	end

.another_pikachu_text
	ctxt "Wow, another"
	line "Pikachu!"
	prompt

.raichu_text
	ctxt "Wow, a Raichu!"
	line "That's so cool!"
	prompt

.pichu_text
	ctxt "Oh, how cute,"
	line "a little Pichu!"
	prompt

LaurelForestPokemonOnly_PikachuTryGiveLightBallToPlayer:
	callasm .GiveLightBallToPlayer
	sif true
		jumptext .already_holding_item_text
	writetext .gave_light_ball_text
	playwaitsfx SFX_ITEM
	waitbutton
	setevent EVENT_POKEONLY_PIKACHU_GAVE_LIGHT_BALL
	closetextend

.GiveLightBallToPlayer:
	ld a, [wPartySpecies]
	ld hl, .PikachuSpeciesLine
	call IsInSingularArray
	ld hl, wPartyMon1Item
	jr c, .checkFirstItem
	ld hl, wPartyMon2Item
.checkFirstItem
	ld a, [hl]
	and a
	jr nz, .fail
	ld [hl], LIGHT_BALL
	xor a
.fail
	ldh [hScriptVar], a
	ret

.PikachuSpeciesLine
	db PICHU, PIKACHU, RAICHU
	db $ff

.already_holding_item_text
	ctxt "Oh, you're holding"
	line "another item."

	para "I'll be waiting"
	line "for when you'll"
	para "be able to receive"
	line "my Light Ball."
	done

.gave_light_ball_text
	text_from_ram wPartyMonNicknames
	ctxt ""
	line "received a Light"
	cont "Ball!"
	done

LaurelForestPokemonOnlyFruitTree:
	checkevent EVENT_POKEONLY_PIKACHU_IN_PARTY
	iftrue .pikachuGnawsOnRoot
	checkevent EVENT_POKEONLY_FRUIT_TREE_DEAD
	sif true
		jumptext .out_of_berries_text
	opentext
	giveitem ORAN_BERRY, 1
	writetext .picked_berry_text
	playwaitsfx SFX_ITEM
	setevent EVENT_POKEONLY_FRUIT_TREE_DEAD
	closetextend

.out_of_berries_text
	ctxt "This tree won't"
	line "grow any more"
	cont "Berries<...>"
	done

.picked_berry_text
	ctxt "This tree appears"
	line "damaged<...>"

	para "There's one Oran"
	line "Berry left, might"
	cont "as well pick it!"

	para "You picked the"
	line "Berry."
	done

.pikachuGnawsOnRoot
	moveperson 9, 21, 56
	checkcode VAR_FACING
	sif =, DOWN, then
		spriteface 9, DOWN
	selse
		spriteface 9, RIGHT
	sendif
	appear 9
	cry PIKACHU
	showtext .good_fruit_tree_text
	checkcode VAR_FACING
	sif =, DOWN, then
		applymovement 9, .PikachuMovesDownAndFacesRight
	selse
		applymovement 9, .PikachuMovesRightAndFacesDown
	sendif
	showtext .look_at_root_text
	checkcode VAR_FACING
	sif =, DOWN, then
		applymovement 9, .PikachuMovesUpAndFacesRight
	selse
		applymovement 9, .PikachuMovesLeftAndFacesDown
	sendif
	faceperson PLAYER, 9
	opentext
	writetext .satisfied_from_root_text
	checkevent EVENT_POKEONLY_FINISHED_PIKACHU_QUEST
	iftrue .noCuroShard
	checkevent EVENT_POKEONLY_PIKACHU_DEFEATED
	iftrue .noCuroShard
	writetext .heres_a_curo_shard_text
	giveitem CURO_SHARD, 1
	playwaitsfx SFX_ITEM
	setevent EVENT_POKEONLY_PIKACHU_GAVE_CURO_SHARD
	writetext .something_extra_text
	jump .giveLightBall
.noCuroShard
	writetext .light_ball_substitute_reward_text
.giveLightBall
	writetext .dont_worry_text
	callasm RemoveSecondPartyMember
	scall LaurelForestPokemonOnly_PikachuTryGiveLightBallToPlayer
	setevent EVENT_POKEONLY_FINISHED_PIKACHU_ROOT_QUEST
	applymovement 9, .PikachuExitsFromRootQuest
	disappear 9
	moveperson 9, 47, 51
	appear 9
	end

.PikachuMovesDownAndFacesRight
	step_down
	turn_head_right
	step_end

.PikachuMovesRightAndFacesDown
	step_right
	turn_head_down
	step_end

.PikachuMovesUpAndFacesRight
	step_up
	turn_head_right
	step_end

.PikachuMovesLeftAndFacesDown
	step_left
	turn_head_down
	step_end

.PikachuExitsFromRootQuest
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.good_fruit_tree_text
	ctxt "This looks like a"
	line "good fruit tree!"

	para "I'll see how good"
	line "the berry is."
	sdone

.look_at_root_text
	ctxt "Actually, forget"
	line "the berries, just"
	para "take a look at"
	line "that root!"

	para "Let me gnaw on it"
	line "for a few seconds."

	para "<...>gnaw<...>"

	para "<...>gnaw<...>"

	para "<...>gnaw<...>"
	sdone

.satisfied_from_root_text
	ctxt "OK<...> I'm good."

	para "Thanks for taking"
	line "me here, I'm"
	para "afraid to leave"
	line "my beach alone."
	prompt

.heres_a_curo_shard_text
	ctxt "Here's a Curo"
	line "Shard."
	sdone

.something_extra_text
	ctxt "Oh, as something"
	line "extra, you can"
	para "have my Light"
	line "Ball!"
	prompt

.light_ball_substitute_reward_text
	ctxt "Hmm, I'd give you"
	line "a Curo Shard as"
	para "thanks, but"
	line "I already gave"
	para "the only one I had"
	line "to another"
	cont "#mon."

	para "Oh, I know!"

	para "You can have my"
	line "Light Ball!"
	prompt

.dont_worry_text
	ctxt "Don't worry, I'll be"
	line "fine without it."

	para "I rarely need to"
	line "battle in this"
	cont "forest anyway."
	prompt

LaurelForestPokemonOnlyFlammableStump:
	opentext
	writetext .start_a_fire_text
	checkpokemontype FIRE
	anonjumptable
	dw .fail
	dw .ok
	dw .cancel

.fail
	jumptext .its_a_stump_text

.ok
	appear 13
	clearevent EVENT_POKEONLY_FIRE_OUT
	jumptext .fire_started_text

.cancel
	closetextend

.start_a_fire_text
	ctxt "Want to start a"
	line "fire here?"
	sdone

.fire_started_text
	ctxt "You started a"
	line "scorching fire!"
	done

.its_a_stump_text
	ctxt "It's a highly"
	line "flammable stump."
	done

LaurelForestPokemonOnlyFire:
	checkflag EVENT_POKEONLY_FIRE_OUT
	iftrue LaurelForestPokemonOnlyFlammableStump

	opentext
	writetext .use_oran_berry_text
	yesorno
	sif false
		closetextend
	takeitem ORAN_BERRY, 1
	sif false
		jumptext .you_dont_have_one_text
	writetext .burnt_berry_text
	giveitem BURNT_BERRY, 1
	closetextend

.use_oran_berry_text
	ctxt "Use Oran Berry"
	line "here?"
	done

.you_dont_have_one_text
	ctxt "You don't have an"
	line "Oran Berry."
	done

.burnt_berry_text
	ctxt "The Oran Berry was"
	line "burnt!"
	prompt
