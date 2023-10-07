LaurelForestBeach_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 2
	dbw MAPCALLBACK_OBJECTS, .hide_pikachu
	dbw MAPCALLBACK_NEWMAP, .hide_pikachu

.hide_pikachu
	setevent EVENT_1
	return

LaurelForestBeachSwitch:
	opentext
	writetext .switch_push_it_text
	yesorno
	sif false
		jumptext .not_pushed_text
	writetext .pushed_text
	playsound SFX_SWITCH_POKEMON
	checkevent EVENT_0
	sif true, then
		changemap LaurelForestBeach_BlockData
		clearevent EVENT_0
	selse
		changemap .no_water_block_data
		setevent EVENT_0
	sendif
	endtext

.switch_push_it_text
	ctxt "Oooh, a switch!"

	para "Push it?"
	done

.not_pushed_text
	ctxt "Fine, be a wimp!"
	done

.pushed_text
	ctxt "Who wouldn't?"
	done

.no_water_block_data: INCBIN "maps/blk/LaurelForestBeach_NoWater.ablk.lz"

LaurelForestBeachSurskit:
	faceplayer
	cry SURSKIT
	jumptext .text

.text
	ctxt "I come from far"
	line "away<...>"

	para "I was washed upon"
	line "this shore, and"
	para "the current is too"
	line "fast to push me"
	cont "back home."

	para "I wonder what"
	line "causes the strange"
	cont "tides here?"
	done

LaurelForestBeachXatu:
	faceplayer
	cry XATU
	jumptext .text

.text
	ctxt "There was a vein"
	line "of mind rejuve-"
	para "nating shards that"
	line "were called <``>Curo"
	cont "Shards<''>."

	para "They were used by"
	line "our community to"
	para "aid us in thinking"
	line "straight during"
	cont "stressful moments."

	para "To create this"
	line "effect, all you"
	cont "need is 3 shards."

	para "However, the vein"
	line "has been blocked"
	para "off recently due"
	line "to the scientists."

	para "They're working on"
	line "collecting every"
	cont "last one!"

	para "The community is"
	line "still holding on"
	cont "to a few, though."

	para "If you need one,"
	line "you should look"
	para "around and talk"
	line "to the residents."
	done

LaurelForestBeachWartortle:
	faceplayer
	cry WARTORTLE
	checkevent EVENT_POKEONLY_BEAT_WARTORTLE
	sif true
		jumptext .already_beaten_text
	opentext
	writetext .before_battle_text
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon WARTORTLE, 22
	startbattle
	reloadmapafterbattle
	setevent EVENT_POKEONLY_BEAT_WARTORTLE
	jumptext .after_battle_text

.before_battle_text
	ctxt "-sigh-"

	para "Ever since someone"
	line "put that strange"
	para "machine there, my"
	line "beach's been full"
	cont "of trespassers!"

	para "In fact, what are"
	line "you doing here?"

	para "Get off my beach"
	line "now or you'll be"
	cont "sorry!"
	sdone

.after_battle_text
	ctxt "Fine, I'll share."

	para "Just make sure to"
	line "stay out of my way"
	cont "from now on."
	done

.already_beaten_text
	ctxt "I told you, stay"
	line "out of my way!"
	done

LaurelForestBeachFruitTree:
	checkevent EVENT_POKEONLY_FRUIT_TREE_2_DEAD
	sif true
		jumptext .dead_tree_text
	opentext
	writetext .last_berry_text
	giveitem ORAN_BERRY, 1
	writetext .picked_berry_text
	playwaitsfx SFX_ITEM
	waitbutton
	setevent EVENT_POKEONLY_FRUIT_TREE_2_DEAD
	checkevent EVENT_POKEONLY_PIKACHU_IN_PARTY
	closetext
	sif false
		end
	checkcode VAR_FACING
	sif =, DOWN
		moveperson 7, 6, 13
	appear 7
	faceperson 7, PLAYER
	faceperson PLAYER, 7
	cry PIKACHU
	showtext .pikachu_comments_text
	disappear 7
	end

.dead_tree_text
	ctxt "This tree won't"
	line "grow any more"
	cont "Berries<...>"
	done

.last_berry_text
	ctxt "This tree appears"
	line "damaged<...>"

	para "There's one Oran"
	line "Berry left. Might"
	cont "as well pick it!"
	prompt

.picked_berry_text
	ctxt "Picked the Berry!"
	done

.pikachu_comments_text
	ctxt "This Berry looks"
	line "delicious!"

	para "But I think we can"
	line "do better."

	para "Let's look for"
	line "more!"
	sdone

LaurelForestBeach_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 1, 8, 1, LAUREL_FOREST_POKEMON_ONLY
	warp_def 2, 8, 2, LAUREL_FOREST_POKEMON_ONLY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 15, 7, SIGNPOST_READ, LaurelForestBeachSwitch

.ObjectEvents
	db 6
	person_event SPRITE_SURSKIT, 10, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LaurelForestBeachSurskit, -1
	person_event SPRITE_XATU, 16, 13, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForestBeachXatu, -1
	person_event SPRITE_WARTORTLE, 14, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LaurelForestBeachWartortle, -1
	person_event SPRITE_FRUIT_TREE, 15, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForestBeachFruitTree, -1
	person_event SPRITE_POKE_BALL, 12, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, GIANT_ROCK, EVENT_POKEONLY_GOT_ROCK_1
	person_event SPRITE_PIKACHU, 16, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_1
