LaurelForestPokemonOnly_MapScriptHeader:
 ;trigger count
	db 0

 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .reload_blocks

.reload_blocks
	checkevent EVENT_POKEONLY_CHARMANDER_PUSHED_BOULDER_2
	sif true, then
		scall TriggerFillPond
		return
	sendif
	checkevent EVENT_POKEONLY_CHARMANDER_PUSHED_BOULDER_1
	sif false
		return
	changeblock 48, 26, $cf
	return

TriggerFillPond:
	changeblock 48, 26, $85
	changeblock 46, 26, $5d
	changeblock 44, 26, $5d
	changeblock 44, 28, $5d
	changeblock 46, 28, $5d
	changeblock 46, 30, $5d
	changeblock 44, 30, $5d
	changeblock 44, 30, $5d
	changeblock 42, 30, $5d
	changeblock 40, 30, $5d
	changeblock 38, 30, $5d
	changeblock 36, 30, $5d
	changeblock 34, 26, $5d
	changeblock 36, 26, $5d
	changeblock 38, 26, $5d
	changeblock 40, 26, $5d
	changeblock 34, 28, $5d
	changeblock 36, 28, $5d
	changeblock 38, 28, $5d
	changeblock 40, 28, $5d
	changeblock 40, 32, $5d
	changeblock 42, 32, $5d
	changeblock 44, 32, $5d
	end

LaurelForestOTName:
	db "Wild@F"
LaurelForestOTNameEnd:

LaurelForestPokemonOnlyGatekeepingClefairy:
	faceplayer
	opentext
	writetext .want_to_leave_text
	yesorno
	closetext
	sif false
		end
	callasm RemoveSecondPartyMember
	restorecustchar
	restoresecondpokemon
	clearflag ENGINE_POKEMON_MODE
	clearflag ENGINE_USE_TREASURE_BAG
	blackoutmod LAUREL_CITY
	warp LAUREL_FOREST_MAIN, 36, 4
	end

.want_to_leave_text
	ctxt "Want to leave?"
	done

RemoveSecondPartyMember:
	ld hl, wPartyMonOT
	ld de, LaurelForestOTName
	ld c, LaurelForestOTNameEnd - LaurelForestOTName
	call StringCmp
	jr nz, .removesecond

	ld hl, wPartyMon2
	ld de, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes

	ld hl, wPartyMonOT + NAME_LENGTH
	ld de, wPartyMonOT
	ld bc, NAME_LENGTH
	rst CopyBytes

	ld hl, wPartyMonNicknames + PKMN_NAME_LENGTH
	ld de, wPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes

	ld a, [wPartySpecies]
	ld b, a
	ld a, [wPartySpecies + 1]
	ld [wPartySpecies], a
	ld a, b
	jr .done

.removesecond
	ld a, [wPartySpecies + 1]
.done
	ldh [hScriptVar], a
	ld a, $ff
	ld [wPartySpecies + 1], a
	ld a, 1
	ld [wPartyCount], a
	ld hl, wPartyMon1HP
	ld a, [hli]
	or [hl]
	ret nz
	inc [hl]
	ret

LaurelForestPokemonOnly_NotEnoughRoomInParty:
	jumptext .text

.text
	ctxt "Make more room in"
	line "your party!"
	done

LaurelForestPokemonOnly_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $38, $25, 1, LAUREL_FOREST_BEACH
	warp_def $39, $25, 2, LAUREL_FOREST_BEACH
	warp_def $5, $37, 1, LAUREL_FOREST_LAB
	warp_def $15, $30, 1, LAUREL_FOREST_CHARIZARD_CAVE

.CoordEvents
	db 6
	xy_trigger 0, 55, 06, LaurelForestPokemonOnly_Pikachu_BerriesArentOutsideForest, EVENT_POKEONLY_PIKACHU_IN_PARTY
	xy_trigger 0, 55, 06, LaurelForestPokemonOnly_Butterfree_NoWayBabyWanderedOutsideForest, EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	xy_trigger 0, 55, 06, LaurelForestPokemonOnly_Caterpie_MommyIsntOutsideForest, EVENT_POKEONLY_CATERPIE_IN_PARTY
	xy_trigger 0, 06, 55, LaurelForestPokemonOnly_Pikachu_BerriesArentInLab, EVENT_POKEONLY_PIKACHU_IN_PARTY
	xy_trigger 0, 06, 55, LaurelForestPokemonOnly_Butterfree_NoWayBabyWanderedInsideLab, EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	xy_trigger 0, 06, 55, LaurelForestPokemonOnly_Caterpie_MommyIsntInLab, EVENT_POKEONLY_CATERPIE_IN_PARTY

.BGEvents
	db 1
	signpost 16, 27, SIGNPOST_READ, LaurelForestPokemonOnlyFlammableStump

.ObjectEvents
	db 13
	person_event SPRITE_DRAGON, 10, 50, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyBrainwashedCharizard, EVENT_POKEONLY_BRAINWASHED_CHARIZARD
	person_event SPRITE_CHARMANDER, 28, 50, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyCharmander, EVENT_POKEONLY_CHARMANDER_PUSHED_BOULDER_2
	person_event SPRITE_BUTTERFREE, 30, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyMotherButterfree, EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	person_event SPRITE_METAPOD, 31, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyRescuedMetapod, EVENT_POKEONLY_METAPOD_NOT_IN_NEST
	person_event SPRITE_CATERPIE, 52, 34, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyCaterpie, EVENT_POKEONLY_CATERPIE_PICKED_UP
	person_event SPRITE_POKE_BALL, 15, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CURO_SHARD, EVENT_LAUREL_POKEMONONLY_CUROSHARD
	person_event SPRITE_FRUIT_TREE, 57, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyFruitTree, -1
	person_event SPRITE_PIKACHU, 51, 47, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyPikachu, EVENT_POKEONLY_PIKACHU_IN_PARTY
	person_event SPRITE_BUTTERFREE, 32, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyRescuedButterfree, EVENT_POKEONLY_CHILD_BUTTERFREE_NOT_IN_NEST
	person_event SPRITE_FAIRY, 56, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyGatekeepingClefairy, -1
	person_event SPRITE_POKE_BALL, 24, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, GIANT_ROCK, EVENT_LAUREL_POKEMONONLY_BOULDER_1
	person_event SPRITE_FIRE, 16, 27, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyFire, EVENT_POKEONLY_FIRE_OUT
	person_event SPRITE_CATERPIE, 30, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForestPokemonOnlyRescuedCaterpie, EVENT_POKEONLY_CATERPIE_NOT_IN_NEST
