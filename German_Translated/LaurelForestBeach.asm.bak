LaurelForestBeach_MapScriptHeader;trigger count
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
	ctxt "Oh, ein Schalter!"

	para "Drücken?"
	done

.not_pushed_text
	ctxt "Du Angsthase!"
	done

.pushed_text
	ctxt "Warum auch nicht?"
	done

.no_water_block_data: INCBIN "maps/blk/LaurelForestBeach_NoWater.blk.lz"

LaurelForestBeachSurskit:
	faceplayer
	cry SURSKIT
	jumptext .text

.text
	ctxt "Ich komme von"
	line "weit her <...>"

	para "Ich wurde hier ans"
	line "Ufer gespült und"
	para "die Wellen sind zu"
	line "stark, um zurück-"
	cont "zuschwimmen."

	para "Ich frage mich,"
	line "was der Grund für"
	cont "diese Wellen ist?"
	done

LaurelForestBeachXatu:
	faceplayer
	cry XATU
	jumptext .text

.text
	ctxt "Es gab eine Ader"
	line "voller gedanken-"
	cont "lösender Splitter."
	
	para "Wir nennen sie"
	line "'Curo-Scherben'."

	para "Unsere Gemeinde"
	line "nutzt sie, um in"
	para "harten Zeiten klar"
	line "denken zu können."

	para "Für diesen Effekt"
	line "braucht man 3"
	cont "Splitter."

	para "Jedenfalls wurde"
	line "die Ader blo-"
	para "ckiert, weil die"
	line "Forscher da sind."

	para "Sie wollen die"
	line "letzten Splitter"
	cont "abbauen."

	para "Die Gemeinde hat"
	line "noch ein paar in"
	cont "Reserve."

	para "Wenn du welche"
	line "suchst, solltest"
	para "du dich bei den"
	line "Einwohnern umhören"
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
	ctxt "-Seufz-"

	para "Jemand hat diese"
	line "komische Maschiene"
	cont "hier platziert <...>"
	
	para "Seitdem ist mein"
	line "Strand voller"
	cont "Eindringlinge!"

	para "Im Ernst, was"
	line "machst du hier?"

	para "Verschwinde von"
	line "meinem Strand oder"
	cont "du wirst sehen!"
	sdone

.after_battle_text
	ctxt "Schon gut, kannst"
	line "bleiben."

	para "Lauf mir einfach"
	line "nicht mehr über"
	cont "den Weg."
	done

.already_beaten_text
	ctxt "Ich sagte, bleib"
	line "mir fern!"
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
	ctxt "Diesem Baum werden"
	line "keine Beeren mehr"
	cont "nachwachsen <...>"
	done

.last_berry_text
	ctxt "Dieser Baum ist"
	line "beschädigt <...>"

	para "Da hängt noch eine"
	line "Sinelbeere."
	prompt

.picked_berry_text
	ctxt "Beere gepflückt!"
	done

.pikachu_comments_text
	ctxt "Diese Beere sieht"
	line "saftig aus!"

	para "Aber es geht noch"
	line "besser."

	para "Lass weiter-"
	line "suchen!"
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
