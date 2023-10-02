BotanPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

BotanPokecenterNPC1:
	ctxt "Behalt das hier"
	line "bloß für dich!"
	done

BotanPokecenterNPC2:
	ctxt "Das ist das erste"
	line "geheimgehaltene"
	para "#mon Center der"
	line "Welt!"
	para "Wir wollen nur"
	line "das Beste für"
	cont "unsere #mon."
	done

BotanPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 5, BOTAN_CITY
	warp_def $7, $5, 5, BOTAN_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_POKEFAN_M, 6, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanPokecenterNPC1, -1
	person_event SPRITE_COOLTRAINER_M, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanPokecenterNPC2, -1