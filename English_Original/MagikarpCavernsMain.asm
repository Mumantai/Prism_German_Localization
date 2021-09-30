MagikarpCavernsMain_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 2
	dbw MAPCALLBACK_OBJECTS, .TryHidingTunodBlocker
	dbw MAPCALLBACK_NEWMAP, .TryHidingTunodBlocker

.TryHidingTunodBlocker
	checkflag ENGINE_PLAINBADGE
	sif true
		setevent EVENT_0
	return

MagikarpCavernsMainTrialNPC:
	faceplayer
	checkevent EVENT_MAGIKARP_TEST
	sif true
		jumptext .already_completed_text
	opentext
	writetext .introduction_text
	yesorno
	sif false
		jumptext .refused_text
	copybytetovar wNumItems
	sif >, 15
		jumptext .big_bag
	showtext .accepted_text
	setflag ENGINE_POKEMON_MODE
	setflag ENGINE_CUSTOM_PLAYER_SPRITE
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	callasm .SetPlayerSpriteAsMagikarp
	warp MAGIKARP_CAVERNS_RAPIDS, 10, 11
	end

.SetPlayerSpriteAsMagikarp:
	ld a, MAGIKARP
	ld [wPokeonlyMainSpecies], a
	ld a, SPRITE_WALKING_MAGIKARP
	ld [wPlayerSprite], a
	ret

.introduction_text
	ctxt "Welcome!"

	para "I see you found"
	line "your way around"
	cont "the sacred fish?"

	para "<...>"

	para "Oh, so you failed"
	line "to notice how this"
	cont "cave is designed?"

	para "I have aligned"     
	line "the rocks in here"
	para "to look like the"
	line "#mon I idolize."

	para "Yes, the majestic"
	line "fish #mon"
	cont "called Magikarp!"

	para "Tales of its"
	line "past have shown"
	para "it to be more"
	line "powerful than it"
	cont "is currently."

	para "In my family,"
	line "it is told that"
	para "my ancestors would"
	line "pray on a daily"
	para "basis for the fish"
	line "to return to its"
	cont "former glory days."

	para "<...>"

	para "What do you mean,"
	line "'Gyarados'?"

	para "BLASPHEMY!"

	para "I talk about its"
	line "former birth form."

	para "OK, you know what?"
	line "I'm done arguing"
	cont "with nonbelievers."

	para "<...>"

	para "What's that?"

	para "The path in the"
	line "forest is blocked?"

	para "HAHA!"

	para "<...>You know what?"

	para "I'll tell that"
	line "fellow to move<...>"
	para "<...>if you complete a"
	line "small task for me."

	para "I have the ability"
	line "to change you into"
	cont "a real Magikarp."

	para "-- Really!"
	line "I do not lie!"

	para "In that legendary"
	line "form, you'll get"
	para "to experience what"
	line "Magikarp around"
	para "the world have to"
	line "deal with daily."

	para "That is, navigat-"
	line "ing in the rapids."

	para "Then, maybe you"
	line "won't think they"
	cont "are so 'weak'."

	para "Also, keep in mind"
	line "that, once the"
	para "task begins, I"
	line "will not change"
	para "you back until you"
	line "fully complete the"
	cont "task."

	para "Do we have a deal?"
	done

.accepted_text
	ctxt "Good<...>"

	para "Go for it!"
	sdone

.already_completed_text
	ctxt "A well done job,"
	line "indeed."
	done

.refused_text
	ctxt "Suit yourself."

	para "Keep in mind, my"
	line "fellow worshipper"
	para "isn't going to"
	line "move without my"
	cont "permission."
	done

.big_bag
	ctxt "You intend to"
	line "carry such a"
	para "large, full bag"
	line "as a Magikarp?"
	
	para "You should leave"
	line "some stuff in your"
	cont "PC."
	done

MagikarpCavernsMainTunodBlock:
	ctxt "Hold on."

	para "North of the cave"
	line "lies the region of"
	cont "Tunod."

	para "You're not strong"
	line "enough to handle"
	para "the Trainers there"
	line "yet."

	para "Come back when you"
	line "have grown more as"
	cont "a Trainer!"
	done

MagikarpCavernsMain_MapEventHeader:: db 0, 0

.Warps: db 16
	warp_def 11, 3, 8, MAGIKARP_CAVERNS_MAIN
	warp_def 3, 13, 3, MAGIKARP_CAVERNS_MAIN
	warp_def 15, 27, 2, MAGIKARP_CAVERNS_MAIN
	warp_def 7, 55, 7, MAGIKARP_CAVERNS_MAIN
	warp_def 19, 57, 14, MAGIKARP_CAVERNS_MAIN
	warp_def 23, 45, 11, MAGIKARP_CAVERNS_MAIN
	warp_def 21, 31, 4, MAGIKARP_CAVERNS_MAIN
	warp_def 37, 3, 1, MAGIKARP_CAVERNS_MAIN
	warp_def 45, 17, 12, MAGIKARP_CAVERNS_MAIN
	warp_def 47, 23, 13, MAGIKARP_CAVERNS_MAIN
	warp_def 31, 35, 6, MAGIKARP_CAVERNS_MAIN
	warp_def 29, 41, 9, MAGIKARP_CAVERNS_MAIN
	warp_def 29, 49, 10, MAGIKARP_CAVERNS_MAIN
	warp_def 57, 35, 5, MAGIKARP_CAVERNS_MAIN
	warp_def 57, 17, 3, LAUREL_CITY
	warp_def 9, 27, 1, ROUTE_87

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 21, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HARD_STONE, EVENT_MAGIKARP_CAVERNS_MAIN_ITEM_HARD_STONE
	person_event SPRITE_POKE_BALL, 21, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PRISM_SCALE, EVENT_MAGIKARP_CAVERNS_MAIN_ITEM_PRISM_SCALE
	person_event SPRITE_ELDER, 32, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, MagikarpCavernsMainTrialNPC, -1
	person_event SPRITE_BOULDER, 25, 45, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_ELDER, 10, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, MagikarpCavernsMainTunodBlock, EVENT_0
