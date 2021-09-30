RijonLeagueChampionRoom_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueChampionRoom_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LANCE, 9, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
