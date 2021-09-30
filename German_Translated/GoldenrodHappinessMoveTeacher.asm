GoldenrodHappinessMoveTeacher_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

GoldenrodHappinessMoveTeacherNPC1:
	ctxt "Die Anwendung von "
	line "Nährstoffen bei "
	para "#mon wird sie "
	line "glücklich machen!"

	done

GoldenrodHappinessMoveTeacherNPC2:
	ctxt "Dein #mon wird "
	line "unglücklich, wenn "
	cont "es verliert."

	done

GoldenrodHappinessMoveTeacherTutor:
	faceplayer
	opentext
	special Special_GoldenrodHappinessMoveTutor
	endtext

GoldenrodHappinessMoveTeacher_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 8, GOLDENROD_CITY
	warp_def $7, $3, 8, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_LASS, 3, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodHappinessMoveTeacherNPC1, -1
	person_event SPRITE_POKEFAN_M, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodHappinessMoveTeacherNPC2, -1
	person_event SPRITE_TEACHER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GoldenrodHappinessMoveTeacherTutor, -1
