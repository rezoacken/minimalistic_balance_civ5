UPDATE Buildings SET GoldMaintenance=1 Where BuildingClass='BUILDINGCLASS_MONUMENT';
UPDATE Buildings SET GoldMaintenance=0 Where BuildingClass='BUILDINGCLASS_SHRINE';
UPDATE Buildings SET GoldMaintenance=1 Where Type='BUILDING_TEMPLE';
UPDATE Buildings SET GoldMaintenance=3 Where BuildingClass='BUILDINGCLASS_COURTHOUSE';
UPDATE Buildings SET GoldMaintenance=1 Where BuildingClass='BUILDINGCLASS_WATERMILL';