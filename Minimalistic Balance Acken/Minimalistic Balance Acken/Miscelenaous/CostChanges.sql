UPDATE Defines SET Value=8 WHERE Name='GOLD_PURCHASE_GOLD_PER_PRODUCTION';
UPDATE Defines SET Value=0.88 WHERE Name='HURRY_GOLD_PRODUCTION_EXPONENT';
UPDATE Buildings SET HurryCostModifier=HurryCostModifier+5 WHERE HurryCostModifier >= 0;
UPDATE Units SET HurryCostModifier=HurryCostModifier+5 WHERE HurryCostModifier >= 0;

UPDATE Building_HurryModifiers SET HurryCostModifier=-10 WHERE BuildingType='BUILDING_BIG_BEN';
Update Language_en_US Set Text='Requires Commerce. Cost of [ICON_GOLD] Gold purchasing in all cities reduced by 10%.' Where 
Tag='TXT_KEY_WONDER_BIG_BEN_HELP';
Update Language_DE_DE Set Text='Requires Commerce. Cost of [ICON_GOLD] Gold purchasing in all cities reduced by 10%.' Where 
Tag='TXT_KEY_WONDER_BIG_BEN_HELP';
Update Language_PL_PL Set Text='Requires Commerce. Cost of [ICON_GOLD] Gold purchasing in all cities reduced by 10%.' Where 
Tag='TXT_KEY_WONDER_BIG_BEN_HELP';

UPDATE Policy_HurryModifiers SET HurryCostModifier=-15 WHERE PolicyType='POLICY_MERCANTILISM';
Update Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE]Purchasing items in Cities requires 15% less [ICON_GOLD] Gold. +1 [ICON_RESEARCH] Science from every Mint, Market, Bank, and Stock Exchange.' Where 
Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';
Update Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE]Purchasing items in Cities requires 15% less [ICON_GOLD] Gold. +1 [ICON_RESEARCH] Science from every Mint, Market, Bank, and Stock Exchange.' Where 
Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';
Update Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE]Purchasing items in Cities requires 15% less [ICON_GOLD] Gold. +1 [ICON_RESEARCH] Science from every Mint, Market, Bank, and Stock Exchange.' Where 
Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';

UPDATE Building_YieldModifiers SET Yield=15 WHERE BuildingType='BUILDING_MARKET';
UPDATE Building_YieldModifiers SET Yield=15 WHERE BuildingType='BUILDING_BAZAAR';
UPDATE Building_YieldModifiers SET Yield=15 WHERE BuildingType='BUILDING_SATRAPS_COURT';
UPDATE Building_YieldModifiers SET Yield=15 WHERE BuildingType='BUILDING_BANK';
UPDATE Building_YieldModifiers SET Yield=15 WHERE BuildingType='BUILDING_STOCK_EXCHANGE';
UPDATE Building_YieldModifiers SET Yield=15 WHERE BuildingType='BUILDING_HANSE';

UPDATE Building_YieldChanges SET Yield=2 WHERE BuildingType='BUILDING_MARKET';
UPDATE Building_YieldChanges SET Yield=3 WHERE BuildingType='BUILDING_BAZAAR';
UPDATE Building_YieldChanges SET Yield=4 WHERE BuildingType='BUILDING_SATRAPS_COURT';
UPDATE Building_YieldChanges SET Yield=3 WHERE BuildingType='BUILDING_BANK';
UPDATE Building_YieldChanges SET Yield=4 WHERE BuildingType='BUILDING_STOCK_EXCHANGE';
UPDATE Building_YieldChanges SET Yield=3 WHERE BuildingType='BUILDING_HANSE';

UPDATE Builds SET PrereqTech='TECH_THE_WHEEL' WHERE Type='BUILD_TRADING_POST';
UPDATE Improvements SET AdjacentLuxury=1 WHERE Type='IMPROVEMENT_TRADING_POST';
/*UPDATE Improvements SET NoTwoAdjacent=1 WHERE Type='IMPROVEMENT_TRADING_POST';*/

INSERT INTO Improvement_TechYieldChanges
(ImprovementType, TechType, YieldType, Yield) VALUES
('IMPROVEMENT_TRADING_POST', 'TECH_CURRENCY', 'YIELD_GOLD', 1),
('IMPROVEMENT_TRADING_POST', 'TECH_GUILDS', 'YIELD_GOLD', 1); 
INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_CIV5_IMPROVEMENTS_TRADING_POST_HELP','A Trading Post must be built adjacent to a Luxury resource.');
/*('TXT_KEY_CIV5_IMPROVEMENTS_TRADING_POST_HELP','A Trading Post must be built adjacent to a Luxury resource.  It may not be adjacent to another Trading Post.');*/
UPDATE Improvements SET Help='TXT_KEY_CIV5_IMPROVEMENTS_TRADING_POST_HELP' WHERE Type='IMPROVEMENT_TRADING_POST';