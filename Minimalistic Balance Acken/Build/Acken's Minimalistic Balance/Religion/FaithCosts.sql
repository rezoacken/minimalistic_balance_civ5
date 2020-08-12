UPDATE Defines SET Value=20 WHERE Name='RELIGION_MIN_FAITH_FIRST_PANTHEON';
UPDATE Defines SET Value=0 WHERE Name='RELIGION_GAME_FAITH_DELTA_NEXT_PANTHEON';
UPDATE Defines SET Value=100 WHERE Name='RELIGION_BASE_CHANCE_PROPHET_SPAWN';

UPDATE Eras SET FaithCostMultiplier=125 WHERE Type='ERA_RENAISSANCE';
UPDATE Eras SET FaithCostMultiplier=150 WHERE Type='ERA_INDUSTRIAL';
UPDATE Eras SET FaithCostMultiplier=175 WHERE Type='ERA_MODERN';
UPDATE Eras SET FaithCostMultiplier=200 WHERE Type='ERA_POSTMODERN';
UPDATE Eras SET FaithCostMultiplier=225 WHERE Type='ERA_FUTURE';

UPDATE Buildings SET FaithCost=250 WHERE BuildingClass='BUILDINGCLASS_UNIVERSITY';
UPDATE Buildings SET FaithCost=340 WHERE BuildingClass='BUILDINGCLASS_PUBLIC_SCHOOL';
UPDATE Buildings SET FaithCost=450 WHERE BuildingClass='BUILDINGCLASS_LABORATORY';

UPDATE Buildings SET FaithCost=250, UnlockedByBelief=1 WHERE BuildingClass='BUILDINGCLASS_OPERA_HOUSE';
UPDATE Buildings SET FaithCost=340, UnlockedByBelief=1 WHERE BuildingClass='BUILDINGCLASS_MUSEUM';
UPDATE Buildings SET FaithCost=450, UnlockedByBelief=1 WHERE BuildingClass='BUILDINGCLASS_BROADCAST_TOWER';

UPDATE Units SET FaithCost=FaithCost/2 WHERE PrereqTech IN
(SELECT type FROM Technologies WHERE Era IN ('ERA_INDUSTRIAL','ERA_MODERN','ERA_POSTMODERN','ERA_FUTURE'));