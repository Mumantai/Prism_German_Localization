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
	ctxt "Danke für das"
	line "Abenteuer!"

	para "Die Wurzeln haben"
	line "auch geschmeckt!"
	done

.heres_my_light_ball_text
	ctxt "Oh, willst du mein"
	line "Kugelblitz haben?"

	para "OK! Nimm es!"
	prompt

.what_are_you_doing_here_text
	ctxt "<...>Uhm, was machst"
	line "du hier noch?"
	done

.heres_the_junk_you_wanted_text
	ctxt "Willst du echt den"
	line "Müll den ich auf-"
	cont "gesammelt habe?"

	para "OK, aber nur weil"
	line "ich so ein netter"
	cont "Kerl bin."
	prompt

.full_for_now_text
	ctxt "Bin erstmal voll!"
	done

.after_defeated_text
	ctxt "Bitte, lass mich."
	done

.asking_for_burnt_berries_text
	ctxt "Oh, Hallöschen!"

	para "Uh<...>"

	para "Ich habe richtig"
	line "Kohldampf!"

	para "Gehst du für mich"
	line "etwas zum mampfen"
	cont "besorgen?"

	para "Übrigens, ich esse"
	line "nur Brandbeeren."
	done

.cant_wait_to_eat_text
	ctxt "Wunderbar!"

	para "Ich freue mich auf"
	line "das ESSEN, ESSEN!"
	done

.wanna_fight_text
	ctxt "OK, das wars!"

	para "Jetzt können wir"
	cont "kämpfen!"

	sdone

.defeated_text
	ctxt "OK, OK, OK, sorry!"

	para "Du brauchst mir"
	line "nichts mehr zu"
	cont "besorgen<...>"

	para "Hier hast du eine"
	line "Curo-Scherbe."
	done

.must_deliver_two_burnt_berries_text
	ctxt "YEAH!"

	para "Wenn du nicht"
	line "verletzt werden"
	para "willst, besorg mir"
	line "2 Brandbeeren."

	para "<...>sonst!"
	done

.cant_give_curo_shard_nice_text
	ctxt "Hey, wie soll ich"
	line "dir irgendwas"
	para "geben, wenn du"
	line "kein platz hast."
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
	ctxt "Würdest du mit"
	line "mir auf einen"
	cont "Abenteuer gehen?"
	done

.accepted_adventure_text
	ctxt "Perfekt!"

	para "Lass uns leckere"
	line "Beeren finden!"

	para "Pikachu ist deinem"
	line "Team beigetreten!"
	done

.no_adventure_text
	ctxt "Aw, Ich hatte mich"
	line "schon so gefreut<...>"
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
	ctxt "Wo ist die "
	line "Brandbeere?"

	para "Ich sehe es nicht."
	done

.delivered_burnt_berry_text
	ctxt "Danke für die"
	line "Brandbeere!"

	para "Nimm diese Curo-"
	line "Scherbe als dank."
	done

.happy_pikachu_full_bag_text
	ctxt "Deine Tasche ist"
	line "voll."

	para "Ich warte hier,"
	line "leere du erstmal"
	cont "deine Tasche."
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
	ctxt "Endlich!"

	para "Ich lasse dich nun"
	line "gehen. Nimm diesen"
	para "Müll was ich zuvor"
	line "gefunden hatte."
	prompt

.handed_over_text
	ctxt "Pikachu schenkt"
	line "dir eine Curo-"
	cont "Scherbe!"
	done

.dont_come_back_without_burnt_berries_text
	ctxt "Komm nicht ohne"
	line "die 2 Brandbeeren"
	cont "zurück!"
	done

.angry_pikachu_cant_deliver_curo_shard_text
	ctxt "Ich kann dir den"
	line "Müll nicht geben,"
	para "wenn du kein Platz"
	line "dafür hast!"
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
	ctxt "Wow, noch"
	line "ein Pikachu!"
	prompt

.raichu_text
	ctxt "Wow, ein Raichu!"
	line "Sowas von cool!"
	prompt

.pichu_text
	ctxt "Oh, wie süß,"
	line "ein kleines Pichu!"
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
	ctxt "Oh, du hälst"
	line "bereits ein Item."
	
	para "Ich warte auf dich"
	line "bis du platz für"
	para "den Kugelblitz"
	line "gemacht hast."
	done

.gave_light_ball_text
	text_from_ram wPartyMonNicknames
	ctxt ""
	line "erhält den"
	cont "Kugelblitz!"
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
	ctxt "Dieser Baum wächst"
	line "nicht mehr nach."
	done

.picked_berry_text
	ctxt "Der Baum sieht"
	line "beschädigt aus<...>"

	para "Es hängt noch eine"
	line "Sinnelbeere dran<...>"

	para "Du pflückst die"
	line "Sinnelbeere."
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
	ctxt "Die Beeren am Baum"
	line "sehen gut aus!"
	
	para "Lass mich das mal"
	line "überprüfen<...>"
	sdone

.look_at_root_text
	ctxt "Obwohl<...> vergiss"
	line "die Beeren, wir"
	para "nehmen die ganze"
	line "Wurzel!"

	para "Lass mich kurz "
	line "dran nagen<...>"

	para "<...>knabber<...>"

	para "<...>knabber<...>"

	para "<...>knabber<...>"
	sdone

.satisfied_from_root_text
	ctxt "OK<...> bin satt."

	para "Danke fürs her-"
	line "bringen, ich habe"
	para "Angst alleine los-"
	line "zuziehen."
	prompt

.heres_a_curo_shard_text
	ctxt "Hier eine Curo-"
	line "Scherbe für dich."
	sdone

.something_extra_text
	ctxt "Oh, als Bonus"
	line "kriegst du mein"
	cont "Kugelblitz!"
	prompt

.light_ball_substitute_reward_text
	ctxt "Hmm, ich würde dir"
	line "eine Curo-Scherbe"
	para "schenken, aber"
	line "leider gab ich den"
	para "letzten bereits"
	line "einem anderen"
	cont "#mon."
	
	para "Ah, Stimmt!"
	
	para "Ich hab ja noch"
	line "ein Kugelblitz!"
	prompt

.dont_worry_text
	ctxt "Keine sorge, ich"
	line "brauchs nicht."

	para "So viele Kämpfe"
	line "habe ich hier im"
	cont "Wald nicht mehr."
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
	ctxt "Willst du hier"
	line "ein Feuer legen?"
	sdone

.fire_started_text
	ctxt "Du hast ein"
	line "Feuer gelegt!"
	done

.its_a_stump_text
	ctxt "Es ist ein leicht"
	line "entzündlicher"
	cont "Baumstumpf."
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
	ctxt "Sinelbeere hier"
	line "einsetzen?"
	done

.you_dont_have_one_text
	ctxt "Du hast keine"
	line "Sinelbeere."
	done

.burnt_berry_text
	ctxt "Die Sinelbeere"
	line "wurde gebraten!"
	prompt
