/*Bugs **=supposedly fixed
**The tourism from the hermitage beleif if secondary religion isn't added
Tooltip stuff:
BuildingClassHappiness from secondary religion works but is not displayed in the tooltip on buildings (only in local happiness)
Extra yields from secondary religion aren't displayed on the buildings but works (it is displayed in the summary)
Extra culture for shrine temples isn't displayed
*/

/*OPENER*/
INSERT INTO Policy_BuildingClassYieldChanges
(PolicyType, BuildingClassType, YieldType, YieldChange) VALUES
('POLICY_PIETY', 'BUILDINGCLASS_PALACE', 'YIELD_FAITH', 1);

/*POLICY_ORGANIZED_RELIGION*/
INSERT INTO Policy_BuildingClassCultureChanges
(PolicyType, BuildingClassType, CultureChange) VALUES
('POLICY_ORGANIZED_RELIGION', 'BUILDINGCLASS_SHRINE', 1),
('POLICY_ORGANIZED_RELIGION', 'BUILDINGCLASS_TEMPLE', 1);

/*POLICY_THEOCRACY*/
/*INSERT INTO Policy_BuildingClassYieldModifiers
(PolicyType, BuildingClassType, YieldType, YieldMod) VALUES
('POLICY_THEOCRACY', 'BUILDINGCLASS_GRAND_TEMPLE', 'YIELD_GOLD', 25);*/
/*INSERT INTO Policy_BuildingClassYieldChanges
(PolicyType, BuildingClassType, YieldType, YieldChange) VALUES
('POLICY_THEOCRACY', 'BUILDINGCLASS_SHRINE', 'YIELD_GOLD', 1);
UPDATE Policy_BuildingClassYieldModifiers Set YieldMod=20 WHERE PolicyType='POLICY_THEOCRACY' AND BuildingClassType='BUILDINGCLASS_TEMPLE';*/
INSERT INTO Policy_BuildingClassYieldChanges
(PolicyType, BuildingClassType, YieldType, YieldChange) VALUES
('POLICY_THEOCRACY', 'BUILDINGCLASS_SHRINE', 'YIELD_GOLD', 2);
UPDATE Policy_BuildingClassYieldModifiers Set YieldMod=15 WHERE PolicyType='POLICY_THEOCRACY' AND BuildingClassType='BUILDINGCLASS_TEMPLE';

/*POLICY_FREE_RELIGION*/
UPDATE Policies SET SecondReligionPantheon=0 WHERE Type='POLICY_FREE_RELIGION';
UPDATE Policies SET ExtraHappinessForFollowingCity=1 WHERE Type='POLICY_FREE_RELIGION';

/*POLICY_REFORMATION*/
UPDATE Policies SET ProphetSpawnGoldenAgeBonusPerFollower=1 WHERE Type='POLICY_REFORMATION';
UPDATE Policies SET ProphetSpawnGoldBonusPerFollower=1 WHERE Type='POLICY_REFORMATION';
UPDATE Policies SET ProphetSpawnProductionBonusPerFollower=1 WHERE Type='POLICY_REFORMATION';

/*Finisher*/
UPDATE Policies SET SecondReligionPantheon=1 WHERE Type='POLICY_PIETY_FINISHER';
DELETE FROM Policy_ImprovementCultureChanges WHERE PolicyType='POLICY_PIETY_FINISHER';

/*Layout*/
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_THEOCRACY';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_REFORMATION';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_FREE_RELIGION';
UPDATE Policies SET GridX=3, GridY=1 where Type='POLICY_ORGANIZED_RELIGION';
UPDATE Policies SET GridX=3, GridY=2 where Type='POLICY_THEOCRACY';
UPDATE Policies SET GridX=5, GridY=1 where Type='POLICY_MANDATE_OF_HEAVEN';
UPDATE Policies SET GridX=3, GridY=3 where Type='POLICY_REFORMATION';
UPDATE Policies SET GridX=1, GridY=2 where Type='POLICY_FREE_RELIGION';

/*Prereqs*/
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_THEOCRACY',		'POLICY_ORGANIZED_RELIGION'),
('POLICY_FREE_RELIGION',		'POLICY_ORGANIZED_RELIGION'),
('POLICY_REFORMATION',		'POLICY_THEOCRACY'),
('POLICY_REFORMATION',		'POLICY_MANDATE_OF_HEAVEN');

/*Texts*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] is best for civilizations focused on religion.[NEWLINE][NEWLINE]Adopting Piety will grant +1[ICON_PEACE] Faith in the capital. It will also increase the production of Shrines and Temples by 100%. Unlocks Borobudur.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree will grant a free Prophet. It also give access to the pantheon and follower beliefs of the second most popular religion in your cities.' Where Tag='TXT_KEY_POLICY_BRANCH_PIETY_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Mandate of Heaven[ENDCOLOR][NEWLINE]Diminishes the cost by 20% on all purchases of religious units, buildings and Prophets with [ICON_PEACE] Faith.' Where Tag='TXT_KEY_POLICY_MANDATE_OF_HEAVEN_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Organized Religion[ENDCOLOR][NEWLINE]+1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from Shrines and Temples.' Where Tag='TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Religious Fervour[ENDCOLOR][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness from each city you own that follow your religion and from every 3 foreign cities that follow your religion.' Where Tag='TXT_KEY_POLICY_FREE_RELIGION_HELP';
Update Language_en_US Set Text='Religious Fervour' Where Tag='TXT_KEY_POLICY_FREE_RELIGION';
Update Language_en_US Set Text='Civilopedia Placeholder' Where Tag='TXT_KEY_POLICY_FREERELIGION_TEXT';
/*Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Theocracy[ENDCOLOR][NEWLINE]Holy Sites provide +3 [ICON_GOLD] Gold.[NEWLINE]Temples boost city [ICON_GOLD] Gold output by 20% and Shrines give +1 [ICON_GOLD].' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Theocracy[ENDCOLOR][NEWLINE]Holy Sites provide +3 [ICON_GOLD] Gold.[NEWLINE]Temples boost city [ICON_GOLD] Gold output by 15% and Shrines give +2 [ICON_GOLD].' 
Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Reformation[ENDCOLOR][NEWLINE]Every time a great Prophet is born, the capital receive a bonus in [ICON_GOLD] Gold, [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age points equal to the number of followers of this religion up to a maximum of 100. [NEWLINE]If you founded a religion, gain a bonus Reformation belief.' Where Tag='TXT_KEY_POLICY_REFORMATION_HELP';
INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_FREE_RELIGION_HEADER', 'Religious Fervour');

Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] is best for civilizations focused on religion.[NEWLINE][NEWLINE]Adopting Piety will grant +1[ICON_PEACE] Faith in the capital. It will also increase the production of Shrines and Temples by 100%. Unlocks Borobudur.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree will grant a free Prophet. It also give access to the pantheon and follower beliefs of the second most popular religion in your cities.' Where Tag='TXT_KEY_POLICY_BRANCH_PIETY_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Mandate of Heaven[ENDCOLOR][NEWLINE]Diminishes the cost by 20% on all purchases of religious units, buildings and Prophets with [ICON_PEACE] Faith.' Where Tag='TXT_KEY_POLICY_MANDATE_OF_HEAVEN_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Organized Religion[ENDCOLOR][NEWLINE]+1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from Shrines and Temples.' Where Tag='TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Religious Fervour[ENDCOLOR][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness from each city you own that follow your religion and from every 3 foreign cities that follow your religion.' Where Tag='TXT_KEY_POLICY_FREE_RELIGION_HELP';
Update Language_DE_DE Set Text='Religious Fervour' Where Tag='TXT_KEY_POLICY_FREE_RELIGION';
Update Language_DE_DE Set Text='Civilopedia Placeholder' Where Tag='TXT_KEY_POLICY_FREERELIGION_TEXT';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Theocracy[ENDCOLOR][NEWLINE]Holy Sites provide +3 [ICON_GOLD] Gold.[NEWLINE]Temples boost city [ICON_GOLD] Gold output by 20% and Shrines give +1 [ICON_GOLD].' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Reformation[ENDCOLOR][NEWLINE]Every time a great Prophet is born, the capital receive a bonus in [ICON_GOLD] Gold, [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age points equal to the number of followers of this religion up to a maximum of 100. [NEWLINE]If you founded a religion, gain a bonus Reformation belief.' Where Tag='TXT_KEY_POLICY_REFORMATION_HELP';
INSERT INTO Language_DE_DE
(Tag, Text) VALUES
('TXT_KEY_FREE_RELIGION_HEADER', 'Religious Fervour');

Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] is best for civilizations focused on religion.[NEWLINE][NEWLINE]Adopting Piety will grant +1[ICON_PEACE] Faith in the capital. It will also increase the production of Shrines and Temples by 100%. Unlocks Borobudur.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree will grant a free Prophet. It also give access to the pantheon and follower beliefs of the second most popular religion in your cities.' Where Tag='TXT_KEY_POLICY_BRANCH_PIETY_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Mandate of Heaven[ENDCOLOR][NEWLINE]Diminishes the cost by 20% on all purchases of religious units, buildings and Prophets with [ICON_PEACE] Faith.' Where Tag='TXT_KEY_POLICY_MANDATE_OF_HEAVEN_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Organized Religion[ENDCOLOR][NEWLINE]+1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from Shrines and Temples.' Where Tag='TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Religious Fervour[ENDCOLOR][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness from each city you own that follow your religion and from every 3 foreign cities that follow your religion.' Where Tag='TXT_KEY_POLICY_FREE_RELIGION_HELP';
Update Language_PL_PL Set Text='Religious Fervour' Where Tag='TXT_KEY_POLICY_FREE_RELIGION';
Update Language_PL_PL Set Text='Civilopedia Placeholder' Where Tag='TXT_KEY_POLICY_FREERELIGION_TEXT';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Theocracy[ENDCOLOR][NEWLINE]Holy Sites provide +3 [ICON_GOLD] Gold.[NEWLINE]Temples boost city [ICON_GOLD] Gold output by 20% and Shrines give +1 [ICON_GOLD].' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Reformation[ENDCOLOR][NEWLINE]Every time a great Prophet is born, the capital receive a bonus in [ICON_GOLD] Gold, [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age points equal to the number of followers of this religion up to a maximum of 100. [NEWLINE]If you founded a religion, gain a bonus Reformation belief.' Where Tag='TXT_KEY_POLICY_REFORMATION_HELP';
INSERT INTO Language_PL_PL
(Tag, Text) VALUES
('TXT_KEY_FREE_RELIGION_HEADER', 'Religious Fervour');