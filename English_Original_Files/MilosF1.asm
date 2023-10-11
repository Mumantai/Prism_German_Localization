MilosF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MilosF1_RareCandy:
	dw EVENT_MILOS_F1_HIDDENITEM_RARE_CANDY
	db RARE_CANDY

MilosF1_Rival:
	trainer EVENT_MILOS_F1_RIVAL, RIVAL1, RIVAL1_3, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Oh, look, it's the"
	line "little kid who"
	cont "just won't quit."

	para "Your persistence"
	line "is nothing but a"
	para "nuisance to all"
	line "Naljo residents."

	para "I'm bloody tired of"
	line "this little goody-"
	para "two-shoes trying"
	line "to hinder my big"
	cont "ambitions again."

	para "Your #mon"
	line "better know how"
	cont "to fight by now."
	done

.battle_won_text
	ctxt "I'm not hard"
	line "enough on these"
	cont "wimp #mon!"
	done

.after_battle_text
	ctxt "Look, I do what I"
	line "gotta do, OK?"

	para "A guy like me"
	line "doesn't need to"
	cont "explain himself."

	para "Just<...> Just"
	line "leave me alone."
	done

MilosF1Officer:
	faceplayer
	opentext
	writetext .introduction_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer OFFICER, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .after_battle_text
	special Special_BattleTowerFade
	playsound SFX_ENTER_DOOR
	waitsfx
	warpfacing LEFT, PHACELIA_POLICE_F2, 3, 1
	spriteface 2, RIGHT
	opentext
	writetext .mission_text
	callasm .dress_up_as_palette
	closetext
	setevent EVENT_ROUTE_85_POLICEMAN_GONE
	setevent EVENT_IN_UNDERCOVER_MISSION
	blackoutmod PHACELIA_CITY
	callasm CancelMapSign
	jumptext .after_getting_changed_text

.dress_up_as_palette
	ld a, [wPlayerGender]
	ld [wSavedPlayerCharacteristics2], a
	and 1
	add a, $c
	ld [wPlayerGender], a
	ret

.introduction_text
	ctxt "I'm guarding this"
	line "area right here."

	para "Hm<...> Wait,"
	line "who are you?"

	para "<...>"

	para "I see."

	para "Well, do you have"
	line "any sort of ID<...>?"

	para "A visa?"

	para "A passport?"
	sdone

.before_battle_text
	ctxt "Wait, you fit the"
	line "profile of the"
	para "wanted criminal"
	line "we've been on the"
	cont "lookout for."

	para "A kid with spiky"
	line "hair let us know"
	para "of some foreigner"
	line "that's vandalizing"
	para "this area, and has"
	line "been mistreating"
	cont "poor #mon."

	para "<...>"

	para "Wait, so you can"
	line "prove that you"
	para "in fact treat your"
	line "#mon with the"
	para "love and respect"
	line "that they deserve?"

	para "Fine, let's see"
	line "how you battle."
	sdone

.battle_won_text
	ctxt "I guess I stand"
	line "corrected!"
	done

.after_battle_text
	ctxt "Well, you proved"
	line "yourself, that"
	cont "much I can say."

	para "However, you're"
	line "still not allowed"
	cont "to be here."

	para "Come with me."
	sdone

.mission_text
	ctxt "If you're willing"
	line "to go undercover"
	para "for me and find"
	line "another criminal,"
	cont "I'll let you stay."

	para "Palette Patrollers"
	line "are loitering"
	para "nearby, and I"
	line "need your help"
	para "arresting one of"
	line "them."

	para "Here - take this"
	line "suit, gain their"
	para "trust, and bring"
	line "them to me."
	sdone

.after_getting_changed_text
	ctxt "You look<...>"

	para "Well<...>"

	para "Interesting."

	para "Lure one of those"
	line "thugs back here."
	done

MilosF1_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def $3, $b, 5, ROUTE_77
	warp_def $25, $2f, 2, MILOS_TOWERCLIMB
	warp_def $39, $25, 1, PHACELIA_CITY
	warp_def $1d, $5, 2, MILOS_B2FB
	warp_def $1b, $21, 3, MILOS_B1F
	warp_def $39, $39, 2, PHACELIA_GYM
	warp_def $11, $1b, 2, MILOS_B2F
	warp_def $15, $15, 1, MILOS_B1F

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 28, 25, SIGNPOST_ITEM, MilosF1_RareCandy

.ObjectEvents
	db 7
	person_event SPRITE_SILVER, 8, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, MilosF1_Rival, EVENT_MILOS_F1_RIVAL
	person_event SPRITE_POKE_BALL, 42, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, TRADE_STONE, EVENT_MILOS_F1_ITEM_TRADE_STONE
	person_event SPRITE_POKE_BALL, 56, 54, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CALCIUM, EVENT_MILOS_F1_ITEM_CALCIUM
	person_event SPRITE_POKE_BALL, 5, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NUGGET, EVENT_MILOS_F1_ITEM_NUGGET
	person_event SPRITE_POKE_BALL, 24, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ESCAPE_ROPE, EVENT_MILOS_F1_ITEM_ESCAPE_ROPE
	person_event SPRITE_BOULDER, 48, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 57, 37, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MilosF1Officer, EVENT_ARRESTED_PALETTE_BLACK
