DELETE FROM Policy_Flavors;
INSERT INTO Policy_Flavors (PolicyType, FlavorType, Flavor) VALUES
('POLICY_LIBERTY', 'FLAVOR_EXPANSION', 10),
('POLICY_LIBERTY', 'FLAVOR_PRODUCTION', 5),
('POLICY_LIBERTY', 'FLAVOR_CULTURE', 5),
('POLICY_REPUBLIC', 'FLAVOR_PRODUCTION', 20),
('POLICY_COLLECTIVE_RULE', 'FLAVOR_EXPANSION', 15),
('POLICY_COLLECTIVE_RULE', 'FLAVOR_PRODUCTION', 5),
('POLICY_CITIZENSHIP', 'FLAVOR_TILE_IMPROVEMENT', 10),
('POLICY_CITIZENSHIP', 'FLAVOR_PRODUCTION', 10),
('POLICY_MERITOCRACY', 'FLAVOR_HAPPINESS', 20),
('POLICY_REPRESENTATION', 'FLAVOR_CULTURE', 20),
('POLICY_LIBERTY_FINISHER', 'FLAVOR_GREAT_PEOPLE', 15),
('POLICY_LIBERTY_FINISHER', 'FLAVOR_GROWTH', 5),	

('POLICY_TRADITION', 'FLAVOR_GROWTH', 10),
('POLICY_TRADITION', 'FLAVOR_EXPANSION', 8), --balance picks
('POLICY_TRADITION', 'FLAVOR_CULTURE', 5),
('POLICY_TRADITION', 'FLAVOR_WONDER', 5),
('POLICY_ARISTOCRACY', 'FLAVOR_GROWTH', 5),
('POLICY_ARISTOCRACY', 'FLAVOR_WONDER', 10),
('POLICY_ARISTOCRACY', 'FLAVOR_HAPPINESS', 5),
('POLICY_OLIGARCHY', 'FLAVOR_DEFENSE', 10),
('POLICY_OLIGARCHY', 'FLAVOR_GOLD', 10),
('POLICY_LEGALISM', 'FLAVOR_CULTURE', 15),
('POLICY_LEGALISM', 'FLAVOR_GROWTH', 5),
('POLICY_LANDED_ELITE', 'FLAVOR_GROWTH', 20),
('POLICY_MONARCHY', 'FLAVOR_GROWTH', 5),
('POLICY_MONARCHY', 'FLAVOR_GOLD', 5),
('POLICY_MONARCHY', 'FLAVOR_HAPPINESS', 10),
('POLICY_TRADITION_FINISHER', 'FLAVOR_GROWTH', 20),	

('POLICY_HONOR', 'FLAVOR_OFFENSE', 10),
('POLICY_HONOR', 'FLAVOR_EXPANSION', 5),
('POLICY_HONOR', 'FLAVOR_CULTURE', 5),
('POLICY_WARRIOR_CODE', 'FLAVOR_OFFENSE', 10),
('POLICY_WARRIOR_CODE', 'FLAVOR_MILITARY_TRAINING', 10),
('POLICY_DISCIPLINE', 'FLAVOR_OFFENSE', 10),
('POLICY_DISCIPLINE', 'FLAVOR_MILITARY_TRAINING', 10),
('POLICY_MILITARY_CASTE', 'FLAVOR_CULTURE', 10),
('POLICY_MILITARY_CASTE', 'FLAVOR_HAPPINESS', 10),
('POLICY_PROFESSIONAL_ARMY', 'FLAVOR_PRODUCTION', 5),
('POLICY_PROFESSIONAL_ARMY', 'FLAVOR_CULTURE', 5),
('POLICY_PROFESSIONAL_ARMY', 'FLAVOR_HAPPINESS', 5),
('POLICY_PROFESSIONAL_ARMY', 'FLAVOR_GOLD', 5),
('POLICY_MILITARY_TRADITION', 'FLAVOR_PRODUCTION', 10),
('POLICY_MILITARY_TRADITION', 'FLAVOR_OFFENSE', 10),
('POLICY_HONOR_FINISHER', 'FLAVOR_GOLD', 15),
('POLICY_HONOR_FINISHER', 'FLAVOR_EXPANSION', 5),

('POLICY_PIETY', 'FLAVOR_RELIGION', 20),
('POLICY_ORGANIZED_RELIGION', 'FLAVOR_CULTURE', 10),
('POLICY_ORGANIZED_RELIGION', 'FLAVOR_RELIGION', 10),
('POLICY_MANDATE_OF_HEAVEN', 'FLAVOR_RELIGION', 20),
('POLICY_THEOCRACY', 'FLAVOR_RELIGION', 10),
('POLICY_THEOCRACY', 'FLAVOR_GOLD', 10),
('POLICY_REFORMATION', 'FLAVOR_RELIGION', 10),
('POLICY_REFORMATION', 'FLAVOR_PRODUCTION', 10),
('POLICY_REFORMATION', 'FLAVOR_GOLD', 5),
('POLICY_REFORMATION', 'FLAVOR_CULTURE', 5),
('POLICY_FREE_RELIGION', 'FLAVOR_HAPPINESS', 20),
('POLICY_PIETY_FINISHER', 'FLAVOR_RELIGION', 15),
('POLICY_PIETY_FINISHER', 'FLAVOR_CULTURE', 5),

('POLICY_PATRONAGE', 'FLAVOR_DIPLOMACY', 25),
('POLICY_PHILANTHROPY', 'FLAVOR_GOLD', 5),
('POLICY_PHILANTHROPY', 'FLAVOR_DIPLOMACY', 20),
('POLICY_CONSULATES', 'FLAVOR_DIPLOMACY', 25),
('POLICY_SCHOLASTICISM', 'FLAVOR_SCIENCE', 5),
('POLICY_SCHOLASTICISM', 'FLAVOR_DIPLOMACY', 20),
('POLICY_CULTURAL_DIPLOMACY', 'FLAVOR_HAPPINESS', 5),
('POLICY_CULTURAL_DIPLOMACY', 'FLAVOR_DIPLOMACY', 20),
('POLICY_MERCHANT_CONFEDERACY', 'FLAVOR_GOLD', 2),
('POLICY_MERCHANT_CONFEDERACY', 'FLAVOR_CULTURE', 3),
('POLICY_MERCHANT_CONFEDERACY', 'FLAVOR_DIPLOMACY', 20),
('POLICY_PATRONAGE_FINISHER', 'FLAVOR_DIPLOMACY', 20),
('POLICY_PATRONAGE_FINISHER', 'FLAVOR_CULTURE', 2),
('POLICY_PATRONAGE_FINISHER', 'FLAVOR_GROWTH', 2),
('POLICY_PATRONAGE_FINISHER', 'FLAVOR_RELIGION', 1),

('POLICY_AESTHETICS', 'FLAVOR_CULTURE', 20),
('POLICY_AESTHETICS', 'FLAVOR_GREAT_PEOPLE', 5),
('POLICY_CULTURAL_CENTERS', 'FLAVOR_CULTURE', 25),
('POLICY_FINE_ARTS', 'FLAVOR_CULTURE', 25),
('POLICY_FLOURISHING_OF_ARTS', 'FLAVOR_CULTURE', 10),
('POLICY_FLOURISHING_OF_ARTS', 'FLAVOR_WONDER', 15),
('POLICY_ARTISTIC_GENIUS', 'FLAVOR_CULTURE', 25),
('POLICY_ETHICS', 'FLAVOR_CULTURE', 25),
('POLICY_AESTHETICS_FINISHER', 'FLAVOR_CULTURE', 25),

('POLICY_COMMERCE', 'FLAVOR_GOLD', 20),
('POLICY_COMMERCE', 'FLAVOR_OFFENSE', 5),
('POLICY_ENTREPRENEURSHIP', 'FLAVOR_GOLD', 20),
('POLICY_ENTREPRENEURSHIP', 'FLAVOR_GREAT_PEOPLE', 5),
('POLICY_TRADE_UNIONS', 'FLAVOR_CULTURE', 10),
('POLICY_TRADE_UNIONS', 'FLAVOR_GOLD', 15),
('POLICY_MERCANTILISM', 'FLAVOR_GOLD', 15),
('POLICY_MERCANTILISM', 'FLAVOR_SCIENCE', 10),
('POLICY_PROTECTIONISM', 'FLAVOR_HAPPINESS', 25),
('POLICY_CARAVANS', 'FLAVOR_GOLD', 25),
('POLICY_COMMERCE_FINISHER', 'FLAVOR_GROWTH', 10),
('POLICY_COMMERCE_FINISHER', 'FLAVOR_GOLD', 15),

('POLICY_EXPLORATION', 'FLAVOR_NAVAL', 25),
('POLICY_MARITIME_INFRASTRUCTURE', 'FLAVOR_PRODUCTION', 10),
('POLICY_MARITIME_INFRASTRUCTURE', 'FLAVOR_NAVAL', 15),
('POLICY_NAVAL_TRADITION', 'FLAVOR_HAPPINESS', 10),
('POLICY_NAVAL_TRADITION', 'FLAVOR_PRODUCTION', 5),
('POLICY_NAVAL_TRADITION', 'FLAVOR_NAVAL', 10),
('POLICY_TREASURE_FLEETS', 'FLAVOR_GOLD', 15),
('POLICY_TREASURE_FLEETS', 'FLAVOR_PRODUCTION', 10),
('POLICY_NAVIGATION_SCHOOL', 'FLAVOR_EXPANSION', 25),
('POLICY_MERCHANT_NAVY', 'FLAVOR_GOLD', 15),
('POLICY_MERCHANT_NAVY', 'FLAVOR_PRODUCTION', 5),
('POLICY_MERCHANT_NAVY', 'FLAVOR_CULTURE', 5),
('POLICY_EXPLORATION_FINISHER', 'FLAVOR_NAVAL', 25),

('POLICY_RATIONALISM', 'FLAVOR_SCIENCE', 35),
('POLICY_RATIONALISM', 'FLAVOR_SPACESHIP', 10),
('POLICY_SCIENTIFIC_REVOLUTION', 'FLAVOR_SCIENCE', 20),
('POLICY_SOVEREIGNTY', 'FLAVOR_PRODUCTION', 15),
('POLICY_SOVEREIGNTY', 'FLAVOR_GOLD', 20),
('POLICY_HUMANISM', 'FLAVOR_SCIENCE', 35),
('POLICY_FREE_THOUGHT', 'FLAVOR_SCIENCE', 35),
('POLICY_SECULARISM', 'FLAVOR_SCIENCE', 35),
('POLICY_RATIONALISM_FINISHER', 'FLAVOR_SCIENCE', 35),

('POLICY_OPEN_SOCIETY', 'FLAVOR_GREAT_PEOPLE', 25),
('POLICY_OPEN_SOCIETY', 'FLAVOR_CULTURE', 10),
('POLICY_UNIVERSAL_HEALTHCARE_F', 'FLAVOR_HAPPINESS', 35),
('POLICY_CREATIVE_EXPRESSION', 'FLAVOR_SCIENCE', 35),
('POLICY_CIVIL_SOCIETY', 'FLAVOR_GROWTH', 20),
('POLICY_CIVIL_SOCIETY', 'FLAVOR_GREAT_PEOPLE', 15),
('POLICY_VOLUNTEER_ARMY', 'FLAVOR_OFFENSE', 15),
('POLICY_VOLUNTEER_ARMY', 'FLAVOR_DEFENSE', 20),
('POLICY_COVERT_ACTION', 'FLAVOR_ESPIONAGE', 35),
('POLICY_URBANIZATION', 'FLAVOR_HAPPINESS', 30),
('POLICY_URBANIZATION', 'FLAVOR_GROWTH', 5),
('POLICY_CAPITALISM', 'FLAVOR_HAPPINESS', 25),
('POLICY_CAPITALISM', 'FLAVOR_GOLD', 10),
('POLICY_ECONOMIC_UNION', 'FLAVOR_GOLD', 35),
('POLICY_THEIR_FINEST_HOUR', 'FLAVOR_DEFENSE', 35),
('POLICY_UNIVERSAL_SUFFRAGE', 'FLAVOR_HAPPINESS', 20),
('POLICY_UNIVERSAL_SUFFRAGE', 'FLAVOR_GREAT_PEOPLE', 15),
('POLICY_NEW_DEAL', 'FLAVOR_CULTURE', 8),
('POLICY_NEW_DEAL', 'FLAVOR_SCIENCE', 8),
('POLICY_NEW_DEAL', 'FLAVOR_PRODUCTION', 8),
('POLICY_NEW_DEAL', 'FLAVOR_GOLD', 8),
('POLICY_ARSENAL_DEMOCRACY', 'FLAVOR_DIPLOMACY', 15),
('POLICY_ARSENAL_DEMOCRACY', 'FLAVOR_OFFENSE', 10),
('POLICY_ARSENAL_DEMOCRACY', 'FLAVOR_DEFENSE', 10),
('POLICY_MEDIA_CULTURE', 'FLAVOR_CULTURE', 45),
('POLICY_TREATY_ORGANIZATION', 'FLAVOR_DIPLOMACY', 45),
('POLICY_SPACE_PROCUREMENTS', 'FLAVOR_SPACESHIP', 45),

('POLICY_HERO_OF_THE_PEOPLE', 'FLAVOR_GREAT_PEOPLE', 25),
('POLICY_HERO_OF_THE_PEOPLE', 'FLAVOR_CULTURE', 10),
('POLICY_UNIVERSAL_HEALTHCARE_O', 'FLAVOR_HAPPINESS', 35),
('POLICY_SOCIALIST_REALISM', 'FLAVOR_HAPPINESS', 35),
('POLICY_SKYSCRAPERS', 'FLAVOR_PRODUCTION', 15),
('POLICY_SKYSCRAPERS', 'FLAVOR_GOLD', 20),
('POLICY_PATRIOTIC_WAR', 'FLAVOR_DEFENSE', 35),
('POLICY_DOUBLE_AGENTS', 'FLAVOR_SCIENCE', 5),
('POLICY_DOUBLE_AGENTS', 'FLAVOR_ESPIONAGE', 30),
('POLICY_YOUNG_PIONEERS', 'FLAVOR_HAPPINESS', 30),
('POLICY_YOUNG_PIONEERS', 'FLAVOR_PRODUCTION', 5),
('POLICY_ACADEMY_SCIENCES', 'FLAVOR_HAPPINESS', 30),
('POLICY_ACADEMY_SCIENCES', 'FLAVOR_SCIENCE', 5),
('POLICY_PARTY_LEADERSHIP', 'FLAVOR_GOLD', 7),
('POLICY_PARTY_LEADERSHIP', 'FLAVOR_SCIENCE', 7),
('POLICY_PARTY_LEADERSHIP', 'FLAVOR_PRODUCTION', 7),
('POLICY_PARTY_LEADERSHIP', 'FLAVOR_GROWTH', 7),
('POLICY_PARTY_LEADERSHIP', 'FLAVOR_CULTURE', 7),
('POLICY_RESETTLEMENT', 'FLAVOR_EXPANSION', 35),
('POLICY_CULTURAL_REVOLUTION', 'FLAVOR_CULTURE', 35),
('POLICY_WORKERS_FACULTIES', 'FLAVOR_SCIENCE', 30),
('POLICY_WORKERS_FACULTIES', 'FLAVOR_PRODUCTION', 5),
('POLICY_FIVE_YEAR_PLAN', 'FLAVOR_PRODUCTION', 20),
('POLICY_FIVE_YEAR_PLAN', 'FLAVOR_EXPANSION', 15),
('POLICY_DICTATORSHIP_PROLETARIAT', 'FLAVOR_CULTURE', 45),
('POLICY_IRON_CURTAIN', 'FLAVOR_OFFENSE', 45),
('POLICY_SPACEFLIGHT_PIONEERS', 'FLAVOR_SPACESHIP', 45),

('POLICY_ELITE_FORCES', 'FLAVOR_OFFENSE', 25),
('POLICY_ELITE_FORCES', 'FLAVOR_DEFENSE', 10),
('POLICY_UNIVERSAL_HEALTHCARE_A', 'FLAVOR_HAPPINESS', 35),
('POLICY_MOBILIZATION', 'FLAVOR_OFFENSE', 15),
('POLICY_MOBILIZATION', 'FLAVOR_DEFENSE', 10),
('POLICY_MOBILIZATION', 'FLAVOR_GOLD', 10),
('POLICY_UNITED_FRONT', 'FLAVOR_OFFENSE', 10),
('POLICY_UNITED_FRONT', 'FLAVOR_DIPLOMACY', 25),
('POLICY_FUTURISM', 'FLAVOR_CULTURE', 35),
('POLICY_INDUSTRIAL_ESPIONAGE', 'FLAVOR_ESPIONAGE', 15),
('POLICY_INDUSTRIAL_ESPIONAGE', 'FLAVOR_SCIENCE', 20),
('POLICY_MILITARISM', 'FLAVOR_HAPPINESS', 30),
('POLICY_MILITARISM', 'FLAVOR_MILITARY_TRAINING', 5),
('POLICY_LIGHTNING_WARFARE', 'FLAVOR_OFFENSE', 35),
('POLICY_FORTIFIED_BORDERS', 'FLAVOR_HAPPINESS', 25),
('POLICY_FORTIFIED_BORDERS', 'FLAVOR_DEFENSE', 10),
('POLICY_POLICE_STATE', 'FLAVOR_OFFENSE', 20),
('POLICY_POLICE_STATE', 'FLAVOR_HAPPINESS', 15),
('POLICY_NATIONALISM', 'FLAVOR_OFFENSE', 10),
('POLICY_NATIONALISM', 'FLAVOR_GOLD', 25),
('POLICY_THIRD_ALTERNATIVE', 'FLAVOR_OFFENSE', 25),
('POLICY_THIRD_ALTERNATIVE', 'FLAVOR_MILITARY_TRAINING', 10),
('POLICY_TOTAL_WAR', 'FLAVOR_OFFENSE', 20),
('POLICY_TOTAL_WAR', 'FLAVOR_MILITARY_TRAINING', 15),
('POLICY_CULT_PERSONALITY', 'FLAVOR_CULTURE', 45),
('POLICY_GUNBOAT_DIPLOMACY', 'FLAVOR_DIPLOMACY', 45),
('POLICY_NEW_ORDER', 'FLAVOR_OFFENSE', 45);


/*UPDATE Units SET Combat=500 WHERE Class='UNITCLASS_TRIREME'; /*testing purposes to know if the database update is read until the end or not*/