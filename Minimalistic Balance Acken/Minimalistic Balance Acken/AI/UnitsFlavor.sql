UPDATE Unit_Flavors SET Flavor=24 WHERE UnitType='UNIT_BATTLESHIP' AND FlavorType='FLAVOR_NAVAL'; /*27*/
UPDATE Unit_Flavors SET Flavor=24 WHERE UnitType='UNIT_DESTROYER' AND FlavorType='FLAVOR_NAVAL'; /*18*/
UPDATE Unit_Flavors SET Flavor=20 WHERE UnitType='UNIT_SUBMARINE' AND FlavorType='FLAVOR_NAVAL'; /*20*/
UPDATE Unit_Flavors SET Flavor=22 WHERE UnitType='UNIT_NUCLEAR_SUBMARINE' AND FlavorType='FLAVOR_NAVAL'; /*32*/
UPDATE Unit_Flavors SET Flavor=28 WHERE UnitType='UNIT_MISSILE_CRUISER' AND FlavorType='FLAVOR_NAVAL'; /*23*/

DELETE FROM Unit_AITypes WHERE UnitType='UNIT_SUBMARINE' AND UnitAIType='UNITAI_ASSAULT_SEA';
DELETE FROM Unit_AITypes WHERE UnitType='UNIT_NUCLEAR_SUBMARINE' AND UnitAIType='UNITAI_ASSAULT_SEA'; 

/*UPDATE Units SET Combat=500 WHERE Class='UNITCLASS_WARRIOR'; /*test*/
