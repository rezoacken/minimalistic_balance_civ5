/*Bugs **=supposedly fixed*/
/*POLICY_COMMERCE*/
/*UPDATE Policies SET GreatMerchantRateModifier=25 WHERE Type='POLICY_COMMERCE';*/

/*POLICY_TRADE_UNIONS*/
UPDATE Policies SET BuildingGoldToCulture=15 WHERE Type='POLICY_TRADE_UNIONS';

/*POLICY_ENTREPRENEURSHIP*/
/*UPDATE Policies SET GreatMerchantRateModifier=0 WHERE Type='POLICY_COMMERCE';*/
UPDATE Policies SET EmbarkedExtraMoves=0 WHERE Type='POLICY_ENTREPRENEURSHIP';
/*INSERT INTO Policy_SpecialistExtraYields
(PolicyType, YieldType, Yield) VALUES
('POLICY_ENTREPRENEURSHIP','YIELD_GOLD',1);*/

/*POLICY_CARAVANS*/

/*POLICY_MERCANTILISM*/

/*POLICY_PROTECTIONISM*/

/*Finisher POLICY_COMMERCE_FINISHER*/
UPDATE POLICIES SET ExtraTradeRoutes=1 WHERE Type='POLICY_COMMERCE_FINISHER';

/*Layout*/
/*UPDATE Policies SET GridX=2, GridY=1 where Type='POLICY_MERCANTILISM';
UPDATE Policies SET GridX=4, GridY=1 where Type='POLICY_TRADE_UNIONS';
UPDATE Policies SET GridX=2, GridY=2 where Type='POLICY_ENTREPRENEURSHIP';
UPDATE Policies SET GridX=4, GridY=2 where Type='POLICY_CARAVANS';
UPDATE Policies SET GridX=2, GridY=3 where Type='POLICY_PROTECTIONISM';*/

/*Prereqs*/
/*DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_FLOURISHING_OF_ARTS';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_ARTISTIC_GENIUS';
DELETE FROM Policy_PrereqPolicies WHERE PolicyType='POLICY_ETHICS';
INSERT INTO Policy_PrereqPolicies
(PolicyType,			PrereqPolicy) VALUES	
('POLICY_ARTISTIC_GENIUS',		'POLICY_FLOURISHING_OF_ARTS'),
('POLICY_ARTISTIC_GENIUS',		'POLICY_CULTURAL_CENTERS'),
('POLICY_FINE_ARTS',		'POLICY_CULTURAL_CENTERS'),
('POLICY_ETHICS',		'POLICY_FINE_ARTS');*/

/*Texts*/
/*Update Language_en_US 
Set Text='[COLOR_POSITIVE_TEXT][COLOR_POSITIVE_TEXT]Commerce[ENDCOLOR] provides bonuses to empires focused on [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Adopting Commerce increases the capital [ICON_GOLD] Gold output by 25% and increases Great Merchant generation by 25%. Unlocks building Big Ben.[NEWLINE][NEWLINE]Adopting all Policies in the Commerce tree gives +1 [ICON_INTERNATIONAL_TRADE] Trade Route and +1 [ICON_GOLD] Gold for every Trade Posts. It also allows the purchase of Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';*/
Update Language_en_US 
Set Text='[COLOR_POSITIVE_TEXT]Merchant Dynasties[ENDCOLOR][NEWLINE]Allows you to recruit Landskenechts for gold and every time you buy a building with gold, get 15% of the [ICON_GOLD] Gold spent as [ICON_CULTURE] Culture.' 
Where Tag='TXT_KEY_POLICY_TRADE_UNIONS_HELP';
/*Update Language_en_US 
Set Text='[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE]Specialists give +1 [ICON_GOLD] Gold. Receive double [ICON_GOLD] Gold from Great Merchant trade missions.' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_en_US Set Text='' 
Where Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';*/
/*Update Language_en_US Set Text='' 
Where Tag='TXT_KEY_POLICY_CARAVANS_HELP';*/
/*Update Language_en_US Set Text='' 
Where Tag='TXT_KEY_POLICY_PROTECTIONISM_HELP';*/
INSERT INTO Language_en_US
(Tag, Text) VALUES
('TXT_KEY_TRADE_UNIONS_HEADER', 'Merchant Dynasties');

/*Update Language_DE_DE 
Set Text='[COLOR_POSITIVE_TEXT][COLOR_POSITIVE_TEXT]Commerce[ENDCOLOR] provides bonuses to empires focused on [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Adopting Commerce increases the capital [ICON_GOLD] Gold output by 25% and increases Great Merchant generation by 25%. Unlocks building Big Ben.[NEWLINE][NEWLINE]Adopting all Policies in the Commerce tree gives +1 [ICON_INTERNATIONAL_TRADE] Trade Route and +1 [ICON_GOLD] Gold for every Trade Posts. It also allows the purchase of Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';*/
Update Language_DE_DE 
Set Text='[COLOR_POSITIVE_TEXT]Merchant Dynasties[ENDCOLOR][NEWLINE]Allows you to recruit Landskenechts for gold and every time you buy a building with gold, get 15% of the [ICON_GOLD] Gold spent as [ICON_CULTURE] Culture.' 
Where Tag='TXT_KEY_POLICY_TRADE_UNIONS_HELP';
/*Update Language_DE_DE 
Set Text='[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE]Specialists give +1 [ICON_GOLD] Gold. Receive double [ICON_GOLD] Gold from Great Merchant trade missions.' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_DE_DE Set Text='' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_DE_DE Set Text='' 
Where Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';*/
/*Update Language_DE_DE Set Text='' 
Where Tag='TXT_KEY_POLICY_CARAVANS_HELP';*/
/*Update Language_DE_DE Set Text='' 
Where Tag='TXT_KEY_POLICY_PROTECTIONISM_HELP';*/
INSERT INTO Language_DE_DE
(Tag, Text) VALUES
('TXT_KEY_TRADE_UNIONS_HEADER', 'Merchant Dynasties');



/*Update Language_PL_PL 
Set Text='[COLOR_POSITIVE_TEXT][COLOR_POSITIVE_TEXT]Commerce[ENDCOLOR] provides bonuses to empires focused on [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Adopting Commerce increases the capital [ICON_GOLD] Gold output by 25% and increases Great Merchant generation by 25%. Unlocks building Big Ben.[NEWLINE][NEWLINE]Adopting all Policies in the Commerce tree gives +1 [ICON_INTERNATIONAL_TRADE] Trade Route and +1 [ICON_GOLD] Gold for every Trade Posts. It also allows the purchase of Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';*/
Update Language_PL_PL 
Set Text='[COLOR_POSITIVE_TEXT]Merchant Dynasties[ENDCOLOR][NEWLINE]Allows you to recruit Landskenechts for gold and every time you buy a building with gold, get 15% of the [ICON_GOLD] Gold spent as [ICON_CULTURE] Culture.' 
Where Tag='TXT_KEY_POLICY_TRADE_UNIONS_HELP';
/*Update Language_PL_PL 
Set Text='[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE]Specialists give +1 [ICON_GOLD] Gold. Receive double [ICON_GOLD] Gold from Great Merchant trade missions.' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_PL_PL Set Text='' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_PL_PL Set Text='' 
Where Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';*/
/*Update Language_PL_PL Set Text='' 
Where Tag='TXT_KEY_POLICY_CARAVANS_HELP';*/
/*Update Language_PL_PL Set Text='' 
Where Tag='TXT_KEY_POLICY_PROTECTIONISM_HELP';*/
INSERT INTO Language_PL_PL
(Tag, Text) VALUES
('TXT_KEY_TRADE_UNIONS_HEADER', 'Merchant Dynasties');