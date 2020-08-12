/*Bugs **=supposedly fixed*/
/*OPENER*/

/*POLICY_CULTURAL_CENTERS*/
INSERT INTO Policy_UnitCombatProductionModifiers
(PolicyType, UnitCombatType, ProductionModifier) VALUES
('POLICY_CULTURAL_CENTERS','UNITCOMBAT_ARCHAEOLOGIST',50);
INSERT INTO UnitCombatInfos
(Type, Description) VALUES
('UNITCOMBAT_ARCHAEOLOGIST','TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');
UPDATE Units SET CombatClass='UNITCOMBAT_ARCHAEOLOGIST' WHERE Class='UNITCLASS_ARCHAEOLOGIST';

/*POLICY_FLOURISHING_OF_ARTS*/

/*POLICY_FINE_ARTS*/
/*UPDATE Policies Set HappinessToCulture='50' WHERE Type='POLICY_AESTHETICS';*/
INSERT INTO Policy_BuildingClassYieldChanges
(PolicyType, BuildingClassType, YieldType, YieldChange) VALUES
('POLICY_FINE_ARTS', 'BUILDINGCLASS_AMPHITHEATER', 'YIELD_TOURISM', 1),
('POLICY_FINE_ARTS', 'BUILDINGCLASS_OPERA_HOUSE', 'YIELD_TOURISM', 1),
('POLICY_FINE_ARTS', 'BUILDINGCLASS_MUSEUM', 'YIELD_TOURISM', 1),
('POLICY_FINE_ARTS', 'BUILDINGCLASS_BROADCAST_TOWER', 'YIELD_TOURISM', 1);
/*ALTER TABLE Policies ADD COLUMN 'BonusTourismWonder' integer default 0;
UPDATE Policies SET BonusTourismWonder=2 WHERE Type='POLICY_FINE_ARTS';*/

/*POLICY_ARTISTIC_GENIUS*/
INSERT INTO Policy_GreatWorkYieldChanges
(PolicyType, YieldType, Yield) VALUES
('POLICY_ARTISTIC_GENIUS', 'YIELD_TOURISM', 1);

/*POLICY_ETHICS*/

/*Finisher POLICY_AESTHETICS_FINISHER*/
UPDATE Resources SET PolicyReveal='POLICY_AESTHETICS_FINISHER' WHERE Type='RESOURCE_HIDDEN_ARTIFACTS';

/*Layout*/
UPDATE Policies SET GridX=2, GridY=1 where Type='POLICY_CULTURAL_CENTERS';
UPDATE Policies SET GridX=4, GridY=1 where Type='POLICY_FLOURISHING_OF_ARTS';
UPDATE Policies SET GridX=2, GridY=2 where Type='POLICY_FINE_ARTS';
UPDATE Policies SET GridX=4, GridY=2 where Type='POLICY_ARTISTIC_GENIUS';
UPDATE Policies SET GridX=2, GridY=3 where Type='POLICY_ETHICS';

/*Prereqs*/
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_FLOURISHING_OF_ARTS';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_ARTISTIC_GENIUS';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_ETHICS';
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_ARTISTIC_GENIUS',		'POLICY_FLOURISHING_OF_ARTS'),
('POLICY_ARTISTIC_GENIUS',		'POLICY_CULTURAL_CENTERS'),
('POLICY_FINE_ARTS',		'POLICY_CULTURAL_CENTERS'),
('POLICY_ETHICS',		'POLICY_FINE_ARTS');

/*Texts*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Aesthetics[ENDCOLOR] improves the civilization ability to generate [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Adopting Aesthetics allows you to earn Great Writers, Artists, and Musicians 25% faster. Unlocks the Uffizi Wonder.[NEWLINE][NEWLINE]Adopting all policies doubles the theming bonus from Museums and Wonders. The finisher also reveals Hidden Antiquity Sites and allows you to buy Great Musicians with [ICON_PEACE] Faith in the industrial era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Flourishing of the Arts[ENDCOLOR][NEWLINE][ICON_CULTURE] Culture increased by 33% in all cities which have built a World Wonder and the empire immediately enters a [ICON_GOLDEN_AGE] Golden Age.' 
Where Tag='TXT_KEY_POLICY_FLOURISHING_OF_ARTS_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Cultural Centers[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers are built 50% faster as well as Archaeologists.' 
Where Tag='TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';
/*Update Language_en_US Set Text='' 
Where Tag='TXT_KEY_POLICY_ETHICS_HELP';*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Artistic Genius[ENDCOLOR][NEWLINE]A Great Artist appear and all Great Works give +1[ICON_TOURISM] Tourism.' 
Where Tag='TXT_KEY_POLICY_ARTISTIC_GENIUS_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Fine Arts[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers now provide +1[ICON_TOURISM] Tourism.  Also receive 50% of your excess [ICON_HAPPINESS_1] Happiness in [ICON_CULTURE] Culture' 
Where Tag='TXT_KEY_POLICY_FINE_ARTS_HELP';
Update Language_en_US Set Text='Archaeologist Units' 
Where Tag='TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST';

Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Aesthetics[ENDCOLOR] improves the civilization ability to generate [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Adopting Aesthetics allows you to earn Great Writers, Artists, and Musicians 25% faster. Unlocks the Uffizi Wonder.[NEWLINE][NEWLINE]Adopting all policies doubles the theming bonus from Museums and Wonders. The finisher also reveals Hidden Antiquity Sites and allows you to buy Great Musicians with [ICON_PEACE] Faith in the industrial era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Flourishing of the Arts[ENDCOLOR][NEWLINE][ICON_CULTURE] Culture increased by 33% in all cities which have built a World Wonder and the empire immediately enters a [ICON_GOLDEN_AGE] Golden Age.' 
Where Tag='TXT_KEY_POLICY_FLOURISHING_OF_ARTS_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Cultural Centers[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers are built 50% faster as well as Archaeologists.' 
Where Tag='TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';
/*Update Language_DE_DE Set Text='' 
Where Tag='TXT_KEY_POLICY_ETHICS_HELP';*/
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Artistic Genius[ENDCOLOR][NEWLINE]A Great Artist appear and all Great Works give +1[ICON_TOURISM] Tourism.' 
Where Tag='TXT_KEY_POLICY_ARTISTIC_GENIUS_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Fine Arts[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers now provide +1[ICON_TOURISM] Tourism.  Also receive 50% of your excess [ICON_HAPPINESS_1] Happiness in [ICON_CULTURE] Culture' 
Where Tag='TXT_KEY_POLICY_FINE_ARTS_HELP';
Update Language_DE_DE Set Text='Archaeologist Units' 
Where Tag='TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST';

Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Aesthetics[ENDCOLOR] improves the civilization ability to generate [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Adopting Aesthetics allows you to earn Great Writers, Artists, and Musicians 25% faster. Unlocks the Uffizi Wonder.[NEWLINE][NEWLINE]Adopting all policies doubles the theming bonus from Museums and Wonders. The finisher also reveals Hidden Antiquity Sites and allows you to buy Great Musicians with [ICON_PEACE] Faith in the industrial era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Flourishing of the Arts[ENDCOLOR][NEWLINE][ICON_CULTURE] Culture increased by 33% in all cities which have built a World Wonder and the empire immediately enters a [ICON_GOLDEN_AGE] Golden Age.' 
Where Tag='TXT_KEY_POLICY_FLOURISHING_OF_ARTS_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Cultural Centers[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers are built 50% faster as well as Archaeologists.' 
Where Tag='TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';
/*Update Language_PL_PL Set Text='' 
Where Tag='TXT_KEY_POLICY_ETHICS_HELP';*/
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Artistic Genius[ENDCOLOR][NEWLINE]A Great Artist appear and all Great Works give +1[ICON_TOURISM] Tourism.' 
Where Tag='TXT_KEY_POLICY_ARTISTIC_GENIUS_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Fine Arts[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers now provide +1[ICON_TOURISM] Tourism.  Also receive 50% of your excess [ICON_HAPPINESS_1] Happiness in [ICON_CULTURE] Culture' 
Where Tag='TXT_KEY_POLICY_FINE_ARTS_HELP';
Update Language_PL_PL Set Text='Archaeologist Units' 
Where Tag='TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST';

