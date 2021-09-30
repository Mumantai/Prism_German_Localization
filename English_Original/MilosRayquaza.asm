MilosRayquaza_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MilosRayquaza_MapEventHeader:: db 0, 0

.Warps
	db 0

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_SAGE, 7, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_RAYQUAZA, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
