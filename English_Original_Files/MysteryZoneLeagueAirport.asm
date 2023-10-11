MysteryZoneLeagueAirport_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MysteryZoneAirportNPC:
	faceplayer
	opentext
	writetext .want_to_go_back_text
	yesorno
	sif false
		closetextend
	writetext .accepted_text
	special FadeOutPalettes
	playwaitsfx SFX_SWORDS_DANCE
	playwaitsfx SFX_THUNDER
	wait 5
	warp SOUTHERLY_AIRPORT, 4, 6
	end

.want_to_go_back_text
	ctxt "Hello."

	para "Would you like to"
	line "fly to Southerly"
	cont "City?"
	done

.accepted_text
	ctxt "Great!"

	para "We'll depart"
	line "shortly."
	sdone

MysteryZoneLeagueAirport_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def  0, 17, 1, MYSTERY_ZONE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_OFFICER,  8,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, MysteryZoneAirportNPC, -1
