/*UPDATE Policies SET ExtraHappiness=2 WHERE Type='POLICY_LIBERTY';*/
UPDATE Policies SET BuildingProductionModifier=10 WHERE Type='POLICY_REPUBLIC';
/*UPDATE Policies SET ExtraTradeRoutes=1 WHERE Type='POLICY_LIBERTY_FINISHER';*/

UPDATE Policies SET GridX=4, GridY=1 where Type='POLICY_REPUBLIC';
UPDATE Policies SET GridX=1, GridY=1 where Type='POLICY_CITIZENSHIP';

DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_COLLECTIVE_RULE';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_REPRESENTATION';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_MERITOCRACY';
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy)
VALUES	('POLICY_MERITOCRACY',		'POLICY_REPUBLIC'),
		('POLICY_REPRESENTATION',		'POLICY_REPUBLIC'),
		('POLICY_COLLECTIVE_RULE',		'POLICY_CITIZENSHIP');

UPDATE Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Republic[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production in every City and +10% [ICON_PRODUCTION] Production for buildings in cities.' WHERE Tag='TXT_KEY_POLICY_REPUBLIC_HELP';
UPDATE Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Republic[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production in every City and +10% [ICON_PRODUCTION] Production for buildings in cities.' WHERE Tag='TXT_KEY_POLICY_REPUBLIC_HELP';
UPDATE Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Republic[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production in every City and +10% [ICON_PRODUCTION] Production for buildings in cities.' WHERE Tag='TXT_KEY_POLICY_REPUBLIC_HELP';

UPDATE Language_en_US Set Text='[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a truly free Great Person of your choice near the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';
UPDATE Language_DE_DE Set Text='[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a truly free Great Person of your choice near the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';
UPDATE Language_PL_PL Set Text='[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a truly free Great Person of your choice near the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';