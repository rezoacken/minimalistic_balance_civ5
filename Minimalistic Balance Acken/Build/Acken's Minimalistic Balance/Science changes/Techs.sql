-- Insert SQL Rules Here 
UPDATE Technologies Set EmbarkedMoveChange=1 Where Type='TECH_COMPASS';

DELETE FROM Technology_PrereqTechs WHERE TechType='TECH_CONSTRUCTION' AND PrereqTech='TECH_THE_WHEEL';
UPDATE Technologies SET GridY=7 WHERE Type='TECH_ARCHERY';
INSERT INTO Technology_PrereqTechs
(TechType, PrereqTech) VALUES
('TECH_CONSTRUCTION','TECH_ARCHERY');

UPDATE Technology_PrereqTechs SET PrereqTech='TECH_PHILOSOPHY' WHERE TechType='TECH_COMPASS' AND PrereqTech='TECH_THEOLOGY';
UPDATE Technologies SET GridY=2 WHERE Type='TECH_DRAMA';
UPDATE Technologies SET GridY=2 WHERE Type='TECH_THEOLOGY';
DELETE FROM Technology_PrereqTechs WHERE TechType='TECH_STEAM_POWER' AND PrereqTech='TECH_SCIENTIFIC_THEORY';
DELETE FROM Technology_PrereqTechs WHERE TechType='TECH_RIFLING' AND PrereqTech='TECH_ECONOMICS';
INSERT INTO Technology_PrereqTechs
(TechType, PrereqTech) VALUES
('TECH_GUNPOWDER','TECH_MACHINERY');
DELETE FROM Technology_PrereqTechs WHERE TechType='TECH_BALLISTICS' AND PrereqTech='TECH_FLIGHT';
UPDATE Technologies SET GridY=6 WHERE Type='TECH_BALLISTICS';

/*UPDATE Technologies SET GridY=7 WHERE Type='TECH_REPLACEABLE_PARTS';
UPDATE Technologies SET GridY=3 WHERE Type='TECH_RAILROAD';

UPDATE Technology_PrereqTechs SET PrereqTech='TECH_DYNAMITE' WHERE TechType='TECH_REPLACEABLE_PARTS' AND PrereqTech='TECH_ELECTRICITY';
UPDATE Technology_PrereqTechs SET PrereqTech='TECH_ELECTRICITY' WHERE TechType='TECH_RAILROAD' AND PrereqTech='TECH_DYNAMITE';
UPDATE Technology_PrereqTechs SET PrereqTech='TECH_RAILROAD' WHERE TechType='TECH_PLASTIC' AND PrereqTech='TECH_REPLACEABLE_PARTS';
UPDATE Technology_PrereqTechs SET PrereqTech='TECH_RAILROAD' WHERE TechType='TECH_ELECTRONICS' AND PrereqTech='TECH_REPLACEABLE_PARTS';
UPDATE Technology_PrereqTechs SET PrereqTech='TECH_REPLACEABLE_PARTS' WHERE TechType='TECH_COMBUSTION' AND PrereqTech='TECH_RAILROAD';
UPDATE Technology_PrereqTechs SET PrereqTech='TECH_REPLACEABLE_PARTS' WHERE TechType='TECH_BALLISTICS' AND PrereqTech='TECH_RAILROAD';
*/

UPDATE Units SET PrereqTech='TECH_RAILROAD' WHERE Class='UNITCLASS_GREAT_WAR_INFANTRY';
UPDATE Units SET ObsoleteTech='TECH_RAILROAD' WHERE Class='UNITCLASS_RIFLEMAN';
UPDATE Buildings SET PrereqTech='TECH_REPLACEABLE_PARTS' WHERE BuildingClass='BUILDINGCLASS_NEUSCHWANSTEIN';

UPDATE Units SET PrereqTech='TECH_COMBINED_ARMS' WHERE Class='UNITCLASS_INFANTRY';
UPDATE Units SET ObsoleteTech='TECH_COMBINED_ARMS' WHERE Class='UNITCLASS_GREAT_WAR_INFANTRY';
/*UPDATE Units SET PrereqTech='TECH_PLASTIC' WHERE Class='UNITCLASS_MACHINE_GUN';*/

UPDATE Units SET PrereqTech='TECH_METALLURGY' WHERE Class='UNITCLASS_CANNON';
UPDATE Units SET ObsoleteTech='TECH_METALLURGY' WHERE Class='UNITCLASS_TREBUCHET';

UPDATE Buildings SET PrereqTech='TECH_CHEMISTRY' WHERE BuildingClass='BUILDINGCLASS_ARSENAL';

UPDATE Units SET PrereqTech='TECH_CHIVALRY' WHERE Class='UNITCLASS_PIKEMAN';
UPDATE Units SET ObsoleteTech='TECH_CHIVALRY' WHERE Class='UNITCLASS_SPEARMAN';
UPDATE Units SET ObsoleteTech='TECH_IRON_WORKING' WHERE Class='UNITCLASS_WARRIOR';