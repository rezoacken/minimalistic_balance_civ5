/*National College changes*/
/*UPDATE Buildings SET SpecialistType="SPECIALIST_SCIENTIST" WHERE Type='BUILDING_NATIONAL_COLLEGE';
UPDATE Buildings SET SpecialistCount=1 WHERE Type='BUILDING_NATIONAL_COLLEGE';
DELETE FROM Building_YieldChanges Where BuildingType='BUILDING_NATIONAL_COLLEGE' AND YieldType='YIELD_SCIENCE';*/
UPDATE Building_YieldChanges SET Yield=4 Where BuildingType='BUILDING_NATIONAL_COLLEGE' AND YieldType='YIELD_SCIENCE';
UPDATE Building_YieldModifiers SET Yield=25 WHERE BuildingType='BUILDING_NATIONAL_COLLEGE';
/*Changes to Univesities and Laboratories Using class for uniques*/
UPDATE Buildings SET SpecialistCount=1 WHERE BuildingClass='BUILDINGCLASS_UNIVERSITY';
--v4 Laboratories now have 1 scientist slots, Library have gained 1 scientist slot
UPDATE Buildings SET SpecialistCount=1 WHERE BuildingClass='BUILDINGCLASS_LIBRARY';
UPDATE Buildings SET SpecialistCount=1 WHERE BuildingClass='BUILDINGCLASS_LABORATORY';
UPDATE Buildings SET SpecialistType="SPECIALIST_SCIENTIST" WHERE BuildingClass='BUILDINGCLASS_LIBRARY';

UPDATE Building_YieldModifiers SET Yield=25 WHERE BuildingType='BUILDING_OBSERVATORY' AND YieldType='YIELD_SCIENCE';
UPDATE Buildings SET Cost=160 WHERE Type='BUILDING_OBSERVATORY';

DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_LABORATORY';
DELETE FROM Building_YieldChanges WHERE BuildingType='BUILDING_PUBLIC_SCHOOL';
/*UPDATE Building_YieldChanges SET Yield= WHERE BuildingType='BUILDING_LABORATORY' AND YieldType='YIELD_SCIENCE';*/
/*INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield) VALUES
('BUILDING_LIBRARY', 'YIELD_SCIENCE', 1),
('BUILDING_ROYAL_LIBRARY', 'YIELD_SCIENCE', 1),
('BUILDING_PAPER_MAKER', 'YIELD_SCIENCE', 1);*/
