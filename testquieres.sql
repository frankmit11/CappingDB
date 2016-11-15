-- Frank Query--
select Ref_F_Name, Condition_Description from referrals,reference_conditions, ref_indiv_condition where referrals.P_num = ref_indiv_condition.P_num and reference_conditions.condition_key = ref_indiv_condition.condition_key;  

-- Return the number of children under 18 a participant has
SELECT Count(*) FROM Intk_Children WHERE Intk_Children.P_Num = 1 AND Intk_Children.Ch_Age < 18;

-- Return the people who a participant gave consent to receive personal info
SELECT Consent_to_Release_Info.Agency_Name, Consent_to_Release_Info.Contact_F_Name, Consent_to_Release_Info.Contact_L_Name FROM Consent_to_Release_Info WHERE Consent_to_Release_Info.P_Num = 1;