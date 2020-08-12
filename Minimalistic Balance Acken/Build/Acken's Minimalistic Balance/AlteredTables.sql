ALTER TABLE Beliefs ADD COLUMN 'SettlerProductionModifier' integer default 0;
ALTER TABLE Beliefs ADD COLUMN 'CityStrengthModifier' integer default 0;

ALTER TABLE HandicapInfos ADD COLUMN 'AINumCitiesExponent' integer default 0;
ALTER TABLE HandicapInfos ADD COLUMN 'AITourismAdditiveModifier' integer default 0;

ALTER TABLE Policies ADD COLUMN 'NumCitiesFreeDefenseBuilding' integer default 0;
ALTER TABLE Policies ADD COLUMN 'SpyRankChange' integer default 0;
ALTER TABLE Policies ADD COLUMN 'InstantSpyRankChange' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ExtraCoupChance' integer default 0;
ALTER TABLE Policies ADD COLUMN 'RemoveCoupCapChance' integer default 0;
ALTER TABLE Policies ADD COLUMN 'CityStrengthModifier' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ExtraCityHitPoints' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ExtraTradeRoutes' integer default 0;
ALTER TABLE Policies ADD COLUMN 'BuildingGoldToCulture' integer default 0;
ALTER TABLE Policies ADD COLUMN 'AdditionalPersonalQuest' integer default 0;
ALTER TABLE Policies ADD COLUMN 'FasterPersonalQuest' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ExtraHappinessForFollowingCity' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ProphetSpawnGoldenAgeBonusPerFollower' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ProphetSpawnGoldBonusPerFollower' integer default 0;
ALTER TABLE Policies ADD COLUMN 'ProphetSpawnProductionBonusPerFollower' integer default 0;

ALTER TABLE Units ADD COLUMN 'UniqueBuyableWithFaith' boolean NOT NULL default false;

ALTER TABLE Buildings ADD COLUMN 'ReducedResistance' integer default 0;

ALTER TABLE Traits ADD COLUMN 'BuildingProductionModifier' integer default 0;

/*INSERT INTO Defines
(Name, Value) VALUES
('MOD_STACKCIVILIAN',0);*/

/*Please do not change this value unless you know what you are doing
This would allow for stacks of civilians but the worker AI will be somewhat confused*/