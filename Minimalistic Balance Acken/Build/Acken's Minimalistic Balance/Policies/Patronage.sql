/*Bugs **=supposedly fixed*/
/*The finisher doesn't seem to work for all yields (food)*/
/*OPENER*/

/*POLICY_PHILANTHROPY*/

/*POLICY_CONSULATES*/
UPDATE Policies SET AdditionalPersonalQuest=1 WHERE Type='POLICY_CONSULATES';
UPDATE Policies SET MinorFriendshipMinimum=15 WHERE Type='POLICY_CONSULATES';

/*POLICY_SCHOLASTICISM*/
/*Right now scholasticism yields are hardcoded*/
/*2 per era*/
INSERT INTO Policy_YieldChangePerMinorTradeRoute
(PolicyType, YieldType, Yield) VALUES
('POLICY_SCHOLASTICISM', 'YIELD_SCIENCE', 3);

/*POLICY_CULTURAL_DIPLOMACY*/

/*POLICY_MERCHANT_CONFEDERACY*/
UPDATE Policies SET ProtectedMinorPerTurnInfluence=100 WHERE Type='POLICY_MERCHANT_CONFEDERACY';
UPDATE Policies SET CityStateTradeChange=400 WHERE Type='POLICY_MERCHANT_CONFEDERACY';
INSERT INTO Policy_YieldChangePerMinorTradeRoute
(PolicyType, YieldType, Yield) VALUES
('POLICY_MERCHANT_CONFEDERACY', 'YIELD_CULTURE', 3);

/*Finisher POLICY_PATRONAGE_FINISHER*/
UPDATE Policies SET FasterPersonalQuest=1 WHERE Type='POLICY_PATRONAGE_FINISHER';
/*ALTER TABLE Policies ADD COLUMN 'BonusMinorYield' integer default 0;
UPDATE Policies SET BonusMinorYield=30 WHERE Type='POLICY_PATRONAGE_FINISHER';*/

/*Layout*/
UPDATE Policies SET GridX=2, GridY=1 where Type='POLICY_PHILANTHROPY';
UPDATE Policies SET GridX=4, GridY=1 where Type='POLICY_CONSULATES';
UPDATE Policies SET GridX=2, GridY=3 where Type='POLICY_SCHOLASTICISM';
UPDATE Policies SET GridX=4, GridY=2 where Type='POLICY_CULTURAL_DIPLOMACY';
UPDATE Policies SET GridX=4, GridY=3 where Type='POLICY_MERCHANT_CONFEDERACY';

/*Prereqs*/
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_CULTURAL_DIPLOMACY';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_MERCHANT_CONFEDERACY';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_SCHOLASTICISM';
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_CULTURAL_DIPLOMACY',		'POLICY_CONSULATES'),
('POLICY_SCHOLASTICISM',		'POLICY_PHILANTHROPY'),
/*('POLICY_MERCHANT_CONFEDERACY',		'POLICY_PHILANTHROPY'),*/
('POLICY_MERCHANT_CONFEDERACY',		'POLICY_CULTURAL_DIPLOMACY');

/*Texts*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause all [COLOR_POSITIVE_TEXT]Allied[ENDCOLOR] City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. City-State will also give personal quests twice as fast.' 
Where Tag='TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Philanthropy[ENDCOLOR][NEWLINE][ICON_GOLD] Gold gifts to City-States produce 25% more [ICON_INFLUENCE] Influence.' 
Where Tag='TXT_KEY_POLICY_PHILANTHROPY_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Scholasticism[ENDCOLOR][NEWLINE]All allied City-States provide bonus [ICON_RESEARCH] Science per turn based on your current Era. Trade routes to City-States now also give 3 science.' 
Where Tag='TXT_KEY_POLICY_SCHOLASTICISM_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Merchant Confederacy[ENDCOLOR][NEWLINE]+4 [ICON_GOLD] Gold, and +3 [ICON_CULTURE] Culture from every trade routes to city states. You also generate +1 [ICON_INFLUENCE] Influence per turn with City-States you sent a trade route to.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_CONFEDERACY_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Consulates[ENDCOLOR][NEWLINE]Get 15 [ICON_INFLUENCE] resting points with every City-States. You can also now receive one more personal quest.' 
Where Tag='TXT_KEY_POLICY_CONSULATES_HELP';

Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause all [COLOR_POSITIVE_TEXT]Allied[ENDCOLOR] City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. City-State will also give personal quests twice as fast.' 
Where Tag='TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Philanthropy[ENDCOLOR][NEWLINE][ICON_GOLD] Gold gifts to City-States produce 25% more [ICON_INFLUENCE] Influence.' 
Where Tag='TXT_KEY_POLICY_PHILANTHROPY_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Scholasticism[ENDCOLOR][NEWLINE]All allied City-States provide bonus [ICON_RESEARCH] Science per turn based on your current Era. Trade routes to City-States now also give 3 science.' 
Where Tag='TXT_KEY_POLICY_SCHOLASTICISM_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Merchant Confederacy[ENDCOLOR][NEWLINE]+4 [ICON_GOLD] Gold, and +3 [ICON_CULTURE] Culture from every trade routes to city states. You also generate +1 [ICON_INFLUENCE] Influence per turn with City-States you sent a trade route to.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_CONFEDERACY_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Consulates[ENDCOLOR][NEWLINE]Get 15 [ICON_INFLUENCE] resting points with every City-States. You can also now receive one more personal quest.' 
Where Tag='TXT_KEY_POLICY_CONSULATES_HELP';


Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause all [COLOR_POSITIVE_TEXT]Allied[ENDCOLOR] City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. City-State will also give personal quests twice as fast.' 
Where Tag='TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Philanthropy[ENDCOLOR][NEWLINE][ICON_GOLD] Gold gifts to City-States produce 25% more [ICON_INFLUENCE] Influence.' 
Where Tag='TXT_KEY_POLICY_PHILANTHROPY_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Scholasticism[ENDCOLOR][NEWLINE]All allied City-States provide bonus [ICON_RESEARCH] Science per turn based on your current Era. Trade routes to City-States now also give 3 science.' 
Where Tag='TXT_KEY_POLICY_SCHOLASTICISM_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Merchant Confederacy[ENDCOLOR][NEWLINE]+4 [ICON_GOLD] Gold, and +3 [ICON_CULTURE] Culture from every trade routes to city states. You also generate +1 [ICON_INFLUENCE] Influence per turn with City-States you sent a trade route to.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_CONFEDERACY_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Consulates[ENDCOLOR][NEWLINE]Get 15 [ICON_INFLUENCE] resting points with every City-States. You can also now receive one more personal quest.' 
Where Tag='TXT_KEY_POLICY_CONSULATES_HELP';



