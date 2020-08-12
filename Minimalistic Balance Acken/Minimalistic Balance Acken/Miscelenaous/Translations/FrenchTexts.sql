INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_MINOR','[COLOR_NEGATIVE_TEXT]Notre colonisation intensive est troublante.[ENDCOLOR]'),
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_MAJOR','[COLOR_NEGATIVE_TEXT]Ils considèrent que nous nous colonisons agressivement.[ENDCOLOR]'),
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_SEVERE','[COLOR_NEGATIVE_TEXT]Ils considèrent que nous nous colonisons trop de terres ![ENDCOLOR]'),
('TXT_KEY_DIPLO_RECKLESS_EXPANDER_CRITICAL','[COLOR_NEGATIVE_TEXT]Notre colonisation agressive est une menace ![ENDCOLOR]'),
('TXT_KEY_DIPLO_CASUS_BELLI_US','Nous avons un casus belli contre eux (nous pouvons capturer une ville sans conséquence diplomatique)!'),
('TXT_KEY_DIPLO_CASUS_BELLI_THEM','[COLOR_NEGATIVE_TEXT]Ils ont un casus belli contre nous ![ENDCOLOR]');

UPDATE Language_FR_FR Set Text='Chef' WHERE Tag='TXT_KEY_HANDICAP_SETTLER';
UPDATE Language_FR_FR Set Text='Débutant' WHERE Tag='TXT_KEY_HANDICAP_SETTLER_HELP';
UPDATE Language_FR_FR Set Text='Warlord' WHERE Tag='TXT_KEY_HANDICAP_CHIEFTAIN';
UPDATE Language_FR_FR Set Text='Facile' WHERE Tag='TXT_KEY_HANDICAP_CHIEFTAIN_HELP';
UPDATE Language_FR_FR Set Text='Prince' WHERE Tag='TXT_KEY_HANDICAP_WARLORD';
UPDATE Language_FR_FR Set Text='Normal' WHERE Tag='TXT_KEY_HANDICAP_WARLORD_HELP';
UPDATE Language_FR_FR Set Text='Roi' WHERE Tag='TXT_KEY_HANDICAP_PRINCE';
UPDATE Language_FR_FR Set Text='Hard' WHERE Tag='TXT_KEY_HANDICAP_PRINCE_HELP';
UPDATE Language_FR_FR Set Text='Emperor' WHERE Tag='TXT_KEY_HANDICAP_KING';
UPDATE Language_FR_FR Set Text='Very Hard' WHERE Tag='TXT_KEY_HANDICAP_KING_HELP';
UPDATE Language_FR_FR Set Text='Immortal' WHERE Tag='TXT_KEY_HANDICAP_EMPEROR';
UPDATE Language_FR_FR Set Text='Extremely Difficult' WHERE Tag='TXT_KEY_HANDICAP_EMPEROR_HELP';
UPDATE Language_FR_FR Set Text='DemiGod' WHERE Tag='TXT_KEY_HANDICAP_IMMORTAL';
UPDATE Language_FR_FR Set Text='Elite Difficulty' WHERE Tag='TXT_KEY_HANDICAP_IMMORTAL_HELP';

UPDATE Language_FR_FR SET Text='+25% [COLOR_POSITIVE_TEXT]Defense[ENDCOLOR] against all [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR].' WHERE Tag='TXT_KEY_PROMOTION_COVER_1_HELP';
UPDATE Language_FR_FR SET Text='+25% [COLOR_POSITIVE_TEXT]Defense[ENDCOLOR] against all [COLOR_POSITIVE_TEXT]Ranged Attacks[ENDCOLOR].' WHERE Tag='TXT_KEY_PROMOTION_COVER_2_HELP';
UPDATE Language_FR_FR SET Text='Bonus vs Tanks (50).' WHERE Tag='TXT_KEY_PROMOTION_ANTI_TANK';
/*UPDATE Language_FR_FR SET Text='+150% Bonus vs Cities.' WHERE Tag='TXT_KEY_PROMOTION_CITY_SIEGE_HELP';
UPDATE Language_FR_FR SET Text='Bonus vs Cities (150)' WHERE Tag='TXT_KEY_PROMOTION_CITY_SIEGE';*/
UPDATE Language_FR_FR SET Text='Penalty Attacking Cities (20)' WHERE Tag='TXT_KEY_PROMOTION_CITY_PENALTY';
UPDATE Language_FR_FR SET Text='20% Penalty Attacking Cities.' WHERE Tag='TXT_KEY_PROMOTION_CITY_PENALTY_HELP';
UPDATE Language_FR_FR SET Text='Penalty Attacking Cities (20)' WHERE Tag='TXT_KEY_SMALL_PROMOTION_CITY_PENALTY';
UPDATE Language_FR_FR SET Text='20% Penalty Attacking Cities.' WHERE Tag='TXT_KEY_SMALL_PROMOTION_CITY_PENALTY_HELP';

UPDATE Language_FR_FR SET Text='+1 [ICON_FOOD] Food from Coast and Ocean Tiles.[NEWLINE][NEWLINE]Each source of [ICON_RES_FISH] Fish worked by this City produces +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag='TXT_KEY_BUILDING_LIGHTHOUSE_HELP';
UPDATE Language_FR_FR SET Text='+1 [ICON_GOLD] Gold from Coast and Ocean Tiles.[NEWLINE][NEWLINE]Forms a [ICON_CONNECTED] City Connection with the [ICON_CAPITAL] Capital over water (if they''re not already [ICON_CONNECTED] connected by land). Sea trade routes originating from this city have a 50% increase in range and produce an additional 2 [ICON_GOLD] Gold when connecting to another civilization.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag='TXT_KEY_BUILDING_HARBOR_HELP';
UPDATE Language_FR_FR SET Text='+1 [ICON_PRODUCTION] Production from Coast and Ocean Tiles. +15% [ICON_PRODUCTION] Production when building Naval Units.[NEWLINE][NEWLINE]City must be built on the coast.'
WHERE Tag='TXT_KEY_BUILDING_SEAPORT_HELP';

UPDATE Language_FR_FR SET Text='Each source of [ICON_RES_BISON] Bison [ICON_RES_WHEAT] Wheat [ICON_RES_BANANA] Bananas and [ICON_RES_DEER] Deer worked by this City produce +1 [ICON_FOOD] Food.[NEWLINE][NEWLINE]Allows [ICON_FOOD] Food to be moved from this city along trade routes inside your civilization.' WHERE Tag='TXT_KEY_BUILDING_GRANARY_HELP';
UPDATE Language_FR_FR SET Text='Each source of [ICON_RES_GOLD] Gold, [ICON_RES_SILVER] Silver, and [ICON_RES_COPPER] Copper worked by this City produces +2 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]City must have at least one of these resources mined nearby.' WHERE Tag='TXT_KEY_BUILDING_MINT_HELP';
UPDATE Language_FR_FR SET Text='The Mint can only be constructed in a city with improved gold, silver, or copper resources nearby. The Mint increases the [ICON_GOLD] Gold output of each such resource the city has access to.' WHERE Tag='TXT_KEY_BUILDING_MINT_STRATEGY';
/*UPDATE Language_FR_FR SET Text='City must have access to a [ICON_RES_URANIUM] Uranium ressource and not contain a solar plant.' WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_HELP';
UPDATE Language_FR_FR SET Text='The Nuclear Plant significantly increases a city''s productivity. A Nuclear Plant requires [ICON_RES_URANIUM] Uranium near the city. The city must possess a Factory before it can be constructed.'
WHERE Tag='TXT_KEY_BUILDING_NUCLEAR_PLANT_STRATEGY';*/
UPDATE Language_en_US SET Text='Land trade routes originating from this city have a 50% increase in range and produce an additional 3 [ICON_GOLD] Gold when connecting to another civilization.' 
WHERE Tag='TXT_KEY_BUILDING_CARAVANSARY_HELP';
UPDATE Language_FR_FR SET Text='Requires Piety. Must be built in a Holy City. 3 free Missionaries appear.' 
WHERE Tag='TXT_KEY_WONDER_BOROBUDUR_HELP';
UPDATE Language_FR_FR SET Text='Must be built in a Holy city. All Missionaries born in this city can spread religion three times. Provides a free Mosque in the city in which it is built.' 
WHERE Tag='TXT_KEY_WONDER_MOSQUE_OF_DJENNE_HELP';
UPDATE Language_FR_FR SET Text='[ICON_CULTURE] Culture and [ICON_GOLD] Gold costs of acquiring new tiles reduced by 25% in every city. Provides a free University in the city in which it is built.' 
WHERE Tag='TXT_KEY_WONDER_ANGKOR_WAT_HELP';
UPDATE Language_FR_FR SET Text='Must have built a Market in all Cities. The cost goes up the more cities there are in the empire. Gain an additional trade route slot. Trade routes other players make to a city with an East India Company will generate an extra 4 [ICON_GOLD] Gold for the city owner and the trade route owner gains an additional 2 [ICON_GOLD] Gold.' 
WHERE Tag='TXT_KEY_BUILDING_NATIONAL_TREASURY_HELP';
UPDATE Language_FR_FR SET Text='Provides an additional spy and levels up all your existing spies. Also provides a 15% reduction in enemy spy effectiveness. Must have a Constabulary in all cities.'
WHERE Tag='TXT_KEY_BUILDING_INTELLIGENCE_AGENCY_HELP';
UPDATE Language_FR_FR SET Text='Creates a copy of each type of military land unit you control and places the unit near the city where the Terracotta Army is constructed. Produces +5 [ICON_CULTURE] Culture after Archaeology.'
WHERE Tag='TXT_KEY_WONDER_TERRA_COTTA_ARMY_HELP';
UPDATE Language_FR_FR SET Text='Requires Order. +20% [ICON_PRODUCTION] Production in the city. 1 Free Social Policy.'
WHERE Tag='TXT_KEY_WONDER_KREMLIN_HELP';

Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Aesthetics[ENDCOLOR] improves the civilization ability to generate [ICON_TOURISM] Tourism.[NEWLINE][NEWLINE]Adopting Aesthetics allows you to earn Great Writers, Artists, and Musicians 25% faster. Unlocks the Uffizi Wonder.[NEWLINE][NEWLINE]Adopting all policies doubles the theming bonus from Museums and Wonders. The finisher also reveals Hidden Antiquity Sites and allows you to buy Great Musicians with [ICON_PEACE] Faith in the industrial era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_AESTHETICS_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Flourishing of the Arts[ENDCOLOR][NEWLINE][ICON_CULTURE] Culture increased by 33% in all cities which have built a World Wonder and the empire immediately enters a [ICON_GOLDEN_AGE] Golden Age.' 
Where Tag='TXT_KEY_POLICY_FLOURISHING_OF_ARTS_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Cultural Centers[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers are built 50% faster as well as Archaeologists.' 
Where Tag='TXT_KEY_POLICY_CULTURAL_CENTERS_HELP';
/*Update Language_FR_FR Set Text='' 
Where Tag='TXT_KEY_POLICY_ETHICS_HELP';*/
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Artistic Genius[ENDCOLOR][NEWLINE]A Great Artist appear and all Great Works give +1[ICON_TOURISM] Tourism.' 
Where Tag='TXT_KEY_POLICY_ARTISTIC_GENIUS_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Fine Arts[ENDCOLOR][NEWLINE]Amphitheaters, Opera Houses, Museums and Broadcast Towers now provide +1[ICON_TOURISM] Tourism.  Also receive 50% of your excess [ICON_HAPPINESS_1] Happiness in [ICON_CULTURE] Culture' 
Where Tag='TXT_KEY_POLICY_FINE_ARTS_HELP';
Update Language_FR_FR Set Text='Archaeologist Units' 
Where Tag='TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST';

/*Update Language_FR_FR 
Set Text='[COLOR_POSITIVE_TEXT][COLOR_POSITIVE_TEXT]Commerce[ENDCOLOR] provides bonuses to empires focused on [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Adopting Commerce increases the capital [ICON_GOLD] Gold output by 25% and increases Great Merchant generation by 25%. Unlocks building Big Ben.[NEWLINE][NEWLINE]Adopting all Policies in the Commerce tree gives +1 [ICON_INTERNATIONAL_TRADE] Trade Route and +1 [ICON_GOLD] Gold for every Trade Posts. It also allows the purchase of Great Merchants with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_COMMERCE_HELP';*/
Update Language_FR_FR 
Set Text='[COLOR_POSITIVE_TEXT]Merchant Dynasties[ENDCOLOR][NEWLINE]Allows you to recruit Landskenechts for gold and every time you buy a building with gold, get 15% of the [ICON_GOLD] Gold spent as [ICON_CULTURE] Culture.' 
Where Tag='TXT_KEY_POLICY_TRADE_UNIONS_HELP';
/*Update Language_FR_FR 
Set Text='[COLOR_POSITIVE_TEXT]Entrepreneurship[ENDCOLOR][NEWLINE]Specialists give +1 [ICON_GOLD] Gold. Receive double [ICON_GOLD] Gold from Great Merchant trade missions.' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_FR_FR Set Text='' 
Where Tag='TXT_KEY_POLICY_ENTREPRENEURSHIP_HELP';*/
/*Update Language_FR_FR Set Text='' 
Where Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';*/
/*Update Language_FR_FR Set Text='' 
Where Tag='TXT_KEY_POLICY_CARAVANS_HELP';*/
/*Update Language_FR_FR Set Text='' 
Where Tag='TXT_KEY_POLICY_PROTECTIONISM_HELP';*/
INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_TRADE_UNIONS_HEADER', 'Merchant Dynasties');

/*Texts*/
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR] enhances naval empires.[NEWLINE][NEWLINE]Adopting Exploration gives +1 [ICON_MOVES] Movement for Naval units and +1 Sight for Naval combat units. It also allows increases embarked [ICON_MOVES] moves of land units by 1. Unlocks building the Louvre.[NEWLINE][NEWLINE]Adopting all policies increases naval units [ICON_STRENGTH] strength and [ICON_RANGE_STRENGTH] ranged strength by 15% and Admirals may be purchased with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
/*Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR][NEWLINE]' 
Where Tag='TXT_KEY_POLICY_MARITIME_INFRASTRUCTURE_HELP';*/
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Naval Tradition[ENDCOLOR][NEWLINE]Gives +1[ICON_HAPPINESS_1] for every lighthouse, harbor and seaport. It also boosts the production of these buildings by 50%.' 
Where Tag='TXT_KEY_POLICY_NAVAL_TRADITION_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Merchant Navy[ENDCOLOR][NEWLINE]Gives +2[ICON_GOLD] Gold for all Lighthouse, Harbor and Seaports. Also boosts the East India Company with +4[ICON_CULTURE] Culture and +4[ICON_PRODUCTION] Production.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_NAVY_HELP';
/*Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT][ENDCOLOR][NEWLINE]' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';*/
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Treasure Fleets[ENDCOLOR][NEWLINE]Gives an extra +3[ICON_GOLD] Gold, +4[ICON_RESEARCH] Science and +2[ICON_CULTURE] for every international sea trade routes.' 
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';

INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_PROMOTION_EXPLORATION_FINISHER_BOOST', 'Exploration Finisher'),
('TXT_KEY_PROMOTION_EXPLORATION_FINISHER_BOOST_HELP', '+10% [ICON_STRENGTH] Combat Strength');

Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Honor[ENDCOLOR] is best for agressive and militaristic civilizations. It unlocks the Statue of Zeus.[NEWLINE][NEWLINE]Adopting Honor will grant [ICON_CULTURE] when destroying enemy units (50% of [ICON_STRENGTH]). It will also periodically reveal barbarian camps and boost strength against barbarians by 33%.[NEWLINE][NEWLINE]Adopting all Policies in the Honor tree will grant gold when killing units and boosts the production of Courthouses by 50%. It also allows the purchase of Great Generals with [ICON_PEACE] Faith starting in the Industrial Era.' Where Tag='TXT_KEY_POLICY_BRANCH_HONOR_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Professional Army[ENDCOLOR][NEWLINE]Barracks, Armories, and Military Academies production is doubled and upgrading units costs 33% less [ICON_GOLD] gold.' Where Tag='TXT_KEY_POLICY_PROFESSIONAL_ARMY_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Military Caste[ENDCOLOR][NEWLINE]Barracks now give +1 [ICON_HAPPINESS_1] Happiness, and +2 [ICON_CULTURE] Culture.' Where Tag='TXT_KEY_POLICY_MILITARY_CASTE_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Warrior Code[ENDCOLOR][NEWLINE]Receive 1 Spearman and 1 Archer and 2 units cost no maintenance. General points are increased by 50%.' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Discipline[ENDCOLOR][NEWLINE]+15% [ICON_STRENGTH] combat strength for melee Units next to military units. Military units also gain 50% more Experience from combat.' Where Tag='TXT_KEY_POLICY_DISCIPLINE_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Get 15% more [ICON_PRODUCTION] Production toward military units and the Heroic Epic is produced twice as fast. You also receive a free Great General.' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';

UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Covert Action[ENDCOLOR][NEWLINE]Chance of success in a coup increased by 15% and also removes the 85% cap for coups.' 
WHERE Tag='TXT_KEY_POLICY_COVERT_ACTION_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Economic Union[ENDCOLOR][NEWLINE]+3 [ICON_GOLD] Gold from all your trade routes with other civilizations.' 
WHERE Tag='TXT_KEY_POLICY_ECONOMIC_UNION_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Their Finest Hour[ENDCOLOR][NEWLINE][ICON_STRENGTH] Combat Strength of already existing Cities increased by 15 and hit points by 50.' 
WHERE Tag='TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP';
UPDATE Language_FR_FR SET Text='+20% attack bonus in friendly territory.' WHERE Tag='TXT_KEY_PROMOTION_NATIONALISM_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Patriotic War[ENDCOLOR][NEWLINE]+20% attack bonus when fighting in friendly territory.' 
WHERE Tag='TXT_KEY_POLICY_PATRIOTIC_WAR_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Double Agents[ENDCOLOR][NEWLINE]Spies get +1 level.' 
WHERE Tag='TXT_KEY_POLICY_DOUBLE_AGENTS_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Party Leadership[ENDCOLOR][NEWLINE]+2 [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_CULTURE] Culture per city.' 
WHERE Tag='TXT_KEY_POLICY_PARTY_LEADERSHIP_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Resettlement[ENDCOLOR][NEWLINE]New Cities start with an extra 3 [ICON_CITIZEN] Population and settler production is increased by 100%.' 
WHERE Tag='TXT_KEY_POLICY_RESETTLEMENT_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Futurism[ENDCOLOR][NEWLINE]+400 [ICON_TOURISM] Tourism with all known civs when a Great Writer, Artist or Musician is born.' 
WHERE Tag='TXT_KEY_POLICY_FUTURISM_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Third Alternative[ENDCOLOR][NEWLINE]Quantity of Strategic Resources produced is increased by 100%. +5 [ICON_FOOD] Food and +5 [ICON_Production] Production in [ICON_CAPITAL] Capital.'
WHERE Tag='TXT_KEY_POLICY_THIRD_ALTERNATIVE_HELP';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]United Front[ENDCOLOR][NEWLINE]Militaristic City-States grant units twice as often.' 
WHERE Tag='TXT_KEY_POLICY_UNITED_FRONT_HELP';

UPDATE Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Liberty[ENDCOLOR] is best for civilizations which desire rapid expansion.[NEWLINE][NEWLINE]Adopting Liberty will provide 1 [ICON_CULTURE] Culture in every city. Unlocks the Pyramids.[NEWLINE][NEWLINE]Adopting all policies in the Liberty tree will grant a truly free Great Person of your choice near the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_BRANCH_LIBERTY_HELP';
UPDATE Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Republic[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production in every City and +10% [ICON_PRODUCTION] Production for buildings in cities.' WHERE Tag='TXT_KEY_POLICY_REPUBLIC_HELP';

Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Patronage[ENDCOLOR] enhances the benefits of City-State friendship.[NEWLINE][NEWLINE]Adopting Patronage will cause [ICON_INFLUENCE] Influence with City-States to degrade 25% slower than normal. Unlocks building the Forbidden Palace.[NEWLINE][NEWLINE]Adopting all policies in the Patronage tree will cause all [COLOR_POSITIVE_TEXT]Allied[ENDCOLOR] City-States to occasionally gift you [ICON_GREAT_PEOPLE] Great People. City-State will also give personal quests twice as fast.' 
Where Tag='TXT_KEY_POLICY_BRANCH_PATRONAGE_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Philanthropy[ENDCOLOR][NEWLINE][ICON_GOLD] Gold gifts to City-States produce 25% more [ICON_INFLUENCE] Influence.' 
Where Tag='TXT_KEY_POLICY_PHILANTHROPY_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Scholasticism[ENDCOLOR][NEWLINE]All allied City-States provide bonus [ICON_RESEARCH] Science per turn based on your current Era. Trade routes to City-States now also give 3 science.' 
Where Tag='TXT_KEY_POLICY_SCHOLASTICISM_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Merchant Confederacy[ENDCOLOR][NEWLINE]+4 [ICON_GOLD] Gold, and +3 [ICON_CULTURE] Culture from every trade routes to city states. You also generate +1 [ICON_INFLUENCE] Influence per turn with City-States you sent a trade route to.' 
Where Tag='TXT_KEY_POLICY_MERCHANT_CONFEDERACY_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Consulates[ENDCOLOR][NEWLINE]Get 15 [ICON_INFLUENCE] resting points with every City-States. You can also now receive one more personal quest.' 
Where Tag='TXT_KEY_POLICY_CONSULATES_HELP';

Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Piety[ENDCOLOR] is best for civilizations focused on religion.[NEWLINE][NEWLINE]Adopting Piety will grant +1[ICON_PEACE] Faith in the capital. It will also increase the production of Shrines and Temples by 100%. Unlocks Borobudur.[NEWLINE][NEWLINE]Adopting all Policies in the Piety tree will grant a free Prophet. It also give access to the pantheon and follower beliefs of the second most popular religion in your cities.' Where Tag='TXT_KEY_POLICY_BRANCH_PIETY_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Mandate of Heaven[ENDCOLOR][NEWLINE]Diminishes the cost by 20% on all purchases of religious units, buildings and Prophets with [ICON_PEACE] Faith.' Where Tag='TXT_KEY_POLICY_MANDATE_OF_HEAVEN_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Organized Religion[ENDCOLOR][NEWLINE]+1 [ICON_PEACE] Faith and +1 [ICON_CULTURE] Culture from Shrines and Temples.' Where Tag='TXT_KEY_POLICY_ORGANIZED_RELIGION_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Religious Fervour[ENDCOLOR][NEWLINE]+1 [ICON_HAPPINESS_1] Happiness from each city you own that follow your religion and from every 3 foreign cities that follow your religion.' Where Tag='TXT_KEY_POLICY_FREE_RELIGION_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Theocracy[ENDCOLOR][NEWLINE]Holy Sites provide +3 [ICON_GOLD] Gold.[NEWLINE]Temples boost city [ICON_GOLD] Gold output by 20% and Shrines give +1 [ICON_GOLD].' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Reformation[ENDCOLOR][NEWLINE]Every time a great Prophet is born, the capital receive a bonus in [ICON_GOLD] Gold, [ICON_PRODUCTION] Production and [ICON_GOLDEN_AGE] Golden Age points equal to the number of followers of this religion up to a maximum of 100. [NEWLINE]If you founded a religion, gain a bonus Reformation belief.' Where Tag='TXT_KEY_POLICY_REFORMATION_HELP';
INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_FREE_RELIGION_HEADER', 'Religious Fervour');

Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Rationalism[ENDCOLOR] improves the ability to use and generate [ICON_RESEARCH] Science. Unlocks Porcelain Tower.[NEWLINE][NEWLINE]Adopting Rationalism allows you to earn Great Scientists 25% faster. Unlocks building the Porcelain Tower.[NEWLINE][NEWLINE]Adopting all Policies in the Rationalism tree will grant a free technology. It also allows the purchase of Great Scientists with [ICON_PEACE] Faith starting in the Industrial Era.' 
Where Tag='TXT_KEY_POLICY_BRANCH_RATIONALISM_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Humanism[ENDCOLOR][NEWLINE]+10% [ICON_RESEARCH] Science while the empire is [ICON_HAPPINESS_1] Happy.' 
Where Tag='TXT_KEY_POLICY_HUMANISM_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Secularism[ENDCOLOR][NEWLINE]+1 [ICON_RESEARCH] Science from every Specialist and +2 [ICON_RESEARCH] for Great Person Improvements.' 
Where Tag='TXT_KEY_POLICY_SECULARISM_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Sovereignty[ENDCOLOR][NEWLINE]+1[ICON_GOLD] and +1[ICON_PRODUCTION] Production for every science building.' 
Where Tag='TXT_KEY_POLICY_SOVEREIGNTY_HELP';
Update Language_FR_FR Set Text='[ICON_BULLET][COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] from Trade routes.' 
Where Tag='TXT_KEY_TP_CULTURE_FROM_TRAITS';
INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_CO_CITY_TOURISM_BUILDINGCLASS', '{1_Num} [ICON_TOURISM] Tourism from Buildings');

UPDATE Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Oligarchy[ENDCOLOR][NEWLINE]Garrisoned units cost no maintenance and your first four cities get a free defense building.' WHERE Tag='TXT_KEY_POLICY_OLIGARCHY_HELP';
UPDATE Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Landed Elite[ENDCOLOR][NEWLINE]+15% [ICON_FOOD] Growth and +2 [ICON_FOOD] Food in the [ICON_CAPITAL] Capital.' WHERE Tag='TXT_KEY_POLICY_LANDED_ELITE_HELP';

INSERT INTO Language_FR_FR
(Tag,Text) VALUES
('TXT_KEY_PRODMOD_RELIGION_SETTLER','[NEWLINE][ICON_BULLET]Pantheon Modifier for Settlers: {1_Num}%');
Update Language_FR_FR Set Text='+1 [ICON_PRODUCTION] Production in cities with 2 population' Where 
Tag='TXT_KEY_BELIEF_GOD_CRAFTSMEN';
Update Language_FR_FR Set Text='+2 [ICON_CULTURE] Culture from Shrines' Where 
Tag='TXT_KEY_BELIEF_ANCESTOR_WORSHIP';
Update Language_FR_FR Set Text='+1 [ICON_PEACE] Faith from Tundra tiles' Where 
Tag='TXT_KEY_BELIEF_DANCE_AURORA';
/*Update Language_FR_FR Set Text='+20 HP healed per turn in your own territory' Where 
Tag='TXT_KEY_BELIEF_FAITH_HEALERS';*/
Update Language_FR_FR Set Text='Gain [ICON_PEACE] Faith equal to target strength if you win a battle within 6 tiles of your city' Where 
Tag='TXT_KEY_BELIEF_GOD_WAR';
Update Language_FR_FR Set Text='Palace provides +1 to these yields: [ICON_HAPPINESS_1], [ICON_FOOD], [ICON_CULTURE] , [ICON_PEACE] , [ICON_GOLD], [ICON_PRODUCTION], [ICON_RESEARCH]' Where 
Tag='TXT_KEY_BELIEF_GOD_KING';
Update Language_FR_FR Set Text='+25% faster border growth and +20% [ICON_PRODUCTION] Production for settlers in capital' Where 
Tag='TXT_KEY_BELIEF_RELIGIOUS_SETTLEMENTS';
Update Language_FR_FR Set Text='+5 [ICON_STRENGTH] Strength in all cities (need 1 turn to update)' Where 
Tag='TXT_KEY_BELIEF_GODDESS_STRATEGY';
Update Language_FR_FR Set Text='+20% [ICON_PRODUCTION] Production of Ancient/Classical/Medieval Wonders' Where 
Tag='TXT_KEY_BELIEF_MONUMENT_GODS';
Update Language_FR_FR Set Text='+1 [ICON_HAPPINESS_1] Happiness from cities with population of 4+' Where 
Tag='TXT_KEY_BELIEF_GODDESS_LOVE';
Update Language_FR_FR Set Text='+1 [ICON_PEACE] Faith from Plantations' Where 
Tag='TXT_KEY_BELIEF_ORAL_TRADITION';
Update Language_FR_FR Set Text='+1 [ICON_PEACE] Faith for each [ICON_RES_IRON] Iron and [ICON_RES_SALT] Salt resource' Where 
Tag='TXT_KEY_BELIEF_EARTH_MOTHER';
Update Language_FR_FR Set Text='+1 [ICON_GOLD] Gold and +1 [ICON_PEACE] Faith for each [ICON_RES_COPPER] Copper, [ICON_RES_GOLD] Gold and [ICON_RES_SILVER] Silver' Where 
Tag='TXT_KEY_BELIEF_FORMAL_LITURGY';
INSERT INTO Language_FR_FR
(Tag,Text) VALUES
('TXT_KEY_BELIEF_CEREMONIAL_ROBES','+2 [ICON_CULTURE] Culture for each [ICON_RES_SILK] Silk, [ICON_RES_COTTON] Cotton and [ICON_RES_DYE] Dye'),
('TXT_KEY_BELIEF_CEREMONIAL_ROBES_SHORT','Ceremonial Robes'),
('TXT_KEY_BELIEF_OFFERINGS_GODS','+1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith for each [ICON_RES_TRUFFLES] Truffles, [ICON_RES_SUGAR] Sugar and [ICON_RES_SPICES] Spices'),
('TXT_KEY_BELIEF_OFFERINGS_GODS_SHORT','Offerings to the Gods'),
('TXT_KEY_BELIEF_NATURES_BLESSING','+1 [ICON_PEACE] Faith from Forests'),
('TXT_KEY_BELIEF_NATURES_BLESSING_SHORT','Nature''s Blessing'),
('TXT_KEY_BELIEF_GIFTS_WISDOM','+1 [ICON_RESEARCH] Science for each [ICON_RES_COCOA] Cocoa'),
('TXT_KEY_BELIEF_GIFTS_WISDOM_SHORT','Gifts of Wisdom');
Update Language_FR_FR Set Text='Ampitheaters and Opera Houses provide +1 [ICON_PEACE] and +2 [ICON_PEACE] Faith respectively' Where 
Tag='TXT_KEY_BELIEF_LITURGICAL_DRAMA';
Update Language_FR_FR Set Text='Use [ICON_PEACE] Faith to purchase Pagodas (+2 [ICON_PEACE] Faith, +1 [ICON_CULTURE] Culture, +2 [ICON_HAPPINESS_1] Happiness)' Where 
Tag='TXT_KEY_BELIEF_PAGODAS';
Update Language_FR_FR Set Text='Use [ICON_PEACE] Faith to purchase Cathedrals (+1 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture, +1 [ICON_HAPPINESS_1] Happiness, 1 Great Work of Art slot)' Where 
Tag='TXT_KEY_BELIEF_CATHEDRALS';
Update Language_FR_FR Set Text='Shrines provide +1 [ICON_HAPPINESS_1] Happiness in cities' Where 
Tag='TXT_KEY_BELIEF_ASCETISM';
Update Language_FR_FR Set Text='Temples and Opera Houses provide +2 [ICON_CULTURE] and +1 [ICON_CULTURE] Culture respectively' Where 
Tag='TXT_KEY_BELIEF_CHORAL_MUSIC';
Update Language_FR_FR Set Text='Hermitage provides +8 [ICON_CULTURE] Culture and +8 [ICON_TOURISM] Tourism' Where 
Tag='TXT_KEY_BELIEF_RELIGIOUS_ART';
/*
Update Language_FR_FR Set Text='Shrines provide +1 [ICON_FOOD] Food and Temples provide +2 [ICON_FOOD] Food' Where 
Tag='TXT_KEY_BELIEF_FEED_WORLD';
*/
Update Language_FR_FR Set Text='+1 [ICON_GOLD] Gold for every 5 followers of this religion' Where 
Tag='TXT_KEY_BELIEF_TITHE';
Update Language_FR_FR Set Text='+1 [ICON_HAPPINESS_1] Global Happiness for every 7 followers of this religion in foreign cities' Where 
Tag='TXT_KEY_BELIEF_PEACE_LOVING';
Update Language_FR_FR Set Text='Gain 75 [ICON_PEACE] Faith each time a Great Person is expended' Where 
Tag='TXT_KEY_BELIEF_RELIQUARY';
Update Language_FR_FR Set Text='Missionary conversion strength +40%' Where 
Tag='TXT_KEY_BELIEF_MISSIONARY_ZEAL';
Update Language_FR_FR Set Text='Cathedrals, Mosques, Monasteries and Pagodas purchased with [ICON_PEACE] Faith provide 1 [ICON_TOURISM] Tourism, 1 [ICON_CULTURE] Culture and 1 [ICON_GOLD] Gold each.' Where 
Tag='TXT_KEY_BELIEF_SACRED_SITES';
INSERT INTO Language_FR_FR
(Tag,Text) VALUES
('TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE','May build Opera Houses, Museums and Broadcast Towers with [ICON_PEACE] Faith.'),
('TXT_KEY_BELIEF_RELIGIOUS_INFLUENCE_SHORT','Patron of the arts');

/*Newtexts*/
UPDATE Language_FR_FR SET Text='Unique Assyrian Library replacement. +1 [ICON_RESEARCH] Science for every 2 [ICON_CITIZEN] Citizens in this City. Also has a slot for a Great Work of Writing which, when filled, gives 15 extra XP to trained Units.' 
WHERE Tag='TXT_KEY_BUILDING_ROYAL_LIBRARY_HELP';
UPDATE Language_FR_FR SET Text='Get a free writer when researching Writing. When a city is conquered, gain a free Technology already discovered by its owner.  Gaining a city through a trade deal does not count, and it can only happen once per enemy city.'
WHERE Tag='TXT_KEY_TRAIT_SLAYER_OF_TIAMAT';
UPDATE Language_FR_FR SET Text='Fast and powerful early game Mounted Unit that can always be bought with faith. Weak to Spearmen. Only the Byzantines may build it. This Unit has a higher [ICON_STRENGTH] Combat Strength, defends better, and attacks cities more effectively than the Horseman which it replaces.'
WHERE Tag='TXT_KEY_UNIT_HELP_BYZANTINE_CATAPHRACT';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Free Thought[ENDCOLOR][NEWLINE]+17%[ICON_RESEARCH] to Universities and +7 [ICON_RESEARCH] Science for Oxford University.' 
Where Tag='TXT_KEY_POLICY_FREE_THOUGHT_HELP';
UPDATE Language_FR_FR SET Text='Get a free bonus belief when founding a religion.'
WHERE Tag='TXT_KEY_TRAIT_EXTRA_BELIEF';
UPDATE Language_FR_FR SET Text='All Civilizations are prevented from constructing new nuclear weapons (Atomic Bomb and Nuclear Missile).  Weapons already constructed, however, are not disarmed.[NEWLINE][NEWLINE]Available once any Civilization discovers Nuclear Fission.'
WHERE Tag='TXT_KEY_RESOLUTION_NUCLEAR_NON_PROLIFERATION_HELP';

Update Language_FR_FR Set Text='Religious Fervour' Where Tag='TXT_KEY_POLICY_FREE_RELIGION';
Update Language_FR_FR Set Text='Civilopedia Placeholder' Where Tag='TXT_KEY_POLICY_FREERELIGION_TEXT';
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Free Expression[ENDCOLOR][NEWLINE]+1 [ICON_RESEARCH] Science for every Specialists.' 
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP';
UPDATE Language_FR_FR SET Text='Free Expression' 
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION';
UPDATE Language_FR_FR SET Text='Civilopedia placeholder' 
WHERE Tag='TXT_KEY_POLICY_CREATIVE_EXPRESSION_TEXT';
UPDATE Language_FR_FR SET Text='Requires Honor. All units gain +15% [ICON_STRENGTH] combat strength when attacking cities and diminishes the resistance time by half.'
WHERE Tag='TXT_KEY_WONDER_STATUE_ZEUS_HELP';
Update Language_FR_FR Set Text='Requires Commerce. Cost of [ICON_GOLD] Gold purchasing in all cities reduced by 10%.' Where 
Tag='TXT_KEY_WONDER_BIG_BEN_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Mercantilism[ENDCOLOR][NEWLINE]Purchasing items in Cities requires 15% less [ICON_GOLD] Gold. +1 [ICON_RESEARCH] Science from every Mint, Market, Bank, and Stock Exchange.' Where 
Tag='TXT_KEY_POLICY_MERCANTILISM_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Theocracy[ENDCOLOR][NEWLINE]Holy Sites provide +3 [ICON_GOLD] Gold.[NEWLINE]Temples boost city [ICON_GOLD] Gold output by 15% and Shrines give +2 [ICON_GOLD].' Where Tag='TXT_KEY_POLICY_THEOCRACY_HELP';
INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_CIV5_IMPROVEMENTS_TRADING_POST_HELP','A Trading Post must be built adjacent to a Luxury resource.  It may not be adjacent to another Trading Post.');
UPDATE Language_FR_FR SET Text='All coastal Cities get a free Cothon : a special carthagenian Harbor giving more gold to ocean tiles. Units may cross mountains after the first Great General is earned, taking 50 HP damage if they end a turn on a mountain.'
WHERE Tag='TXT_KEY_TRAIT_PHOENICIAN_HERITAGE';
INSERT INTO Language_FR_FR
(Text, Tag) Values
('Civilopedia placeholder for cothon',
'TXT_KEY_BUILDING_COTHON_PEDIA'),
('Carthaginian unique Harbor.[NEWLINE][NEWLINE]+2 [ICON_GOLD] Gold from Coast and Ocean Tiles.[NEWLINE][NEWLINE]Forms a [ICON_CONNECTED] City Connection with the [ICON_CAPITAL] Capital over water (if they''re not already [ICON_CONNECTED] connected by land). Sea trade routes originating from this city have a 50% increase in range and produce an additional 2 [ICON_GOLD] Gold when connecting to another civilization.[NEWLINE][NEWLINE]City must be built on the coast.',
'TXT_KEY_BUILDING_COTHON_HELP'),
('Cothon',
'TXT_KEY_BUILDING_COTHON'),
('Strategy placeholder for cothon',
'TXT_KEY_BUILDING_COTHON_STRATEGY');
INSERT INTO Language_FR_FR
(Text, Tag) Values
('Civilopedia placeholder for Forum',
'TXT_KEY_BUILDING_FORUM_PEDIA'),
('Roman unique Amphitheater.[NEWLINE][NEWLINE]+25% [ICON_GREAT_PEOPLE] Great People generation in this City.',
'TXT_KEY_BUILDING_FORUM_HELP'),
('Forum',
'TXT_KEY_BUILDING_FORUM'),
('Strategy placeholder for Forum',
'TXT_KEY_BUILDING_FORUM_STRATEGY');
UPDATE Language_FR_FR SET Text='+10%[ICON_PRODUCTION] towards buildings. Get a +15%[ICON_PRODUCTION] towards buildings already built in the Capital.'
WHERE Tag='TXT_KEY_TRAIT_CAPITAL_BUILDINGS_CHEAPER';
INSERT INTO Language_FR_FR
(Text, Tag) Values
('[NEWLINE][ICON_BULLET]Trait Empire Modifier for Buildings: {1_Num}%','TXT_KEY_PRODMOD_BUILDING_TRAIT_PLAYER');
UPDATE Language_FR_FR SET Text='[COLOR_POSITIVE_TEXT]Industrial Espionage[ENDCOLOR][NEWLINE]Spies steal technologies 33% faster than the normal rate.' 
WHERE Tag='TXT_KEY_POLICY_INDUSTRIAL_ESPIONAGE_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Colonies[ENDCOLOR][NEWLINE]Newly founded cities start with 1 extra [ICON_CITIZEN] Population, a free Worker, and a Governor''s Mansion which provides 1 [ICON_HAPPINESS_1] Happiness.' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_HELP';
Update Language_FR_FR Set Text='Colonies' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL';
Update Language_FR_FR Set Text='Civilopedia placeholder' 
Where Tag='TXT_KEY_POLICY_NAVIGATION_SCHOOL_TEXT';
INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_BUILDING_GOVERNORS_MANSION_DESC','Governor''s Mansion'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_PEDIA','A Governor''s Mansion is automatically constructed in every newly founded city after you have adopted the Colonies social policy.'),
('TXT_KEY_BUILDING_GOVERNORS_MANSION_STRATEGY','Founding a new city when you have adopted Colonies will give that city an additional 1 [ICON_CITIZEN] Population and 1 [ICON_HAPPINESS_1] Happiness as well as a Free Worker.');
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Treasure Fleets[ENDCOLOR][NEWLINE]+1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from Coast and Ocean tiles without sea resources.' 
Where Tag='TXT_KEY_POLICY_TREASURE_FLEETS_HELP';
INSERT INTO Language_FR_FR
(Tag, Text) VALUES
('TXT_KEY_BUILDING_TREASURE_FLEETS_DESC','Warehouse'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_PEDIA','A Warehouse is automatically constructed in every city after you have adopted the Treasure Fleets social policy.'),
('TXT_KEY_BUILDING_TREASURE_FLEETS_STRATEGY','Provides +1 [ICON_PRODUCTION] Production, and +1 [ICON_GOLD] Gold from all Coast and Ocean tiles without sea resources.');
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Exploration[ENDCOLOR] enhances naval empires.[NEWLINE][NEWLINE]Adopting Exploration gives +1 [ICON_MOVES] Movement for Naval units and +1 Sight for Naval combat units. It also allows increases embarked [ICON_MOVES] moves of land units by 1. Unlocks building the Louvre.[NEWLINE][NEWLINE]Adopting all policies increases naval units [ICON_STRENGTH] strength and [ICON_RANGE_STRENGTH] ranged strength by 10% and Admirals may be purchased with [ICON_PEACE] Faith starting in the Industrial Era. Also get a free Admiral, admirals are earned 50% faster and move 2 more tiles.' 
Where Tag='TXT_KEY_POLICY_BRANCH_EXPLORATION_HELP';
UPDATE Language_FR_FR SET Text='+25% [ICON_GREAT_PEOPLE] generation in this city. Contains a prebuilt Great Work of Art in the Great Work Slot.'
WHERE Tag='TXT_KEY_WONDER_PARTHENON_HELP';

UPDATE Language_FR_FR SET Text='+1 [ICON_RESEARCH] science for all specialists and for all Great Person tile improvements. Receive a tech boost each time a scientific building/Wonder is built in the Korean capital.'
WHERE Tag='TXT_KEY_TRAIT_SCHOLARS_JADE_HALL';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Military Tradition[ENDCOLOR][NEWLINE]Get 15% more [ICON_PRODUCTION] Production toward military units and the Heroic Epic gives +4 [ICON_HAPPINESS_1] Happiness. You also receive a free Great General.' Where Tag='TXT_KEY_POLICY_MILITARY_TRADITION_HELP';
Update Language_FR_FR Set Text='[COLOR_POSITIVE_TEXT]Warrior Code[ENDCOLOR][NEWLINE]Receive 2 warriors and 2 units cost no maintenance. General points are increased by 50%.' Where Tag='TXT_KEY_POLICY_WARRIOR_CODE_HELP';

UPDATE Language_FR_FR SET Text='1 free Great Musician appears near the City where the Wonder was built.' 
WHERE Tag='TXT_KEY_WONDER_CN_TOWER_HELP';
UPDATE Language_FR_FR SET Text='[ICON_GOLD] Gold cost of upgrading military units reduced by 33%. And get a copy of each distinct land unit you have.' 
WHERE Tag='TXT_KEY_WONDER_PENTAGON_HELP';