LaurelForestPokemonOnlyBrainwashedCharizard:
	faceplayer
	cry CHARIZARD
	opentext
	writetext .not_in_its_right_mind_text
	takeitem CURO_SHARD, 3
	sif true, then
		writetext .placed_curo_shards_text
		closetext
		playsound SFX_METRONOME
	selse
		writetext .fight_text
		yesorno
		closetext
		sif false
			end
		writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
		loadwildmon CHARIZARD, 65
		startbattle
		reloadmapafterbattle
		playsound SFX_RUN
	sendif
	applymovement 2, .leave
	disappear 2
	setevent EVENT_POKEONLY_BRAINWASHED_CHARIZARD
	end

.leave
	return_dig 73
	step_end

.not_in_its_right_mind_text
	ctxt "<...>"

	para "Snarl<...>"

	para "Looks like it's not"
	line "in its right mind<...>"

	para "I wonder what"
	line "happened to it?"
	sdone

.placed_curo_shards_text
	ctxt "You placed three"
	line "Curo Shards on"
	cont "Charizard's head."

	para "Gruhh<...> What?"

	para "Where am I?"

	para "Who are you?"

	para "Was I standing"
	line "around all day?"

	para "That's just plain"
	line "unacceptable!"

	para "I have so many"
	line "things to do!"
	sdone

.fight_text
	ctxt "Do you want to"
	line "fight this"
	cont "Charizard?"
	done
