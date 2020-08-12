-- Insert SQL Rules Here 

INSERT INTO Policy_SpecialistExtraYields
(PolicyType, YieldType, Yield) VALUES
('POLICY_CREATIVE_EXPRESSION','YIELD_SCIENCE',1);
DELETE FROM Policy_GreatWorkYieldChanges WHERE PolicyType='POLICY_CREATIVE_EXPRESSION';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Free Expression[ENDCOLOR][NEWLINE]+1 [ICON_RESEARCH] Science for every Specialists.' 
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP';
UPDATE Language_en_US SET Text='Free Expression' 
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION';
UPDATE Language_en_US SET Text='Civilopedia placeholder' 
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION_TEXT';

UPDATE Policies SET RiggingElectionModifier=0 WHERE Type='POLICY_COVERT_ACTION';
UPDATE Policies SET ExtraCoupChance=15, RemoveCoupCapChance=15 WHERE Type='POLICY_COVERT_ACTION';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Covert Action[ENDCOLOR][NEWLINE]Chance of success in a coup increased by 15% and also removes the 85% cap for coups.' 
WHERE Tag='TXT_KEY_POLICY_COVERT_ACTION_HELP';

UPDATE Policies SET SharedIdeologyTradeGoldChange=0, LandTradeRouteGoldChange=300, SeaTradeRouteGoldChange=300 WHERE Type='POLICY_ECONOMIC_UNION';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Economic Union[ENDCOLOR][NEWLINE]+3 [ICON_GOLD] Gold from all your trade routes with other civilizations.' 
WHERE Tag='TXT_KEY_POLICY_ECONOMIC_UNION_HELP';

UPDATE Policies SET CityStrengthMod=0, CityStrengthModifier=1500, ExtraCityHitPoints=50 WHERE Type='POLICY_THEIR_FINEST_HOUR';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Their Finest Hour[ENDCOLOR][NEWLINE][ICON_STRENGTH] Combat Strength of already existing Cities increased by 15 and hit points by 50.' 
WHERE Tag='TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP';

UPDATE UnitPromotions SET FriendlyLandsAttackModifier=20 WHERE Type='PROMOTION_NATIONALISM';
UPDATE Language_en_US SET Text='+20% attack bonus in friendly territory.' WHERE Tag='TXT_KEY_PROMOTION_NATIONALISM_HELP';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Patriotic War[ENDCOLOR][NEWLINE]+20% attack bonus when fighting in friendly territory.' 
WHERE Tag='TXT_KEY_POLICY_PATRIOTIC_WAR_HELP';

UPDATE Policies SET CatchSpiesModifier=0, InstantSpyRankChange=1, SpyRankChange=1 WHERE Type='POLICY_DOUBLE_AGENTS';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Double Agents[ENDCOLOR][NEWLINE]Spies get +1 level.' 
WHERE Tag='TXT_KEY_POLICY_DOUBLE_AGENTS_HELP';

UPDATE Policy_CityYieldChanges SET Yield=2 WHERE PolicyType='POLICY_PARTY_LEADERSHIP';
/*INSERT INTO Policy_CityYieldChanges
(PolicyType, YieldType, Yield) VALUES
('POLICY_FIVE_YEAR_PLAN','YIELD_FAITH',2);*/ /*Good enough already*/
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Party Leadership[ENDCOLOR][NEWLINE]+2 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture per city.' 
WHERE Tag='TXT_KEY_POLICY_PARTY_LEADERSHIP_HELP';

UPDATE Policies SET NewCityExtraPopulation=3, SettlerProductionModifier=100 WHERE Type='POLICY_RESETTLEMENT';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Resettlement[ENDCOLOR][NEWLINE]New Cities start with an extra 3 [ICON_CITIZEN] Population and settler production is increased by 100%.' 
WHERE Tag='TXT_KEY_POLICY_RESETTLEMENT_HELP';

UPDATE Policies SET StealTechFasterModifier=33 WHERE Type='POLICY_INDUSTRIAL_ESPIONAGE';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Industrial Espionage[ENDCOLOR][NEWLINE]Spies steal technologies 33% faster than the normal rate.' 
WHERE Tag='TXT_KEY_POLICY_INDUSTRIAL_ESPIONAGE_HELP';

UPDATE Policy_TourismOnUnitCreation SET Tourism=400 WHERE PolicyType='POLICY_FUTURISM';
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Futurism[ENDCOLOR][NEWLINE]+400 [ICON_TOURISM] Tourism with all known civs when a Great Writer, Artist or Musician is born.' 
WHERE Tag='TXT_KEY_POLICY_FUTURISM_HELP';

DELETE FROM Policy_CapitalYieldChanges WHERE PolicyType='POLICY_THIRD_ALTERNATIVE' AND YieldType='YIELD_SCIENCE';
INSERT INTO Policy_CapitalYieldChanges
(PolicyType,YieldType,Yield) VALUES
('POLICY_THIRD_ALTERNATIVE','YIELD_PRODUCTION',5);
UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]Third Alternative[ENDCOLOR][NEWLINE]Quantity of Strategic Resources produced is increased by 100%. +5 [ICON_FOOD] Food and +5 [ICON_Production] Production in [ICON_CAPITAL] Capital.'
WHERE Tag='TXT_KEY_POLICY_THIRD_ALTERNATIVE_HELP';

UPDATE Language_en_US SET Text='[COLOR_POSITIVE_TEXT]United Front[ENDCOLOR][NEWLINE]Militaristic City-States grant units twice as often.' 
WHERE Tag='TXT_KEY_POLICY_UNITED_FRONT_HELP';