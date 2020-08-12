/*INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_HANDICAP_DEMIGOD','Demi God'),
('TXT_KEY_HANDICAP_DEMIGOD_HELP','Elite difficulty, are you ready ?');*/

/*Rename stuff*/
UPDATE Language_en_US Set Text='Chieftain' WHERE Tag='TXT_KEY_HANDICAP_SETTLER';
UPDATE Language_en_US Set Text='Beginner' WHERE Tag='TXT_KEY_HANDICAP_SETTLER_HELP';
UPDATE Language_en_US Set Text='Warlord' WHERE Tag='TXT_KEY_HANDICAP_CHIEFTAIN';
UPDATE Language_en_US Set Text='Easy' WHERE Tag='TXT_KEY_HANDICAP_CHIEFTAIN_HELP';
UPDATE Language_en_US Set Text='Prince' WHERE Tag='TXT_KEY_HANDICAP_WARLORD';
UPDATE Language_en_US Set Text='Normal' WHERE Tag='TXT_KEY_HANDICAP_WARLORD_HELP';
UPDATE Language_en_US Set Text='King' WHERE Tag='TXT_KEY_HANDICAP_PRINCE';
UPDATE Language_en_US Set Text='Hard' WHERE Tag='TXT_KEY_HANDICAP_PRINCE_HELP';
UPDATE Language_en_US Set Text='Emperor' WHERE Tag='TXT_KEY_HANDICAP_KING';
UPDATE Language_en_US Set Text='Very Hard' WHERE Tag='TXT_KEY_HANDICAP_KING_HELP';
UPDATE Language_en_US Set Text='Immortal' WHERE Tag='TXT_KEY_HANDICAP_EMPEROR';
UPDATE Language_en_US Set Text='Extremely Difficult' WHERE Tag='TXT_KEY_HANDICAP_EMPEROR_HELP';
UPDATE Language_en_US Set Text='Demigod' WHERE Tag='TXT_KEY_HANDICAP_IMMORTAL';
UPDATE Language_en_US Set Text='Elite Difficulty' WHERE Tag='TXT_KEY_HANDICAP_IMMORTAL_HELP';

/*Remove free settler worker from the now chieftain level 1 difficulty*/
DELETE FROM HandicapInfo_Goodies WHERE GoodyType='GOODY_SETTLER';
DELETE FROM HandicapInfo_Goodies WHERE GoodyType='GOODY_WORKER';
/*Fix techs for the corresponding difficulties*/
DELETE FROM HandicapInfo_AIFreeTechs;
INSERT INTO HandicapInfo_AIFreeTechs
(HandicapType, TechType) VALUES
('HANDICAP_DEITY', 'TECH_POTTERY'),
('HANDICAP_DEITY', 'TECH_MINING'),
('HANDICAP_IMMORTAL', 'TECH_POTTERY'),
('HANDICAP_IMMORTAL', 'TECH_MINING'),
('HANDICAP_EMPEROR', 'TECH_POTTERY'),
('HANDICAP_EMPEROR', 'TECH_MINING'),
('HANDICAP_KING', 'TECH_POTTERY'),
('HANDICAP_PRINCE', 'TECH_POTTERY');
	
UPDATE HandicapInfos SET AINumCitiesExponent = 75 WHERE Type='HANDICAP_SETTLER';
UPDATE HandicapInfos SET AINumCitiesExponent = 75 WHERE Type='HANDICAP_CHIEFTAIN';
UPDATE HandicapInfos SET AINumCitiesExponent = 70 WHERE Type='HANDICAP_WARLORD';
UPDATE HandicapInfos SET AINumCitiesExponent = 65 WHERE Type='HANDICAP_PRINCE';
UPDATE HandicapInfos SET AINumCitiesExponent = 60 WHERE Type='HANDICAP_KING';
UPDATE HandicapInfos SET AINumCitiesExponent = 55 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AINumCitiesExponent = 50 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AINumCitiesExponent = 45 WHERE Type='HANDICAP_DEITY';
UPDATE HandicapInfos SET AINumCitiesExponent = 60 WHERE Type='HANDICAP_AI_DEFAULT';

UPDATE HandicapInfos SET AITourismAdditiveModifier = 0 WHERE Type='HANDICAP_SETTLER';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 0 WHERE Type='HANDICAP_CHIEFTAIN';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 0 WHERE Type='HANDICAP_WARLORD';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 5 WHERE Type='HANDICAP_PRINCE';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 5 WHERE Type='HANDICAP_KING';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 5 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 10 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 10 WHERE Type='HANDICAP_DEITY';
UPDATE HandicapInfos SET AITourismAdditiveModifier = 0 WHERE Type='HANDICAP_AI_DEFAULT';

UPDATE HandicapInfos SET AIDeclareWarProb = 105 WHERE Type='HANDICAP_KING';
UPDATE HandicapInfos SET AIDeclareWarProb = 110 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AIDeclareWarProb = 110 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AIDeclareWarProb = 115 WHERE Type='HANDICAP_DEITY';

UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_WARLORD';
UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_PRINCE';
UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_KING';
UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_DEITY';
UPDATE HandicapInfos SET AICreatePercent = 100 WHERE Type='HANDICAP_AI_DEFAULT';

UPDATE HandicapInfos SET AITrainPercent = 100 WHERE Type='HANDICAP_WARLORD';
UPDATE HandicapInfos SET AITrainPercent = 95 WHERE Type='HANDICAP_PRINCE';
UPDATE HandicapInfos SET AITrainPercent = 85 WHERE Type='HANDICAP_KING';
UPDATE HandicapInfos SET AITrainPercent = 75 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AITrainPercent = 70 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AITrainPercent = 60 WHERE Type='HANDICAP_DEITY';

UPDATE HandicapInfos SET AIPerEraModifier = -1 WHERE Type='HANDICAP_PRINCE';
UPDATE HandicapInfos SET AIPerEraModifier = -1 WHERE Type='HANDICAP_KING';
UPDATE HandicapInfos SET AIPerEraModifier = -2 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AIPerEraModifier = -2 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AIPerEraModifier = -3 WHERE Type='HANDICAP_DEITY';

UPDATE HandicapInfos SET AIGrowthPercent = AIGrowthPercent + 5 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AIGrowthPercent = AIGrowthPercent + 5 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AIGrowthPercent = AIGrowthPercent + 5 WHERE Type='HANDICAP_DEITY';

/*UPDATE HandicapInfos SET TechNumOptionsConsidered = 3;*/
UPDATE HandicapInfos SET CityProductionNumOptionsConsidered = 2;
UPDATE HandicapInfos SET ProductionFreeUnits=20;
UPDATE HandicapInfos SET AIUnhappinessPercent = AIUnhappinessPercent - 5;

/*v8*/

UPDATE HandicapInfos SET AIFreeXP = 15 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AIFreeXP = 15 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AIFreeXP = 15 WHERE Type='HANDICAP_DEITY';

UPDATE HandicapInfos SET AIFreeXPPercent = 25 WHERE Type='HANDICAP_EMPEROR';
UPDATE HandicapInfos SET AIFreeXPPercent = 25 WHERE Type='HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET AIFreeXPPercent = 25 WHERE Type='HANDICAP_DEITY';

/*UPDATE Units SET Combat=500 WHERE Class='UNITCLASS_CANNON'; /*testing purposes to know if the database update is read until the end or not*/