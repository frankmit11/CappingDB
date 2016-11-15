--Author Frankie boi--
DROP TABLE IF EXISTS Referrals CASCADE;

DROP TABLE IF EXISTS Reference_Conditions CASCADE;

DROP TABLE IF EXISTS Ref_Indiv_Condition CASCADE;

DROP TABLE IF EXISTS Ref_Household_Info CASCADE;

DROP TABLE IF EXISTS Other_Agencies CASCADE;

DROP TABLE IF EXISTS Participants CASCADE;

DROP TABLE IF EXISTS Curriculum CASCADE;

DROP TABLE IF EXISTS Class_Subjects CASCADE;

DROP TABLE IF EXISTS Curriculum_Subjects CASCADE;

DROP TABLE IF EXISTS Employees CASCADE;

DROP TABLE IF EXISTS Locations CASCADE;

DROP TABLE IF EXISTS Classes_Scheduled CASCADE;

DROP TABLE IF EXISTS Class_Attendence CASCADE;

DROP TABLE IF EXISTS Consent_to_Release_Info CASCADE;

DROP TABLE IF EXISTS Participant_Intake CASCADE;

DROP TABLE IF EXISTS Intk_Children CASCADE;


--11/06/16--
--Frank Mitarotonda Dan Martino Joe Schmidt--
--Team:108--
--Capping Database--



--SERIAL type auto increments the primary keys--

CREATE TABLE IF NOT EXISTS Referrals (
  P_Num SERIAL not null,
  Ref_F_Name VARCHAR(20),
  Ref_L_Name VARCHAR(20),
  Ref_MI_Name VARCHAR(1),
  Ref_Street VARCHAR(30),
  Ref_City VARCHAR(30),
  Ref_State VARCHAR(2),
  Ref_Zip VARCHAR(5) check (Ref_Zip ~ '^[0-9]+$'),
  Ref_Home_Phone VARCHAR(10) check (Ref_Home_Phone ~ '^[0-9]+$'),
  Ref_Cell_Phone VARCHAR(10) check (Ref_Cell_Phone ~ '^[0-9]+$'),
  Reasons_For_Referral VARCHAR(250),
  Referring_Agency VARCHAR(30),
  Ref_Date DATE,
  Contact_Person_F_Name VARCHAR(20),
  Contact_Person_L_Name VARCHAR(20),
  Contact_Person_Number VARCHAR(10) check (Contact_Person_Number ~ '^[0-9]+$'),
  Contact_Person_Email VARCHAR(30),
  Additional_Info_Specific_Needs VARCHAR(250),
  Date_of_fst_Contact DATE,
  Means_of_Contact VARCHAR(75),
  Date_of_Int_Meeting DATE,
  Time_of_Int_Meeting TIME,
  Location VARCHAR(50),
  Staff_Person VARCHAR(50),
  Comments VARCHAR(250),
  DOB DATE,
  AGE INTEGER,
  PRIMARY KEY (P_Num)
);



CREATE TABLE IF NOT EXISTS Reference_Conditions (
  Condition_Key SERIAL not null,
  Condition_Description VARCHAR(150),
  PRIMARY KEY (Condition_Key)
);



CREATE TABLE IF NOT EXISTS Ref_Indiv_Condition (
  P_Num SERIAL not null references Referrals(P_Num), 
  Condition_Key SERIAL not null references Reference_Conditions(Condition_Key),
  PRIMARY KEY (P_Num, Condition_Key)
);



CREATE TABLE IF NOT EXISTS Ref_Household_Info(
  P_Num SERIAL NOT NULL REFERENCES Referrals(P_Num), 
  H_F_Name VARCHAR(20) NOT NULL,
  H_L_Name VARCHAR(20) NOT NULL,
  H_Date DATE NOT NULL,
  H_MI_Name VARCHAR(1),
  H_Sex VARCHAR(1),
  H_Race VARCHAR(20),
  H_Comment VARCHAR(75),
  H_Relation VARCHAR(20),
  PRIMARY KEY(P_Num, H_F_Name, H_L_Name, H_Date)
);



CREATE TABLE IF NOT EXISTS Other_Agencies(
  P_Num serial NOT NULL REFERENCES Referrals(P_Num),
  Agency_Name VARCHAR(20) NOT NULl,
  Working_With VARCHAR(40),
  Relation VARCHAR(20),
  PRIMARY KEY(P_Num, Agency_Name)
);



CREATE TABLE IF NOT EXISTS Curriculum(
  CID SERIAL NOT NULL,
  Curriculum_Name VARCHAR(100),
  Classes_Needed INTEGER,
  Classes_Total INTEGER,
  PRIMARY KEY(CID)
);



CREATE TABLE IF NOT EXISTS Participants(
  P_Num SERIAL NOT NULL REFERENCES Referrals(P_Num),
  CID SERIAL NOT NULL REFERENCES Curriculum(CID),
  Sex VARCHAR(1),
  Race VARCHAR(20),
  Number_Of_Children INTEGER,
  Status VARCHAR(15),
  PRIMARY KEY(P_Num, CID)
);



CREATE TABLE IF NOT EXISTS Class_Subjects(
  C_Subject SERIAL NOT NULL,
  Class_Subject VARCHAR(100),
  PRIMARY KEY(C_Subject)
);



CREATE TABLE IF NOT EXISTS Curriculum_Subjects(
  C_Subject SERIAL UNIQUE NOT NULL REFERENCES Class_Subjects(C_Subject),
  CID SERIAL NOT NULL REFERENCES Curriculum(CID),
  PRIMARY KEY(C_Subject, CID)
);



CREATE TABLE IF NOT EXISTS Employees(
  EID SERIAL NOT NULL,
  E_F_NAME VARCHAR(20),
  E_L_NAME VARCHAR(20),
  Email VARCHAR(30),
  Home_Phone VARCHAR(10) check (Home_Phone ~ '^[0-9]+$'),
  Cell_Phone VARCHAR(10) check (Cell_Phone ~ '^[0-9]+$'),
  Permission_Lvl VARCHAR(15) CHECK (Permission_Lvl = 'Admin' OR Permission_Lvl = 'SuperUser' OR Permission_Lvl = 'Employee'),
  Password VARCHAR(25) ,
  PRIMARY KEY(EID)
);



CREATE TABLE IF NOT EXISTS Locations(
  Location_ID SERIAL NOT NULL,
  Location_Name VARCHAR(100),
  PRIMARY KEY(Location_ID)
);



CREATE TABLE IF NOT EXISTS Classes_Scheduled(
  Class_ID SERIAL UNIQUE NOT NULL,
  CID SERIAL NOT NULL REFERENCES Curriculum(CID),
  EID SERIAL NOT NULL REFERENCES Employees(EID),
  Location_ID SERIAL NOT NULL REFERENCES Locations(Location_ID),
  C_Subject SERIAL NOT NULL REFERENCES Curriculum_Subjects(C_Subject),
  Date_Time_Schedules TIMESTAMP,
  PRIMARY KEY (Class_ID, CID, EID, Location_ID, C_Subject)
);



CREATE TABLE IF NOT EXISTS Class_Attendence(
  EID SERIAL NOT NULL REFERENCES Employees(EID),
  Class_ID SERIAL NOT NULL REFERENCES Classes_Scheduled(Class_ID),
  P_Num SERIAL NOT NULL REFERENCES Referrals(P_Num),
  Participant_Comment VARCHAR(250),
  PRIMARY KEY(EID, Class_ID, P_Num)
);



CREATE TABLE IF NOT EXISTS Consent_to_Release_Info(
  P_Num SERIAL NOT NULL REFERENCES Referrals(P_Num),
  Agency_Name VARCHAR(20) NOT NULL,
  Contact_F_Name VARCHAR(20),
  Contact_L_Name VARCHAR(20),
  Contact_Address_Street VARCHAR(30),
  Contact_Address_City VARCHAR(30),
  Contact_Address_State VARCHAR(2),
  Contact_Address_Zipcode VARCHAR(5) check (Contact_Address_Zipcode ~ '^[0-9]+$'),
  Contact_Phone VARCHAR(10) check (Contact_Phone ~ '^[0-9]+$'),
  Date_Contacted DATE,
  Consent_Form_Path VARCHAR(30),
  PRIMARY KEY(P_Num, Agency_Name)
);



CREATE TABLE IF NOT EXISTS Participant_Intake(
  P_Num SERIAL NOT NULL REFERENCES Referrals(P_Num),
  Age INTEGER NOT NULL,
  Num_People_in_Home INTEGER,
  Relation_to_Household VARCHAR(50),
  Daytime_Phone VARCHAR(10) check (Daytime_Phone ~ '^[0-9]+$'),
  Daytime_Msg BOOLEAN,
  Evening_Phone VARCHAR(10) check (Evening_Phone ~ '^[0-9]+$'),
  Date_of_Birth DATE,
  Occupation VARCHAR(35),
  Religion VARCHAR(25),
  Ethnicity VARCHAR(20),
  Languages VARCHAR(75),
  Handicapping_cond VARCHAR(75),
  Last_Year_of_School VARCHAR (75),
  Drug_Alcohol_Issue BOOLEAN,
  Drug_if_Yes_Comment VARCHAR(250),
  Length_Sep_From_Child VARCHAR(100),
  Length_Sep_From_Oth_Parent VARCHAR(100),
  Status_Relation_Oth_Parent VARCHAR(75),
  Parent_Together_Status VARCHAR(125),
  Involved_W_CPS BOOLEAN,
  If_Yes_Prev_Involved_W_CPS BOOLEAN,
  Mandated BOOLEAN,
  If_Mandated_By_Who VARCHAR(50),
  If_Mandated_Why VARCHAR(300),
  If_Not_Mandated_Why VARCHAR(300),
  Safety_To_Participate_Needs VARCHAR(200),
  Behaviors_to_Stop_Part VARCHAR(200),
  Other_Parenting_Classes VARCHAR(200),
  Other_Parenting_Long_Ago VARCHAR(200),
  Victim_of_Abuse BOOLEAN,
  If_Yes_Form_of_Abuse VARCHAR(150),
  Therapy BOOLEAN,
  Issues_Related_to_Abuse VARCHAR(150),
  Emergency_Contact_F_Name VARCHAR(20),
  Emergency_Contact_L_Name VARCHAR(20),
  Emergency_Contact_Relation VARCHAR(15),
  Emergency_Contact_Number VARCHAR(10) check (Emergency_Contact_Number ~ '^[0-9]+$'),
  What_Like_Learn VARCHAR(500),
  Domestic_Violence BOOLEAN,
  Discussed_W_Someone BOOLEAN,
  History_of_Violence BOOLEAN,
  Nuclear_Family_Violence BOOLEAN,
  Orders_of_Protection BOOLEAN,
  If_Orders_of_Prot_Explain VARCHAR(175),
  Arrested_for_Crime BOOLEAN,
  Convicted_for_Crime BOOLEAN,
  If_Convicted_Explain VARCHAR(200),
  Prison_or_Jail_Record BOOLEAN,
  If_Prison_or_Jail_when_what VARCHAR(100),
  Parole_or_Probation BOOLEAN,
  If_Parole_Probation_Why VARCHAR(100),
  Other_Members_in_Parenting BOOLEAN,
  If_Oth_Members_in_Parent VARCHAR(200),
  PRIMARY KEY(P_Num, Age)
);



CREATE TABLE IF NOT EXISTS Intk_Children(
  P_Num SERIAL NOT NULL REFERENCES Referrals(P_Num),
  Ch_F_Name VARCHAR(20) NOT NULL,
  Ch_L_Name VARCHAR(20) NOT NULL,
  Ch_Age INTEGER NOT NULL,
  Ch_M_Initial VARCHAR(1),
  Ch_Sex VARCHAR(1),
  Ch_Race VARCHAR(20),
  Ch_Address_Street VARCHAR(30),
  Ch_Address_City VARCHAR(30),
  Ch_Address_State VARCHAR(2),
  Ch_Address_Zipcode VARCHAR(5) check (Ch_Address_Zipcode ~ '^[0-9]+$'),
  Custody VARCHAR(50),
  PRIMARY KEY(P_Num, Ch_F_Name, Ch_L_Name)
);





-- Referrals
INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('John', 'Smith', 'M', '18 Tice Street', 'Wayne', 'NJ', '07470', '9737203755', '9738973755', 'Beat his kid', 'EvilCorp', '2016-12-11', 'Larry', 'David', '8973552210', 'curbyours@gamil.com', 'Beat kids badly', '2016-01-01', 'Long time friend', '2016-07-11', '2:00 PM', 'Poughkeepsie', 'Frank', 'No comments', '1990-12-05', 26);

INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('Darren', 'Sharper', 'H', '12 Ash Street', 'GlenRock', 'NJ', '07452', '9737203755', '2019876554', 'Beat his kid more', 'The Agency', '2016-03-11', 'Larry', 'Hughes', '8973572270', 'donthitme@gamil.com', 'Beat kids even worse', '2016-02-01', 'Long time bowler', '2015-07-11', '11:00 AM', 'Toronto', 'Joe', 'Really does not love his kids or anyone', '1991-11-05', 25);

INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('Greg', 'Jennings', 'W', '22 Larz Street', 'Paterson', 'NJ', '07501', '9731103745', '2012296534', 'Beat his kid the most', 'TreeHouseCo', '2016-07-14', 'Larry', 'Johnson', '8973352271', 'donthitme@gamil.com', 'Beat kids even worse', '2016-02-01', 'Long time frined', '2014-09-22', '12:00 PM', 'SimCity', 'Dan', 'Really hates people', '1992-12-07', 24);

--Sacha: record not in the DB--
INSERT INTO Referrals (Ref_F_Name, Ref_L_Name, Ref_MI_Name, Ref_Street, Ref_City, Ref_State, Ref_Zip, Ref_Home_Phone, Ref_Cell_Phone, Reasons_For_Referral, Referring_Agency, Ref_Date, Contact_Person_F_Name, Contact_Person_L_Name, Contact_Person_Number, Contact_Person_Email, Additional_Info_Specific_Needs,  Date_of_fst_Contact, Means_of_Contact, Date_of_Int_Meeting, Time_of_Int_Meeting, Location, Staff_Person, Comments, DOB, AGE)
     VALUES ('John', 'Sean', 'M', '26 Circular Street', 'Saratoga Springs', 'NY', '12866', '5564313670', '9887463191', 'Sat on his kid until incapacitated', 'Agency', '2002-08-28', 'Sam', 'Smith', '9098371921', 'justdoit@gamil.com', 'beat kids more then worse', '2002-08-12', 'Met in passing', '2000-10-22', '6:00 PM', 'TheDogHouse', 'LaBrick', 'Likes turtles', '1989-04-28', 27);



-- Reference_Conditions
INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Struck kids with blunt objects');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Crushed son with anvil');

INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Attempted to box 3 year old son');

--Brad: record not in the DB--
INSERT INTO Reference_Conditions(Condition_Description)
	VALUES('Threw son down the stairs');

-- Ref_Indiv_Condition
INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(1,2);

INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(1,3);

INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(2,1);

--Brad: record not in the DB--
INSERT INTO Ref_Indiv_Condition (P_Num, Condition_Key)
    VALUES(4,4);

-- Ref_Household_Info
INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(1,'Terry', 'Bradshaw', '2015-09-12', 'P', 'M', 'Jedi', 'Cold blooded killer', 'Long time caller');

INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(2,'John', 'Hopkins', '2014-03-05', 'L', 'M', 'Dothraki', 'Warm blooded killer', 'Long time friend');

INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(3,'Martha', 'Stewart', '2012-11-11', 'G', 'F', 'Avatar', 'Crazy Chef', 'Friend of a friend');

--Brad: record not in the DB--
INSERT INTO Ref_Household_Info (P_Num, H_F_Name, H_L_Name, H_Date, H_MI_Name, H_Sex, H_Race, H_Comment, H_Relation)
	VALUES(4,'Casey', 'Anthony', '2013-10-09', 'L', 'F', 'Argonian', 'Bad Mom', 'Cousin');


-- Other_Agencies
INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(1,'Other Agency', 'Susan', 'Sister');

INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(2,'Arcadio', 'Karen', 'Cousin');

INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(2,'Felix', 'Lucy', 'Step-Mom');

INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(3,'TreeHouseCo', 'Ronnie', 'Friend');

--Brad: record not in the DB--
INSERT INTO Other_Agencies(P_Num, Agency_Name, Working_With, Relation)
	VALUES(4,'Help', 'Amanda', 'Neice');


-- Curriculum
INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Stop The Beat Down', 12, 24);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Stop Hurting Kids 101', 5, 12);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('How to not hurt a child', 7, 17);

INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('Regular Curriculum', 2, 4);

--Brad: record not in the DB--
INSERT INTO Curriculum (Curriculum_Name, Classes_Needed, Classes_Total)
	VALUES('When not to hit your kids', 10, 15);


-- Participants
INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(1, 3, 'M', 'Sith', 2, 'Healthy');

INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(2, 1, 'M', 'Dragon', 5, 'Sick');

INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(3, 2, 'M', 'Bird', 3, 'Breathing');

--Brad: record not in the DB--
INSERT INTO Participants (P_Num, CID, Sex, Race, Number_Of_Children, Status)
	VALUES(4, 4, 'M', 'Hollow', 8, 'Alive');


-- Class_Subjects
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Understanding how to talk with your child');

INSERT INTO Class_Subjects (Class_Subject)
	VALUES('The importance of not beating your kids');

INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Anger management and deep breathing');

--Brad: record not in the DB--
INSERT INTO Class_Subjects (Class_Subject)
	VALUES('Understanding emotions');


-- Curriculum_Subjects
INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(1,1);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(2,1);

INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(3,1);

--Brad: record not in the DB--
INSERT INTO Curriculum_Subjects(C_Subject, CID)
	VALUES(4,2);



-- Employees
INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('James', 'Caldwell', 'james.caldwell@gmail.com', '8451234567', '8459876543', 'Admin', 'swimmingpools');

INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('Amanda', 'Griffin', 'agriffin@gmail.com', '8453334444', '8452357422', 'SuperUser', 'alpaca');

INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('Nicholas', 'Johnson', 'nick.johnson@gmail.com', '8458352356', '8454733826', 'Employee', 'catfishsoup');

--Brad: record not in the DB--
INSERT INTO Employees(E_F_NAME, E_L_NAME, Email, Home_Phone, Cell_Phone, Permission_Lvl, Password)
	VALUES('Lando', 'Carlissian', 'Lando.Carlissian@gmail.com', '8454567295', '8453219764', 'Employee', 'password123');


-- Locations
INSERT INTO Locations(Location_Name)
	VALUES('Poughkeepsie');

INSERT INTO Locations(Location_Name)
	VALUES('Rhinebeck');

INSERT INTO Locations(Location_Name)
	VALUES('Hyde Park');


-- Classes_Scheduled
INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(4, 1, 1, 1, '2016-11-09');

INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(4, 1, 1, 2, '2016-11-10');

--Brad: record not in the DB--
INSERT INTO Classes_Scheduled(CID, EID, Location_ID, C_Subject, Date_Time_Schedules)
	VALUES(5,1,3,4,'2016-11-14');

-- Class_Attendence
INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,1,1,'Gave good input to the class');

INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(1,2,1,'Displayed good behavior during class');

--Brad: record not in the DB--	
INSERT INTO Class_Attendence(EID, Class_ID, P_Num, Participant_Comment)
	VALUES(3,3,4,'Tried to demonstrate how he sits on his kids using another participant');


-- Consent_to_Release_Info
INSERT INTO Consent_to_Release_Info(P_Num, Agency_Name, Contact_F_Name, Contact_L_Name, Contact_Address_Street, Contact_Address_City, Contact_Address_State, Contact_Address_Zipcode, Contact_Phone, Date_Contacted, Consent_Form_Path)
  VALUES(1, 'Johnson Law', 'Larry', 'Johnson', '123 Main Street', 'Poughkeepsie', 'NY', 12601, 8457778888, '2016-08-01', 'Normal Consent Form Path');

INSERT INTO Consent_to_Release_Info(P_Num, Agency_Name, Contact_F_Name, Contact_L_Name, Contact_Address_Street, Contact_Address_City, Contact_Address_State, Contact_Address_Zipcode, Contact_Phone, Date_Contacted, Consent_Form_Path)
  VALUES(1, 'Drug Addicts Anon.', 'Stephanie', 'Norman', '456 Nodrugz Street', 'Poughkeepsie', 'NY', 12601, 8456738492, '2016-08-15', 'Normal Consent Form Path');
  
--Brad: record not in the DB--	
INSERT INTO Participant_Intake(P_Num, Age, Num_People_in_Home, Relation_to_Household, Daytime_Phone, Daytime_Msg, Evening_Phone,
 Date_of_Birth, Occupation, Religion, Ethnicity, Languages, Handicapping_cond, Last_Year_of_School, Drug_Alcohol_Issue, Drug_if_Yes_Comment,
  Length_Sep_From_Child, Length_Sep_From_Oth_Parent, Status_Relation_Oth_Parent, Parent_Together_Status, Involved_W_CPS, If_Yes_Prev_Involved_W_CPS,
   Mandated, If_Mandated_By_Who, If_Mandated_Why, If_Not_Mandated_Why, Safety_To_Participate_Needs, Behaviors_to_Stop_Part, Other_Parenting_Classes,
    Other_Parenting_Long_Ago, Victim_of_Abuse, If_Yes_Form_of_Abuse, Therapy, Issues_Related_to_Abuse, Emergency_Contact_F_Name,
     Emergency_Contact_L_Name, Emergency_Contact_Relation, Emergency_Contact_Number, What_Like_Learn, Domestic_Violence, Discussed_W_Someone,
      History_of_Violence, Nuclear_Family_Violence, Orders_of_Protection, If_Orders_of_Prot_Explain, Arrested_for_Crime, Convicted_for_Crime,
       If_Convicted_Explain, Prison_or_Jail_Record, If_Prison_or_Jail_when_what, Parole_or_Probation, If_Parole_Probation_Why,
        Other_Members_in_Parenting, If_Oth_Members_in_Parent)
	VALUES(4,25,5,'Father','5564313670','true','5564313670','1989-04-28','Construction Worker', 'Catholic','Caucasian','English','No Handicaps','Highschool', 'true','Alcoholic','2 months','2 months','Divorced','Not together', 'false' , 'false','true','police','Abusive to family members' , 'N/A','No safety to participate needs', 'Needs to stop sitting on children','No other parenting classes','No other parent long ago','true','verbal','false','none','Anger management','Casey','Anthony','Friend',8454248396,'Anger Management','true','true','true','true','true','Restraining order issued via police report','true','true','Child abuse charges','false','N/A','false','N/A','false','N/A'); 


-- Participant_Intake
INSERT INTO Participant_Intake(P_Num, Age, Num_People_in_Home, Relation_to_Household, Daytime_Phone, Daytime_Msg, Evening_Phone,
 Date_of_Birth, Occupation, Religion, Ethnicity, Languages, Handicapping_cond, Last_Year_of_School, Drug_Alcohol_Issue, Drug_if_Yes_Comment,
  Length_Sep_From_Child, Length_Sep_From_Oth_Parent, Status_Relation_Oth_Parent, Parent_Together_Status, Involved_W_CPS, If_Yes_Prev_Involved_W_CPS,
   Mandated, If_Mandated_By_Who, If_Mandated_Why, If_Not_Mandated_Why, Safety_To_Participate_Needs, Behaviors_to_Stop_Part, Other_Parenting_Classes,
    Other_Parenting_Long_Ago, Victim_of_Abuse, If_Yes_Form_of_Abuse, Therapy, Issues_Related_to_Abuse, Emergency_Contact_F_Name,
     Emergency_Contact_L_Name, Emergency_Contact_Relation, Emergency_Contact_Number, What_Like_Learn, Domestic_Violence, Discussed_W_Someone,
      History_of_Violence, Nuclear_Family_Violence, Orders_of_Protection, If_Orders_of_Prot_Explain, Arrested_for_Crime, Convicted_for_Crime,
       If_Convicted_Explain, Prison_or_Jail_Record, If_Prison_or_Jail_when_what, Parole_or_Probation, If_Parole_Probation_Why,
        Other_Members_in_Parenting, If_Oth_Members_in_Parent)
	VALUES(1, 40, 4, 'Father', '8453334444', 'true', '8451234567', '1976-10-15', 'Ironworker', 'Christian', 'Caucasian', 'English, Spanish', 'No Handicaps', 'Highschool', 'true', 'Cocaine Addiction', 'One Year', 'Two Years', 'Divorced', 'Not Together', 'false', 'false', 'true', 'Judge', 'Beat his children', 'N/A', 'No Safety to participate needs', 'Needs to not beat his kids', 'No other parenting classes', 'No other parent long ago', 'false', 'N/A', 'false', 'Drug addiction', 'Doug', 'Mitchell', 'Brother', '8456759283', 'How to control anger and not beat children', 'true', 'true', 'true', 'true', 'true', 'Judge ordered mandatory classes', 'true', 'true', 'Domestic Violence Charges', 'false', 'N/A', 'true', 'Beat children', 'false', 'N/A');


-- Intk_Children
INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(1, 'Dom', 'Islove', 17, 'R', 'M', 'Caucasian', '117 Spartan Lane', 'Halo', 'NJ', '07452', 'Cortana');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(1, 'Domma', 'Islove', 13, 'M', 'F', 'Caucasian', '117 Spartan Lane', 'Halo', 'NJ', '07452', 'Cortana');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(1, 'Cotty', 'Hills', 9, 'V', 'M', 'Caucasian', '117 Spartan Lane', 'Halo', 'NJ', '07452', 'Sgt. Johnson');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(2, 'Michael', 'Martin', 25, 'F', 'M', 'African American', '1337 NoScope Road', 'Poughkeepsie', 'NY', '12601', 'Mother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(2, 'Gina', 'Martin', 15, 'S', 'F', 'African American', '1337 NoScope Road', 'Poughkeepsie', 'NY', '12601', 'Mother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(3, 'Robb', 'Stark', 12, 'T', 'M', 'Hispanic', '123 Abc Lane', 'Glen Rock', 'NJ', '07562', 'Grandmother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(3, 'Tony', 'Stark', 16, 'W', 'M', 'Hispanic', '123 Abc Lane', 'Glen Rock', 'NJ', '07562', 'Grandmother');

--Brad: record not in the DB--	
INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(4, 'Bob','Barker',14,'L','M','Caucasian','124 Fleet street','London','NY','11111','mother');

INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(4, 'Benjamin','Barker',13,'D','M','Caucasian','124 Fleet street','London','NY','11111','mother');
	
INSERT INTO Intk_Children(P_Num, Ch_F_Name, Ch_L_Name, Ch_Age, Ch_M_Initial, Ch_Sex, Ch_Race, Ch_Address_Street, Ch_Address_City, Ch_Address_State, Ch_Address_Zipcode, Custody)
	VALUES(4, 'Sweeney','Todd',11,'D','M','Caucasian','124 Fleet street','London','NY','11111','mother');