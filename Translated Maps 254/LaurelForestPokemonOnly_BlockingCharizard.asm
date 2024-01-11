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
	para "Knurr <...>"
	para "Es sieht verwirrt"
	line "aus <...>"
	para "Was wohl mit ihm"
	line "passiert ist?"
	sdone

.placed_curo_shards_text
	ctxt "Du legst drei"
	line "Curoscherben auf"
	cont "Gluraks Kopf."
	para "Grr <...> Was?"
	para "Wo bin ich?"
	para "Wer bist du?"
	para "Stand ich hier den"
	line "ganzen Tag lang?"
	para "Das ist doch"
	line "lächerlich!"
	para "Ich hab noch so"
	line "viel zu erledigen!"
	sdone

.fight_text
	ctxt "Willst du gegen"
	line "dieses Glurak"
	cont "kämpfen?"
	done