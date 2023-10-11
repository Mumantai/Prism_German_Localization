FirelightPalletPath1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

const_value = 4
	const FIRELIGHT_PALLET_PATH_VARANEOUS
	const FIRELIGHT_PALLET_PATH_NOBU
	const FIRELIGHT_PALLET_PATH_OFFICER
const_value = 8
	const FIRELIGHT_PALLET_PATH_PALETTE_PINK
	const FIRELIGHT_PALLET_PATH_PALETTE_RED
	const FIRELIGHT_PALLET_PATH_PALETTE_BLUE

FirelightPalletPath1FCutscene:
	checkevent EVENT_VARANEOUS_REVIVED
	sif true
		end
	opentext
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, RIGHT
	writetext .palette_text_1
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, LEFT
	writetext .palette_text_2
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, LEFT
	writetext .palette_text_3
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, RIGHT
	writetext .palette_text_4
	writetext .palette_text_5
	writetext .palette_text_6
	writetext .palette_text_7
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, LEFT
	writetext .palette_text_8
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, DOWN
	writetext .palette_text_9
	closetext
	applymovement PLAYER, .player_approaches_palette_members
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, DOWN
	opentext
	writetext .before_awaking_varaneous_text
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, UP
	playsound SFX_AEROBLAST
	earthquake 16
	appear FIRELIGHT_PALLET_PATH_VARANEOUS
	cry VARANEOUS
	closetext
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_jumps_towards_palette_members
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, UP
	showtext .after_awaking_varaneous_text
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_attacks_red
	playsound SFX_KARATE_CHOP
	spriteface FIRELIGHT_PALLET_PATH_VARANEOUS, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, LEFT
	pause 16
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, UP
	showtext .varaneous_attacks_red_text
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_attacks_pink
	playsound SFX_KARATE_CHOP
	spriteface FIRELIGHT_PALLET_PATH_VARANEOUS, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, LEFT
	pause 16
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, UP
	opentext
	writetext .varaneous_attacks_pink_text
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_approaches_player
	spriteface PLAYER, RIGHT
	refreshscreen 0
	pokepic VARANEOUS
	cry VARANEOUS
	closepokepic
	opentext
	writetext .varaneous_sniffs_player_text
	cry VARANEOUS
	closetext
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_leaves
	spriteface PLAYER, LEFT
	opentext
	writetext .nobu_notices_palettes_text
	spriteface PLAYER, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, DOWN
	closetext
	appear FIRELIGHT_PALLET_PATH_NOBU
	appear FIRELIGHT_PALLET_PATH_OFFICER
	follow FIRELIGHT_PALLET_PATH_OFFICER, FIRELIGHT_PALLET_PATH_NOBU
	applymovement FIRELIGHT_PALLET_PATH_OFFICER, .officer_and_nobu_approach_player
	spriteface FIRELIGHT_PALLET_PATH_OFFICER, UP
	stopfollow
	showtext .officer_arrests_palettes_text
	applymovement FIRELIGHT_PALLET_PATH_NOBU, .nobu_approaches_player
	opentext
	writetext .nobu_talks_to_player_text
	special Special_BattleTowerFade
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ROUTE_80_NOBU, 5, 4
	special InitRoamMons
	setevent EVENT_VARANEOUS_REVIVED
	setevent EVENT_FIRELIGHT_POLICE
	writebyte VARANEOUS
	special SpecialSeenMon
	spriteface PLAYER, LEFT
	end

.palette_text_1
	ctxt "Blue: I'm still"
	line "confused, Red;"
	cont "why are we here?"

	para "And why do we"
	line "have to keep on"
	cont "wearing spandex?"
	sdone

.palette_text_2
	ctxt "Red: AGAIN, THIS"
	line "IS NOT SPANDEX!"

	para "It's a traditional"
	line "Naljo garb."

	para "As I've already"
	line "told you, Andy,"
	para "we have finally"
	line "finished searching"
	para "the region for the"
	line "orbs of the Naljo"
	cont "Guardians."

	para "Once Varaneous"
	line "wakes up, Naljo"
	para "will return to"
	line "the paradise that"
	para "our forefathers"
	line "once experienced!"
	sdone

.palette_text_3
	ctxt "Pink: Why is it"
	line "just the three of"
	cont "us here?"

	para "I heard one of the"
	line "other guys got"
	para "arrested, but what"
	line "about the other"
	cont "two?"
	sdone

.palette_text_4
	ctxt "Red: They are also"
	line "traitors."

	para "They viewed us as"
	line "criminals who just"
	para "want money and"
	line "rare #mon."

	para "We're not Team"
	line "Rocket; we just"
	para "want outsiders to"
	line "stop interfering"
	para "with our almost"
	line "forgotten culture."
	sdone

.palette_text_5
	ctxt "Pink: But<...> they"
	line "were trying to"
	para "help us get money,"
	line "so we could cover"
	cont "even more ground."

	para "After all, the end"
	line "jus-"
	sdone

.palette_text_6
	ctxt "Red: Shut up!"

	para "Money doesn't"
	line "interest me."

	para "Money is part of"
	line "what ruined Naljo."
	sdone

.palette_text_7
	ctxt "Blue: Eh<...> I don't"
	line "know if this is a"
	cont "good idea<...>"

	para "I might have to"
	line "keep this gig off"
	cont "my resume<...>"
	sdone

.palette_text_8
	ctxt "Red: <...>You're going"
	line "to pay if you"
	cont "betray me too."

	para "My world has no"
	line "such thing as a"
	cont "<``>fire escape<''><...>"

	para "<...>understood?"

	para "Do you remember"
	line "what I did to that"
	para "Team Rocket, who"
	line "tried to steal my"
	cont "#mon before?"
	sdone

.palette_text_9
	ctxt "Pink: <...>Please, I'd"
	line "like to forget all"
	cont "about that."

	para "<...>"

	para "Wait, that kid"
	line "actually followed"
	cont "us back here."
	sdone

.player_approaches_palette_members
	step_up
	step_up
	step_right
	turn_head_up
	step_end

.before_awaking_varaneous_text
	ctxt "Red: Why do you"
	line "insist on standing"
	cont "in our way?"

	para "This creature and"
	line "its brethren are"
	para "the key to Naljo's"
	line "future safety."

	para "Varaneous itself"
	line "could bring the"
	para "seas to a boil if"
	line "it so desired."

	para "At last, the power"
	line "to protect Naljo"
	cont "is within reach<...>"

	para "While waking from"
	line "its slumber, still"
	para "weakened from its"
	line "long sleep, it'll"
	cont "be mine to catch!"

	para "This embodiment of"
	line "fire, war and"
	cont "destruction<...>"

	para "All mine!"
	sdone

.varaneous_jumps_towards_palette_members
	step_down
	jump_step_down
	step_end

.after_awaking_varaneous_text
	ctxt "Red: Varaneous,"
	line "you've awakened!"

	para "You've been asleep"
	line "for centuries."

	para "Naljo is in dire"
	line "need of you and"
	para "the three other"
	line "Guardians."

	para "Naljo culture is"
	line "vanishing, and"
	para "Naljo descendants"
	line "have given up your"
	para "vision of old and"
	line "accept foreigners"
	cont "with open arms."
	sdone

.varaneous_attacks_pink
	fast_slide_step_right
.varaneous_attacks_red
	fast_slide_step_down
	fast_slide_step_up
	step_end

.varaneous_attacks_red_text
	ctxt "Red: What?!"

	para "Why would you"
	line "attack me<...>?"

	para "I'm a descendant!"
	prompt

.varaneous_attacks_pink_text
	ctxt "Pink: My leg<...>"

	para "It's broken!"
	sdone

.varaneous_approaches_player
	fast_slide_step_right
	jump_step_down
	fast_slide_step_left
	step_end

.varaneous_sniffs_player_text
	ctxt "Varaneous:"
	line "-sniffs-"
	sdone

.varaneous_leaves
	fast_slide_step_down
	fast_jump_step_left
	fast_jump_step_left
	fast_jump_step_left
	fast_jump_step_left
	step_end

.nobu_notices_palettes_text
	ctxt "Red: That #mon"
	line "stole the other"
	cont "orbs!"

	para "Nobu: Officer,"
	line "there they are!"
	sdone

.officer_and_nobu_approach_player
	step_right
	step_up
	step_right
	step_up
	step_up
	step_up
	step_up
	step_end

.officer_arrests_palettes_text
	ctxt "Officer: Looks"
	line "like we were able"
	para "to finally track"
	line "you guys down."

	para "We're locking you"
	line "all up for good."

	para "Wait, where are"
	line "the Green and"
	cont "Yellow ones?"

	para "No matter, we're"
	line "making progress<...>"

	para "Hey, kid, are you"
	line "a part of this"
	cont "group as well?"
	prompt

.nobu_approaches_player
	step_right
	turn_head_up
	step_end

.nobu_talks_to_player_text
	ctxt "Nobu: No, officer."

	para "The fanatic in red"
	line "has been plotting"
	para "for years to wake"
	line "up the Protectors."

	para "Officer: You mean"
	line "the ones from all"
	cont "the old stories?"

	para "Nobu: Indeed."

	para "But wait!"

	para "Why did Varaneous"
	line "attack them, and"
	cont "not you<...>?"

	para "Wait a minute<...>"

	para "You remind me of"
	line "someone I saw on"
	cont "TV once."

	para "Wait!"

	para "Lance is really"
	line "your father?"

	para "The legendary"
	line "Dragon Trainer?"

	para "Well, it all makes"
	line "sense now!"

	para "<...>"

	para "You seem confused."

	para "Let's return home"
	line "and I'll explain"
	cont "everything to you."
	prompt

FirelightPalletPath1F_PalettePink:
	trainer EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_PINK, PATROLLER, 8, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	writetext .after_battle_text
	closetext
	applymovement 2, .movement
	disappear 2
	end

.movement
	step_left
	step_left
	step_left
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

.before_battle_text
	ctxt "Wait, what are you"
	line "doing here?"

	para "You're not going to"
	line "stop us!"
	done

.battle_won_text
	ctxt "Stubborn, huh?"
	done

.after_battle_text
	ctxt "Look, we do what"
	line "we have to do."

	para "Face it, it's over"
	line "your head, kid."

	para "We'll do anything"
	line "we have to do to"
	cont "get our way."

	para "The end always ju-"
	line "stifies the means."
	sdone

FirelightPalletPath1F_PaletteBlue:
	trainer EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_BLUE, PATROLLER, 11, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	writetext .after_battle_text
	closetext
	applymovement 3, .movement
	disappear 3
	end

.movement
	rept 5
		step_right
	endr
	step_down
	step_down
	step_down
	step_left
	rept 5
		step_down
	endr
	step_end

.before_battle_text
	ctxt "This the best gig"
	line "I'll ever get;"

	para "I'm not going to"
	line "let you take it"
	cont "away from me!"
	done

.battle_won_text
	ctxt "No mercy, huh?"
	done

.after_battle_text
	ctxt "I'm not completely"
	line "sure of what the"
	para "boss has been up"
	line "to, but he's called"
	cont "all of us here."

	para "He's saying that"
	line "everything he's"
	para "done has led up to"
	line "this moment."

	para "Color me curious."
	sdone

FirelightPalletPath1F_PaletteRed:
	trainer EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_RED, PATROLLER, 16, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	writetext .after_battle_text
	closetext
	applymovement 7, .movement
	disappear 7
	end

.movement
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	rept 4
		step_up
	endr
	step_end

.before_battle_text
	ctxt "Guess what, idiot?"

	para "You're too late!"

	para "We already have"
	line "everything that we"
	cont "need<...>!"
	done

.battle_won_text
	ctxt "No matter."
	done

.after_battle_text
	ctxt "<...>"

	para "You're just like"
	line "your father."

	para "He who disobeyed"
	line "his roots to"
	para "strive for"
	line "popularity, as a"
	para "self-proclaimed"
	line "#mon Master."

	para "Well, now all that"
	line "will change."

	para "Your family has"
	line "betrayed Naljo for"
	cont "the last time!"

	para "The proud culture"
	line "of Naljo will be"
	cont "awoken once again!"
	sdone

FirelightPalletPath1F_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def $d, $1a, 5, FIRELIGHT_PALLETPATH_1F
	warp_def $1d, $b, 4, FIRELIGHT_PALLETPATH_1F
	warp_def $33, $37, 2, FIRELIGHT_PALLETPATH_B1F
	warp_def $5, $7, 2, FIRELIGHT_PALLETPATH_1F
	warp_def $30, $21, 1, FIRELIGHT_PALLETPATH_1F

.CoordEvents
	db 1
	xy_trigger 0, 17, 47, FirelightPalletPath1FCutscene

.BGEvents
	db 0

.ObjectEvents
	db 9
	person_event SPRITE_PALETTE_PATROLLER, 52, 51, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TRAINER, 3, FirelightPalletPath1F_PalettePink, EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_PINK
	person_event SPRITE_PALETTE_PATROLLER, 5, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, FirelightPalletPath1F_PaletteBlue, EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_BLUE
	person_event SPRITE_VARANEOUS, 10, 48, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 1, ObjectEvent, EVENT_VARANEOUS_REVIVED
	person_event SPRITE_SAGE, 20, 44, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIRELIGHT_POLICE
	person_event SPRITE_BRUCE, 20, 45, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIRELIGHT_POLICE
	person_event SPRITE_PALETTE_PATROLLER, 29, 48, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 1, FirelightPalletPath1F_PaletteRed, EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_RED
	person_event SPRITE_PALETTE_PATROLLER, 14, 49, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_VARANEOUS_REVIVED
	person_event SPRITE_PALETTE_PATROLLER, 14, 48, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_VARANEOUS_REVIVED
	person_event SPRITE_PALETTE_PATROLLER, 14, 47, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_VARANEOUS_REVIVED
