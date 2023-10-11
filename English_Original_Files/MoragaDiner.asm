MoragaDiner_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaDinerNPC1:
	ctxt "Don't disturb me"
	line "while I'm eating!"
	done

MoragaDinerNPC2:
	ctxt "I've had better"
	line "burgers up in"
	cont "Kanto."
	done

MoragaDinerNPC3:
	ctxt "My #mon love"
	line "these burgers"
	cont "too!"
	done

MoragaDiner_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $4, 7, MORAGA_TOWN
	warp_def $7, $5, 7, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_CLERK, 4, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, MORAGA_DINER_MART, -1
	person_event SPRITE_FISHER, 6, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, MoragaDinerNPC1, -1
	person_event SPRITE_YOUNGSTER, 6, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, MoragaDinerNPC2, -1
	person_event SPRITE_RECEPTIONIST, 2, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaDinerNPC3, -1
