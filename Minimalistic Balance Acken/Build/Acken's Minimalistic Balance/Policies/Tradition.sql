UPDATE Policies SET GarrisonedCityRangeStrikeModifier=0, NumCitiesFreeDefenseBuilding=4 WHERE Type='POLICY_OLIGARCHY';
UPDATE Policies SET CapitalGrowthMod=15 WHERE Type='POLICY_LANDED_ELITE';

DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_LEGALISM';
UPDATE Policies Set GridX=5, GridY=1 where Type='POLICY_OLIGARCHY';
UPDATE Policies Set GridX=3, GridY=1 where Type='POLICY_LEGALISM';
UPDATE Policies Set GridX=2, GridY=2 where Type='POLICY_LANDED_ELITE';
UPDATE Policies Set GridX=4, GridY=2 where Type='POLICY_MONARCHY';

UPDATE Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Oligarchy[ENDCOLOR][NEWLINE]Garrisoned units cost no maintenance and your first four cities get a free defense building.' WHERE Tag='TXT_KEY_POLICY_OLIGARCHY_HELP';
UPDATE Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Oligarchy[ENDCOLOR][NEWLINE]Garrisoned units cost no maintenance and your first four cities get a free defense building.' WHERE Tag='TXT_KEY_POLICY_OLIGARCHY_HELP';
UPDATE Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Oligarchy[ENDCOLOR][NEWLINE]Garrisoned units cost no maintenance and your first four cities get a free defense building.' WHERE Tag='TXT_KEY_POLICY_OLIGARCHY_HELP';

UPDATE Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Landed Elite[ENDCOLOR][NEWLINE]+15% [ICON_FOOD] Growth and +2 [ICON_FOOD] Food in the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_LANDED_ELITE_HELP';
UPDATE Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Landed Elite[ENDCOLOR][NEWLINE]+15% [ICON_FOOD] Growth and +2 [ICON_FOOD] Food in the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_LANDED_ELITE_HELP';
UPDATE Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Landed Elite[ENDCOLOR][NEWLINE]+15% [ICON_FOOD] Growth and +2 [ICON_FOOD] Food in the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_LANDED_ELITE_HELP';