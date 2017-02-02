--12/04/16--
--Frank Mitarotonda--
--Team:108--
--Views--


-- Give common participant information such as name, cell phone, age, race, DOB, and status
CREATE VIEW participantinfo AS
    SELECT Ref_F_Name, Ref_L_Name, AGE, Ref_Cell_Phone, DOB, Sex, Race, Status
    FROM referrals, participants
    WHERE referrals.P_num = participants.P_num;


-- Gets the names of all currently scheduled curriculums and the person who is teaching them
CREATE VIEW curriculuminfo AS
    SELECT Distinct Curriculum_Name, E_F_NAME, E_L_NAME, Location_Name, TO_CHAR(Date_Time_Schedules, 'DD-MM-YYYY HH:MI:SS AM') "Date 12Hr" 
    FROM curriculum, classes_scheduled, employees, locations, curriculum_Subjects
    WHERE curriculum.cid = curriculum_subjects.cid 
    and curriculum_subjects.cid = classes_scheduled.cid
    and locations.location_id = classes_scheduled.location_id
    and employees.eid = classes_scheduled.eid;



--Marengo
--All info from intake packet. This one was really hard
--SELECT *
--FROM participant_intake

--Name and curriculum stuff
--SELECT Ref_F_Name, Ref_L_Name, Curriculum_Name
--FROM curriculum, classes_scheduled, curriculum_Subjects
--WHERE curriculum.cid = curriculum_subjects.cid

--IS THE VM BEING EXCEPTIONALLY SLOW FOR ANYONE ELSE?


 --*
 --* Dan Martino
 --* Returns all of the class names of the classes in the "Full" curriculum
 --*/
CREATE VIEW full_curriculum_classes AS
SELECT Class_Subjects.Class_Subject
FROM
Class_Subjects,
Curriculum_Subjects
WHERE
Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.CID = 2;



/*
 * Dan Martino
 * Returns all of the class names of the classes in the "Rehab" curriculum
 */
CREATE VIEW rehab_curriculum_classes AS
SELECT 
Class_Subjects.Class_Subject

FROM
Class_Subjects,
Curriculum_Subjects

WHERE
Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.CID = 3;



/*
 * Dan Martino
 * Returns all of the class ids, class names, and comments of the classes a specific
 * participant has attended.
 * PID 1 is used as an example.
 */
CREATE VIEW participant_attendence AS
SELECT DISTINCT
Class_Subjects.C_Subject,
Class_Subjects.Class_Subject
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

ORDER BY Class_Subjects.C_Subject;



/* Dan Martino
 * Returns all of the class ids and class names of the classes a specific
 * participant has not attended
 * PID 1 is used as an example
 */
CREATE VIEW participant_remaining_classes AS
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
									And Referrals.P_Num = Participants.P_Num
									AND Participants.P_Num = Class_Attendence.P_Num
									AND Class_Attendence.Class_ID = Classes_Scheduled.Class_ID
									AND Classes_Scheduled.C_Subject = Curriculum_Subjects.C_Subject
									AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject);