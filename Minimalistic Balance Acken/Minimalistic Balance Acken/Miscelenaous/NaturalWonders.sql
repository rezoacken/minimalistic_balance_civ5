UPDATE Feature_YieldChanges SET Yield=4 WHERE FeatureType='FEATURE_CRATER' AND YieldType='YIELD_SCIENCE';
UPDATE Feature_YieldChanges SET Yield=4 WHERE FeatureType='FEATURE_CRATER' AND YieldType='YIELD_GOLD';

UPDATE Feature_YieldChanges SET Yield=4 WHERE FeatureType='FEATURE_MESA' AND YieldType='YIELD_PRODUCTION';
UPDATE Feature_YieldChanges SET Yield=4 WHERE FeatureType='FEATURE_MESA' AND YieldType='YIELD_GOLD';

UPDATE Feature_YieldChanges SET Yield=6 WHERE FeatureType='FEATURE_VOLCANO' AND YieldType='YIELD_SCIENCE';
UPDATE Natural_Wonder_Placement SET 
RequiredNumberOfAdjacentShallowWater=4,
CoreTileCanBeShallowWater=1,
AdjacentTilesCareAboutTerrainTypes=1,
CoreTileCanBeAnyTerrainType=0 WHERE NaturalWonderType='FEATURE_VOLCANO';

UPDATE Natural_Wonder_Placement SET AvoidBiggestLandmass=0 WHERE NaturalWonderType='FEATURE_FUJI';

UPDATE Feature_YieldChanges SET Yield=3 WHERE FeatureType='FEATURE_GIBRALTAR' AND YieldType='YIELD_FOOD';
UPDATE Feature_YieldChanges SET Yield=6 WHERE FeatureType='FEATURE_GIBRALTAR' AND YieldType='YIELD_GOLD';

UPDATE Feature_YieldChanges SET Yield=12 WHERE FeatureType='FEATURE_POTOSI' AND YieldType='YIELD_GOLD';
UPDATE Features SET OccurrenceFrequency=10 WHERE Type='FEATURE_POTOSI';
UPDATE Natural_Wonder_Placement SET OccurrenceFrequency=10 WHERE NaturalWonderType='FEATURE_POTOSI';

UPDATE Features SET OccurrenceFrequency=10 WHERE Type='FEATURE_SOLOMONS_MINES';
UPDATE Natural_Wonder_Placement SET OccurrenceFrequency=10 WHERE NaturalWonderType='FEATURE_SOLOMONS_MINES';

UPDATE Feature_YieldChanges SET Yield=3 WHERE FeatureType='FEATURE_GEYSER' AND YieldType='YIELD_SCIENCE';