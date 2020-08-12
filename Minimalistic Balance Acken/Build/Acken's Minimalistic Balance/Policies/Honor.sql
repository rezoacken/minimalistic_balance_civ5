/*OPENER*/
UPDATE Policies SET CultureFromKills=50, CultureFromBarbarianKills=0 WHERE Type='POLICY_HONOR';

/*Professional Army*/
UPDATE Policy_BuildingClassProductionModifiers SET ProductionModifier=100 WHERE PolicyType='POLICY_PROFESSIONAL_ARMY';

/*Warrior Code*/
UPDATE Policies SET BaseFreeUnits=2 WHERE Type='POLICY_WARRIOR_CODE';
DELETE FROM Policy_UnitCombatProductionModifiers WHERE PolicyType='POLICY_WARRIOR_CODE';
DELETE FROM Policy_FreeUnitClasses WHERE PolicyType='POLICY_WARRIOR_CODE';
INSERT INTO Policy_FreeUnitClasses
(PolicyType, UnitClassType, Count) VALUES
('POLICY_WARRIOR_CODE', 'UNITCLASS_WARRIOR', 2);

/*DISCIPLINE*/
UPDATE Policies SET ExpModifier=50 WHERE Type='POLICY_DISCIPLINE';

/*MILITARY_TRADITION*/
UPDATE Policies SET ExpModifier=0 WHERE Type='POLICY_MILITARY_TRADITION';
UPDATE Policies Set MilitaryProductionModifier=15 WHERE Type='POLICY_MILITARY_TRADITION';
UPDATE Policies SET IncludesOneShotFreeUnits=1 WHERE Type='POLICY_MILITARY_TRADITION';
INSERT INTO Policy_FreeUnitClasses
(PolicyType, UnitClassType, Count) VALUES
('POLICY_MILITARY_TRADITION', 'UNITCLASS_GREAT_GENERAL', 1);
INSERT INTO Policy_BuildingClassHappiness
(PolicyType, BuildingClassType, Happiness) VALUES
('POLICY_MILITARY_TRADITION', 'BUILDINGCLASS_HEROIC_EPIC', 4);

/*Military caste*/
UPDATE Policies SET CulturePerGarrisonedUnit=0 WHERE Type='POLICY_MILITARY_CASTE';
UPDATE Policies SET HappinessPerGarrisonedUnit=0 WHERE Type='POLICY_MILITARY_CASTE';
INSERT INTO Policy_BuildingClassCultureChanges
(PolicyType, BuildingClassType, CultureChange) VALUES
('POLICY_MILITARY_CASTE', 'BUILDINGCLASS_BARRACKS', 2);
INSERT INTO Policy_BuildingClassHappiness
(PolicyType, BuildingClassType, Happiness) VALUES
('POLICY_MILITARY_CASTE', 'BUILDINGCLASS_BARRACKS', 1);

/*Finisher*/
INSERT INTO Policy_BuildingClassProductionModifiers
(PolicyType, BuildingClassType, ProductionModifier) VALUES
('POLICY_HONOR_FINISHER', 'BUILDINGCLASS_COURTHOUSE', 50);

/*Layout*/
UPDATE Policies SET GridX=2, GridY=1 where Type='POLICY_PROFESSIONAL_ARMY';
UPDATE Policies SET GridX=2, GridY=2 where Type='POLICY_MILITARY_CASTE';
UPDATE Policies SET GridX=4, GridY=1 where Type='POLICY_WARRIOR_CODE';
UPDATE Policies SET GridX=4, GridY=2 where Type='POLICY_DISCIPLINE';
UPDATE Policies SET GridX=3, GridY=3 where Type='POLICY_MILITARY_TRADITION';

/*Prereqs*/
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_PROFESSIONAL_ARMY';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_MILITARY_CASTE';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_MILITARY_TRADITION';
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_DISCIPLINE',		'POLICY_WARRIOR_CODE'),
('POLICY_MILITARY_CASTE',		'POLICY_PROFESSIONAL_ARMY'),
('POLICY_MILITARY_TRADITION',		'POLICY_DISCIPLINE'),
('POLICY_MILITARY_TRADITION',		'POLICY_MILITARY_CASTE');

/*Texts*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Honor[ENDCOLOR] is best for agressive and militaristic civilizations. It unlocks the Statue of Zeus.[NEWLINE][NEWLINE]Adopting Honor will grant [ICON_CULTURE] when destroying enemy units (50% of [ICON_STRENGTH]). It will also periodically reveal barbarian camps and boost strength against barbarians by 33%.[NEWLINE][NEWLINE]Adopting all Policies in the Honor tree will grant gold when killing units and boosts the production of Courthouses by 50%. It also allows the purchase of Great Generals with [ICON_PEACE] Faith starting in the Industrial Era.' Where Tag='TXT_KEY_POLICY_BRANCH_HONOR_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Professional Army[ENDCOLOR][NEWLINE]Barracks, Armories, and Military Academies production is doubled and upgrading units costs 33% less [ICON_GOLD] gold.' Where Tag='TXT_KEY_POLICY_PROFESSIONAL_ARMY_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Military Caste[ENDCOLOR][NEWLINE]Barracks now give +1 [ICON_HAPPINESS_1] Happiness, and +2 [ICON_CULTURE] Culture.' Where Tag='TXT_KEY_POLICY_MILITARY_CASTE_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Warrior Code[ENDCOLOR][NEWLINE]Receive 2 warriors and 2 units cost no maintenance. General points are increased by 50%.' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Discipline[ENDCOLOR][NEWLINE]+15% [ICON_STRENGTH] combat strength for melee Units next to military units. Military units also gain 50% more Experience from combat.' Where Tag='TXT_KEY_POLICY_DISCIPLINE_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Get 15% more [ICON_PRODUCTION] Production toward military units and the Heroic Epic gives +4 [ICON_HAPPINESS_1] Happiness. You also receive a free Great General.' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';

Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Honor[ENDCOLOR] is best for agressive and militaristic civilizations. It unlocks the Statue of Zeus.[NEWLINE][NEWLINE]Adopting Honor will grant [ICON_CULTURE] when destroying enemy units (50% of [ICON_STRENGTH]). It will also periodically reveal barbarian camps and boost strength against barbarians by 33%.[NEWLINE][NEWLINE]Adopting all Policies in the Honor tree will grant gold when killing units and boosts the production of Courthouses by 50%. It also allows the purchase of Great Generals with [ICON_PEACE] Faith starting in the Industrial Era.' Where Tag='TXT_KEY_POLICY_BRANCH_HONOR_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Professional Army[ENDCOLOR][NEWLINE]Barracks, Armories, and Military Academies production is doubled and upgrading units costs 33% less [ICON_GOLD] gold.' Where Tag='TXT_KEY_POLICY_PROFESSIONAL_ARMY_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Military Caste[ENDCOLOR][NEWLINE]Barracks now give +1 [ICON_HAPPINESS_1] Happiness, and +2 [ICON_CULTURE] Culture.' Where Tag='TXT_KEY_POLICY_MILITARY_CASTE_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Warrior Code[ENDCOLOR][NEWLINE]Receive 2 warriors and 2 units cost no maintenance. General points are increased by 50%.' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Discipline[ENDCOLOR][NEWLINE]+15% [ICON_STRENGTH] combat strength for melee Units next to military units. Military units also gain 50% more Experience from combat.' Where Tag='TXT_KEY_POLICY_DISCIPLINE_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Get 15% more [ICON_PRODUCTION] Production toward military units and the Heroic Epic gives +4 [ICON_HAPPINESS_1] Happiness. You also receive a free Great General.' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';

Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Honor[ENDCOLOR] is best for agressive and militaristic civilizations. It unlocks the Statue of Zeus.[NEWLINE][NEWLINE]Adopting Honor will grant [ICON_CULTURE] when destroying enemy units (50% of [ICON_STRENGTH]). It will also periodically reveal barbarian camps and boost strength against barbarians by 33%.[NEWLINE][NEWLINE]Adopting all Policies in the Honor tree will grant gold when killing units and boosts the production of Courthouses by 50%. It also allows the purchase of Great Generals with [ICON_PEACE] Faith starting in the Industrial Era.' Where Tag='TXT_KEY_POLICY_BRANCH_HONOR_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Professional Army[ENDCOLOR][NEWLINE]Barracks, Armories, and Military Academies production is doubled and upgrading units costs 33% less [ICON_GOLD] gold.' Where Tag='TXT_KEY_POLICY_PROFESSIONAL_ARMY_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Military Caste[ENDCOLOR][NEWLINE]Barracks now give +1 [ICON_HAPPINESS_1] Happiness, and +2 [ICON_CULTURE] Culture.' Where Tag='TXT_KEY_POLICY_MILITARY_CASTE_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Warrior Code[ENDCOLOR][NEWLINE]Receive 2 warriors and 2 units cost no maintenance. General points are increased by 50%.' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Discipline[ENDCOLOR][NEWLINE]+15% [ICON_STRENGTH] combat strength for melee Units next to military units. Military units also gain 50% more Experience from combat.' Where Tag='TXT_KEY_POLICY_DISCIPLINE_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Get 15% more [ICON_PRODUCTION] Production toward military units and the Heroic Epic gives +4 [ICON_HAPPINESS_1] Happiness. You also receive a free Great General.' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';