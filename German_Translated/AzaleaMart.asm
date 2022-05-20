AzaleaMart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AzaleaMartNPC1:
	ctxt "Kurt hatte damals"
	line "Pläne, seine Bälle"
	para "an Märkte zu"
	line "verkaufen."

	para "Sie hätten alle"
	line "anderen Bälle vom"
	cont "Markt verdrängt <...>"
	done

AzaleaMartNPC2:
	ctxt "Die Prototypen"
	line "von Kurts Bällen"
	para "hatten ein paar"
	line "Problemchen."

	para "Sympabälle"
	line "fingen noch das"
	para "gleiche Geschlecht"
	line "oder der Turboball"
	para "funktionierte nur"
	line "bei drei #mon."

	para "Zum Glück geht"
	line "jetzt alles!"
	done

AzaleaMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 6, AZALEA_TOWN
	warp_def $7, $7, 6, AZALEA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, AZALEA_STANDARD_MART, -1
	person_event SPRITE_YOUNGSTER, 6, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaMartNPC1, -1
	person_event SPRITE_ROCKER, 2, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, AzaleaMartNPC2, -1
