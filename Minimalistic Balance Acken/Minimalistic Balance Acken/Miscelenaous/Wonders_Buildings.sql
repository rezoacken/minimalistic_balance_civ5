UPDATE Buildings SET SpecialistCount=2 WHERE BuildingClass='BUILDINGCLASS_WORKSHOP';
UPDATE Buildings SET SpecialistCount=2 WHERE BuildingClass='BUILDINGCLASS_MARKET';
UPDATE Buildings SET SpecialistCount=1 WHERE BuildingClass='BUILDINGCLASS_STOCK_EXCHANGE';
UPDATE Buildings SET SpecialistCount=1 WHERE BuildingClass='BUILDINGCLASS_FACTORY';

UPDATE Buildings SET PrereqTech='TECH_ATOMIC_THEORY' WHERE BuildingClass='BUILDINGCLASS_BOMB_SHELTER';

INSERT INTO Building_SeaPlotYieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_HARBOR', 'YIELD_GOLD', 1),
('BUILDING_SEAPORT', 'YIELD_PRODUCTION', 1);
UPDATE Buildings SET TradeRouteSeaGoldBonus=200 WHERE BuildingClass='BUILDINGCLASS_HARBOR';

DELETE FROM Building_SeaResourceYieldChanges WHERE BuildingType='BUILDING_LIGHTHOUSE' AND YieldType='YIELD_PRODUCTION';
DELETE FROM Building_SeaResourceYieldChanges WHERE BuildingType='BUILDING_SEAPORT' AND YieldType='YIELD_GOLD';
DELETE FROM Building_SeaResourceYieldChanges WHERE BuildingType='BUILDING_SEAPORT' AND YieldType='YIELD_PRODUCTION';

INSERT INTO Improvement_ResourceType_Yields
(ImprovementType, ResourceType, YieldType, Yield) VALUES
('IMPROVEMENT_FISHING_BOATS','RESOURCE_FISH','YIELD_PRODUCTION',1),
('IMPROVEMENT_FISHING_BOATS','RESOURCE_WHALE','YIELD_PRODUCTION',1),
('IMPROVEMENT_FISHING_BOATS','RESOURCE_PEARLS','YIELD_PRODUCTION',1),
('IMPROVEMENT_FISHING_BOATS','RESOURCE_CRAB','YIELD_PRODUCTION',1);

UPDATE Language_en_US SET Text='+1 [ICON_FOOD] Food from Coast and Ocean Tiles.[NEWLINE][NEWLINE]Each source of [ICON_RES_FISH] Fish worked by this City produces +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag='TXT_KEY_BUILDING_LIGHTHOUSE_HELP';
UPDATE Language_en_US SET Text='+1 [ICON_GOLD] Gold from Coast and Ocean Tiles.[NEWLINE][NEWLINE]Forms a [ICON_CONNECTED] City Connection with the [ICON_CAPITAL] Capital over water (if they''re not already [ICON_CONNECTED] connected by land). Sea trade routes originating from this city have a 50% increase in range and produce an additional 2 [ICON_GOLD] Gold when connecting to another civilization.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag='TXT_KEY_BUILDING_HARBOR_HELP';
UPDATE Language_en_US SET Text='+1 [ICON_PRODUCTION] Production from Coast and Ocean Tiles. +15% [ICON_PRODUCTION] Production when building Naval Units.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag='TXT_KEY_BUILDING_SEAPORT_HELP';

UPDATE Buildings SET Flat=0 WHERE BuildingClass='BUILDINGCLASS_WINDMILL';
UPDATE Buildings SET ProhibitedCityTerrain=NULL WHERE BuildingClass='BUILDINGCLASS_STONE_WORKS';

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_GRANARY','RESOURCE_BISON','YIELD_FOOD',1);

/*Texts*/
UPDATE Language_en_US SET Text='Each source of [ICON_RES_BISON] Bison [ICON_RES_WHEAT] Wheat [ICON_RES_BANANA] Bananas and [ICON_RES_DEER] Deer worked by this City produce +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Allows [ICON_FOOD] Food to be moved from this city along trade routes inside your civilization.' WHERE Tag='TXT_KEY_BUILDING_GRANARY_HELP';
UPDATE Language_DE_DE SET Text='Each source of [ICON_RES_BISON] Bison [ICON_RES_WHEAT] Wheat [ICON_RES_BANANA] Bananas and [ICON_RES_DEER] Deer worked by this City produce +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Allows [ICON_FOOD] Food to be moved from this city along trade routes inside your civilization.' WHERE Tag='TXT_KEY_BUILDING_GRANARY_HELP';
UPDATE Language_PL_PL SET Text='Each source of [ICON_RES_BISON] Bison [ICON_RES_WHEAT] Wheat [ICON_RES_BANANA] Bananas and [ICON_RES_DEER] Deer worked by this City produce +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Allows [ICON_FOOD] Food to be moved from this city along trade routes inside your civilization.' WHERE Tag='TXT_KEY_BUILDING_GRANARY_HELP';

INSERT INTO Building_ResourceYieldChanges
(BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_MINT','RESOURCE_COPPER','YIELD_GOLD',2);

INSERT INTO Building_LocalResourceOrs
(BuildingType, ResourceType) VALUES
('BUILDING_MINT','RESOURCE_COPPER');

/*Texts*/
UPDATE Language_en_US SET Text='Each source of [ICON_RES_GOLD] Gold, [ICON_RES_SILVER] Silver, and [ICON_RES_COPPER] Copper worked by this City produces +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]City must have at least one of these resources mined nearby.' WHERE Tag='TXT_KEY_BUILDING_MINT_HELP';
UPDATE Language_DE_DE SET Text='Each source of [ICON_RES_GOLD] Gold, [ICON_RES_SILVER] Silver, and [ICON_RES_COPPER] Copper worked by this City produces +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]City must have at least one of these resources mined nearby.' WHERE Tag='TXT_KEY_BUILDING_MINT_HELP';
UPDATE Language_PL_PL SET Text='Each source of [ICON_RES_GOLD] Gold, [ICON_RES_SILVER] Silver, and [ICON_RES_COPPER] Copper worked by this City produces +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]City must have at least one of these resources mined nearby.' WHERE Tag='TXT_KEY_BUILDING_MINT_HELP';

UPDATE Language_en_US SET Text='The Mint can only be constructed in a city with improved gold, silver, or copper resources nearby. The Mint increases the [ICON_GOLD] Gold output of each such resource the city has access to.' WHERE Tag='TXT_KEY_BUILDING_MINT_STRATEGY';
UPDATE Language_DE_DE SET Text='The Mint can only be constructed in a city with improved gold, silver, or copper resources nearby. The Mint increases the [ICON_GOLD] Gold output of each such resource the city has access to.' WHERE Tag='TXT_KEY_BUILDING_MINT_STRATEGY';
UPDATE Language_PL_PL SET Text='The Mint can only be constructed in a city with improved gold, silver, or copper resources nearby. The Mint increases the [ICON_GOLD] Gold output of each such resource the city has access to.' WHERE Tag='TXT_KEY_BUILDING_MINT_STRATEGY';

/*
DELETE FROM Building_ResourceQuantityRequirements WHERE BuildingType='BUILDING_NUCLEAR_PLANT';
INSERT INTO Building_LocalResourceOrs
(BuildingType, ResourceType) VALUES
('BUILDING_NUCLEAR_PLANT','RESOURCE_URANIUM');

UPDATE Language_en_US SET Text='City must have access to a [ICON_RES_URANIUM] Uranium ressource and not contain a solar plant.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_HELP';
UPDATE Language_DE_DE SET Text='City must have access to a [ICON_RES_URANIUM] Uranium ressource and not contain a solar plant.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_HELP';
UPDATE Language_PL_PL SET Text='City must have access to a [ICON_RES_URANIUM] Uranium ressource and not contain a solar plant.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_HELP';

UPDATE Language_en_US SET Text='The Nuclear Plant significantly increases a city''s productivity. A Nuclear Plant requires [ICON_RES_URANIUM] Uranium near the city. The city must possess a Factory before it can be constructed.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_STRATEGY';
UPDATE Language_DE_DE SET Text='The Nuclear Plant significantly increases a city''s productivity. A Nuclear Plant requires [ICON_RES_URANIUM] Uranium near the city. The city must possess a Factory before it can be constructed.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_STRATEGY';
UPDATE Language_PL_PL SET Text='The Nuclear Plant significantly increases a city''s productivity. A Nuclear Plant requires [ICON_RES_URANIUM] Uranium near the city. The city must possess a Factory before it can be constructed.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_STRATEGY';
*/
UPDATE Building_Flavors SET Flavor=0 where BuildingType='BUILDING_NUCLEAR_PLANT';

UPDATE Buildings SET PrereqTech='TECH_IRON_WORKING', Cost=100 WHERE BuildingClass='BUILDINGCLASS_FORGE';

UPDATE Buildings SET PrereqTech='TECH_ANIMAL_HUSBANDRY', Cost=60, TradeRouteLandGoldBonus=300 WHERE BuildingClass='BUILDINGCLASS_CARAVANSARY';
UPDATE Language_en_US SET Text='Land trade routes originating from this city have a 50% increase in range and produce an additional 3 [ICON_GOLD] Gold when connecting to another civilization.' 
WHERE Tag='TXT_KEY_BUILDING_CARAVANSARY_HELP';

UPDATE Buildings SET GreatPeopleRateChange=0 WHERE Type='BUILDING_TEMPLE_ARTEMIS';
UPDATE Buildings SET GreatPeopleRateChange=2 WHERE Type='BUILDING_STONEHENGE';
/*UPDATE Building_YieldChanges SET Yield=6 WHERE BuildingType='BUILDING_STONEHENGE' and YieldType='YIELD_FAITH';*/
UPDATE Buildings SET GreatPeopleRateModifier=25 WHERE Type='BUILDING_PARTHENON';
UPDATE Language_en_US SET Text='+25% [ICON_GREAT_PEOPLE] generation in this city. Contains a prebuilt Great Work of Art in the Great Work Slot.'
WHERE Tag='TXT_KEY_WONDER_PARTHENON_HELP';
UPDATE Buildings SET GreatPeopleRateChange=2 WHERE Type='BUILDING_GREAT_LIGHTHOUSE';
INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_GREAT_LIGHTHOUSE', 'YIELD_GOLD', 4);

UPDATE Buildings SET ReducedResistance=-50 WHERE Type='BUILDING_STATUE_ZEUS';
UPDATE Language_en_US SET Text='Requires Honor. All units gain +15% [ICON_STRENGTH] combat strength when attacking cities and diminishes the resistance time by half.'
WHERE Tag='TXT_KEY_WONDER_STATUE_ZEUS_HELP';

UPDATE Buildings SET PolicyBranchType=NULL, HolyCity=1 WHERE Type='BUILDING_MOSQUE_OF_DJENNE';
UPDATE Buildings SET PolicyBranchType='POLICY_BRANCH_PIETY' WHERE Type='BUILDING_BOROBUDUR';
/*INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_WONDER_STONEHENGE_HELP','Requires Piety.');*/
UPDATE Language_en_US SET Text='Requires Piety. Must be built in a Holy City. 3 free Missionaries appear.' 
WHERE Tag='TXT_KEY_WONDER_BOROBUDUR_HELP';
UPDATE Language_en_US SET Text='Must be built in a Holy city. All Missionaries born in this city can spread religion three times. Provides a free Mosque in the city in which it is built.' 
WHERE Tag='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';

UPDATE Buildings SET Cost=325, FreeBuildingThisCity='BUILDINGCLASS_UNIVERSITY' WHERE BuildingClass='BUILDINGCLASS_ANGKOR_WAT';
UPDATE Building_YieldChanges SET Yield=3 WHERE BuildingType='BUILDING_ANGKOR_WAT' AND YieldType='YIELD_CULTURE';
UPDATE Language_en_US SET Text='[ICON_CULTURE] Culture and [ICON_GOLD] Gold costs of acquiring new tiles reduced by 25% in every city. Provides a free University in the city in which it is built.' 
WHERE Tag='TXT_KEY_WONDER_ANGKOR_WAT_HELP';

UPDATE Building_YieldChanges SET Yield=4 WHERE BuildingType='BUILDING_NATIONAL_EPIC' AND YieldType='YIELD_CULTURE';

UPDATE Buildings SET NumTradeRouteBonus=1 WHERE Type='BUILDING_NATIONAL_TREASURY';
UPDATE Language_en_US SET Text='Must have built a Market in all Cities. The cost goes up the more cities there are in the empire. Gain an additional trade route slot. Trade routes other players make to a city with an East India Company will generate an extra 4 [ICON_GOLD] Gold for the city owner and the trade route owner gains an additional 2 [ICON_GOLD] Gold.' 
WHERE Tag='TXT_KEY_BUILDING_NATIONAL_TREASURY_HELP';

UPDATE Buildings SET Cost=200 WHERE BuildingClass='BUILDINGCLASS_POLICE_STATION';
UPDATE Building_ClassesNeededInCity SET BuildingClassType='BUILDINGCLASS_CONSTABLE' WHERE BuildingType='BUILDING_INTELLIGENCE_AGENCY';
UPDATE Building_PrereqBuildingClasses SET BuildingClassType='BUILDINGCLASS_CONSTABLE' WHERE BuildingType='BUILDING_INTELLIGENCE_AGENCY'; 
UPDATE Language_en_US SET Text='Provides an additional spy and levels up all your existing spies. Also provides a 15% reduction in enemy spy effectiveness. Must have a Constabulary in all cities.'
WHERE Tag='TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';

UPDATE Buildings SET Cost=400 WHERE Type='BUILDING_HIMEJI_CASTLE';

UPDATE Buildings SET Cost=185, EnhancedYieldTech='TECH_ARCHAEOLOGY' WHERE Type='BUILDING_TERRACOTTA_ARMY';
INSERT INTO Building_TechEnhancedYieldChanges
(BuildingType,YieldType,Yield) VALUES
('BUILDING_TERRACOTTA_ARMY','YIELD_CULTURE',5);
UPDATE Language_en_US SET Text='Creates a copy of each type of military land unit you control and places the unit near the city where the Terracotta Army is constructed. Produces +5 [ICON_CULTURE] Culture after Archaeology.'
WHERE Tag='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';

DELETE FROM Building_UnitCombatProductionModifiers WHERE BuildingType='BUILDING_KREMLIN';
INSERT INTO Building_YieldModifiers
(BuildingType,YieldType,Yield) VALUES
('BUILDING_KREMLIN','YIELD_PRODUCTION',20);
UPDATE Language_en_US SET Text='Requires Order. +20% [ICON_PRODUCTION] Production in the city. 1 Free Social Policy.'
WHERE Tag='TXT_KEY_WONDER_KREMLIN_HELP';

UPDATE Buildings SET GreatWorkCount=1, GreatWorkSlotType='GREAT_WORK_SLOT_ART_ARTIFACT' WHERE Type='BUILDING_NOTRE_DAME';
UPDATE Buildings SET GreatWorkCount=1, GreatWorkSlotType='GREAT_WORK_SLOT_ART_ARTIFACT' WHERE Type='BUILDING_FORBIDDEN_PALACE';

UPDATE Buildings SET Cost=450 WHERE Type='BUILDING_RED_FORT';
UPDATE Buildings SET Cost=800 WHERE Type='BUILDING_PENTAGON';
UPDATE Buildings SET Cost=160 WHERE Type='BUILDING_PYRAMID';
UPDATE Buildings SET Cost=200 WHERE BuildingClass='BUILDINGCLASS_WINDMILL';
UPDATE Buildings SET Cost=400 WHERE BuildingClass='BUILDINGCLASS_RECYCLING_CENTER';
UPDATE Buildings SET Cost=400 WHERE BuildingClass='BUILDINGCLASS_STADIUM';
UPDATE Buildings SET Cost=250 WHERE BuildingClass='BUILDINGCLASS_HOSPITAL';
UPDATE Buildings SET Cost=375 WHERE BuildingClass='BUILDINGCLASS_MEDICAL_LAB';
UPDATE Buildings SET Cost=200 WHERE BuildingClass='BUILDINGCLASS_SEAPORT';

UPDATE Buildings SET SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=1 WHERE Type='BUILDING_GREAT_LIBRARY';
UPDATE Buildings SET SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=2 WHERE Type='BUILDING_ANGKOR_WAT';
UPDATE Buildings SET SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=1 WHERE Type='BUILDING_FORBIDDEN_PALACE';
UPDATE Buildings SET SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=2 WHERE Type='BUILDING_GLOBE_THEATER';
UPDATE Buildings SET SpecialistType='SPECIALIST_WRITER', GreatPeopleRateChange=1 WHERE Type='BUILDING_NEUSCHWANSTEIN';

UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_MAUSOLEUM_HALICARNASSUS';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_TERRACOTTA_ARMY';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_ALHAMBRA';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_BOROBUDUR';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_HAGIA_SOPHIA';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_PARTHENON';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_UFFIZI';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_SISTINE_CHAPEL';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_TAJ_MAHAL';
UPDATE Buildings SET SpecialistType='SPECIALIST_ARTIST', GreatPeopleRateChange=1 WHERE Type='BUILDING_LOUVRE';

UPDATE Buildings SET SpecialistType='SPECIALIST_MUSICIAN', GreatPeopleRateChange=2 WHERE Type='BUILDING_CN_TOWER';
UPDATE Buildings SET SpecialistType='SPECIALIST_MUSICIAN', GreatPeopleRateChange=1 WHERE Type='BUILDING_SYDNEY_OPERA_HOUSE';
UPDATE Buildings SET SpecialistType='SPECIALIST_MUSICIAN', GreatPeopleRateChange=2 WHERE Type='BUILDING_BROADWAY';
UPDATE Buildings SET SpecialistType='SPECIALIST_MUSICIAN', GreatPeopleRateChange=1 WHERE Type='BUILDING_NOTRE_DAME';

UPDATE Buildings SET SpecialistType='SPECIALIST_ENGINEER', GreatPeopleRateChange=1 WHERE Type='BUILDING_CRISTO_REDENTOR';
UPDATE Buildings SET SpecialistType='SPECIALIST_ENGINEER', GreatPeopleRateChange=1 WHERE Type='BUILDING_HANGING_GARDEN';
UPDATE Buildings SET SpecialistType='SPECIALIST_ENGINEER', GreatPeopleRateChange=1 WHERE Type='BUILDING_KREMLIN';
UPDATE Buildings SET SpecialistType='SPECIALIST_ENGINEER', GreatPeopleRateChange=1 WHERE Type='BUILDING_PRORA_RESORT';
UPDATE Buildings SET SpecialistType='SPECIALIST_ENGINEER', GreatPeopleRateChange=1 WHERE Type='BUILDING_STATUE_OF_LIBERTY';
UPDATE Buildings SET SpecialistType='SPECIALIST_ENGINEER', GreatPeopleRateChange=1 WHERE Type='BUILDING_LEANING_TOWER';

UPDATE Buildings SET SpecialistType='SPECIALIST_SCIENTIST', GreatPeopleRateChange=2 WHERE Type='BUILDING_GREAT_FIREWALL';
UPDATE Buildings SET SpecialistType='SPECIALIST_SCIENTIST', GreatPeopleRateChange=2 WHERE Type='BUILDING_HUBBLE';

/*V8*/

UPDATE Buildings SET Happiness=1 WHERE BuildingClass='BUILDINGCLASS_CONSTABLE';
UPDATE Buildings SET Happiness=1 WHERE BuildingClass='BUILDINGCLASS_POLICE_STATION';
INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_CARAVANSARY', 'YIELD_GOLD', 2);

UPDATE Building_YieldChanges SET Yield=3 WHERE BuildingType='BUILDING_TERRACOTTA_ARMY' and YieldType='YIELD_CULTURE';

UPDATE Buildings SET GlobalPopulationChange=0, HappinessPerCity=0  WHERE Type='BUILDING_CN_TOWER';
UPDATE Language_en_US SET Text='1 free Great Musician appears near the City where the Wonder was built.' 
WHERE Tag='TXT_KEY_WONDER_CN_TOWER_HELP';
UPDATE Buildings SET InstantMilitaryIncrease=1 WHERE Type='BUILDING_PENTAGON';
UPDATE Language_en_US SET Text='[ICON_GOLD] Gold cost of upgrading military units reduced by 33%. And get a copy of each distinct land unit you have.' 
WHERE Tag='TXT_KEY_WONDER_PENTAGON_HELP';
