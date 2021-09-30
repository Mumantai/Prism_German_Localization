MoundF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .swap_map

.swap_map
	checkevent EVENT_BLEW_UP_DYNAMITE
	sif true
		changemap MoundF1_BlownUp_BlockData
	return

MoundF1Rival:
	showtext .during_phone_call_text
	faceplayer
	showemote 3, 6, 32
	spriteface 6, 2
	opentext
	writetext .noticed_player_text
	playwaitsfx SFX_HANG_UP
	closetext
	faceplayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext .engaged_player_text
	loadtrainer RIVAL1, RIVAL1_2
	winlosstext .battle_won_text, 0
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext .after_battle_text
	applymovement 6, .leave
	special RestartMapMusic
	disappear 6
	setevent EVENT_MOUND_CAVE_RIVAL
	end

.leave
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end

.during_phone_call_text
	ctxt "Die Verbindung"
	line "bricht ab<...>"

	para "Hallo?"
	para "Noch da?"
	
	para "OK, jetzt gehts."

	para "Nun, wo soll ich"
	line "jetzt nochmal hin?"
	sdone

.noticed_player_text
	ctxt "<...>"

	para "Ich ruf zurück."
	done

.engaged_player_text
	ctxt "Ich sagte dir geh"
	line "mir aus dem weg."

	para "Verstehst du"
	line "einfachste"
	cont "Anweisungen nicht?"

	para "<...>"

	para "Es ist Zeit meine"
	line "neuen #mon an"
	cont "dir auszutesten!"
	sdone

.battle_won_text
	ctxt "Was war das denn?"
	done

.after_battle_text
	ctxt "Diese niederen"
	line "Kreaturen sind nur"
	cont "Zeitverschwendung!"

	para "Jetzt muss ich mir"
	line "bessere #mon"
	cont "suchen gehen."

	para "<...>"

	para "Welche das sind?"

	para "Hah! geht dich"
	line "nichts an."
	sdone

MoundF1DynamiteGuy:
	opentext
	checkevent EVENT_SPOKE_DYNAMITE_GUY
	sif false, then
		writetext .intro_text
		setevent EVENT_SPOKE_DYNAMITE_GUY
	sendif
	takeitem DYNAMITE, 5
	sif false, then
		checkitem POKE_BALL
		sif true, then
			writetext .theres_dynamite_left_text
			jumptext .still_waiting_text
		selse
			writetext .no_balls_text
			verbosegiveitem POKE_BALL, 3
			closetextend
		sendif
	sendif
	giveitem DYNAMITE, 5
	writetext .need_fire_mon_text
	findpokemontype FIRE
	waitbutton
	sif false
		closetextend
	callasm ReadScriptVarMonName
	writetext .try_mon_text
	addvar -1
	copyvartobyte wCurPartyMon
	yesorno
	closetext
	sif false
		end
	fieldmovepokepic
	showtext .lit_the_fuse_text
	applymovement PLAYER, .player_steps_aside
	applymovement 3, .guy_steps_aside
	applymovement 3, .guy_moves_back
	showemote EMOTE_SHOCK, PLAYER, 32
	applymovement PLAYER, .player_moves_back
	changemap MoundF1_BlownUp_BlockData
	playsound SFX_EGG_BOMB
	earthquake 24
	playsound SFX_EGG_BOMB
	earthquake 24
	playsound SFX_EGG_BOMB
	earthquake 24
	playsound SFX_EGG_BOMB
	earthquake 24
	spriteface 3, UP
	spriteface PLAYER, LEFT
	loademote EMOTE_HAPPY
	showemote EMOTE_HAPPY, 3, 32
	showtext .after_blowing_up_text
	playsound SFX_JUMP_OVER_LEDGE
	applymovement 3, .guy_leaves
	takeitem DYNAMITE, 5
	setevent EVENT_BLEW_UP_DYNAMITE
	end

.player_steps_aside
	step_right
	step_end

.guy_moves_back
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_right
	run_step_right
	run_step_down
	step_end

.player_moves_back
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	run_step_right
	run_step_right
	run_step_right
	step_end

.guy_leaves
	jump_step_left
	run_step_left
	run_step_left
	hide_person
	step_down
	step_down
	step_down
.guy_steps_aside
	step_down
	step_end

.intro_text
	ctxt "Ah, Hallo!"

	para "Ich würde hier"
	line "gerne auch vorbei<...>"

	para "Jedoch<...>"

	para "blockieren diese"
	line "Felsen den Weg."

	para "Ich bräuchte 5x"
	line "Dynamit um diese"
	para "Felsen aus dem"
	line "Weg zu räumen<...>"

	para "Ein für alle Mal!"
	sdone

.theres_dynamite_left_text
	ctxt "Hmm. soweit ich"
	line "weiß, liegt in"
	para "den unteren Etagen"
	line "noch genügend"
	cont "Dynamit rum."

	para "Jedoch habe ich"
	line "dort eine Gruppe"
	para "farbiger Freaks"
	line "rumlungern sehen."

	para "Es wäre sehr will-"
	line "kommen, wenn du d-"
	cont "ich um diese Typen"
	cont "kümmern könntest."
	sdone

.still_waiting_text
	ctxt "Ich warte hier auf"
	line "das Dynamit."

	para "Bring 5 stück und"
	line "wir sind durch."
	done

.no_balls_text
	ctxt "Du hast keine"
	line "#bälle?"

	para "Naja<...>"

	para "Um hier durch zu"
	line "kommen, brauchst"
	para "du ein Elektro und"
	line "Feuer-Typ #mon."

	para "Hier."

	para "Einpaar #bälle"
	line "für dich!"
	sdone

.need_fire_mon_text
	ctxt "Perfekt, du hast"
	line "genug Dynamit da!"

	para "Leider brauchen"
	line "wir echtes Feuer"
	cont "um sie anzuzünden."

	para "Du brauchst ein"
	line "Feuer #mom oder"
	cont "Feuer-Attacke<...>"
	done

.try_mon_text
	ctxt "Mit <STRBF2>"
	line "versuchen?"
	done

.lit_the_fuse_text
	ctxt "Achtung, die Lunte"
	line "brennt. halt etwas"
	cont "abstand!"
	sdone

.after_blowing_up_text
	ctxt "Whoo hoo!"

	para "Ich bin frei!"

	para "Danke Kind."
	sdone

MoundF1_BlownUp_BlockData: INCBIN "./maps/blk/MoundF1_BlownUp_BlockData.blk.lz"

MoundF1_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 25, 17, 3, ROUTE_73
	warp_def 43, 3, 3, MOUND_F1
	warp_def 89, 3, 2, MOUND_F1
	warp_def 59, 17, 5, MOUND_F1
	warp_def 5, 15, 4, MOUND_F1
	warp_def 13, 17, 1, MOUND_B3F
	warp_def 49, 9, 1, MOUND_B1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 31, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_AERIAL_ACE, 0, EVENT_MOUND_CAVE_TM43
	person_event SPRITE_R_HIKER, 2, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoundF1DynamiteGuy, EVENT_BLEW_UP_DYNAMITE
	person_event SPRITE_POKE_BALL, 73, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MINING_PICK, EVENT_MOUND_F1_ITEM_MINING_PICK
	person_event SPRITE_ROCK, 37, 11, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_SILVER, 27, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoundF1Rival, EVENT_MOUND_CAVE_RIVAL
	person_event SPRITE_POKE_BALL, 60, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TMHMBALL, TM_PROTECT, 0, EVENT_MOUND_CAVE_TM17
	person_event SPRITE_POKE_BALL, 87, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SUPER_POTION, EVENT_MOUND_F1_ITEM_SUPER_POTION
