/*--------------*/
/*	Pantheons	*/
/*--------------*/
/*Updates*/
Update Beliefs Set MinPopulation=2 WHERE Type='BELIEF_GOD_CRAFTSMEN';
/*INSERT INTO Belief_CityYieldChanges
(BeliefType, YieldType, Yield) VALUES
('BELIEF_GOD_CRAFTSMEN','YIELD_GOLD', 2);*/

UPDATE Beliefs Set MaxDistance=6, FaithFromKills=100 WHERE Type='BELIEF_GOD_WAR';

UPDATE Belief_BuildingClassYieldChanges SET YieldChange=2 WHERE BeliefType='BELIEF_ANCESTOR_WORSHIP' AND YieldType='YIELD_CULTURE';

INSERT INTO Belief_BuildingClassYieldChanges
(BeliefType, BuildingClassType, YieldType, YieldChange) VALUES
('BELIEF_GOD_KING','BUILDINGCLASS_PALACE','YIELD_FOOD',1);
INSERT INTO Belief_BuildingClassHappiness
(BeliefType, BuildingClassType, Happiness) VALUES
('BELIEF_GOD_KING','BUILDINGCLASS_PALACE',1);

UPDATE Beliefs SET PlotCultureCostModifier=-25, SettlerProductionModifier=20 WHERE Type='BELIEF_RELIGIOUS_SETTLEMENTS';

UPDATE Beliefs SET CityStrengthModifier=500, CityRangeStrikeModifier=0 WHERE Type='BELIEF_GODDESS_STRATEGY';

UPDATE Beliefs SET WonderProductionModifier=20, ObsoleteEra='ERA_RENAISSANCE' WHERE Type='BELIEF_MONUMENT_GODS';

UPDATE Beliefs SET MinPopulation=4 WHERE Type='BELIEF_GODDESS_LOVE';

DELETE FROM Belief_ImprovementYieldChanges WHERE BeliefType='BELIEF_ORAL_TRADITION' AND ImprovementType='IMPROVEMENT_PLANTATION' AND YieldType='YIELD_CULTURE';
INSERT INTO Belief_ImprovementYieldChanges
(BeliefType, ImprovementType, YieldType, Yield) VALUES
('BELIEF_ORAL_TRADITION', 'IMPROVEMENT_PLANTATION', 'YIELD_FAITH', 1);

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType='BELIEF_EARTH_MOTHER' AND ResourceType='RESOURCE_COPPER' AND YieldType='YIELD_FAITH';

DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType='BELIEF_FORMAL_LITURGY' AND ResourceType='RESOURCE_GOLD' AND YieldType='YIELD_CULTURE';
DELETE FROM Belief_ResourceYieldChanges WHERE BeliefType='BELIEF_FORMAL_LITURGY' AND ResourceType='RESOURCE_SILVER' AND YieldType='YIELD_CULTURE';
INSERT INTO Belief_ResourceYieldChanges
(BeliefType, ResourceType, YieldType, Yield) VALUES
('BELIEF_FORMAL_LITURGY', 'RESOURCE_COPPER', 'YIELD_FAITH', 1),
('BELIEF_FORMAL_LITURGY', 'RESOURCE_COPPER', 'YIELD_GOLD', 1),
('BELIEF_FORMAL_LITURGY', 'RESOURCE_SILVER', 'YIELD_GOLD', 1),
('BELIEF_FORMAL_LITURGY', 'RESOURCE_GOLD', 'YIELD_GOLD', 1);

/*NewPantheons*/
INSERT INTO Beliefs
(Type, Description, ShortDescription, Pantheon) VALUES
('BELIEF_CEREMONIAL_ROBES','TXT_KEY_BELIEF_CEREMONIAL_ROBES','TXT_KEY_BELIEF_CEREMONIAL_ROBES_SHORT', 1);

INSERT INTO Belief_ResourceYieldChanges
(BeliefType, ResourceType, YieldType, Yield) VALUES
('BELIEF_CEREMONIAL_ROBES','RESOURCE_SILK','YIELD_CULTURE', 2),
('BELIEF_CEREMONIAL_ROBES','RESOURCE_COTTON','YIELD_CULTURE', 2),
('BELIEF_CEREMONIAL_ROBES','RESOURCE_DYE','YIELD_CULTURE', 2);

INSERT INTO Beliefs
(Type,Description,ShortDescription,Pantheon) VALUES
('BELIEF_OFFERINGS_GODS','TXT_KEY_BELIEF_OFFERINGS_GODS','TXT_KEY_BELIEF_OFFERINGS_GODS_SHORT',1);
INSERT INTO Belief_ResourceYieldChanges
(BeliefType, ResourceType, YieldType, Yield) VALUES
('BELIEF_OFFERINGS_GODS','RESOURCE_SUGAR','YIELD_FAITH', 1),
('BELIEF_OFFERINGS_GODS','RESOURCE_SUGAR','YIELD_CULTURE', 1),
('BELIEF_OFFERINGS_GODS','RESOURCE_TRUFFLES','YIELD_FAITH', 1),
('BELIEF_OFFERINGS_GODS','RESOURCE_TRUFFLES','YIELD_CULTURE', 1),
('BELIEF_OFFERINGS_GODS','RESOURCE_SPICES','YIELD_FAITH', 1),
('BELIEF_OFFERINGS_GODS','RESOURCE_SPICES','YIELD_CULTURE', 1);

INSERT INTO Beliefs
(Type,Description,ShortDescription,Pantheon) VALUES
('BELIEF_NATURES_BLESSING','TXT_KEY_BELIEF_NATURES_BLESSING','TXT_KEY_BELIEF_NATURES_BLESSING_SHORT',1);
INSERT INTO Belief_FeatureYieldChanges
(BeliefType, FeatureType, YieldType, Yield) VALUES
('BELIEF_NATURES_BLESSING','FEATURE_FOREST','YIELD_FAITH',1);

INSERT INTO Beliefs
(Type,Description,ShortDescription,Pantheon) VALUES
('BELIEF_GIFTS_WISDOM','TXT_KEY_BELIEF_GIFTS_WISDOM','TXT_KEY_BELIEF_GIFTS_WISDOM_SHORT',1);
INSERT INTO Belief_ResourceYieldChanges
(BeliefType, ResourceType, YieldType, Yield) VALUES
('BELIEF_GIFTS_WISDOM','RESOURCE_COCOA','YIELD_SCIENCE',1);

/*Texts*/
INSERT INTO Language_en_US
(Tag,Text) VALUES
('TXT_KEY_PRODMOD_RELIGION_SETTLER','[NEWLINE][ICON_BULLET]Pantheon Modifier for Settlers: {1_Num}%');
Update Language_en_US Set Text='+1 [ICON_PRODUCTION] Production in cities with 2 population' Where 
Tag='TXT_KEY_BELIEF_GOD_CRAFTSMEN';
Update Language_en_US Set Text='+2 [ICON_CULTURE] Culture from Shrines' Where 
Tag='TXT_KEY_BELIEF_ANCESTOR_WORSHIP';
Update Language_en_US Set Text='+1 [ICON_PEACE] Faith from Tundra tiles' Where 
Tag='TXT_KEY_BELIEF_DANCE_AURORA';
/*Update Language_en_US Set Text='+20 HP healed per turn in your own territory' Where 
Tag='TXT_KEY_BELIEF_FAITH_HEALERS';*/
Update Language_en_US Set Text='Gain [ICON_PEACE] Faith equal to target strength if you win a battle within 6 tiles of your city' Where 
Tag='TXT_KEY_BELIEF_GOD_WAR';
Update Language_en_US Set Text='Palace provides +1 to these yields: [ICON_HAPPINESS_1], [ICON_FOOD], [ICON_CULTURE] , [ICON_PEACE] , [ICON_GOLD], [ICON_PRODUCTION], [ICON_RESEARCH]' Where 
Tag='TXT_KEY_BELIEF_GOD_KING';
Update Language_en_US Set Text='+25% faster border growth and +20% [ICON_PRODUCTION] Production for settlers in capital' Where 
Tag='TXT_KEY_BELIEF_RELIGIOUS_SETTLEMENTS';
Update Language_en_US Set Text='+5 [ICON_STRENGTH] Strength in all cities' Where 
Tag='TXT_KEY_BELIEF_GODDESS_STRATEGY';
Update Language_en_US Set Text='+20% [ICON_PRODUCTION] Production of Ancient/Classical/Medieval Wonders' Where 
Tag='TXT_KEY_BELIEF_MONUMENT_GODS';
Update Language_en_US Set Text='+1 [ICON_HAPPINESS_1] Happiness from cities with population of 4+' Where 
Tag='TXT_KEY_BELIEF_GODDESS_LOVE';
Update Language_en_US Set Text='+1 [ICON_PEACE] Faith from Plantations' Where 
Tag='TXT_KEY_BELIEF_ORAL_TRADITION';
Update Language_en_US Set Text='+1 [ICON_PEACE] Faith for each [ICON_RES_IRON] Iron and [ICON_RES_SALT] Salt resource' Where 
Tag='TXT_KEY_BELIEF_EARTH_MOTHER';
Update Language_en_US Set Text='+1 [ICON_GOLD] Gold and +1 [ICON_PEACE] Faith for each [ICON_RES_COPPER] Copper, [ICON_RES_GOLD] Gold and [ICON_RES_SILVER] Silver' Where 
Tag='TXT_KEY_BELIEF_FORMAL_LITURGY';
INSERT INTO Language_en_US
(Tag,Text) VALUES
('TXT_KEY_BELIEF_CEREMONIAL_ROBES','+2 [ICON_CULTURE] Culture for each [ICON_RES_SILK] Silk, [ICON_RES_COTTON] Cotton and [ICON_RES_DYE] Dye'),
('TXT_KEY_BELIEF_CEREMONIAL_ROBES_SHORT','Ceremonial Robes'),
('TXT_KEY_BELIEF_OFFERINGS_GODS','+1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith for each [ICON_RES_TRUFFLES] Truffles, [ICON_RES_SUGAR] Sugar and [ICON_RES_SPICES] Spices'),
('TXT_KEY_BELIEF_OFFERINGS_GODS_SHORT','Offerings to the Gods'),
('TXT_KEY_BELIEF_NATURES_BLESSING','+1 [ICON_PEACE] Faith from Forests'),
('TXT_KEY_BELIEF_NATURES_BLESSING_SHORT','Nature''s Blessing'),
('TXT_KEY_BELIEF_GIFTS_WISDOM','+1 [ICON_RESEARCH] Science for each [ICON_RES_COCOA] Cocoa'),
('TXT_KEY_BELIEF_GIFTS_WISDOM_SHORT','Gifts of Wisdom');

/*--------------*/
/*	Follower	*/
/*--------------*/
/*Updates*/
UPDATE Beliefs SET MinFollowers=0 WHERE Type='BELIEF_LITURGICAL_DRAMA';
UPDATE Belief_BuildingClassYieldChanges SET YieldChange=1 WHERE BeliefType='BELIEF_LITURGICAL_DRAMA' AND BuildingClassType='BUILDINGCLASS_AMPHITHEATER' AND YieldType='YIELD_FAITH';
INSERT INTO Belief_BuildingClassYieldChanges
(BeliefType, BuildingClassType, YieldType, YieldChange) VALUES
('BELIEF_LITURGICAL_DRAMA','BUILDINGCLASS_OPERA_HOUSE','YIELD_FAITH',2);

UPDATE Building_YieldChanges Set Yield=1 WHERE BuildingType='BUILDING_PAGODA' AND YieldType='YIELD_CULTURE';
UPDATE Building_YieldChanges Set Yield=2 WHERE BuildingType='BUILDING_CATHEDRAL' AND YieldType='YIELD_CULTURE';

UPDATE Beliefs SET MinFollowers=0 WHERE Type='BELIEF_ASCETISM';

UPDATE Beliefs SET MinFollowers=0 WHERE Type='BELIEF_CHORAL_MUSIC';
INSERT INTO Belief_BuildingClassYieldChanges
(BeliefType,BuildingClassType,YieldType,YieldChange) VALUES
('BELIEF_CHORAL_MUSIC','BUILDINGCLASS_OPERA_HOUSE','YIELD_CULTURE',2);

UPDATE Belief_BuildingClassYieldChanges SET YieldChange=8 WHERE BeliefType='BELIEF_RELIGIOUS_ART' AND BuildingClassType='BUILDINGCLASS_HERMITAGE' AND YieldType='YIELD_CULTURE';
UPDATE Belief_BuildingClassTourism SET Tourism=8 WHERE BeliefType='BELIEF_RELIGIOUS_ART' AND BuildingClassType='BUILDINGCLASS_HERMITAGE';

/*
UPDATE Belief_BuildingClassYieldChanges SET YieldChange=2 WHERE BeliefType='BELIEF_FEED_WORLD' AND BuildingClassType='BUILDINGCLASS_TEMPLE' AND YieldType='YIELD_FOOD';
*/
Update Language_en_US Set Text='Ampitheaters and Opera Houses provide +1 [ICON_PEACE] and +2 [ICON_PEACE] Faith respectively' Where 
Tag='TXT_KEY_BELIEF_LITURGICAL_DRAMA';
Update Language_en_US Set Text='Use [ICON_PEACE] Faith to purchase Pagodas (+2 [ICON_PEACE] Faith, +1 [ICON_CULTURE] Culture, +2 [ICON_HAPPINESS_1] Happiness)' Where 
Tag='TXT_KEY_BELIEF_PAGODAS';
Update Language_en_US Set Text='Use [ICON_PEACE] Faith to purchase Cathedrals (+1 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture, +1 [ICON_HAPPINESS_1] Happiness, 1 Great Work of Art slot)' Where 
Tag='TXT_KEY_BELIEF_CATHEDRALS';
Update Language_en_US Set Text='Shrines provide +1 [ICON_HAPPINESS_1] Happiness in cities' Where 
Tag='TXT_KEY_BELIEF_ASCETISM';
Update Language_en_US Set Text='Temples and Opera Houses provide +2 [ICON_CULTURE] and +1 [ICON_CULTURE] Culture respectively' Where 
Tag='TXT_KEY_BELIEF_CHORAL_MUSIC';
Update Language_en_US Set Text='Hermitage provides +8 [ICON_CULTURE] Culture and +8 [ICON_TOURISM] Tourism' Where 
Tag='TXT_KEY_BELIEF_RELIGIOUS_ART';
/*
Update Language_en_US Set Text='Shrines provide +1 [ICON_FOOD] Food and Temples provide +2 [ICON_FOOD] Food' Where 
Tag='TXT_KEY_BELIEF_FEED_WORLD';
*/

/*--------------*/
/*	Founder		*/
/*--------------*/
UPDATE Beliefs SET GoldPerXFollowers=5 WHERE Type='BELIEF_TITHE';

UPDATE Beliefs SET HappinessPerXPeacefulForeignFollowers=7 WHERE Type='BELIEF_PEACE_LOVING';
UPDATE Language_en_US SET Text='Charity Missions' WHERE Tag='TXT_KEY_BELIEF_PEACE_LOVING_SHORT';

Update Language_en_US Set Text='+1 [ICON_GOLD] Gold for every 5 followers of this religion' Where 
Tag='TXT_KEY_BELIEF_TITHE';
Update Language_en_US Set Text='+1 [ICON_HAPPINESS_1] Global Happiness for every 7 followers of this religion in foreign cities' Where 
Tag='TXT_KEY_BELIEF_PEACE_LOVING';

/*--------------*/
/*	Enhancer	*/
/*--------------*/
UPDATE Beliefs SET GreatPersonExpendedFaith=75 WHERE Type='BELIEF_RELIQUARY';

UPDATE Beliefs SET MissionaryStrengthModifier=40 WHERE Type='BELIEF_MISSIONARY_ZEAL';

Update Language_en_US Set Text='Gain 75 [ICON_PEACE] Faith each time a Great Person is expended' Where 
Tag='TXT_KEY_BELIEF_RELIQUARY';
Update Language_en_US Set Text='Missionary conversion strength +40%' Where 
Tag='TXT_KEY_BELIEF_MISSIONARY_ZEAL';


/*--------------*/
/*	Reformation	*/
/*--------------*/
UPDATE Beliefs SET FaithBuildingTourism=1 WHERE Type='BELIEF_SACRED_SITES';
INSERT INTO Belief_BuildingClassYieldChanges
(BeliefType, BuildingClassType, YieldType, YieldChange)VALUES
('BELIEF_SACRED_SITES','BUILDINGCLASS_CATHEDRAL','YIELD_GOLD',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_CATHEDRAL','YIELD_CULTURE',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_MOSQUE','YIELD_GOLD',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_MOSQUE','YIELD_CULTURE',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_MONASTERY','YIELD_GOLD',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_MONASTERY','YIELD_CULTURE',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_PAGODA','YIELD_GOLD',1),
('BELIEF_SACRED_SITES','BUILDINGCLASS_PAGODA','YIELD_CULTURE',1);
Update Language_en_US Set Text='Cathedrals, Mosques, Monasteries and Pagodas purchased with [ICON_PEACE] Faith provide 1 [ICON_TOURISM] Tourism, 1 [ICON_CULTURE] Culture and 1 [ICON_GOLD] Gold each.' Where 
Tag='TXT_KEY_BELIEF_SACRED_SITES';

/*New reformations*/
INSERT INTO Beliefs
(Type, Description, ShortDescription, Reformation) VALUES
('BELIEF_RELIGIOUS_INFLUENCE','TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE','TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE_SHORT',1);

INSERT INTO Belief_BuildingClassFaithPurchase
(BeliefType, BuildingClassType) VALUES
('BELIEF_RELIGIOUS_INFLUENCE','BUILDINGCLASS_OPERA_HOUSE'),
('BELIEF_RELIGIOUS_INFLUENCE','BUILDINGCLASS_MUSEUM'),
('BELIEF_RELIGIOUS_INFLUENCE','BUILDINGCLASS_BROADCAST_TOWER');

/*The faith costs are added in the faithcost.sql in religion*/

INSERT INTO Language_en_US
(Tag,Text) VALUES
('TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE','May build Opera Houses, Museums and Broadcast Towers with [ICON_PEACE] Faith.'),
('TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE_SHORT','Patron of the arts');

