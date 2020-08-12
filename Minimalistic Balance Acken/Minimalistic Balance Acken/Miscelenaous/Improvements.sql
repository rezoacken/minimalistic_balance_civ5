UPDATE Improvement_ResourceType_Yields Set Yield=Yield+1 WHERE YieldType='YIELD_GOLD' AND ResourceType NOT IN('RESOURCE_CITRUS','RESOURCE_COCOA');

UPDATE Improvement_Yields Set Yield=8 WHERE YieldType='YIELD_GOLD' AND ImprovementType='IMPROVEMENT_CUSTOMS_HOUSE';
UPDATE Improvement_Yields Set Yield=5 WHERE YieldType='YIELD_PRODUCTION' AND ImprovementType='IMPROVEMENT_MANUFACTORY';
UPDATE Improvement_Yields Set Yield=7 WHERE YieldType='YIELD_SCIENCE' AND ImprovementType='IMPROVEMENT_ACADEMY';

UPDATE Improvement_TechYieldChanges Set Yield=2 WHERE YieldType='YIELD_GOLD' AND ImprovementType='IMPROVEMENT_CUSTOMS_HOUSE' AND TechType='TECH_ECONOMICS';
UPDATE Improvement_TechYieldChanges Set Yield=4 WHERE YieldType='YIELD_SCIENCE' AND ImprovementType='IMPROVEMENT_ACADEMY' AND TechType='TECH_ATOMIC_THEORY';
INSERT INTO Improvement_TechYieldChanges
(ImprovementType, TechType, YieldType, Yield) VALUES
('IMPROVEMENT_CUSTOMS_HOUSE','TECH_REFRIGERATION','YIELD_GOLD',2),
('IMPROVEMENT_CUSTOMS_HOUSE','TECH_STEAM_POWER','YIELD_GOLD',2),
('IMPROVEMENT_CUSTOMS_HOUSE','TECH_COMPUTERS','YIELD_GOLD',2),
('IMPROVEMENT_MANUFACTORY','TECH_PHYSICS','YIELD_PRODUCTION',1),
('IMPROVEMENT_MANUFACTORY','TECH_STEAM_POWER','YIELD_PRODUCTION',1),
('IMPROVEMENT_MANUFACTORY','TECH_COMBUSTION','YIELD_PRODUCTION',1),
('IMPROVEMENT_MANUFACTORY','TECH_ROBOTICS','YIELD_PRODUCTION',1),
('IMPROVEMENT_ACADEMY','TECH_PRINTING_PRESS','YIELD_SCIENCE',2),
('IMPROVEMENT_ACADEMY','TECH_ELECTRONICS','YIELD_SCIENCE',2),
('IMPROVEMENT_ACADEMY','TECH_TELECOM','YIELD_SCIENCE',4);

INSERT INTO Improvement_ValidFeatures
(ImprovementType, FeatureType) VALUES
('IMPROVEMENT_LUMBERMILL','FEATURE_JUNGLE');