UPDATE Defines set value=30 where name ='INITIAL_GOLD_PER_UNIT_TIMES_100';

UPDATE Defines set value=1000 where name='BARBARIAN_MAX_XP_VALUE';

/*UPDATE Defines SET Value=150 WHERE Name='GREAT_PERSON_THRESHOLD_INCREASE';*/
UPDATE Defines SET Value=75 WHERE Name='GREAT_PERSON_THRESHOLD_BASE';
UPDATE Specialists set greatpeopleratechange=2 where type='SPECIALIST_MERCHANT';
UPDATE Specialists set greatpeopleratechange=2 where type='SPECIALIST_ENGINEER';
UPDATE Specialists set greatpeopleratechange=2 where type='SPECIALIST_SCIENTIST';

UPDATE Builds SET Time=600 WHERE Type='BUILD_FORT';

/*UPDATE Worlds SET MaxActiveReligions=MaxActiveReligions-1;*/
UPDATE Resolutions SET TechPrereqAnyMember='TECH_NUCLEAR_FISSION' WHERE Type='RESOLUTION_NUCLEAR_NON_PROLIFERATION';
UPDATE Language_en_US SET Text='All Civilizations are prevented from constructing new nuclear weapons (Atomic Bomb and Nuclear Missile).  Weapons already constructed, however, are not disarmed.[NEWLINE][NEWLINE]Available once any Civilization discovers Nuclear Fission.'
WHERE Tag='TXT_KEY_RESOLUTION_NUCLEAR_NON_PROLIFERATION_HELP';
UPDATE Resolutions SET TechPrereqAnyMember='TECH_ROCKETRY' WHERE Type='RESOLUTION_INTERNATIONAL_SPACE_STATION';

/*v4 
Growth requirement has been reduced by reducing the exponent from 1.5 to 1.3, this should make a noticeable difference in growth after size 20.
The maximum discount for already known techs has been reduced from 30% to 20% (discounts due to having met civs that already have the tech)
Leveling up with spies give less of a reduction in steal time (15% instead of 25%) and the base value of steal has been slightly increased (130% instead of 125%).*/
UPDATE Defines SET Value=20 WHERE Name='TECH_COST_TOTAL_KNOWN_TEAM_MODIFIER';
UPDATE Defines SET Value=1.4 WHERE Name='CITY_GROWTH_EXPONENT';
UPDATE Defines SET Value=115 WHERE Name='ESPIONAGE_GATHERING_INTEL_COST_PERCENT';
UPDATE Defines SET Value=25 WHERE Name='ESPIONAGE_GATHERING_INTEL_RATE_BY_SPY_RANK_PERCENT';

UPDATE Defines SET Value=10 WHERE Name='FRIENDSHIP_PER_UNIT_GIFTED';
UPDATE Defines SET Value=2 WHERE Name='MINOR_UNIT_GIFT_TRAVEL_TURNS';

UPDATE Units SET MilitaryProduction=0 WHERE Class='UNITCLASS_CARAVAN';
UPDATE Units SET MilitaryProduction=0 WHERE Class='UNITCLASS_CARGO_SHIP';

UPDATE Units SET Moves=6 WHERE Class='UNITCLASS_MUSICIAN';
UPDATE Units SET Moves=4 WHERE Class='UNITCLASS_PROPHET';
INSERT INTO Unit_FreePromotions
(UnitType, PromotionType) VALUES
('UNIT_MUSICIAN','PROMOTION_RIVAL_TERRITORY');

/*v4 Scientists 2 science*/
UPDATE SpecialistYields Set Yield=2  Where SpecialistType='SPECIALIST_SCIENTIST';
UPDATE SpecialistYields Set Yield=4  Where SpecialistType='SPECIALIST_MERCHANT';
UPDATE Units SET BaseGold=500, NumGoldPerEra=150 WHERE Class='UNITCLASS_MERCHANT';
UPDATE Defines SET Value=60 WHERE Name='MINOR_FRIENDSHIP_FROM_TRADE_MISSION';
/*UPDATE SpecialistYields Set Yield=2  Where SpecialistType='SPECIALIST_ENGINEER';*/

UPDATE Defines SET Value=20 WHERE Name='MINOR_CIV_GLOBAL_QUEST_FIRST_POSSIBLE_TURN';
UPDATE Defines SET Value=20 WHERE Name='MINOR_CIV_PERSONAL_QUEST_FIRST_POSSIBLE_TURN';
UPDATE Defines SET Value=15 WHERE Name='MINOR_CIV_GLOBAL_QUEST_FIRST_POSSIBLE_TURN_RAND';
UPDATE Defines SET Value=15 WHERE Name='MINOR_CIV_PERSONAL_QUEST_FIRST_POSSIBLE_TURN_RAND';
UPDATE Defines SET Value=15 WHERE Name='MINOR_CIV_GLOBAL_QUEST_RAND_TURNS_BETWEEN';
UPDATE Defines SET Value=15 WHERE Name='MINOR_CIV_PERSONAL_QUEST_RAND_TURNS_BETWEEN';

DELETE FROM HandicapInfo_Goodies WHERE GoodyType='GOODY_REVEAL_NEARBY_BARBS';
UPDATE GoodyHuts SET MapOffset=1, MapRange=5,  MapProb=100 WHERE Type='GOODY_MAP';
UPDATE Improvements Set TilesPerGoody=33, GoodyRange=3 WHERE Type='IMPROVEMENT_GOODY_HUT';

UPDATE Defines SET Value=1 WHERE Name='EMBARKED_VISIBILITY_RANGE';

UPDATE Yields SET MinCity=2 WHERE Type='YIELD_PRODUCTION';

UPDATE Units SET Cost=Cost-20 WHERE Class='UNITCLASS_WORKBOAT';
UPDATE Units SET Cost=Cost-10 WHERE Class='UNITCLASS_WORKER';

UPDATE Units SET BaseBeakersTurnsToCount=7 WHERE Class='UNITCLASS_SCIENTIST';
UPDATE Units SET BaseCultureTurnsToCount=7 WHERE Class='UNITCLASS_WRITER';

DELETE FROM Resource_YieldChanges WHERE ResourceType='RESOURCE_SALT' AND YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET Yield=3 WHERE ResourceType='RESOURCE_PEARLS' AND YieldType='YIELD_GOLD';

/*V8*/

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType in ('UNIT_SS_STASIS_CHAMBER','UNIT_SS_ENGINE','UNIT_SS_COCKPIT','UNIT_SS_BOOSTER');
