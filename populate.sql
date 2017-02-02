-- Referrals
INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('John', 'Smith', 'M', '18 Tice Street', 'Wayne', 'NJ', '07470', '9737203755', '9738973755', 'Physical Child Abuse', 'ProtectOurKidsCo', '2016-12-11', 'Larry', 'Parker', '8973552210', 'curbyours@gamil.com', 'Agressive personality', '2016-01-01', 'Long time friend', '2016-07-11', '2:00 PM', 'Poughkeepsie', 'Frank', 'No comments', '1990-12-05', 26);

INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('Darren', 'Sharper', 'H', '12 Ash Street', 'GlenRock', 'NJ', '07452', '9737203755', '2019876554', 'Mental Child Abuse', 'TheAgencyForKids', '2016-03-11', 'Derek', 'Hughes', '8973572270', 'donthitme@gamil.com', 'Unstable attitude', '2016-02-01', 'Client', '2015-07-11', '11:00 AM', 'Poughkeepsie', 'Joe', 'Understands his current situation', '1991-11-05', 25);

INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('Greg', 'Jennings', 'W', '22 Larz Street', 'Paterson', 'NJ', '07501', '9731103745', '2012296534', 'Physical Child Abuse', 'TreeHouseCo', '2016-07-14', 'Felix', 'Johnson', '8973352271', 'donthitme@gamil.com', 'Potential drug abuser', '2016-02-01', 'Social Worker', '2014-09-22', '12:00 PM', 'Poughkeepsie', 'Dan', 'Sensitive about his children', '1992-12-07', 24);

--Sacha:--
INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('John', 'Sean', 'M', '26 Circular Street', 'Saratoga Springs', 'NY', '12866', '5564313670', '9887463191', 'Mental Child Abuse', 'AgencyAgainstAbuse(AAA)', '2002-08-28', 'Sam', 'Smith', '9098371921', 'justdoit@gamil.com', 'Struggling with bills', '2002-08-12', 'Neighbors', '2000-10-22', '6:00 PM', 'Poughkeepsie', 'Roger', 'Shows rehabilitation potential', '1989-04-28', 27);



-- Reference_Conditions
INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Special Education/IEP/Resource services/504');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Substance use/Abuse History');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('21 years old or younger');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Involved with CPS/Foster Care/Preventive Service');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Pregnant');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('IQ documentation');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Mental Health/dual diagnosis');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Domestic Violence history');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Child/children do not reside with referred individual');



-- Ref_Indiv_Condition
INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(1,2);

INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(1,3);

INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(2,1);
--Brad:--
INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(4,4);



-- Ref_Household_Info
INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(1,'Terry', 'Bradshaw', '2015-09-12', 'P', 'M', 'Asian', 'No comments', 'Brother');

INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(2,'Sam', 'Hopkins', '2014-03-05', 'L', 'M', 'African American', 'Deep thinker', 'Cousin');

INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(3,'Martha', 'Cox', '2012-11-11', 'G', 'F', 'African American', 'Smart individual', 'Sister');
--Brad:--
INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(4,'Casey', 'Garrison', '2013-10-09', 'L', 'F', 'Caucasian', 'No comments', 'Cousin');


-- Other_Agencies
INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(1,'TheAgencyForKids', 'Darren', 'Sister');

INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(2,'ProtectOurKidsCo', 'John', 'Cousin');

INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(2,'LoveOurKids', 'Lucy', 'Step-Mom');

INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(3,'TreeHouseCo', 'Greg', 'Friend');
--Brad:--
INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(4,'ReachOut', 'Amanda', 'Neice');


-- Curriculum
INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('No Curriculum', 0, 0);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Full', 26, 28);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Rehab', 18, 20);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Mens Jail', 14, 16);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Womens Jail', 14, 16);




-- Participants
INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(1, 2, 'M', 'Native American', 2, 'Healthy');

INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(2, 2, 'M', 'African American', 5, 'Sick');

INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(3, 3, 'M', 'Asian', 3, 'Angry');
--Brad:--
INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(4, 2, 'M', 'Caucasian', 8, 'Content');


-- Class_Subjects

-- 1
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Nurturing/Culture/Spirituality');

-- 2
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Developing Empathy/Getting Needs Met');

-- 3
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Recognizing & Understanding Feelings');

-- 4
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Problem Solving & Desision Making');

-- 5
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Communication/Listening/Criticism/Confrontations/Fair Fighting');

-- 6
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Understanding & Handling Stress');

-- 7
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Understanding & Expressing Anger');

-- 8
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Talking about Effects of Drugs/Alcohol/Smoking on Family');

-- 9
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Recap Classes 1-9');

-- 10
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Relationships/Personal Space');

-- 11
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Childrens Brain Development');

-- 12
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Male/Female Brain/Quiz');

-- 13
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Ages & Stages: Appropriate Expectations');

-- 14
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Ages & Stages: Infant to Toddler');

-- 15
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Ages & Stages: Preschool to Adolescence');

-- 16
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Establishing Nurturing Parenting Routines');

-- 17
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Child Proofing Home/Safety Checklist/Safety Reminders');

-- 18
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Recap Classes 10-17');

-- 19
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Feeding Young Children Nutritious Foods');

-- 20
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Keeping Children Safe/Child Abuse & Neglect');

-- 21
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Improving Self-Worth/Childrens Self-Worth');

-- 22
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Developing Personal Power Adults/Children');

-- 23
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Helping Children Manage Behavior');

-- 24
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Attatchment/Seperation and Loss');

-- 25
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Unnderstanding Discipline/Developing Family Morals/Balues/Rules');

-- 26
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Using Rewards & Punishment to Guide/Teach Children/Praise');

-- 27
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Alternatives to Physical Punishment');

-- 28
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Guest Speaker');

-- 29
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Hope/Goal Setting');

-- 30
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Growth & Trust');

-- 31
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Families and Substance Use');

-- 32
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Feelings');

-- 33
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Self-Esteem');

-- 34
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Communication');

-- 35
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Active/Effective Listening');

-- 36
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Confrontation & Problem Solving');

-- 37
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Managing Stress');

-- 38
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('What Babies Teach Us');

-- 39
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Schedules & Routines');

-- 40
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Safety & Protecting Children');

-- 41
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Guiding Behavior');

-- 42
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Knowing Our Value');

-- 43
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Recovery Loss & Love');

-- 44
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Having Fun');

-- 45
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Emotional Honesty/Guilt & Shame');

-- 46
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Self-Esteem/Self-Care-Hygiene-importance of bathing & Body Lice, Scabies, & STDs');

-- 47
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Anger Management/Stress & Frustration');

-- 48
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Conflict Resolution/Fair Fighting');

-- 49
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Communications- Active Listening (Everybody Loves Raymond Video with Activity Sheet)');

-- 50
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Communications I & III Listening(shapes activity) Barriers to effective communication');

-- 51
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Communications II- Learning modalities - How to help our children learn and retain information');

-- 52
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Child Development I - Eric Eriksons stages of life. CDC Stages of childs developemnt');

-- 53
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Child Development II - Brain development/Group Activity - needs of children');

-- 54
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Discipline - Appropriate Expectations');

-- 55
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Discipline - Family Values, Rules, Morals');

-- 56
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Discipline I & II');

-- 57
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Talking to Children about Incarceration');

-- 58
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Co-Dependency/Parent Drug Use effects on Children');

-- 59
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('How Violence Affects Children');

-- 60
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Importance of Dads - Courageous');

-- 61
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Discipline - How Not to Discipline & The Seven Principles of Discipline');

-- 62
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('How Violence Affects Children');

-- 63
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Family Meeting/Game Class');


-- Curriculum_Subjects

-- FULL CURRICULUM
INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(1,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(2,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(3,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(4,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(5,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(6,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(7,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(8,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(9,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(10,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(11,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(12,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(13,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(14,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(15,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(16,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(17,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(18,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(19,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(20,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(21,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(22,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(23,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(24,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(25,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(26,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(27,2);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(28,2);


--REHAB CURRICULUM
INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(29,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(2,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(30,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(31,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(32,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(33,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(34,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(35,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(36,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(37,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(11,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(38,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(39,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(19,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(40,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(1,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(41,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(42,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(43,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(44,3);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(45,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(46,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(47,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(48,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(49,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(50,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(51,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(52,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(53,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(54,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(55,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(56,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(57,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(58,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(59,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(60,4);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(45,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(46,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(47,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(48,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(49,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(50,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(51,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(52,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(53,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(54,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(55,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(61,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(57,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(58,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(62,5);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(59,5);



-- Employees
INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('James', 'Caldwell', 'james.caldwell@gmail.com', '8451234567', '8459876543', 'Admin', 'swimmingpools');

INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('Amanda', 'Griffin', 'agriffin@gmail.com', '8453334444', '8452357422', 'SuperUser', 'alpaca');

INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('Nicholas', 'Johnson', 'nick.johnson@gmail.com', '8458352356', '8454733826', 'Employee', 'catfishsoup');
--Brad:--
INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('Lando', 'Calrissian', 'Lando.Carlissian@gmail.com', '8454567295', '8453219764', 'Employee', 'password123');


-- Locations
INSERT INTO Locations(Location_Name)
	VALUES('Poughkeepsie');

INSERT INTO Locations(Location_Name)
	VALUES('Rhinebeck');

INSERT INTO Locations(Location_Name)
	VALUES('Hyde Park');


-- Classes_Scheduled
INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 1, '2016-11-09 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 2, '2016-11-10 02:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 3, 1, 3, '2016-11-11 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 4, '2016-11-12 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 2, 1, 5, '2016-11-13 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 6, '2016-11-14 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 2, 1, 7, '2016-11-15 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 8, '2016-11-16 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 9, '2016-11-17 07:00 PM');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1, 1, 1, 10, '2016-11-18 07:00 PM');

--Brad:--
INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(1,1,3,4,'2016-11-14 08:00 AM');


-- Class_Attendence
INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,1,1,'Gave good input to the class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,2,1,'No comments');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(3,3,1,'Did not seem to pay attention during class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,4,1,'Displayed good behavior during class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(2,5,1,'Improving attentiveness in class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,6,1,'No comments');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(2,7,1,'No comments');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,8,1,'Participated in class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,9,1,'Gave good feedback during class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,10,1,'Was quiet but attentive');

--Brad:--	
INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(3,3,4,'Remained calm and attentive during class');


-- Consent_to_Release_Info
INSERT INTO Consent_to_Release_Info(P_Num, Agency_Name, Contact_F_Name, Contact_L_Name, Contact_Address_Street, Contact_Address_City, Contact_Address_State, Contact_Address_Zipcode, Contact_Phone, Date_Contacted, Consent_Form_Path)
  VALUES(1, 'Johnson Law', 'Chris', 'Miller', '123 Main Street', 'Poughkeepsie', 'NY', 12601, 8457778888, '2016-08-01', 'C://Desktop');

INSERT INTO Consent_to_Release_Info(P_Num, Agency_Name, Contact_F_Name, Contact_L_Name, Contact_Address_Street, Contact_Address_City, Contact_Address_State, Contact_Address_Zipcode, Contact_Phone, Date_Contacted, Consent_Form_Path)
  VALUES(1, 'For the Children', 'Stephanie', 'Norman', '456 Nodrugz Street', 'Poughkeepsie', 'NY', 12601, 8456738492, '2016-08-15', 'C://Desktop');
  


-- Participant_Intake
--Brad:--	
INSERT INTO Participant_Intake(P_Num, Age, Num_People_in_Home, Relation_to_Household, Daytime_Phone, Daytime_Msg, Evening_Phone,
 Date_of_Birth, Occupation, Religion, Ethnicity, Languages, Handicapping_cond, Last_Year_of_School, Drug_Alcohol_Issue, Drug_if_Yes_Comment,
  Length_Sep_From_Child, Length_Sep_From_Oth_Parent, Status_Relation_Oth_Parent, Parent_Together_Status, Involved_W_CPS, If_Yes_Prev_Involved_W_CPS,
   Mandated, If_Mandated_By_Who, If_Mandated_Why, If_Not_Mandated_Why, Safety_To_Participate_Needs, Behaviors_to_Stop_Part, Other_Parenting_Classes,
    Other_Parenting_Long_Ago, Victim_of_Abuse, If_Yes_Form_of_Abuse, Therapy, Issues_Related_to_Abuse, Emergency_Contact_F_Name,
     Emergency_Contact_L_Name, Emergency_Contact_Relation, Emergency_Contact_Number, What_Like_Learn, Domestic_Violence, Discussed_W_Someone,
      History_of_Violence, Nuclear_Family_Violence, Orders_of_Protection, If_Orders_of_Prot_Explain, Arrested_for_Crime, Convicted_for_Crime,
       If_Convicted_Explain, Prison_or_Jail_Record, If_Prison_or_Jail_when_what, Parole_or_Probation, If_Parole_Probation_Why,
        Other_Members_in_Parenting, If_Oth_Members_in_Parent)
	VALUES(4,25,5,'Father','5564313670','true','5564313670','1989-04-28','Construction Worker', 'Catholic','Caucasian','English','No Handicaps','Highschool', 'true','Alcoholic','2 months','2 months','Divorced','Not together', 'false' , 'false','true','police','Abusive to family members' , 'N/A','No safety to participate needs', 'Needs to learn self-control','No other parenting classes','No other parent long ago','true','verbal','false','Anger management','Casey','Johnson','Friend','8454248396','Anger Management','true','true','true','true','true','Restraining order issued via police report','true','true','Child abuse charges','false','N/A','false','N/A','false','N/A'); 

INSERT INTO Participant_Intake(P_Num, Age, Num_People_in_Home, Relation_to_Household, Daytime_Phone, Daytime_Msg, Evening_Phone,
 Date_of_Birth, Occupation, Religion, Ethnicity, Languages, Handicapping_cond, Last_Year_of_School, Drug_Alcohol_Issue, Drug_if_Yes_Comment,
  Length_Sep_From_Child, Length_Sep_From_Oth_Parent, Status_Relation_Oth_Parent, Parent_Together_Status, Involved_W_CPS, If_Yes_Prev_Involved_W_CPS,
   Mandated, If_Mandated_By_Who, If_Mandated_Why, If_Not_Mandated_Why, Safety_To_Participate_Needs, Behaviors_to_Stop_Part, Other_Parenting_Classes,
    Other_Parenting_Long_Ago, Victim_of_Abuse, If_Yes_Form_of_Abuse, Therapy, Issues_Related_to_Abuse, Emergency_Contact_F_Name,
     Emergency_Contact_L_Name, Emergency_Contact_Relation, Emergency_Contact_Number, What_Like_Learn, Domestic_Violence, Discussed_W_Someone,
      History_of_Violence, Nuclear_Family_Violence, Orders_of_Protection, If_Orders_of_Prot_Explain, Arrested_for_Crime, Convicted_for_Crime,
       If_Convicted_Explain, Prison_or_Jail_Record, If_Prison_or_Jail_when_what, Parole_or_Probation, If_Parole_Probation_Why,
        Other_Members_in_Parenting, If_Oth_Members_in_Parent)
	VALUES(1, 40, 4, 'Father', '8453334444', 'true', '8451234567', '1976-10-15', 'Ironworker', 'Christian', 'Caucasian', 'English, Spanish', 'No Handicaps', 'Highschool', 'true', 'Cocaine Addiction', 'One Year', 'Two Years', 'Divorced', 'Not Together', 'false', 'false', 'true', 'Judge', 'Neglects his children', 'N/A', 'No Safety to participate needs', 'Needs to understand how to communicate with his children', 'No other parenting classes', 'No other parent long ago', 'false', 'N/A', 'false', 'Drug addiction', 'Doug', 'Mitchell', 'Brother', '8456759283', 'How to control emotions', 'true', 'true', 'true', 'true', 'true', 'Judge ordered mandatory classes', 'true', 'true', 'Domestic Violence Charges', 'false', 'N/A', 'true', 'N/A', 'false', 'N/A');


-- Intk_Children
INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(1, 'Dom', 'Stone', 17, 'R', 'M', 'Caucasian', '117 Spartan Lane', 'Halo', 'NJ', '07452', 'Cortana');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(1, 'Donna', 'Stone', 13, 'M', 'F', 'Caucasian', '117 Spartan Lane', 'Halo', 'NJ', '07452', 'Cortana');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(1, 'Cotton', 'Stone', 9, 'V', 'M', 'Caucasian', '117 Spartan Lane', 'Halo', 'NJ', '07452', 'Sgt. Johnson');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(2, 'Michael', 'Martin', 25, 'F', 'M', 'African American', '1337 NoScope Road', 'Poughkeepsie', 'NY', '12601', 'Mother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(2, 'Gina', 'Martin', 15, 'S', 'F', 'African American', '1337 NoScope Road', 'Poughkeepsie', 'NY', '12601', 'Mother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(3, 'Robb', 'Stark', 12, 'T', 'M', 'Hispanic', '123 Abc Lane', 'Glen Rock', 'NJ', '07562', 'Grandmother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(3, 'Tony', 'Stark', 16, 'W', 'M', 'Hispanic', '123 Abc Lane', 'Glen Rock', 'NJ', '07562', 'Grandmother');
--Brad:--	
INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(4, 'Bob','Barker',14,'L','M','Caucasian','124 Fleet street','London','NY','11111','mother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(4, 'Benjamin','Barker',13,'D','M','Caucasian','124 Fleet street','London','NY','11111','mother');
	
INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(4, 'Sweeney','Todd',11,'D','M','Caucasian','124 Fleet street','London','NY','11111','mother');