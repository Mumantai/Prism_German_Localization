EagulouParkGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

EagulouParkGateAttendant:
	ctxt "Willkommen im "
	line "Aegolia-Park!"

	para "Die Regeln haben"
	line "sich geändert."

	para "Jeder darf den"
	line "Park kostenlos"
	para "betreten, aber du"
	line "musst Parkbälle"
	para "benutzen, um"
	line "#mon zu fangen."

	para "Die kannst du dir"
	line "im örtlichen Markt"
	cont "kaufen."

	para "Außerdem darfst du"
	line "die #mon im"
	para "Park nicht"
	line "verletzen, auch,"
	para "wenn sie dich"
	line "zuerst angreifen."

	para "Sei also besser"
	line "vorsichtig!"

	done

EagulouParkGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $0, $3, 1, EAGULOU_PARK_3
	warp_def $0, $4, 2, EAGULOU_PARK_3
	warp_def $5, $3, 4, EAGULOU_CITY
	warp_def $5, $4, 4, EAGULOU_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 2, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, EagulouParkGateAttendant, -1
