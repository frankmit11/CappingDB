--Author Nick Marengo--
--Given a referred person's first and last names, lists some basic info about them--

CREATE OR REPLACE FUNCTION basicinfo(text, text, refcursor)
RETURNS refcursor AS '
DECLARE
	Firstname VARCHAR :=$1;
	Lastname VARCHAR :=$2;
	Resultset refcursor :=$3;
BEGIN
open resultset FOR

SELECT Ref_F_Name, Ref_L_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Cell_Phone, DOB, AGE
FROM Referrals
WHERE Firstname = Ref_F_Name
AND Lastname = Ref_L_Name;

RETURN resultset;

END;
'
LANGUAGE plpgsql


--In order to fetch the info, you need to write a query with the parameter(s) you do so like this:--

--SELECT basicinfo('John', 'Smith', 'results');
--FETCH ALL FROM results;


--Given a referred person's first and last names, lists their referred agency and their contact person 
CREATE OR REPLACE FUNCTION agencyinfo(text, text, refcursor)
RETURNS refcursor AS '
DECLARE
	Firstname VARCHAR :=$1;
	Lastname VARCHAR :=$2;
	Resultset refcursor :=$3;
BEGIN
open resultset FOR

SELECT Ref_F_Name, Ref_L_Name, Ref_Date, Referring_Agency
FROM Referrals
WHERE Firstname = Ref_F_Name
AND Lastname = Ref_L_Name;

RETURN resultset;

END;
'
LANGUAGE plpgsql


--info fetch test--

--SELECT agencyinfo('John', 'Smith', 'results');
--FETCH ALL FROM results;

--attempt at an attendance stored proc--

CREATE OR REPLACE FUNCTION attendanceinfo(text, text, refcursor)
RETURNS refcursor AS '
DECLARE
	Firstname VARCHAR :=$1;
	Lastname VARCHAR :=$2;
	Resultset refcursor :=$3;
BEGIN
open resultset FOR

SELECT Ref_F_Name, Ref_L_Name, Curriculum_Name, Classes_Needed, Classes_Total
FROM Referrals r, Participants p, Curriculum c
WHERE Firstname = Ref_F_Name
AND Lastname = Ref_L_Name 
AND r.P_Num = p.P_Num
AND p.CID = c.CID;

RETURN resultset;

END;
'
LANGUAGE plpgsql

--test query--

--SELECT attendanceinfo('John', 'Smith', 'results');
--FETCH ALL FROM results;




/*
 * Dan Martino
 * Returns all of the class ids, class names, and comments of the classes a specific
 * participant has attended.
 * PARAMETERS: A participant's PID
 */
CREATE OR REPLACE FUNCTION classesAttended(integer, refcursor)
RETURNS refcursor AS
'
DECLARE
	PID INTEGER := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

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
Referrals.P_Num = PID
AND Referrals.P_Num = Participants.P_Num
AND Participants.P_Num = Class_Attendence.P_Num
AND Class_Attendence.Class_ID = Classes_Scheduled.Class_ID
AND Classes_Scheduled.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject

ORDER BY Class_Subjects.C_Subject;

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Returns all of the class ids and class names of the classes a specific
 * participant has not attended
 * PARAMETERS: A participant's PID
 */
CREATE OR REPLACE FUNCTION classesNotAttended(integer, refcursor)
RETURNS refcursor AS
'
DECLARE
	PID INTEGER := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

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
Referrals.P_Num = PID
AND Referrals.P_Num = Participants.P_Num
AND Participants.CID = Curriculum.CID
AND Curriculum.CID = Curriculum_Subjects.CID
AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject
AND Curriculum_Subjects.C_Subject NOT IN (SELECT DISTINCT
									      Curriculum_Subjects.C_Subject

										  FROM 
										  Referrals,
										  Participants,
										  Class_Attendence,
										  Classes_Scheduled,
										  Curriculum_Subjects,
										  Class_Subjects

										  WHERE
										  Referrals.P_Num = PID
										  AND Referrals.P_Num = Participants.P_Num
										  AND Participants.P_Num = Class_Attendence.P_Num
										  AND Class_Attendence.Class_ID = Classes_Scheduled.Class_ID
										  AND Classes_Scheduled.C_Subject = Curriculum_Subjects.C_Subject
										  AND Curriculum_Subjects.C_Subject = Class_Subjects.C_Subject)

ORDER BY Class_Subjects.C_Subject;

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to add a new employee to the database
 * PARAMETERS: First name, last name, email, home phone, cell phone, permission level, password
 * TODO: What happens if a field is null? Example: An employee does not have a cellphone
 */
CREATE OR REPLACE FUNCTION insertEmployee(text, text, text, text, text, text, text, refcursor)
RETURNS refcursor AS
'
DECLARE
	firstName VARCHAR := $1;
	lastName VARCHAR := $2;
	email VARCHAR := $3;
	homephone VARCHAR := $4;
	cellphone VARCHAR := $5;
	permission VARCHAR := $6;
	password VARCHAR := $7;
	Resultset refcursor := $8;

BEGIN
open resultset FOR

INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES(firstName, lastName, email, homephone, cellphone, permission, password);

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to add a new employee to the database
 * PARAMETERS: An employee's EID, first name, last name, email, home phone, cell phone, permission level, password
 * TODO: How to only update certain fields
 */
CREATE OR REPLACE FUNCTION updateEmployee(text, text, text, text, text, text, text, refcursor)
RETURNS refcursor AS
'
DECLARE
	firstName VARCHAR := $1;
	lastName VARCHAR := $2;
	email VARCHAR := $3;
	homephone VARCHAR := $4;
	cellphone VARCHAR := $5;
	permission VARCHAR := $6;
	password VARCHAR := $7;
	Resultset refcursor := $8;

BEGIN
open resultset FOR

UPDATE 
Employees

SET 
E_F_NAME = firstName
E_L_NAME = lastName
Email = email
Home_Phone = homephone
Cell_Phone = cellphone
Permission_Lvl = permission
Password = password

WHERE
Employees.EID = EID;

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to delete an employee from the database
 * PARAMETERS: An employee's EID
 */
CREATE OR REPLACE FUNCTION deleteEmployee(integer, refcursor)
RETURNS refcursor AS
'
DECLARE
	EID INTEGER := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

DELETE FROM 
Employees

WHERE
Employees.EID = EID;

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to add a new class to the database
 * PARAMETERS: A class' name
 */
CREATE OR REPLACE FUNCTION addClass(text, refcursor)
RETURNS refcursor AS
'
DECLARE
	className VARCHAR := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

INSERT INTO Class_Subjects (Class_Subject)
	VALUES(className);

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to add a class to a curriculum
 * PARAMETERS: A class' id and a curriculum's id
 */
CREATE OR REPLACE FUNCTION addClassToCurriculum(integer, integer, refcursor)
RETURNS refcursor AS
'
DECLARE
	classID INTEGER := $1;
	curriculumID INTEGER := $2;
	Resultset refcursor := $3;

BEGIN
open resultset FOR

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(classID, curriculumID);

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to schedule a class
 * PARAMETERS: A curriculum's id, an employee's id, a location's id, a class' id, and a datetime
 */
CREATE OR REPLACE FUNCTION scheduleClass(integer, integer, integer, integer, datetime, refcursor)
RETURNS refcursor AS
'
DECLARE
	curriculumID INTEGER := $1;
	employeeID INTEGER := $2;
	locationID INTEGER := $3;
	classID INTEGER := $4;
	datetime DATETIME := $5;
	Resultset refcursor := $6;

BEGIN
open resultset FOR

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(curriculumID, employeeID, locationID, classID, datetime);

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to add a new location into the database
 * PARAMETERS: A location's name
 */
CREATE OR REPLACE FUNCTION addLocation(text, refcursor)
RETURNS refcursor AS
'
DECLARE
	locationName VARCHAR := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

INSERT INTO Locations(Location_Name)
	VALUES(locationName);

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to remove a location from the database
 * PARAMETERS: A location's id
 */
CREATE OR REPLACE FUNCTION deleteLocation(integer, refcursor)
RETURNS refcursor AS
'
DECLARE
	locationID INTEGER := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

DELETE FROM 
Locations

WHERE
Locations.Location_ID = locationID

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Stored Procedure to take attendence 
 * PARAMETERS: An employee's id, a class's id, a participant's id, and a comment on performance
 */
CREATE OR REPLACE FUNCTION takeAttendence(integer, integer, integer, text refcursor)
RETURNS refcursor AS
'
DECLARE
	employeeID INTEGER := $1;
	classID INTEGER := $2;
	PID INTEGER := $3;
	comment VARCHAR := $4
	Resultset refcursor := $5;

BEGIN
open resultset FOR

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(employeeID, classID, PID, comment);

RETURN resultset;

END;
'
LANGUAGE plpgsql



/*
 * Dan Martino
 * Returns all information about all the classes a specific employee is teaching
 * PARAMETERS: An employee's EID
 */
CREATE OR REPLACE FUNCTION employeeClasses(integer, refcursor)
RETURNS refcursor AS
'
DECLARE
	employeeID INTEGER := $1;
	Resultset refcursor := $2;

BEGIN
open resultset FOR

SELECT DISTINCT
Class_Subjects.Class_Subject

FROM 
Class_Subjects,
Curriculum_Subjects,
Classes_Scheduled

WHERE
Class_Subjects.C_Subject = Curriculum_Subjects.C_Subject
AND Curriculum_Subjects.C_Subject = Classes_Scheduled.C_Subject
AND Classes_Scheduled.EID = employeeID;

RETURN resultset;

END;
'
LANGUAGE plpgsql