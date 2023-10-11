GoldenrodMartB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodMartB1F_Rival:
	faceplayer
	opentext
	playmusic MUSIC_RIVAL_ENCOUNTER
	checkevent EVENT_RIVAL_GOLDENROD_BASEMENT
	sif false, then
		writetext .before_battle_text
		winlosstext .defeated_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer RIVAL1, 6
		startbattle
		reloadmapafterbattle
		playmapmusic
		playmusic MUSIC_RIVAL_ENCOUNTER
		opentext
		setevent EVENT_RIVAL_GOLDENROD_BASEMENT
		writetext .give_TM_text
		waitbutton
		givetm TM_THIEF + RECEIVED_TM
		opentext
		writetext .after_TM_text
	selse
		writetext .after_battle_text
	sendif
	playmusic MUSIC_UNION_CAVE
	closetextend

.before_battle_text
	ctxt "Oh, 'sup?"

	para "I claimed this"
	line "basement as my"
	cont "hideaway."

	para "No one's been down"
	line "here for years."

	para "People want to see"
	line "me behind bars"
	para "forever, but we"
	line "both know that'll"
	para "worsen my mental"
	line "state."

	para "When they release"
	line "me, they'll find"
	para "a reason to throw"
	line "me behind bars"
	cont "again."

	para "This spot is"
	line "perfect for hiding"
	para "from the Naljo"
	line "cops, and I don't"
	para "think anyone in"
	line "Johto's heard of"
	cont "me."

	para "I can start over"
	line "with a new name."

	para "If you don't"
	line "believe me, take"
	para "a look at how I"
	line "treat my #mon"
	cont "now."
	done

.defeated_text
	ctxt "I can't regret"
	line "this; I just need"
	para "to pick up the"
	line "pieces."
	done

.give_TM_text
	ctxt "I really have no"
	line "use for this TM"
	cont "anymore."

	para "Maybe you'll find"
	line "some use for it."
	done

.after_TM_text
	ctxt "If my little"
	line "Charmander could" ; FIXME: wot? Shouldn't it be Bagon? UPDATE: I assume he refers to a Charmander he ditched
	cont "see me now<...>"

	para "I hope he doesn't"
	line "feel like it was"
	cont "his fault."

	para "It was mine."

	para "Life isn't fair,"
	line "but I shouldn't"
	para "have done what I"
	line "did."
	sdone

.after_battle_text
	ctxt "There's only so"
	line "much I can do<...>"

	para "Many people will"
	line "never forgive"
	para "me, but it's"
	line "understandable."
	sdone

GoldenrodMartB1F_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def 2, 17, 3, GOLDENROD_STORAGE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_SILVER, 15, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodMartB1F_Rival, -1
	person_event SPRITE_POKE_BALL, 2, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DUSK_RING, EVENT_GOLDENROD_MART_BASEMENT_ITEM_DUSK_RING
	person_event SPRITE_POKE_BALL, 15, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_POISON_JAB, 0, EVENT_GOLDENROD_MART_BASEMENT_TM_POISON_JAB
