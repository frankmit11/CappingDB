--Query for Colin
SELECT DISTINCT
Classes_Scheduled.Class_ID,
Referrals.Ref_F_Name,
Referrals.Ref_L_Name,
Curriculum.Curriculum_Name,
Class_Subjects.Class_Subject
FROM 
Referrals,
Curriculum,
Participants,
Classes_Scheduled,
Curriculum_Subjects,
Class_Subjects
WHERE
-- PID 1 is in Curriculum 1 (the full curriculum)
Referrals.P_Num = 1
AND Referrals.P_Num = Participants.P_Num
AND Participants.CID = Curriculum.CID
AND Curriculum.CID = Curriculum_Subjects.CID
AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject



--- Give the class_id for a scheduled class that a participant has not attened              


              SELECT DISTINCT
				Classes_Scheduled.Class_ID
				FROM 
				Classes_Scheduled
				WHERE
				Classes_Scheduled.Class_ID NOT IN (
									-- Gets the id and names of all the classes a specific participant has already taken
									SELECT DISTINCT
									Classes_Scheduled.Class_ID

									FROM 
									Referrals,
									Participants,
									Class_Attendence,
									Classes_Scheduled,
									Curriculum_Subjects,
									Class_Subjects

									WHERE
									-- TESTING WITH P_Num 1
									Referrals.P_Num = 1
									And Referrals.P_Num = Participants.P_Num
									AND Participants.P_Num = Class_Attendence.P_Num
									AND Class_Attendence.Class_ID = Classes_Scheduled.Class_ID
									AND Classes_Scheduled.C_Subject = Curriculum_Subjects.C_Subject
									AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject)

ORDER BY Classes_Scheduled.Class_ID



/*
 * Dan Martino
 * Returns all of the class names of the classes in the "Full" curriculum
 */
SELECT 
Class_Subjects.Class_Subject

FROM
Class_Subjects,
Curriculum_Subjects

WHERE
Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.CID = 2



/*
 * Dan Martino
 * Returns all of the class names of the classes in the "Rehab" curriculum
 */
SELECT 
Class_Subjects.Class_Subject

FROM
Class_Subjects,
Curriculum_Subjects

WHERE
Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.CID = 3



/*
 * Dan Martino
 * Returns all of the class names of classes that are in
 * more than one curriculum
 */
SELECT 
Class_Subjects.Class_Subject

FROM 
Class_Subjects,
Curriculum_Subjects

WHERE Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject

GROUP BY Class_Subjects.Class_Subject

HAVING Count(*) > 1



/*
 * Dan Martino
 * Returns all of the class ids, class names, and comments of the classes a specific
 * participant has attended.
 * PID 1 is used as an example.
 */
SELECT DISTINCT
Class_Subjects.C_Subject,
Class_Subjects.Class_Subject,
Class_Attendence.Participant_Comment

FROM 
Referrals,
Participants,
Class_Attendence,
Classes_Scheduled,
Curriculum_Subjects,
Class_Subjects

WHERE
Referrals.P_Num = 1
AND Referrals.P_Num = Participants.P_Num
AND Participants.P_Num = Class_Attendence.P_Num
AND Class_Attendence.Class_ID = Classes_Scheduled.Class_ID
AND Classes_Scheduled.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject

ORDER BY Class_Subjects.C_Subject



/*
 * Dan Martino
 * Returns all of the class ids and class names of the classes a specific
 * participant has not attended
 * PID 1 is used as an example
 */
SELECT DISTINCT
Class_Subjects.C_Subject,
Class_Subjects.Class_Subject

FROM 
Referrals,
Participants,
Curriculum,
Curriculum_Subjects,
Class_Subjects

WHERE
Referrals.P_Num = 1
AND Referrals.P_Num = Participants.P_Num
AND Participants.CID = Curriculum.CID
AND Curriculum.CID = Curriculum_Subjects.CID
AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject
AND Curriculum_Subjects.C_Subject NOT IN (
									SELECT DISTINCT
									Curriculum_Subjects.C_Subject

									FROM 
									Referrals,
									Participants,
									Class_Attendence,
									Classes_Scheduled,
									Curriculum_Subjects,
									Class_Subjects

									WHERE
									Referrals.P_Num = 1
									AND Referrals.P_Num = Participants.P_Num
									AND Participants.P_Num = Class_Attendence.P_Num
									AND Class_Attendence.Class_ID = Classes_Scheduled.Class_ID
									AND Classes_Scheduled.C_Subject = Curriculum_Subjects.C_Subject
									AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject)

ORDER BY Class_Subjects.C_Subject



/*
 * Dan Martino
 * Returns all information about all the classes a specific employee is teaching
 * EID 1 is used as an example.
 */
SELECT DISTINCT
Class_Subjects.Class_Subject

FROM 
Class_Subjects,
Curriculum_Subjects,
Classes_Scheduled

WHERE
Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.C_Subject = Classes_Scheduled.C_Subject
AND Classes_Scheduled.EID = 1

