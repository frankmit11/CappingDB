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

SELECT basicinfo('John', 'Smith', 'results');
FETCH ALL FROM results;


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

SELECT agencyinfo('John', 'Smith', 'results');
FETCH ALL FROM results;

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

SELECT attendanceinfo('John', 'Smith', 'results');
FETCH ALL FROM results;