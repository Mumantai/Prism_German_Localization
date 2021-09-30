Route77DaycareGarden_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 2
	dbw MAPCALLBACK_OBJECTS, .OverridePalettes
	dbw MAPCALLBACK_NEWMAP, .CheckEgg

.OverridePalettes
	callasm .DoPaletteOverride
	return

.DoPaletteOverride
	ld hl, wBreedMon1DVs
	ld de, wMap1Object + MAPOBJECT_COLOR
	ld a, [wBreedMon1Species]
	call .OverridePalette
	ld hl, wBreedMon2DVs
	ld de, wMap2Object + MAPOBJECT_COLOR
	ld a, [wBreedMon2Species]
.OverridePalette
	ld [wCurPartySpecies], a
	push de
	callba GetPalette
	pop de
	swap l
	ret z ; default to red (already loaded) if we're using the orange palette (reserved for player)
	ld a, l
	ld [de], a ; lazy
	ret

.CheckEgg
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	sif true, then
		clearevent EVENT_DAYCARE_EGG
	selse
		setevent EVENT_DAYCARE_EGG
	sendif
	checkflag ENGINE_DAYCARE_MAN_HAS_MON
	sif true, then
		clearevent EVENT_DAYCARE_MON_1
	selse
		setevent EVENT_DAYCARE_MON_1
	sendif
	checkflag ENGINE_DAYCARE_LADY_HAS_MON
	sif true, then
		clearevent EVENT_DAYCARE_MON_2
	selse
		setevent EVENT_DAYCARE_MON_2
	sendif
	return

Route77DaycareGardenMon1:
	opentext
	faceplayer
	special Special_DayCareMon1
	closetextend

Route77DaycareGardenMon2:
	opentext
	faceplayer
	special Special_DayCareMon2
	closetextend

Route77DaycareGardenEgg:
	opentext
	special Special_DayCareManOutside
	waitbutton
	closetext
	sif =, 1
		end
	clearflag ENGINE_DAYCARE_MAN_HAS_EGG
	disappear 4
	end

Route77DaycareGarden_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 14, 17, 1, ROUTE_77_DAYCARE_HOUSE
	warp_def 15, 17, 2, ROUTE_77_DAYCARE_HOUSE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_DAYCARE_MON_1, 17, 1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route77DaycareGardenMon1, EVENT_DAYCARE_MON_1
	person_event SPRITE_DAYCARE_MON_2, 9, 13, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route77DaycareGardenMon2, EVENT_DAYCARE_MON_2
	person_event SPRITE_EGG, 18, 10, SPRITEMOVEDATA_ALTERNATE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, Route77DaycareGardenEgg, EVENT_DAYCARE_EGG
