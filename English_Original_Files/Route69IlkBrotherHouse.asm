Route69IlkBrotherHouse_MapScriptHeader:
 ;trigger count
	db 2

	maptrigger .first_rival_event_trigger
	maptrigger GenericDummyScript
 ;callback count
	db 0

.first_rival_event_trigger
	priorityjump IlkBrothersInTrouble
	end

Route69IlkBrotherHouseStove:
	ctxt "Hmm, this stove"
	line "needs cleaning."
	done

Route69IlkBrotherHouseSink:
	ctxt "Blah!"

	para "What a dirty sink!"
	done

Route69IlkBrotherHouseN64:
	ctxt "It's an N64!"
	done

IlkBrothersInTrouble:
	musicfadeout MUSIC_RIVAL_ENCOUNTER, 8
	applymovement PLAYER, .walk_to_ilk_bro
	showemote EMOTE_SHOCK, 2, 15
	showtext .text
	dotrigger 1
	setevent EVENT_ROUTE_69_ILK_BRO_TRAPPED
	end

.walk_to_ilk_bro
	step_up
	step_up
	step_up
	turn_head_left
	step_end

.text
	ctxt "Finally!"

	para "The cops are here!"

	para "Wait<...>"

	para "You're just a kid."

	para "<...>"

	para "The cops sent you"
	line "here? What were"
	cont "they thinking?"

	para "<...>"

	para "Oh? Prof. Ilk sent"
	line "you to help?"

	para "Well then<...>"

	para "See that guy in"
	line "the back, there?"

	para "He broke in and is"
	line "trying to take my"
	cont "poor Bagon."

	para "Please, help!"
	sdone

IlkBrothersTalkToRival:
	showtext .talk_to_bagon_text
	showemote EMOTE_SHOCK, 3, 15
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, .battle_lost_text
	setlasttalked 255
	loadtrainer RIVAL1, RIVAL1_1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	setlasttalked 3
	dontrestartmapmusic
	startbattle
	disappear 4
	setevent EVENT_RIVAL_ROUTE_69
	reloadmap
	special HealParty
	playmusic MUSIC_RIVAL_AFTER
	showtext .after_battle_text
	playmusic MUSIC_NONE
	playsound SFX_WARP_FROM
	applymovement 3, .rival_teleports
	disappear 3
	waitsfx
	playmapmusic
	spriteface 2, UP
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement PLAYER, .walk_to_ilk_bro_facing_right
	selse
		applymovement PLAYER, .walk_to_ilk_bro
	sendif
	spriteface 2, RIGHT
	opentext
	writetext .ilk_bro_after_battle_text
	special SpecialNameRival
	clearevent EVENT_ROUTE_69_ILK_BRO_TRAPPED
	jumptext .after_naming_rival_text

.rival_teleports
	teleport_from
	remove_person
	step_end

.walk_to_ilk_bro
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_left
	step_end

.walk_to_ilk_bro_facing_right
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_left
	step_end

.talk_to_bagon_text
	ctxt "Haha!"

	para "You're mine now<...>"

	para "<...>unless you want"
	line "to get hurt<...>"
	sdone

.before_battle_text
	ctxt "What do you want,"
	line "you little brat?"

	para "You're not going"
	line "to get in my way!"
	sdone

.battle_won_text
	ctxt "It seems like this"
	line "#mon could use"
	cont "some training<...>"

	para "I will make it"
	line "stronger, by any"
	cont "means necessary."
	done

.battle_lost_text
	ctxt "Hah!"

	para "That was extremely"
	line "pathetic!"
	done

.after_battle_text
	ctxt "You're so naff."

	para "Time to exit."

	para "I got just what I"
	line "needed from this"
	cont "old fart."

	para "Ciao!"

	para "<RIVAL> used an"
	line "Escape Rope."
	sdone

.ilk_bro_after_battle_text
	ctxt "I saw the whole"
	line "thing! Wow!"

	para "You sure put up a"
	line "good fight!"

	para "Did he tell you"
	line "his name?"
	sdone

.after_naming_rival_text
	ctxt "<RIVAL>, huh?"

	para "That Larvitar you"
	line "battled with<...>"

	para "I think it belongs"
	line "to my brother."

	para "Oh, you met him"
	line "already?"

	para "He asked you to"
	line "check up on me?"

	para "That was nice of"
	line "him."

	para "Don't forget to"
	line "return his"
	cont "Larvitar."

	para "He really loves"
	line "that #mon."

	para "Also, please tell"
	line "my brother-in-law"
	cont "he was right."

	para "I should've never"
	line "moved way out"
	cont "here."
	done

Route69IlkBrotherHouseIlkBrother:
	checkevent EVENT_RIVAL_ROUTE_69
	sif true
		jumptextfaceplayer .after_battling_rival
	jumptextfaceplayer .before_battling_rival

.before_battling_rival
	ctxt "Please, hurry!"
	done

.after_battling_rival
	ctxt "Thanks again for"
	line "trying to stop"
	cont "that crazy kid."

	para "I hope my Bagon is"
	line "safe and sound<...>"
	done

Route69IlkBrotherHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $9, $4, 3, ROUTE_69_SOUTH
	warp_def $9, $5, 3, ROUTE_69_SOUTH

	;xy triggers
	db 0

	;signposts
	db 5
	signpost 1, 0, SIGNPOST_TEXT, Route69IlkBrotherHouseStove
	signpost 0, 0, SIGNPOST_TEXT, Route69IlkBrotherHouseStove
	signpost 0, 1, SIGNPOST_TEXT, Route69IlkBrotherHouseSink
	signpost 1, 1, SIGNPOST_TEXT, Route69IlkBrotherHouseSink
	signpost 2, 9, SIGNPOST_TEXT, Route69IlkBrotherHouseN64

	;people-events
	db 3
	person_event SPRITE_SCIENTIST, 6, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route69IlkBrotherHouseIlkBrother, -1
	person_event SPRITE_SILVER, 2, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlkBrothersTalkToRival, EVENT_RIVAL_ROUTE_69
	person_event SPRITE_BAGON, 1, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_ROUTE_69
