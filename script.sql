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



