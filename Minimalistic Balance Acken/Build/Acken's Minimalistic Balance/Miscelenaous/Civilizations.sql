-- Insert SQL Rules Here 
/*Assyria*/
Update Traits SET FreeUnit='UNITCLASS_WRITER', FreeUnitPrereqTech='TECH_WRITING' WHERE Type='TRAIT_SLAYER_OF_TIAMAT';
UPDATE Language_en_US SET Text='Get a free writer when researching Writing. When a city is conquered, gain a free Technology already discovered by its owner.  Gaining a city through a trade deal does not count, and it can only happen once per enemy city.'
WHERE Tag='TXT_KEY_TRAIT_SLAYER_OF_TIAMAT';
/*INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_ROYAL_LIBRARY', 'YIELD_SCIENCE', 1);*/
Update Building_DomainFreeExperiencePerGreatWork Set Experience=15 WHERE BuildingType='BUILDING_ROYAL_LIBRARY';
UPDATE Language_en_US SET Text='Unique Assyrian Library replacement. +1 [ICON_RESEARCH] Science for every 2 [ICON_CITIZEN] Citizens in this City. Also has a slot for a Great Work of Writing which, when filled, gives 15 extra XP to trained Units.' 
WHERE Tag='TXT_KEY_BUILDING_ROYAL_LIBRARY_HELP';

/*Byzantium*/
/*Update Traits SET FreeUnit='UNITCLASS_PROPHET', FreeUnitPrereqTech='TECH_THEOLOGY' WHERE Type='TRAIT_EXTRA_BELIEF';*/
UPDATE Language_en_US SET Text='Get a free bonus belief when founding a religion.'
WHERE Tag='TXT_KEY_TRAIT_EXTRA_BELIEF';
INSERT INTO UnitClasses
(Type, Description, DefaultUnit) VALUES
('UNITCLASS_SPECIAL_DROMON', 'TXT_KEY_UNIT_BYZANTINE_DROMON', 'UNIT_BYZANTINE_DROMON');
UPDATE Units SET Class='UNITCLASS_SPECIAL_DROMON' WHERE Type='UNIT_BYZANTINE_DROMON';

INSERT INTO Civilization_UnitClassOverrides
(CivilizationType, UnitClassType, UnitType)
SELECT Type, 'UNITCLASS_SPECIAL_DROMON', NULL FROM Civilizations;

DELETE FROM Civilization_UnitClassOverrides WHERE UnitType='UNIT_BYZANTINE_DROMON';
UPDATE Civilization_UnitClassOverrides SET UnitType='UNIT_BYZANTINE_DROMON' WHERE CivilizationType='CIVILIZATION_BYZANTIUM' AND UnitClassType='UNITCLASS_SPECIAL_DROMON';
UPDATE Units SET Cost=56, PrereqTech='TECH_OPTICS', RangedCombat=11 WHERE Type='UNIT_BYZANTINE_DROMON';
UPDATE Units SET /*FaithCost=170,*/ RequiresFaithPurchaseEnabled=0, UniqueBuyableWithFaith=1 WHERE Type='UNIT_BYZANTINE_CATAPHRACT';
UPDATE Language_en_US SET Text='Fast and powerful early game Mounted Unit that can always be bought with faith. Weak to Spearmen. Only the Byzantines may build it. This Unit has a higher [ICON_STRENGTH] Combat Strength, defends better, and attacks cities more effectively than the Horseman which it replaces.'
WHERE Tag='TXT_KEY_UNIT_HELP_BYZANTINE_CATAPHRACT';

/*Carthage*/
UPDATE Units SET Combat = Combat - 1 WHERE Type='UNIT_CARTHAGINIAN_QUINQUEREME';
UPDATE Traits SET FreeBuilding='BUILDING_COTHON' WHERE Type='TRAIT_PHOENICIAN_HERITAGE';
UPDATE Language_en_US SET Text='All coastal Cities get a free Cothon : a special carthagenian Harbor giving more gold to ocean tiles. Units may cross mountains after the first Great General is earned, taking 50 HP damage if they end a turn on a mountain.'
WHERE Tag='TXT_KEY_TRAIT_PHOENICIAN_HERITAGE';
INSERT INTO Building_SeaPlotYieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_COTHON', 'YIELD_GOLD', 2);
INSERT INTO Language_en_US
(Text, Tag) Values
('Civilopedia placeholder for cothon',
'TXT_KEY_BUILDING_COTHON_PEDIA'),
('Carthaginian unique Harbor.[NEWLINE][NEWLINE]+2 [ICON_GOLD] Gold from Coast and Ocean Tiles.[NEWLINE][NEWLINE]Forms a [ICON_CONNECTED] City Connection with the [ICON_CAPITAL] Capital over water (if they''re not already [ICON_CONNECTED] connected by land). Sea trade routes originating from this city have a 50% increase in range and produce an additional 2 [ICON_GOLD] Gold when connecting to another civilization.[NEWLINE][NEWLINE]City must be built on the coast.',
'TXT_KEY_BUILDING_COTHON_HELP'),
('Cothon',
'TXT_KEY_BUILDING_COTHON'),
('Strategy placeholder for cothon',
'TXT_KEY_BUILDING_COTHON_STRATEGY');
UPDATE Units Set Cost = 75 WHERE Type='UNIT_CARTHAGINIAN_FOREST_ELEPHANT';
INSERT INTO Civilization_Start_Place_First_Along_Ocean
(CivilizationType, PlaceFirst) VALUES
('CIVILIZATION_CARTHAGE',1);
INSERT INTO Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType, BuildingType) VALUES
('CIVILIZATION_CARTHAGE','BUILDINGCLASS_HARBOR','BUILDING_COTHON');

/*Rome*/
UPDATE Units Set Combat = Combat - 1 WHERE Type='UNIT_ROMAN_LEGION';
INSERT INTO Building_YieldChanges 
(BuildingType, YieldType, Yield) VALUES
('BUILDING_FORUM', 'YIELD_CULTURE', 2);
INSERT INTO Language_en_US
(Text, Tag) Values
('Civilopedia placeholder for Forum',
'TXT_KEY_BUILDING_FORUM_PEDIA'),
('Roman unique Amphitheater.[NEWLINE][NEWLINE]+25% [ICON_GREAT_PEOPLE] Great People generation in this City.',
'TXT_KEY_BUILDING_FORUM_HELP'),
('Forum',
'TXT_KEY_BUILDING_FORUM'),
('Strategy placeholder for Forum',
'TXT_KEY_BUILDING_FORUM_STRATEGY');
INSERT INTO Building_Flavors 
(BuildingType, FlavorType, Flavor) VALUES
('BUILDING_FORUM', 'FLAVOR_CULTURE', 30),
('BUILDING_FORUM', 'FLAVOR_GREAT_PEOPLE', 15);
INSERT INTO Civilization_BuildingClassOverrides
(CivilizationType, BuildingClassType, BuildingType) VALUES
('CIVILIZATION_ROME','BUILDINGCLASS_AMPHITHEATER','BUILDING_FORUM');
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType='UNIT_ROMAN_BALLISTA';
DELETE FROM Units WHERE Type='UNIT_ROMAN_BALLISTA';
DELETE FROM Unit_AITypes WHERE UnitType='UNIT_ROMAN_BALLISTA';
DELETE FROM Unit_ClassUpgrades WHERE UnitType='UNIT_ROMAN_BALLISTA';
DELETE FROM Unit_FreePromotions WHERE UnitType='UNIT_ROMAN_BALLISTA';
DELETE FROM Unit_Flavors WHERE UnitType='UNIT_ROMAN_BALLISTA';
DELETE FROM UnitGameplay2DScripts WHERE UnitType='UNIT_ROMAN_BALLISTA';
UPDATE Traits SET CapitalBuildingModifier=15, BuildingProductionModifier=10 WHERE Type='TRAIT_CAPITAL_BUILDINGS_CHEAPER';
UPDATE Language_en_US SET Text='+10%[ICON_PRODUCTION] towards buildings. Get a +15%[ICON_PRODUCTION] towards buildings already built in the Capital.'
WHERE Tag='TXT_KEY_TRAIT_CAPITAL_BUILDINGS_CHEAPER';
INSERT INTO Language_en_US
(Text, Tag) Values
('[NEWLINE][ICON_BULLET]Trait Empire Modifier for Buildings: {1_Num}%','TXT_KEY_PRODMOD_BUILDING_TRAIT_PLAYER');
/*America*/

/*Ottomans*/

/*Korea*/
UPDATE Trait_SpecialistYieldChanges SET Yield=1 WHERE TraitType='TRAIT_SCHOLARS_JADE_HALL';
UPDATE Language_en_US SET Text='+1 [ICON_RESEARCH] science for all specialists and for all Great Person tile improvements. Receive a tech boost each time a scientific building/Wonder is built in the Korean capital.'
WHERE Tag='TXT_KEY_TRAIT_SCHOLARS_JADE_HALL';