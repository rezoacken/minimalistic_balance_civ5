/*Grand Strategy*/
/*Choosing conquest is based on boldness and the difference between War and Friendly approach then multiplied by 12 - Era*/
/* AI locks in its current GS for AI_GRAND_STRATEGY_NUM_TURNS_STRATEGY_MUST_BE_ACTIVE then roll a new one with different weight.
A random number is associated to all GS between 0 and AI_GS_RAND_ROLL*/
UPDATE Defines Set Value=30 WHERE Name='AI_GRAND_STRATEGY_NUM_TURNS_STRATEGY_MUST_BE_ACTIVE'; /*10*/
UPDATE Defines Set Value=30 WHERE Name='AI_GS_RAND_ROLL'; /*50*/
UPDATE Defines Set Value=60 WHERE Name='AI_GRAND_STRATEGY_CURRENT_STRATEGY_WEIGHT'; /*50*/
UPDATE Defines Set Value=35 WHERE Name='AI_GRAND_STRATEGY_OTHER_PLAYERS_GS_MULTIPLIER'; /*50*/
UPDATE Defines Set Value=15 WHERE Name='AI_GS_CONQUEST_NOBODY_MET_FIRST_TURN'; /*20*/
UPDATE Defines Set Value=-75 WHERE Name='AI_GRAND_STRATEGY_CONQUEST_NOBODY_MET_WEIGHT'; /*-50*/
/* The game looks at (Strength - Strength_Others_Average) / Strength_Others_Average and then multiply by AI_GRAND_STRATEGY_CONQUEST_POWER_RATIO_MULTIPLIER
This means that if you have twice the strength of the average (unlikely) you will add AI_GRAND_STRATEGY_CONQUEST_POWER_RATIO_MULTIPLIER to the priority 
but then the code also divide it by 2. I think it's fair that if you have twice the average you should get a strong priority on conquest.*/
UPDATE Defines Set Value=250 WHERE Name='AI_GRAND_STRATEGY_CONQUEST_POWER_RATIO_MULTIPLIER'; /*100*/
UPDATE Defines Set Value=0 WHERE Name='AI_GRAND_STRATEGY_CONQUEST_AT_WAR_WEIGHT'; /*10*/	
/*Next 2 seems to be used only for guesses in the original code. Changed the code to make it used for our own conquest priority*/
UPDATE Defines Set Value=15 WHERE Name='AI_GRAND_STRATEGY_CONQUEST_WEIGHT_PER_MAJOR_ATTACKED'; /*10*/
UPDATE Defines Set Value=60 WHERE Name='AI_GRAND_STRATEGY_CONQUEST_WEIGHT_PER_MAJOR_CONQUERED'; /*15*/
/*This is used to boost army size*/
INSERT INTO Defines
(Name, Value) VALUES
('GS_CONQUEST_ARMY_SIZE_BOOST', 30);
/*These 2 weight are multiplied by the ratio of civ we are ahead in culture and tourism*/
UPDATE Defines Set Value=30 WHERE Name='AI_GS_CULTURE_AHEAD_WEIGHT'; /*50*/
UPDATE Defines Set Value=100 WHERE Name='AI_GS_CULTURE_TOURISM_AHEAD_WEIGHT'; /*100*/
/*Added per influenced civ*/
/*Added dll modification for familiar and popular*/
/*Currently unused and based on the value of AI_GS_SS_HAS_APOLLO_PROGRAM*/
UPDATE Defines Set Value=30 WHERE Name='AI_GS_CULTURE_INFLUENTIAL_CIV_MOD'; /*50*/
INSERT INTO Defines
(Name, Value) VALUES
('AI_GS_CULTURE_FAMILIAR_CIV_MOD', 15),
('AI_GS_CULTURE_POPULAR_CIV_MOD', 25);
/*Only vote number should count not the number of attacked CS*/
UPDATE Defines Set Value=0 WHERE Name='AI_GRAND_STRATEGY_UN_EACH_MINOR_ATTACKED_WEIGHT'; /*-30*/
/*These 4 are used to evaluate other player strategies*/
UPDATE Defines Set Value=50 WHERE Name='AI_GS_CULTURE_RATIO_MULTIPLIER'; /*75*/
UPDATE Defines Set Value=100 WHERE Name='AI_GS_TOURISM_RATIO_MULTIPLIER'; /*75*/
UPDATE Defines Set Value=150 WHERE Name='AI_GS_SS_HAS_APOLLO_PROGRAM'; /*150*/
UPDATE Defines Set Value=300 WHERE Name='AI_GS_SS_TECH_PROGRESS_MOD'; /*300*/
/*UPDATE Leader_Flavors SET Flavor=Flavor+2 WHERE FlavorType='FLAVOR_SCIENCE';*/

/*These numbers are multiplied by the flavor*/
UPDATE AIGrandStrategy_Flavors SET Flavor=15 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_SPACESHIP';/*13*/
UPDATE AIGrandStrategy_Flavors SET Flavor=9 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE';/*10*/
UPDATE AIGrandStrategy_Flavors SET Flavor=11 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_UNITED_NATIONS';/*10*/
UPDATE AIGrandStrategy_Flavors SET Flavor=12 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CONQUEST';/*10*/

/*Doesn't work reason unknown
Insert Into AIGrandStrategy_Flavors
(AIGrandStrategyType, FlavorType, Flavor)
('AIGRANDSTRATEGY_SPACESHIP', 'FLAVOR_SCIENCE', 7);*/

UPDATE AIGrandStrategy_Yields SET Yield=100 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CONQUEST' AND YieldType='YIELD_PRODUCTION';/*200*/ /*Don't think production works*/
DELETE FROM AIGrandStrategy_Yields WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND YieldType='YIELD_GOLD';/*50*/
INSERT INTO AIGrandStrategy_Yields 
(AIGrandStrategyType, YieldType, Yield) VALUES
('AIGRANDSTRATEGY_CONQUEST', 'YIELD_SCIENCE', 50),
('AIGRANDSTRATEGY_UNITED_NATIONS', 'YIELD_SCIENCE', 50);

UPDATE AIGrandStrategy_FlavorMods SET Flavor=3 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CONQUEST' AND FlavorType='FLAVOR_OFFENSE'; /*2*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=2 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CONQUEST' AND FlavorType='FLAVOR_EXPANSION'; /*1*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=1 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CONQUEST' AND FlavorType='FLAVOR_MILITARY_TRAINING'; /*1*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=2 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CONQUEST' AND FlavorType='FLAVOR_AIR'; /*1*/
INSERT INTO AIGrandStrategy_FlavorMods 
(AIGrandStrategyType, FlavorType, Flavor) VALUES
('AIGRANDSTRATEGY_CONQUEST', 'FLAVOR_MOBILE', 2),
('AIGRANDSTRATEGY_CONQUEST', 'FLAVOR_RANGED', 1),
('AIGRANDSTRATEGY_CONQUEST', 'FLAVOR_DEFENSE', 1),
('AIGRANDSTRATEGY_CONQUEST', 'FLAVOR_WONDER', -1),
('AIGRANDSTRATEGY_CONQUEST', 'FLAVOR_NAVAL', 1),
('AIGRANDSTRATEGY_CONQUEST', 'FLAVOR_RELIGION', -1),
('AIGRANDSTRATEGY_SPACESHIP', 'FLAVOR_GREAT_PEOPLE', 2);

UPDATE AIGrandStrategy_FlavorMods SET Flavor=3 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND FlavorType='FLAVOR_CULTURE'; /*2*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=1 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND FlavorType='FLAVOR_RELIGION'; /*1*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=1 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND FlavorType='FLAVOR_EXPANSION'; /*-1*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=-1 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND FlavorType='FLAVOR_OFFENSE'; /*-1*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=2 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND FlavorType='FLAVOR_GREAT_PEOPLE'; /*2*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=1 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_CULTURE' AND FlavorType='FLAVOR_WONDER'; /*2*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=2 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_SPACESHIP' AND FlavorType='FLAVOR_SPACESHIP'; /*2*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=3 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_SPACESHIP' AND FlavorType='FLAVOR_SCIENCE'; /*2*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=2 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_SPACESHIP' AND FlavorType='FLAVOR_PRODUCTION'; /*1*/
UPDATE AIGrandStrategy_FlavorMods SET Flavor=-1 WHERE AIGrandStrategyType='AIGRANDSTRATEGY_SPACESHIP' AND FlavorType='FLAVOR_RELIGION'; /*-5*/

/*UPDATE Units SET Combat=500 WHERE Class='UNITCLASS_SPEARMAN'; /*tests*/