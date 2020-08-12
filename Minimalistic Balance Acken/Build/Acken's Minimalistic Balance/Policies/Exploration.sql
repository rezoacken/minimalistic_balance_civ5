/*Bugs **=supposedly fixed*/
/*POLICY_EXPLORATION*/
UPDATE Policies SET EmbarkedExtraMoves=1 WHERE Type='POLICY_EXPLORATION';

/*POLICY_MARITIME_INFRASTRUCTURE*/

/*POLICY_NAVAL_TRADITION*/
INSERT INTO Policy_BuildingClassProductionModifiers
(PolicyType, BuildingClassType, ProductionModifier) VALUES
('POLICY_NAVAL_TRADITION', 'BUILDINGCLASS_LIGHTHOUSE', 50),
('POLICY_NAVAL_TRADITION', 'BUILDINGCLASS_HARBOR', 50),
('POLICY_NAVAL_TRADITION', 'BUILDINGCLASS_SEAPORT', 50);

/*POLICY_MERCHANT_NAVY*/
UPDATE Policy_BuildingClassYieldChanges SET YieldChange=2 WHERE PolicyType='POLICY_MERCHANT_NAVY' AND YieldType='YIELD_GOLD';

/*POLICY_NAVIGATION_SCHOOL*/
UPDATE Policies SET IncludesOneShotFreeUnits=0, GreatAdmiralRateModifier=0 WHERE Type='POLICY_NAVIGATION_SCHOOL';
UPDATE Policies SET NewCityExtraPopulation=1 Where Type='POLICY_NAVIGATION_SCHOOL';
INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_BUILDING_GOVERNORS_MANSION_DESC','Governor''s Mansion'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_PEDIA','A Governor''s Mansion is automatically constructed in every newly founded city after you have adopted the Colonies social policy.'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_STRATEGY','Founding a new city when you have adopted Colonies will give that city an additional 1 [ICON_CITIZEN] Population and 1 [ICON_HAPPINESS_1] Happiness as well as a Free Worker.');

/*POLICY_TREASURE_FLEETS*/
UPDATE Policies Set SeaTradeRouteGoldChange=0 WHERE Type='POLICY_TREASURE_FLEETS';
INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_BUILDING_TREASURE_FLEETS_DESC','Warehouse'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_PEDIA','A Warehouse is automatically constructed in every city after you have adopted the Treasure Fleets social policy.'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_STRATEGY','Provides +1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from all Coast and Ocean tiles without sea resources.');
/*
UPDATE Policies Set SeaTradeRouteGoldChange=300 WHERE Type='POLICY_TREASURE_FLEETS';
INSERT INTO Policy_YieldChangePerSeaInternationalTradeRoute
(PolicyType, YieldType, Yield) VALUES
('POLICY_TREASURE_FLEETS', 'YIELD_CULTURE', 2),
('POLICY_TREASURE_FLEETS', 'YIELD_SCIENCE', 4);
*/

/*Finisher POLICY_EXPLORATION_FINISHER*/
UPDATE Policies SET IncludesOneShotFreeUnits=1, GreatAdmiralRateModifier=50 WHERE Type='POLICY_EXPLORATION_FINISHER';
UPDATE Policy_FreePromotions SET PolicyType = 'POLICY_EXPLORATION_FINISHER' WHERE PromotionType='PROMOTION_FAST_ADMIRAL';
UPDATE Policy_FreeUnitClasses SET PolicyType = 'POLICY_EXPLORATION_FINISHER' WHERE UnitClassType='UNITCLASS_GREAT_ADMIRAL';
INSERT INTO Policy_FreePromotions
(PolicyType, PromotionType) VALUES
('POLICY_EXPLORATION_FINISHER','PROMOTION_EXPLORATION_FINISHER');

/*Layout*/
UPDATE Policies SET GridX=3, GridY=1 where Type='POLICY_MARITIME_INFRASTRUCTURE';
UPDATE Policies SET GridX=4, GridY=2 where Type='POLICY_NAVAL_TRADITION';
UPDATE Policies SET GridX=2, GridY=2 where Type='POLICY_MERCHANT_NAVY';
UPDATE Policies SET GridX=1, GridY=1 where Type='POLICY_NAVIGATION_SCHOOL';
UPDATE Policies SET GridX=3, GridY=3 where Type='POLICY_TREASURE_FLEETS';

/*Prereqs*/
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_TREASURE_FLEETS';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_NAVIGATION_SCHOOL';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_MERCHANT_NAVY';
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_NAVAL_TRADITION',		'POLICY_MARITIME_INFRASTRUCTURE'),
('POLICY_MERCHANT_NAVY',		'POLICY_MARITIME_INFRASTRUCTURE'),
('POLICY_TREASURE_FLEETS',		'POLICY_NAVAL_TRADITION'),
('POLICY_TREASURE_FLEETS',		'POLICY_MERCHANT_NAVY');

/*Texts*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR] enhances naval empires.[NEWLINE][NEWLINE]Adopting Exploration gives +1 [ICON_MOVES] Movement for Naval units and +1 Sight for Naval combat units. It also allows increases embarked [ICON_MOVES] moves of land units by 1. Unlocks building the Louvre.[NEWLINE][NEWLINE]Adopting all policies increases naval units [ICON_STRENGTH] strength and [ICON_RANGE_STRENGTH] ranged strength by 10% and Admirals may be purchased with [ICON_PEACE] Faith starting in the Industrial Era. Also get a free Admiral, admirals are earned 50% faster and move 2 more tiles.' 
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
/*Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR][NEWLINE]' 
Where Tag='TXT_KEY_POLICY_MARITIME_INFRASTRUCTURE_HELP';*/
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Naval Tradition[ENDCOLOR][NEWLINE]Gives +1[ICON_HAPPINESS_1] for every lighthouse, harbor and seaport. It also boosts the production of these buildings by 50%.' 
Where Tag='TXT_KEY_POLICY_NAVAL_TRADITION_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Merchant Navy[ENDCOLOR][NEWLINE]Gives +2[ICON_GOLD] Gold for all Lighthouse, Harbor and Seaports. Also boosts the East India Company with +4[ICON_CULTURE] Culture and +4[ICON_PRODUCTION] Production.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Colonies[ENDCOLOR][NEWLINE]Newly founded cities start with 1 extra [ICON_CITIZEN] Population, a free Worker and a Governor''s Mansion which provides 1 [ICON_HAPPINESS_1] Happiness.' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';
Update Language_en_US Set Text='Colonies' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL';
Update Language_en_US Set Text='Civilopedia placeholder' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_TEXT';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Treasure Fleets[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from Coast and Ocean tiles without sea resources.' 
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';

/*Texts*/
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR] enhances naval empires.[NEWLINE][NEWLINE]Adopting Exploration gives +1 [ICON_MOVES] Movement for Naval units and +1 Sight for Naval combat units. It also allows increases embarked [ICON_MOVES] moves of land units by 1. Unlocks building the Louvre.[NEWLINE][NEWLINE]Adopting all policies increases naval units [ICON_STRENGTH] strength and [ICON_RANGE_STRENGTH] ranged strength by 10% and Admirals may be purchased with [ICON_PEACE] Faith starting in the Industrial Era. Also get a free Admiral, admirals are earned 50% faster and move 2 more tiles.' 
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
/*Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR][NEWLINE]' 
Where Tag='TXT_KEY_POLICY_MARITIME_INFRASTRUCTURE_HELP';*/
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Naval Tradition[ENDCOLOR][NEWLINE]Gives +1[ICON_HAPPINESS_1] for every lighthouse, harbor and seaport. It also boosts the production of these buildings by 50%.' 
Where Tag='TXT_KEY_POLICY_NAVAL_TRADITION_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Merchant Navy[ENDCOLOR][NEWLINE]Gives +2[ICON_GOLD] Gold for all Lighthouse, Harbor and Seaports. Also boosts the East India Company with +4[ICON_CULTURE] Culture and +4[ICON_PRODUCTION] Production.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Colonies[ENDCOLOR][NEWLINE]Newly founded cities start with 1 extra [ICON_CITIZEN] Population, a free Worker and a Governor''s Mansion which provides 1 [ICON_HAPPINESS_1] Happiness.' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';
Update Language_DE_DE Set Text='Colonies' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL';
Update Language_DE_DE Set Text='Civilopedia placeholder' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_TEXT';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Treasure Fleets[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from Coast and Ocean tiles without sea resources.' 
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';
INSERT INTO Language_DE_DE
(Tag, Text) VALUES
('TXT_KEY_BUILDING_GOVERNORS_MANSION_DESC','Governor''s Mansion'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_PEDIA','A Governor''s Mansion is automatically constructed in every newly founded city after you have adopted the Colonies social policy.'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_STRATEGY','Founding a new city when you have adopted Colonies will give that city an additional 1 [ICON_CITIZEN] Population and 1 [ICON_HAPPINESS_1] Happiness as well as a Free Worker.');
INSERT INTO Language_DE_DE
(Tag, Text) VALUES
('TXT_KEY_BUILDING_TREASURE_FLEETS_DESC','Warehouse'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_PEDIA','A Warehouse is automatically constructed in every city after you have adopted the Treasure Fleets social policy.'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_STRATEGY','Provides +1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from all Coast and Ocean tiles without sea resources.');


/*Texts*/
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR] enhances naval empires.[NEWLINE][NEWLINE]Adopting Exploration gives +1 [ICON_MOVES] Movement for Naval units and +1 Sight for Naval combat units. It also allows increases embarked [ICON_MOVES] moves of land units by 1. Unlocks building the Louvre.[NEWLINE][NEWLINE]Adopting all policies increases naval units [ICON_STRENGTH] strength and [ICON_RANGE_STRENGTH] ranged strength by 10% and Admirals may be purchased with [ICON_PEACE] Faith starting in the Industrial Era. Also get a free Admiral, admirals are earned 50% faster and move 2 more tiles.' 
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
/*Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR][NEWLINE]' 
Where Tag='TXT_KEY_POLICY_MARITIME_INFRASTRUCTURE_HELP';*/
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Naval Tradition[ENDCOLOR][NEWLINE]Gives +1[ICON_HAPPINESS_1] for every lighthouse, harbor and seaport. It also boosts the production of these buildings by 50%.' 
Where Tag='TXT_KEY_POLICY_NAVAL_TRADITION_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Merchant Navy[ENDCOLOR][NEWLINE]Gives +2[ICON_GOLD] Gold for all Lighthouse, Harbor and Seaports. Also boosts the East India Company with +4[ICON_CULTURE] Culture and +4[ICON_PRODUCTION] Production.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Colonies[ENDCOLOR][NEWLINE]Newly founded cities start with 1 extra [ICON_CITIZEN] Population, a free Worker and a Governor''s Mansion which provides 1 [ICON_HAPPINESS_1] Happiness.' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';
Update Language_PL_PL Set Text='Colonies' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL';
Update Language_PL_PL Set Text='Civilopedia placeholder' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_TEXT';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Treasure Fleets[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from Coast and Ocean tiles without sea resources.' 
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';
INSERT INTO Language_PL_PL
(Tag, Text) VALUES
('TXT_KEY_BUILDING_GOVERNORS_MANSION_DESC','Governor''s Mansion'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_PEDIA','A Governor''s Mansion is automatically constructed in every newly founded city after you have adopted the Colonies social policy.'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_STRATEGY','Founding a new city when you have adopted Colonies will give that city an additional 1 [ICON_CITIZEN] Population and 1 [ICON_HAPPINESS_1] Happiness as well as a Free Worker.');
INSERT INTO Language_PL_PL
(Tag, Text) VALUES
('TXT_KEY_BUILDING_TREASURE_FLEETS_DESC','Warehouse'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_PEDIA','A Warehouse is automatically constructed in every city after you have adopted the Treasure Fleets social policy.'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_STRATEGY','Provides +1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from all Coast and Ocean tiles without sea resources.');
