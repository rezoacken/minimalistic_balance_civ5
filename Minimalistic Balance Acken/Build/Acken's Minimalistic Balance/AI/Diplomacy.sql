/*Others*/
/*Update Defines Set Value = 40 WHERE Name = 'DOF_TURN_BUFFER';*/ /*20*/

/*War behavioral*/
/*Agressive AI should be more prone to capture city states*/
UPDATE Defines Set Value=25 WHERE Name='MINOR_APPROACH_WAR_CONQUEST_GRAND_STRATEGY_NEIGHBORS'; /*10*/
UPDATE Defines Set Value=-5 WHERE Name='MINOR_APPROACH_PROTECTIVE_CONQUEST_GRAND_STRATEGY'; /*-15*/
UPDATE Defines Set Value=-3 WHERE Name='MINOR_APPROACH_WAR_PLANNING_WAR_WITH_ANOTHER_PLAYER'; /*-15*/
UPDATE Defines Set Value=3 WHERE Name='MINOR_APPROACH_CONQUEST_PROXIMITY_NEIGHBORS'; /*1*/
UPDATE Defines Set Value=-10 WHERE Name='MINOR_APPROACH_WAR_CULTURE_GRAND_STRATEGY'; /*-20*/
UPDATE Defines Set Value=-10 WHERE Name='MINOR_APPROACH_WAR_TARGET_IMPOSSIBLE'; /*10*/
UPDATE Defines Set Value=10 WHERE Name='MINOR_APPROACH_WAR_TARGET_BAD'; /*20*/
UPDATE Defines Set Value=60 WHERE Name='MINOR_APPROACH_WAR_TARGET_AVERAGE'; /*40*/
UPDATE Defines Set Value=120 WHERE Name='MINOR_APPROACH_WAR_TARGET_FAVORABLE'; /*110*/
UPDATE Defines Set Value=150 WHERE Name='MINOR_APPROACH_WAR_TARGET_SOFT'; /*130*/

/*Approach changes*/
UPDATE Defines Set Value=20 WHERE Name='APPROACH_WAR_CONQUEST_GRAND_STRATEGY'; /*5*/
UPDATE Defines Set Value=0 WHERE Name='APPROACH_FRIENDLY_DEMAND'; /*-6*/
UPDATE Defines Set Value=-2 WHERE Name='APPROACH_DECEPTIVE_IGNORED_EXPANSION_PROMISE'; /*-4*/
UPDATE Defines Set Value=135 WHERE Name='APPROACH_WAR_RECKLESS_EXPANDER'; /*140*/
UPDATE Defines Set Value=140 WHERE Name='APPROACH_WAR_PROXIMITY_NEIGHBORS';/*115*/
UPDATE Defines Set Value=15 WHERE Name='APPROACH_WAR_PROXIMITY_DISTANT';/*50*/
UPDATE Defines Set Value=25 WHERE Name='APPROACH_WAR_PROXIMITY_FAR';/*60*/
/*These values are added*/
INSERT INTO Defines
(Name, Value) VALUES
('APPROACH_WAR_CURRENTLY_HOSTILE', 3),
('APPROACH_HOSTILE_PROXIMITY_DISTANT', 20),
('APPROACH_HOSTILE_PROXIMITY_FAR', 40);

UPDATE Defines Set Value=12 WHERE Name='APPROACH_OPINION_UNFORGIVABLE_WAR';/*10*/
UPDATE Defines Set Value=9 WHERE Name='APPROACH_OPINION_ENEMY_WAR';/*8*/
UPDATE Defines Set Value=6 WHERE Name='APPROACH_OPINION_COMPETITOR_WAR';/*4*/

/*Opinions*/
UPDATE Defines Set Value=240 WHERE Name='LAND_DISPUTE_STRONG_THRESHOLD'; /*230*/
UPDATE Defines Set Value=8 WHERE Name='EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_LOW'; /*9*/
UPDATE Defines Set Value=-4 WHERE Name='OPINION_WEIGHT_LAND_NONE'; /*-6*/
UPDATE Defines Set Value=15 WHERE Name='OPINION_WEIGHT_LAND_WEAK'; /*10*/
UPDATE Defines Set Value=50 WHERE Name='OPINION_WEIGHT_LAND_STRONG'; /*20*/
UPDATE Defines Set Value=100 WHERE Name='OPINION_WEIGHT_LAND_FIERCE'; /*30*/
UPDATE Defines Set Value=125 WHERE Name='OPINION_WEIGHT_VICTORY_FIERCE'; /*30*/
UPDATE Defines Set Value=50 WHERE Name='OPINION_WEIGHT_VICTORY_STRONG';/*20*/
UPDATE Defines Set Value=10 WHERE Name='OPINION_WEIGHT_WONDER_FIERCE'; /*30*/
UPDATE Defines Set Value=5 WHERE Name='OPINION_WEIGHT_WONDER_STRONG'; /*20*/
UPDATE Defines Set Value=2 WHERE Name='OPINION_WEIGHT_WONDER_WEAK'; /*10*/
UPDATE Defines Set Value=5 WHERE Name='OPINION_WEIGHT_MINOR_CIV_WEAK'; /*10*/
UPDATE Defines Set Value=10 WHERE Name='OPINION_WEIGHT_MINOR_CIV_STRONG'; /*20*/
UPDATE Defines Set Value=20 WHERE Name='OPINION_WEIGHT_MINOR_CIV_FIERCE'; /*30*/
UPDATE Defines Set Value=50 WHERE Name='OPINION_WEIGHT_WARMONGER_CRITICAL'; /*100*/
UPDATE Defines Set Value=40 WHERE Name='OPINION_WEIGHT_WARMONGER_SEVERE'; /*70*/
UPDATE Defines Set Value=25 WHERE Name='OPINION_WEIGHT_WARMONGER_MAJOR'; /*40*/
UPDATE Defines Set Value=10 WHERE Name='OPINION_WEIGHT_WARMONGER_MINOR'; /*15*/
UPDATE Defines Set Value=0 WHERE Name='OPINION_WEIGHT_WARMONGER_NONE'; /*0*/
UPDATE Defines Set Value=-5 WHERE Name='COOPERATION_DESIRE_MILITARY_STRENGTH_WEAK'; /*0*/
UPDATE Defines Set Value=-10 WHERE Name='COOPERATION_DESIRE_MILITARY_STRENGTH_PATHETIC'; /*0*/
UPDATE Defines Set Value=5 WHERE Name='COOPERATION_DESIRE_OPINION_COMPETITOR'; /*25*/

UPDATE Defines Set Value=3 WHERE Name='APPROACH_DECEPTIVE_DENOUNCED'; /*-100*/
UPDATE Defines Set Value=1 WHERE Name='APPROACH_OPINION_ENEMY_DECEPTIVE'; /*1*/
UPDATE Defines Set Value=-8 WHERE Name='APPROACH_DECEPTIVE_WORKING_WITH_PLAYER'; /*3*/
UPDATE Defines Set Value=-75 WHERE Name='OPINION_WEIGHT_DOF'; /*-35*/
UPDATE Defines Set Value=-25 WHERE Name='OPINION_WEIGHT_DOF_WITH_FRIEND'; /*-15*/
UPDATE Defines Set Value=15 WHERE Name='OPINION_WEIGHT_DOF_WITH_ENEMY'; /*15*/
UPDATE Defines Set Value=20 WHERE Name='OPINION_WEIGHT_DENOUNCED_BY_FRIEND_EACH'; /*20*/

--UPDATE Defines Set Value=-10 WHERE Name='OPINION_WEIGHT_DENOUNCED_BY_FRIEND_DONT_LIKE'; /*-10*/
--UPDATE Defines Set Value=15 WHERE Name='OPINION_WEIGHT_DENOUNCED_FRIEND_EACH'; /*15*/
--UPDATE Defines Set Value=35 WHERE Name='OPINION_WEIGHT_DENOUNCED_ME_FRIENDS'; /*35*/
--UPDATE Defines Set Value=40 WHERE Name='OPINION_WEIGHT_WAR_FRIEND_EACH'; /*40*/
--UPDATE Defines Set Value=60 WHERE Name='OPINION_WEIGHT_WAR_ME_FRIENDS'; /*60*/

/*This diminishes the importance of economy in war valuation*/
UPDATE Defines Set Value=50 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_PATHETIC'; /*50*/
UPDATE Defines Set Value=30 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_WEAK'; /*30*/
UPDATE Defines Set Value=12 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_POOR'; /*12*/
UPDATE Defines Set Value=0 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_AVERAGE'; /*0*/
UPDATE Defines Set Value=-6 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_STRONG'; /*-12*/
UPDATE Defines Set Value=-15 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_POWERFUL'; /*-30*/
UPDATE Defines Set Value=-25 WHERE Name='WAR_PROJECTION_THEIR_ECONOMIC_STRENGTH_IMMENSE'; /*-50*/
UPDATE Defines Set Value=70 WHERE Name='WAR_PROJECTION_WAR_DAMAGE_THEM_CRIPPLED'; /*40*/


/*PROBABLY USELESS VARIABLES*/
/*Does these still have an effect ? Can't find where in the BNW code*/
UPDATE Defines Set Value=70 WHERE Name='EVALUATE_WAR_CONQUEST_GRAND_STRATEGY'; /*50*/
UPDATE Defines Set Value=200 WHERE Name='EVALUATE_WAR_GAME_THREAT_CRITICAL'; /*150*/
UPDATE Defines Set Value=125 WHERE Name='EVALUATE_WAR_GAME_THREAT_SEVERE'; /*100*/
UPDATE Defines Set Value=75 WHERE Name='EVALUATE_WAR_GAME_THREAT_MAJOR'; /*50*/
UPDATE Defines Set Value=30 WHERE Name='EVALUATE_WAR_GAME_THREAT_MINOR'; /*20*/
UPDATE Defines Set Value=10 WHERE Name='EVALUATE_WAR_GAME_THREAT_NONE'; /*0*/
UPDATE Defines Set Value=200 WHERE Name='EVALUATE_WAR_SOFT_TARGET'; /*100*/
UPDATE Defines Set Value=100 WHERE Name='EVALUATE_WAR_FAVORABLE_TARGET'; /*50*/
UPDATE Defines Set Value=30 WHERE Name='EVALUATE_WAR_AVERAGE_TARGET'; /*-25*/
UPDATE Defines Set Value=-75 WHERE Name='EVALUATE_WAR_BAD_TARGET'; /*-100*/
UPDATE Defines Set Value=-150 WHERE Name='EVALUATE_WAR_IMPOSSIBLE_TARGET'; /*-200*/
/**/

UPDATE Defines Set Value=100 WHERE Name='MILITARY_AGGRESSIVE_POSTURE_THRESHOLD_INCREDIBLE'; /*80*/
UPDATE Defines Set Value=75 WHERE Name='MILITARY_AGGRESSIVE_POSTURE_THRESHOLD_HIGH'; /*50*/
UPDATE Defines Set Value=1 WHERE Name='PERSONALITY_FLAVOR_MIN_VALUE'; /*0*/
/* According to Delnar_Ersike it's better at 1 due to DLL sometimes dividing by flavors*/

/*Military stuff*/
UPDATE Defines Set Value=1.4 WHERE Name='AI_STRATEGY_DEFEND_MY_LANDS_UNITS_PER_CITY'; /*1*/
UPDATE Defines Set Value=3 WHERE Name='AI_STRATEGY_DEFEND_MY_LANDS_BASE_UNITS'; /*3*/
UPDATE Defines Set Value=0.7 WHERE Name='AI_STRATEGY_NAVAL_UNITS_PER_CITY'; /*1*/
UPDATE Defines Set Value=27 WHERE Name='AI_STRATEGY_MILITARY_RESERVE_PERCENTAGE'; /*35*/
UPDATE Defines Set Value=10 WHERE Name='AI_MILITARY_THREAT_WEIGHT_CRITICAL'; /*10*/
UPDATE Defines Set Value=8 WHERE Name='AI_DIPLO_LAND_DISPUTE_WEIGHT_FIERCE'; /*5*/
UPDATE Defines Set Value=5 WHERE Name='AI_DIPLO_LAND_DISPUTE_WEIGHT_STRONG';  /*3*/
UPDATE Defines Set Value=0.6 WHERE Name='AI_DANGER_MAJOR_APPROACH_HOSTILE'; /*0.2*/
UPDATE Defines Set Value=0.2 WHERE Name='AI_DANGER_MAJOR_APPROACH_DECEPTIVE'; /*0.1*/

/*Congress*/
UPDATE Defines Set Value=-10 WHERE Name='OPINION_WEIGHT_WE_LIKED_THEIR_PROPOSAL'; /*-15*/
UPDATE Defines Set Value=10 WHERE Name='OPINION_WEIGHT_WE_DISLIKED_THEIR_PROPOSAL'; /*15*/
UPDATE Defines Set Value=-10 WHERE Name='OPINION_WEIGHT_THEY_SUPPORTED_OUR_PROPOSAL'; /*-15*/
UPDATE Defines Set Value=15 WHERE Name='OPINION_WEIGHT_THEY_FOILED_OUR_PROPOSAL'; /*20*/
UPDATE Defines Set Value=-15 WHERE Name='OPINION_WEIGHT_THEY_SUPPORTED_OUR_HOSTING'; /*-15*/

/*UPDATE Units SET Combat=500 WHERE Class='UNITCLASS_CATAPULT';/*testing purposes to know if the database update is read until the end or not*/