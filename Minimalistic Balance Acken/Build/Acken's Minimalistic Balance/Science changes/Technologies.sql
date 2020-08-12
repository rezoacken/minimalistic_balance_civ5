/*UPDATE Technologies SET GridX=3, Cost = 105 WHERE Type='TECH_IRON_WORKING';*/

UPDATE Technologies SET Cost = Cost * 1.05 WHERE Era='ERA_ANCIENT';
/*UPDATE Technologies SET Cost = Cost * 1.25 WHERE Era NOT IN ('ERA_ANCIENT');*/
UPDATE Technologies SET Cost = Cost * 1.10 WHERE Era='ERA_CLASSICAL';
UPDATE Technologies SET Cost = Cost * 1.15 WHERE Era='ERA_MEDIEVAL';
UPDATE Technologies SET Cost = Cost * 1.25 WHERE Era='ERA_RENAISSANCE';
UPDATE Technologies SET Cost = Cost * 1.35 WHERE Era='ERA_INDUSTRIAL';
UPDATE Technologies SET Cost = Cost * 1.45 WHERE Era='ERA_MODERN';
UPDATE Technologies SET Cost = Cost * 1.55 WHERE Era='ERA_POSTMODERN';
UPDATE Technologies SET Cost = Cost * 1.65 WHERE Era='ERA_FUTURE';

/*UPDATE Worlds SET NumCitiesTechCostMod = 0;*/

