UPDATE PolicyBranchTypes SET EraPreReq='ERA_INDUSTRIAL' WHERE Type='POLICY_BRANCH_RATIONALISM';

/*Changes*/
UPDATE Policy_SpecialistExtraYields Set Yield=1 where PolicyType='POLICY_SECULARISM' AND YieldType='YIELD_SCIENCE';
INSERT INTO Policy_ImprovementYieldChanges
(PolicyType, ImprovementType, YieldType, Yield) VALUES
('POLICY_SECULARISM', 'IMPROVEMENT_ACADEMY', 'YIELD_SCIENCE', 2),
('POLICY_SECULARISM', 'IMPROVEMENT_CUSTOMS_HOUSE', 'YIELD_SCIENCE', 2),
('POLICY_SECULARISM', 'IMPROVEMENT_MANUFACTORY', 'YIELD_SCIENCE', 2),
('POLICY_SECULARISM', 'IMPROVEMENT_CITADEL', 'YIELD_SCIENCE', 2),
('POLICY_SECULARISM', 'IMPROVEMENT_HOLY_SITE', 'YIELD_SCIENCE', 2);

UPDATE Policies Set HappinessToScience=0, GreatScientistRateModifier=25 where Type='POLICY_RATIONALISM';
UPDATE Policies Set HappinessToScience=10, GreatScientistRateModifier=0 where Type='POLICY_HUMANISM';
INSERT INTO Policy_BuildingClassYieldChanges
(PolicyType, BuildingClassType, YieldType, YieldChange) VALUES
('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_LIBRARY', 'YIELD_PRODUCTION', 1),
('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_UNIVERSITY', 'YIELD_PRODUCTION', 1),
('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_PUBLIC_SCHOOL', 'YIELD_PRODUCTION', 1),
('POLICY_SOVEREIGNTY', 'BUILDINGCLASS_LABORATORY', 'YIELD_PRODUCTION', 1);

/*Free Thought v4 +7 Oxford University, No longer trade post bonus*/
DELETE FROM Policy_ImprovementYieldChanges WHERE PolicyType='POLICY_FREE_THOUGHT';
INSERT INTO Policy_BuildingClassYieldChanges
(PolicyType, BuildingClassType, YieldType, YieldChange) VALUES
('POLICY_FREE_THOUGHT', 'BUILDINGCLASS_OXFORD_UNIVERSITY', 'YIELD_SCIENCE', 7);

/*Layout*/
UPDATE Policies Set GridX=3, GridY=1 where Type='POLICY_SOVEREIGNTY';
UPDATE Policies Set GridX=2, GridY=2 where Type='POLICY_FREE_THOUGHT';
UPDATE Policies Set GridX=5, GridY=1 where Type='POLICY_SECULARISM';
UPDATE Policies Set GridX=4, GridY=2 where Type='POLICY_HUMANISM';
UPDATE Policies Set GridX=1, GridY=1 where Type='POLICY_SCIENTIFIC_REVOLUTION';

/*Requirement logic*/
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_SCIENTIFIC_REVOLUTION';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_SOVEREIGNTY';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_FREE_THOUGHT';
INSERT INTO Policy_PrereqPolicies 
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_FREE_THOUGHT',		'POLICY_SOVEREIGNTY'),
('POLICY_HUMANISM',		'POLICY_SOVEREIGNTY'),
('POLICY_HUMANISM',		'POLICY_SECULARISM');

/*Texts*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Rationalism[ENDCOLOR] improves the ability to use and generate [ICON_RESEARCH] Science. Unlocks Porcelain Tower.[NEWLINE][NEWLINE]Adopting Rationalism allows you to earn Great Scientists 25% faster. Unlocks building the Porcelain Tower.[NEWLINE][NEWLINE]Adopting all Policies in the Rationalism tree will grant a free technology. It also allows the purchase of Great Scientists with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Humanism[ENDCOLOR][NEWLINE]+10% [ICON_RESEARCH] Science while the empire is [ICON_HAPPINESS_1] Happy.' 
Where Tag='TXT_KEY_POLICY_HUMANISM_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Secularism[ENDCOLOR][NEWLINE]+1 [ICON_RESEARCH] Science from every Specialist and +2 [ICON_RESEARCH] for Great Person Improvements.' 
Where Tag='TXT_KEY_POLICY_SECULARISM_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Free Thought[ENDCOLOR][NEWLINE]+17%[ICON_RESEARCH] to Universities and +7 [ICON_RESEARCH] Science for Oxford University.' 
Where Tag='TXT_KEY_POLICY_FREE_THOUGHT_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Sovereignty[ENDCOLOR][NEWLINE]+1[ICON_GOLD] and +1[ICON_PRODUCTION] Production for every science building.' 
Where Tag='TXT_KEY_POLICY_SOVEREIGNTY_HELP';

Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Rationalism[ENDCOLOR] improves the ability to use and generate [ICON_RESEARCH] Science. Unlocks Porcelain Tower.[NEWLINE][NEWLINE]Adopting Rationalism allows you to earn Great Scientists 25% faster. Unlocks building the Porcelain Tower.[NEWLINE][NEWLINE]Adopting all Policies in the Rationalism tree will grant a free technology. It also allows the purchase of Great Scientists with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Humanism[ENDCOLOR][NEWLINE]+10% [ICON_RESEARCH] Science while the empire is [ICON_HAPPINESS_1] Happy.' 
Where Tag='TXT_KEY_POLICY_HUMANISM_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Secularism[ENDCOLOR][NEWLINE]+1 [ICON_RESEARCH] Science from every Specialist and +2 [ICON_RESEARCH] for Great Person Improvements.' 
Where Tag='TXT_KEY_POLICY_SECULARISM_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Free Thought[ENDCOLOR][NEWLINE]+17%[ICON_RESEARCH] to Universities and +7 [ICON_RESEARCH] Science for Oxford University.' 
Where Tag='TXT_KEY_POLICY_FREE_THOUGHT_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Sovereignty[ENDCOLOR][NEWLINE]+1[ICON_GOLD] and +1[ICON_PRODUCTION] Production for every science building.' 
Where Tag='TXT_KEY_POLICY_SOVEREIGNTY_HELP';


Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Rationalism[ENDCOLOR] improves the ability to use and generate [ICON_RESEARCH] Science. Unlocks Porcelain Tower.[NEWLINE][NEWLINE]Adopting Rationalism allows you to earn Great Scientists 25% faster. Unlocks building the Porcelain Tower.[NEWLINE][NEWLINE]Adopting all Policies in the Rationalism tree will grant a free technology. It also allows the purchase of Great Scientists with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Humanism[ENDCOLOR][NEWLINE]+10% [ICON_RESEARCH] Science while the empire is [ICON_HAPPINESS_1] Happy.' 
Where Tag='TXT_KEY_POLICY_HUMANISM_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Secularism[ENDCOLOR][NEWLINE]+1 [ICON_RESEARCH] Science from every Specialist and +2 [ICON_RESEARCH] for Great Person Improvements.' 
Where Tag='TXT_KEY_POLICY_SECULARISM_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Free Thought[ENDCOLOR][NEWLINE]+17%[ICON_RESEARCH] to Universities and +7 [ICON_RESEARCH] Science for Oxford University.' 
Where Tag='TXT_KEY_POLICY_FREE_THOUGHT_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Sovereignty[ENDCOLOR][NEWLINE]+1[ICON_GOLD] and +1[ICON_PRODUCTION] Production for every science building.' 
Where Tag='TXT_KEY_POLICY_SOVEREIGNTY_HELP';