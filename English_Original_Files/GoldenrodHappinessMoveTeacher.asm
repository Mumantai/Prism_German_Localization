GoldenrodHappinessMoveTeacher_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodHappinessMoveTeacherNPC1:
	ctxt "Using vitamins on"
	line "#mon will make"
	cont "them happy!"
	done

GoldenrodHappinessMoveTeacherNPC2:
	ctxt "Your #mon won't"
	line "be happy if it"
	para "faints during"
	line "battle."
	done

GoldenrodHappinessMoveTeacherTutor:
	faceplayer
	opentext
	special Special_GoldenrodHappinessMoveTutor
	endtext

GoldenrodHappinessMoveTeacher_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 9, GOLDENROD_CITY
	warp_def $7, $3, 9, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_LASS, 3, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodHappinessMoveTeacherNPC1, -1
	person_event SPRITE_POKEFAN_M, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodHappinessMoveTeacherNPC2, -1
	person_event SPRITE_TEACHER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodHappinessMoveTeacherTutor, -1
