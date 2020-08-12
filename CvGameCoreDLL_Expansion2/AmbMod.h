#pragma once

#ifndef AMB_MOD_H
#define AMB_MOD_H

// Comment out this line to switch off all custom mod logging
#define AMB_MOD_LOG "AMB_Mod.log"

// Custom mod logger (thanks whoward)
#if defined(AMB_MOD_LOG)
#define	AMB_LOG(sFmt, ...) {  \
	CvString sMsg;  \
	CvString::format(sMsg, sFmt, __VA_ARGS__);  \
	LOGFILEMGR.GetLog(AMB_MOD_LOG, FILogFile::kDontTimeStamp)->Msg(sMsg.c_str());  \
}
#else
#define	AMB_LOG(sFmt, ...) __noop
#endif

//Work In Progress
//_______________________________________________
#define AMB_TRUE_FREE_GP
#define AMB_DONT_HIDE_LAND_DISPUTE
#define AMB_AI_LAND_DISPUTE
#define AMB_NO_AUTO_PLUNDER
#define AMB_LAND_BY_MEANNESS
//Reset the WLTKD resource after 20 turns
#define AMB_WLTKD_RESET
//AI get no per era bonus for wonder
#define AMB_NO_AI_BONUS_WONDER
//All food -2 converted to production when building settlers (excess)
#define AMB_FOOD_PRODUCTION
//AI get a bonus to food consumed instead of food to grow
#define AMB_AIGROWTH_BONUS_CHANGE
//Remove the forest constraint for aurora and all feature removing religion bonuses actually.
#define AMB_AURORA_FIX
//V5
//AI diplo modifiers based on relative strengths and likelihood to make DOFs
//#define AMB_AI_COALLITION
//AI dof have more value
#define AMB_AI_DOFVALUE
//Allows reduction of player resistance in conquered cities (Statue of Zeus)
#define AMB_BUILDING_REDUCED_RESISTANCE
//Save game influence // Puts a timer for no unit killed and no cities exchanged which would result in a possible white peace
#define AMB_AI_NO_ACTIVITY_WHITE_PEACE
//Faster chances to steal
#define AMB_BETTER_SPY
//Spy rank diminish chance to get killed and number of tech difference diminish chance to get killed (Removed)
//#define AMB_BETTER_SPY_CATCHUP
//Weaker nukes
#define AMB_WEAKER_NUKES
//Tentative
//Adds a check for religion spreading if the AI has accepted to not spread
#define AMB_AI_RESPECT_NO_SPREAD
//Allows for faith buying units without the belief (Byzantium)
#define AMB_CIV_UNITFAITH
//Removes the peace condition for peace loving
#define AMB_BELIEF_PEACELOVING_NOTATPEACE
//Gives influence if you kill a unit next to a CS which is at war with the unit owner
#define AMB_DEFEND_CS_INFLUENCE
//Civ changes
#define AMB_CIV_CHANGES
//Better AI after chosing some policies
#define AMB_BETTER_POLICY_STRATEGY
//AI religion tweaks
#define AMB_RELIGIONAI_TWEAKS
//-1 Food For trade routes
//#define AMB_LOWER_TR_FOOD
//Builder AI tweaks
#define AMB_BUILDER_TWEAKS
//AI should now nuke more often
#define AMB_NUKE_HAPPY
//AI cheats to see if there are enemies close to their borders (avoid worker excessive steal)
#define AUI_DANGER_PLOTS_FIX_SHOULD_IGNORE_UNIT_IGNORE_VISIBILITY_PLOT
/// Majors will always "see" barbarians in tiles that have been revealed when plotting danger values (kind of a cheat, but it's a knowledge cheat, so it's OK-ish)
#define AUI_DANGER_PLOTS_SHOULD_IGNORE_UNIT_MAJORS_SEE_BARBARIANS_IN_FOG
/// Minors will always "see" units of major civs in tiles (value) away from their city (since minors don't scout) when plotting danger values (stops excessive worker stealing)
#define AUI_DANGER_PLOTS_SHOULD_IGNORE_UNIT_MINORS_SEE_MAJORS (5)
//Allows for wars while already being at war if conquest GS
#define AMB_DIPLOAI_CAN_ATTACK_MULTIPLE_MAJOR_GS_CONQUEST
#define AMB_DIPLOAI_CAN_ATTACK_MINOR_WHILE_WAR_MAJOR_GS_CONQUEST
//Defenseless boost
#define AMB_AI_PRODUCTION_UNIT_DEFENSLESS
//Rework Coop wars
#define AMB_AI_DIPLO_COOP
//Use citizen values for improvements because food is better than gold ! Also diminishes the bias for capitals plots.
#define AMB_BETTER_PLOT_BUILD_VALUE_USE_CITIZEN
//AI should use Internal route a bit more
//#define AMB_BETTER_INTERNAL_ROUTE_VALUATION
//Tweaks for production choices
#define AMB_AI_PRODUCTION_TWEAKS
//Better AI specialists
#define AMB_AI_SPECIALIST_FOCUS
//Make it so it doesn't disband the second worker demigod starts with
#define AMB_AUIFIX_WORKER_DISBAND_ADJUSTMENT
//This tweaks the number of cities the AI will make
#define AMB_AI_NUM_CITIES_TWEAKS
//Cities act as if they have cover 2 for humans
#define AMB_CITY_COVER2 (40)
//Cities ranged attacks are reduced by some percent
#define AMB_CITY_WEAKER_RANGE (30)
//Ranged units get a boost when garrisoned
#define AMB_RANGED_BOOST_GARRISONED (20)

//Tweaks the great people actions by the AI
#define AMB_AI_BETTER_GREAT_PEOPLE_USE
//Fixes a rare crash where an escort was null, put the civilian into the escort. Better than crashing. See log for "Abort trying NO ESCORT"
#define AMB_MOD_FIX_CRASH
//Adjusted calculations based on difficulty because of the new difficulty
#define AMB_DIFFICULTY_ID_ADJUSTMENT
//This is the warmonger improvements
#define AMB_AI_WARMONGER //Save game influence
//Boost the size of an AI doing conquest by era and already conquered capitals
#define AMB_GS_CONQUEST_ARMY_SIZE_BOOST
//Complete overhaul of the reckless expander modifier
#define AMB_DIPLOAI_RECKLESS_EXPANDER_OVERHAUL //Save game influence
//Makes the free GP from liberty finisher truly free Right now it also makes the one from pisa free.
#define AMB_POLICY_FREEGP_LIBERTY
//WIP on better Operations This pick land targets using the pathfinder
//#define AMB_AI_PICKBESTTARGET_USES_PATHFINDER
//Tries to help the mustering process by giving more room for deployment, experimental.
//#define AMB_BETTER_MUSTERING 
//This allow the AI to agressively try to win Diplomacy OR tries to stop a player from winning it WIP
#define AMB_AI_DIPLOMATIC_VICTORY_IMPROVEMENT 
//This change the way bribes for war are valued and make it harder to bribe if you are weak and juicy, also makes the mod additive rather than multiplicatives
#define AMB_AI_DEAL_VALUE_WAR
//+1 range
//#define AMB_GETGATHERRANGEFORXUNITS_PLUS_1
//Less units and terrain for city states, to diminish computational time and map clogging
#define AMB_LESS_UNIT_CS (6)
#define AMB_LESS_BORDER_CS (2)
//More logical deal values
#define AMB_AI_DEAL_LOGICAL_VALUES
//Partial increase for GSEM
#define AMB_PARTIAL_GP_COUNTERS (0)
//AI conquest will deprioritize wonders
#define AMB_AI_CONQUEST_DEPRIORITIZE_WONDER
//AI gets a tourism bonus based on difficulty
#define AMB_AI_DIFFICULTY_TOURISM_BONUS
//AFFECT SAVE GAMES Allows for settler production modifier in a PANTHEON, note: need AI adjustment (should be done)
#define AMB_BELIEF_SETTLERPRODUCTION
//AFFECT SAVE GAMES Allows for additional city strength from a PANTHEON, note: need AI adjustment (should be done)
#define AMB_BELIEF_CITYSTRENGTH

//Better Treasury Management by the AI, crap
//#define AMB_AI_TREASURY_MANAGEMENT
//This modify some trade values with ressources to make them more consistent, now (with normal opinion) strategics are worth 40/1gpt and luxuries 240/7gpt
//Doesn't work yet, need to consider lux for lux only look for WIP_AMB_AI_DEAL_VALUE_RESSOURCES
//#define AMB_AI_DEAL_VALUE_RESSOURCES
//#define AMB_AI_GS_CULTURE_POPULAR_CIV_MOD //obsolete
//#define AMB_AI_GS_CULTURE_FAMILIAR_CIV_MOD //obsolete
//Fixed what appears to be a bug putting a friendly weight on deceptive when opinion is neutral, vanilla dll
//#define AMB_BUGFIX_OPINION_WEIGHT


//DEBUGING DEFINES AT RISK
//_______________________________________________
//Longer time before peace
#define AMB_HIGHER_PEACE_THRESHOLD



//_________________________________________________
//				AI STUFF
//___________ARTIFICIAL UNINTELLIGENCE______________
//Changes the multiplier used to determine the fleet size of the AI in order to reduce the number of ships the AI makes on non water map
#define AMB_AI_NAVAL_SIZE_DMULTIPLIER
//Make it so popular and familiar levels of culture influence the AI GS culture value
#define AMB_AI_GS_CULTURE_POPULAR_FAMILIAR_CIV_MOD
//increases conquest GS weight if civ already has a capital
#define AMB_AI_GS_CONQUEST_CAPITAL_CONQUERED_MOD
//Boosts War approach if we are currently hostile
#define AMB_APPROACH_WAR_CURRENTLY_HOSTILE
//Less Likely to be friendly if we want to conquer the world
#define AMB_LESS_LIKELY_FRIENDLY_NEIGHBOURS_GS_CONQUEST (75)
//More Likely to be friendly if we want to spread culture
#define AMB_MORE_LIKELY_FRIENDLY_NEIGHBOURS_GS_CULTURE (120)
//Peace treaty no more white peace exploits
#define AMB_AI_DEAL_WHITE_PEACE
//Peace treaty less harsh when civ is far away
#define AMB_AI_DEAL_PEACE_BASED_ON_DISTANCE
//This changes the way branch are valued, adding all policies of a branch rather than doing a propagation up to top policies mechanism
#define AMB_POLICY_BRANCH_ALL_POLICIES //Save game influence
//Same for ideologies
#define AMB_GS_IDEOLOGY_CHOOSE_BY_FLAVORS
//Reduces the influence of the gold gained by the target of a trade route when valuing the route's worth
#define AMB_AI_TRADE_REDUCED_TARGET_GOLD_NEGATIVE_EFFECT
//Approach modifiers for distance that didnt exist
#define AMB_APPROACH_DISTANCE_ADDITIONAL_MODIFIERS

//AUI IMPORT PREPROCESSING
#define AMB_IMPORT_AUI_WORKER
#define AMB_IMPORT_AUI_HOMELAND
#define AMB_IMPORT_AUI_ASTAR
#define AMB_IMPORT_AUI_ECONOMIC
#define AMB_IMPORT_AUI_RELIGION
#define AMB_IMPORT_AUI_POLICY
#define AMB_IMPORT_AUI_ECONOMIC
#define AMB_IMPORT_AUI_OPERATION
#define AMB_IMPORT_AUI_CULTURE
#define AMB_IMPORT_AUI_TACTICAL
#define AMB_IMPORT_AUI_TACTICALANALYSIS
#define AMB_IMPORT_AUI_TEAM
#define AMB_IMPORT_AUI_TECH
#define AMB_IMPORT_AUI_TECHAI
#define AMB_IMPORT_AUI_TRADE
#define AMB_IMPORT_AUI_TRAIT
#define AMB_IMPORT_AUI_UNIT
#define AMB_IMPORT_AUI_PROMOTION
#define AMB_IMPORT_AUI_VOTING
#define AMB_IMPORT_AUI_WONDER
#define AMB_IMPORT_AUI_PLAYER
#define AMB_IMPORT_AUI_CITY

///////////////////////////////////////////////////////
//For compatibility purposes not totally implemented
//SAVE GAME EFFECT Tweaks Disband Obsolete Units function to work more often, more intelligently, and also when player does not have negative GPT but still has obsolete units
#define AUI_MILITARY_DISBAND_OBSOLETE_TWEAKED
///////////////////////////////////////////////////////

//This is used by AUI to speed some stuff
#define AUI_FAST_COMP
/// Optimizes loops that iterate over relative coordinates to hexspace
#define AUI_HEXSPACE_DX_LOOPS
//AUI imported features
//WORKER FUNCTION FROM AUI
#ifdef AMB_IMPORT_AUI_WORKER
	// Worker Automation Stuff
	/// Automated Inca workers know that there is no maintenance on hills, so routines are adjusted as a result
	//#define AUI_WORKER_INCA_HILLS
	/// Automated workers do not care about the build time or cost of scrubbing fallout
	//#define AUI_WORKER_FIX_FALLOUT
	/// AI City Focus/Specialization no longer affects improvement score
	#define AUI_WORKER_SCORE_PLOT_EFFECT_FROM_CITY_FOCUS (0)
	/// Divides score for improvement if built for a puppeted city
	#define AUI_WORKER_SCORE_PLOT_REDUCED_PUPPET_SCORE (2)
	/// Returns score of 0 for improvement if built for a city being razed
	#define AUI_WORKER_SCORE_PLOT_NO_SCORE_FROM_RAZE
	/// Embeds flavors and plot yield multipliers into the ScorePlot() function (copied from the chop directives function), value is base yield value
	//#define AUI_WORKER_SCORE_PLOT_FLAVORS (2.0)
	/// If building an improvement also generates flat hammers, consider the effect as flat +parameter hammer yield
	//#define AUI_WORKER_SCORE_PLOT_CHOP (1.0)
	/// Removes the bias to chop forests after optics (since it doesn't actually offer a gameplay improvement
	#define AUI_WORKER_NO_CHOP_BIAS
	/// Faith now affects tile evaluation for workers, it pulls from culture multiplier though
	//#define AUI_WORKER_EVALUATE_FAITH
	/// For improvement evaluation, leader flavor now have ln() taken before being multiplied by everything else; this reduces cases were leader flavor makes a huge difference in worker automation logic 
	#define AUI_WORKER_LOGARITHMIC_FLAVOR
	/// Automated Dutch workers now remove marshes on tiles with resources (since polders won't be built anyway)
	#define AUI_WORKER_DUTCH_MARSH_RESOURCES
	/// AI Celt workers will no longer leave forests unimproved once they enter the Industrial Era
	//#define AUI_WORKER_CELT_FOREST_IMPROVE_INDUSTRIAL "ERA_INDUSTRIAL"
	/// Automated workers value strategic resources that a player has none of higher than strategic resources that the player has used all of
	#define AUI_WORKER_TWEAKED_DONT_HAVE_MULTIPLIER (10)
	/// Combat workers will increase the maximum allowed plot danger value to their current strength times this value
	//#define AUI_WORKER_SHOULD_BUILDER_CONSIDER_PLOT_MAXIMUM_DANGER_BASED_ON_UNIT_STRENGTH (6)
	/// FindTurnsAway() no longer returns raw distance, parameter dictates whether we're reusing paths and ignoring units (fast but rough) or not (slow but accurate)
	//#define AUI_WORKER_FIND_TURNS_AWAY_USES_PATHFINDER (true)
	#ifdef AUI_PLOT_CALCULATE_STRATEGIC_VALUE
		/// AddImprovingPlotsDirective() now processes improvement defense rate
		//#define AUI_WORKER_ADD_IMPROVING_PLOTS_DIRECTIVE_DEFENSIVES
	#endif
	/// Shifts the check for whether there already is someone building something on the plot to the necessary AddDirectives() functions (so collaborative building is possible)
	#define AUI_WORKER_FIX_SHOULD_BUILDER_CONSIDER_PLOT_EXISTING_BUILD_MISSIONS_SHIFT
	/// New function that is called to construct non-road improvements in a minor's territory (eg. for Portugal)
	//#define AUI_WORKER_ADD_IMPROVING_MINOR_PLOTS_DIRECTIVES
	/// Multiplies the weight of unowned luxury resources for plot directives depending on the empire's happiness (value is the multiplier at 0 happiness)
	#define AUI_WORKER_GET_RESOURCE_WEIGHT_INCREASE_UNOWNED_LUXURY_WEIGHT (2.0)
	/// Consider extra sources of happiness once a resource is obtained (eg. extra happiness from luxury resources via policy, extra happiness from resource variety)
	//#define AUI_WORKER_GET_RESOURCE_WEIGHT_CONSIDER_EXTRAS_FOR_HAPPINESS_FROM_RESOURCE
	/// Removes the isAdjacent check for whether a work boat can access an area different from its current one (pathfinder takes care of bad cases anyway, it's just a bit slower)
	#define AUI_WORKER_FIX_SHOULD_CONSIDER_PLOT_WORK_BOATS_CONSIDER_ALL_SEA_PLOTS
	/// Only disregard an impassable plot if the unit cannot enter impassable plots
	//#define AUI_WORKER_FIX_SHOULD_CONSIDER_PLOT_FLYING_WORKER_DISREGARDS_PEAKS
#endif
//STAR PATHFINDING FROM AUI
#ifdef AMB_IMPORT_AUI_ASTAR
	/// A* functions now identify paradropping as a valid move
	#define AUI_ASTAR_PARADROP
	#ifdef AUI_ASTAR_PARADROP
		/// Paradropping is now inserted into relevant tactical moves and the AI will execute them when favorable
		//#define AUI_HOMELAND_PARATROOPERS_PARADROP
	#endif
	/// AI-controlled units no longer ignore all paths with peaks; since the peak plots are check anyway for whether or not a unit can enter them, this check is pointless 
	#define AUI_ASTAR_FIX_PATH_VALID_PATH_PEAKS_FOR_NONHUMAN
#endif
//ECONOMIC AI FROM AUI
#ifdef AMB_IMPORT_AUI_ECONOMIC
	/// Adds a setter for m_iLastTurnWorkerDisbanded (so if a worker is disbanded in another class, they can reference this)
	#define AUI_ECONOMIC_SETTER_LAST_TURN_WORKER_DISBANDED
#endif
//HOMELAND AI FROM AUI
#ifdef AMB_IMPORT_AUI_HOMELAND
	/// Stops the AI from suiciding units by embarking them onto tiles that can be attacked
	#define AUI_HOMELAND_FIX_EXECUTE_MOVES_TO_SAFEST_PLOT_NO_EMBARK_SUICIDE
	/// This function is just filled with holes; I've now fixed (most of) them!
	#define AUI_HOMELAND_FIX_EXECUTE_AIRCRAFT_MOVES
	/// Dials up priority for upgrading units by 50x every other turn primarily to help upgrade air units (originally from Ninakoru's Smart AI with slight modification)
	#define AUI_HOMELAND_ESTABLISH_HOMELAND_PRIORITIES_50X_UPGRADE_PRIORITY_EVERY_OTHER_TURN
	/// Disbands work boats that cannot target anything, even if units are ignored
	#define AUI_HOMELAND_PLOT_WORKER_SEA_MOVES_DISBAND_WORK_BOATS_WITHOUT_TARGET
	#ifdef AUI_ECONOMIC_SETTER_LAST_TURN_WORKER_DISBANDED
		/// If a worker is idle and we have extra workers, disband him instead of sending him to the safest plot
		#define AUI_HOMELAND_PLOT_WORKER_MOVES_DISBAND_EXTRA_IDLE_WORKERS
	#endif
	/// Disbands archaeologists if there are no more sites available (originally from Ninakoru's Smart AI)
	#define AUI_HOMELAND_EXECUTE_ARCHAEOLOGIST_MOVES_DISBAND_IF_NO_AVAILABLE_SITES
	/// Units in armies that are waiting around are now eligible for upgrading
	#define AUI_HOMELAND_FIX_PLOT_UPGRADE_MOVES_APPLIES_TO_WAITING_ARMIES
	/// The AI will no longer stop upgrading units once it has upgraded more units in a turn than its Military Training Flavor
	#define AUI_HOMELAND_PLOT_UPGRADE_MOVES_NO_COUNT_LIMIT
	/// If the AI wants to use a unit for a Great Work, check if the unit can create one right there and then (performance improvement)
	#define AUI_HOMELAND_EXECUTE_GP_MOVE_INSTANT_GREAT_WORK_CHECK
#endif
//RELIGION AI FROM AUI
#ifdef AMB_IMPORT_AUI_RELIGION
	/// Various bits of code that could cause null pointers have been fixed
	#define AUI_RELIGION_FIX_POSSIBLE_NULL_POINTER
	/// If the AI's religion now unlocks multiple faith buildings, AI can now purchase all of them
	#define AUI_RELIGION_FIX_MULTIPLE_FAITH_BUILDINGS
#endif
//POLICY AI FROM AUI
#ifdef AMB_IMPORT_AUI_POLICY
	/// Divides the weight of religion flavor by this number if we have not founded a pantheon or if we've founded a pantheon but there are no more religions to found
	#define AUI_POLICY_DIVIDE_RELIGION_WEIGHT_WHEN_NO_RELIGION (2)
	/// Doubles Happiness flavor weight if the civ is currently unhappy
	#define AUI_POLICY_MULTIPLY_HAPPINESS_WEIGHT_WHEN_UNHAPPY (2)
	/// Gets all possible happiness sources the branch can give, not just building-based ones (eg. specialists, trade routes, luxuries, etc.)
	#define AUI_POLICY_GET_BRANCH_BUILDING_HAPPINESS_GET_ALL_HAPPINESS_SOURCES
#endif
//ECONOMIC AI FROM AUI
#ifdef AMB_IMPORT_AUI_ECONOMIC
	/// Adds a setter for m_iLastTurnWorkerDisbanded (so if a worker is disbanded in another class, they can reference this)
	#define AUI_ECONOMIC_SETTER_LAST_TURN_WORKER_DISBANDED
#endif
//OPERATION AI FROM AUI
#ifdef AMB_IMPORT_AUI_OPERATION
	/// If a settler tries and fails the no escort check, keep rerolling each turn
	#define AUI_OPERATION_FOUND_CITY_SETTLER_REROLLS
	/// Fixes bugs and tweaks certain values in the FindBestTarget() function for nuke targets
	#define AUI_OPERATION_TWEAKED_FIND_BEST_TARGET_NUKE
	/// Adds the difference between players' nukes to the nuke flavor for nuke rolls
	#define AUI_MILITARY_ROLL_FOR_NUKES_CONSIDER_NUKE_COUNT
	/// FindBestFitReserveUnit() no longer ignores units that can paradrop
	#define AUI_OPERATION_FIND_BEST_FIT_RESERVE_CONSIDER_PARATROOPERS
	/// GetClosestUnit() will now consider whether a unit can paradrop to the target location
	#define AUI_OPERATION_GET_CLOSEST_UNIT_PARADROP
	/// Fixes a possible null pointer in the function
	#define AUI_OPERATION_FIX_CHECK_ON_TARGET_POSSIBLE_NULL_POINTER
	/// FindBestFitReserveUnit() no longer ignores units that can paradrop
	#define AUI_OPERATION_FIND_BEST_FIT_RESERVE_CONSIDER_PARATROOPERS
	/// The filter to filter out scouting units only applies to units whose default AI is scouting
	#define AUI_OPERATION_FIX_FIND_BEST_FIT_RESERVE_CONSIDER_SCOUTING_NONSCOUTS
	/// Operations will now recruit units who are in armies that are waiting for reinforcements
	#define AUI_OPERATION_FIND_BEST_FIT_RESERVE_CONSIDER_UNITS_IN_WAITING_ARMIES
	/// Resets the loop iterator before the secondary unit types are considered in FindBestFitReserveUnit()
	#define AUI_OPERATION_FIX_FIND_BEST_FIT_RESERVE_ITERATOR
	/// Before considering units that fit the primary type first in FindBestFitReserveUnit(), "perfect match" units that fit both primary and secondary type are looked for
	#define AUI_OPERATION_FIND_BEST_FIT_RESERVE_CALCULATE_PERFECT_MATCH_FIRST
	/// GetClosestUnit() will no longer terminate early after finding a single unit with "good enough" range (very important once roads start being used)
	#define AUI_OPERATION_GET_CLOSEST_UNIT_NO_EARLY_BREAK
	/// If two units have the same path distance in GetClosestUnit(), the one with the higher current strength wins (most effective when paired up with no early break)
	#define AUI_OPERATION_GET_CLOSEST_UNIT_GET_STRONGEST
#endif
//CULTURE AI FROM AUI
#ifdef AMB_IMPORT_AUI_CULTURE
	/// AI only wants propaganda diplomats with players of different ideologies (since that's the only time they get the tourism bonus)
	#define AUI_PLAYERCULTURE_FIX_WANTS_DIPLOMAT_DOING_PROPAGANDA_ONLY_NON_SAME_IDEOLOGY
	/// Influence turns are used instead of influence levels (ie. the player will propaganda the two AI's who will take the longest to get to influential)
	#define AUI_PLAYERCULTURE_WANTS_DIPLOMAT_DOING_PROPAGANDA_INFLUENCE_TURNS_USED
	/// No longer returns false if any one player's influence level is Unknown (it will now simply skip that player instead)
	#define AUI_PLAYERCULTURE_WANTS_DIPLOMAT_DOING_PROPAGANDA_NO_EARLY_TERMINATION
	/// The AI will only want propaganda spies if its tourism is greater than a certain amount (will actually use Science Boost amount if it's active)
	#define AUI_PLAYERCULTURE_GET_MAX_PROPAGANDA_DIPLOMATS_WANTED_FILTER_TOURISM (8)
#endif
//TACTICAL AI FROM AUI
#ifdef AMB_IMPORT_AUI_TACTICAL
	/// When checking the embark safety of a plot, use the plot the unit will be moving to instead of the target plot
	#define AUI_TACTICAL_FIX_MOVE_TO_USING_SAFE_EMBARK_CORRECT_PLOT
	/// Sets a very high danger value for water tiles if a unit needs to embark onto the tile (originally from Ninakoru's Smart AI)
	#define AUI_TACTICAL_TWEAKED_MOVE_TO_SAFETY_HIGH_DANGER_EMBARK
	/// Pathfinder no longer called twice when MoveToUsingSafeEmbark() is called in a function that already generated a path to the target
	//#define AUI_TACTICAL_FIX_MOVE_TO_USING_SAFE_EMBARK_SINGLE_PATHFINDER_CALL
	/// Fixes a possible null pointer when converting a target's coordinates to a plot
	#define AUI_TACTICAL_FIX_FIND_BEST_BARBARIAN_SEA_MOVE_POSSIBLE_NULL_POINTER
	/// Fixes a possible null pointer when selecting a naval escort operation's escort
	#define AUI_TACTICAL_FIX_PLOT_NAVAL_ESCORT_OPERATION_MOVES_POSSIBLE_NULL_POINTER
	/// Adds a new function that will order a unit to pillage its tile when appropriate (eg. in enemy territory, don't need to attack or move)
	#define AUI_TACTICAL_FREE_PILLAGE
	/// Capitals will always be included in the list of potential targets if conquest victory is enabled
	#define AUI_MILITARY_ALWAYS_TARGET_CAPITALS
	/// Tweaks capture/damage city moves so that ranged attacks aren't wasted on cities with 1 HP (originally from Ninakoru's Smart AI)
	#define AUI_TACTICAL_TWEAKED_CAPTURE_DAMAGE_CITY_MOVES
	/// Enables a minor adjustment for ranged units to account for possibly being able to move and shoot at a tile
	#define AUI_TACTICAL_ANALYSIS_MAP_MARKING_ADJUST_RANGED
	/// Paradropping is now inserted into relevant tactical moves and the AI will execute them when favorable
	//#define AUI_TACTICAL_PARATROOPERS_PARADROP
	/// Enables a minor adjustment for ranged units to account for possibly being able to move and shoot at a tile
	#define AUI_TACTICAL_ANALYSIS_MAP_MARKING_ADJUST_RANGED
	// Unit Stuff
	/// Adds a function to return a unit's movement range if it can attack after a move + the unit's range (originally from Ninakoru's Smart AI)
	#define AUI_UNIT_RANGE_PLUS_MOVE
	/// Fixes the check for whether ranged damage would be more than heal rate to use >= instead of >, adds a flat value to total damage at start (both make up for randomness), and treats cities as an expected damage source instead of a flat "yes"
	//#define AUI_UNIT_FIX_UNDER_ENEMY_RANGED_ATTACK_HEALRATE (1)
	/// Adds a function to return whether a unit can range strike at a target from a plot (originally from Ninakoru's Smart AI)
	#define AUI_UNIT_CAN_EVER_RANGE_STRIKE_AT_FROM_PLOT
	#ifdef AUI_UNIT_CAN_EVER_RANGE_STRIKE_AT_FROM_PLOT
	/// Overloads the vanilla canEverRangeStrikeAt() function to call the new canEverRangeStrikeAtFromPlot() function if it's enabled (originally from Ninakoru's Smart AI)
		#define AUI_UNIT_CAN_EVER_RANGE_STRIKE_AT_OVERLOAD
		#if defined(AUI_UNIT_CAN_EVER_RANGE_STRIKE_AT_OVERLOAD) && defined(AUI_UNIT_RANGE_PLUS_MOVE)
			/// Adds two new functions that return whether a unit can move and ranged strike at a plot (originally from Ninakoru's Smart AI)
			#define AUI_UNIT_CAN_MOVE_AND_RANGED_STRIKE
			/// Adds new functions that help with positioning units and ordering possible units to position
			#define AUI_TACTICAL_HELPERS_POSITIONING_AND_ORDER
			/// Adds a new function to CvPlot to count how many times the given plot is in a list
			#define AUI_PLOT_COUNT_OCCURANCES_IN_LIST
		#endif
	#endif
	/// Adds a function to calculate the maximum number of possible intercepts on a tile (originally from Ninakoru's Smart AI)
	#define AUI_MILITARY_MAX_INTERCEPTS
	/// This function is just filled with holes; I've now fixed (most of) them!
	#define AUI_MILITARY_FIX_WILL_AIR_UNIT_REBASE
	/// No longer uses a fixed range for the GetNumEnemyAirUnitsInRange() function (originally from Ninakoru's Smart AI)
	#define AUI_MILITARY_NUM_AIR_UNITS_IN_RANGE_DYNAMIC_RANGE
	#ifdef AUI_PLOT_COUNT_OCCURANCES_IN_LIST
		/// Adds a new function that lets aircraft go on intercept missions (originally from Ninakoru's Smart AI)
		#define AUI_HOMELAND_AIRCRAFT_INTERCEPTIONS
	#endif
	/// Air units are no longer skipped by the tactical AI (since homeland AI can send them out on intercepts and rebases)
	#define AUI_TACTICAL_FIX_REVIEW_UNASSIGNED_UNITS_DO_NOT_SKIP_AIR
	/// Adds possible air sweeps to the Find Units within Striking Distance function (originally from Ninakoru's Smart AI)
	#define AUI_TACTICAL_FIND_UNITS_WITHIN_STRIKING_DISTANCE_AIR_SWEEPS
	#ifdef AUI_PLOT_COUNT_OCCURANCES_IN_LIST
		/// Uses a different algorithm for plotting intercept moves instead of relying on dominance zones (originally from Ninakoru's Smart AI)
		#define AUI_TACTICAL_TWEAKED_AIR_INTERCEPT
	#endif
	/// Adds new functions that help with being able to conduct Air Sweeps and Intercepts
	#define AUI_TACTICAL_HELPERS_AIR_SWEEP
#endif
//CITY AI FROM AUI
#ifdef AMB_IMPORT_AUI_CITY
	///AUI_CITIZENS_DO_TURN_NO_FOOD_FOCUS_IF_UNHAPPY
	#define AUI_CITIZENS_DO_TURN_NO_FOOD_FOCUS_IF_UNHAPPY
	/// Replaces the rudimentary specialist-plot check with a plot vs. default citizen value check
	#define AUI_CITIZENS_IS_PLOT_BETTER_THAN_DEFAULT_SPECIALIST
	/// Reenables the purchasing of buildings with gold (originally from Ninakoru's Smart AI, but heavily modified since)
	#define AUI_CITY_FIX_BUILDING_PURCHASES_WITH_GOLD
	#ifdef AUI_CITY_FIX_BUILDING_PURCHASES_WITH_GOLD
		/// Reenables the DoHurry() function, but using a reworked method instead of the original (originally from Ninakoru's Smart AI, but heavily modified since)
		#define AUI_ECONOMIC_FIX_DO_HURRY_REENABLED_AND_REWORKED
	#endif
	/// The sanity check to ensure water units are not built on small inland seas now requires at least one other civ (minors too!) to have a city coastal to that area
	#define AUI_CITYSTRATEGY_FIX_CHOOSE_PRODUCTION_ACCURATE_SEA_SANITY_CHECK
	#ifdef AUI_CITYSTRATEGY_FIX_CHOOSE_PRODUCTION_ACCURATE_SEA_SANITY_CHECK
		//Small change to only consider major
		#define	AMB_CITYSTRATEGY_FIX_CHOOSE_PRODUCTION_ACCURATE_SEA_SANITY_CHECK_ONLY_MAJOR
	#endif
	/// If the player has yet to unlock an ideology, multiply the base weight of buildings that can unlock ideologies by this value
	#define AUI_CITYSTRATEGY_EMPHASIZE_FACTORIES_IF_NO_IDEOLOGY (8)
#endif
//PLAYER AI FROM AUI
#ifdef AMB_IMPORT_AUI_PLAYER
	/// Fixes the score divider caused by enemies on a continent if not a naval expansion map to work the other way around: now a multiplier for when there are no enemies and is a naval expansion map
	#define AUI_PLAYER_FIX_BEST_SETTLE_AREAS_NAVAL_EXPAND_HINT (3)
	/// Fixes GetNumUnitsWithUnitAI() counting units with delayed death (ie. they will die this turn) or are dead, but still in the list of the player's units
	#define AUI_PLAYER_FIX_GET_NUM_UNITS_WITH_UNITAI_NO_DEAD
	/// Checks adjacent tiles for being targetted for city settling as well as the current one
	#define AUI_PLAYER_GET_BEST_SETTLE_PLOT_CHECK_ADJACENT_FOR_CITY_TARGET
	/// The evaluation distance depends on the distance from the player's city closest to the settler instead of the distance from the settler
	#define AUI_PLAYER_GET_BEST_SETTLE_PLOT_EVALDISTANCE_FOR_CLOSEST_CITY
	/// Calls a pathfinder instead of scaling values depending on whether or not the plot is on a different landmass
	#define AUI_PLAYER_GET_BEST_SETTLE_PLOT_PATHFINDER_CALL
	/// Pathfinder used instead of raw distance, parameter dictates whether we're reusing paths (fast but rough) or not (slow but accurate)
	#define AUI_PLAYER_GET_BEST_SETTLE_PLOT_USE_PATHFINDER_FOR_EVALDISTANCE (true)
	/// If a tile is on the same continent as the player's capital and is closer to an enemy major capital than any allied cities, disregard the tile
	#define AUI_PLAYER_GET_BEST_SETTLE_PLOT_CONSIDER_ENEMY_CAPITALS
	/// Switches the function over to using the XML-loaded fertility value
	#define AUI_PLAYER_GET_BEST_SETTLE_PLOT_USE_MINIMUM_FERTILITY
	/// Ignores the fact that the enemy has nukes when calculating Conquest GS priority
	#define AUI_GS_CONQUEST_IGNORE_ENEMY_NUKES
	/// When deciding whether to raze a city, AI_conquerCity() now considers free and/or cheaper courthouses and has a lowerered happiness bar
	#define AUI_PLAYERAI_CONQUER_CITY_TWEAKED_RAZE
	/// do_annex will now properly consider whether the AI gets courthouses for free
	#define AUI_PLAYERAI_DO_ANNEX_CONSIDERS_FREE_COURTHOUSE
	/// do_annex will no longer stop after it annexes the player's own capital
	#define AUI_PLAYERAI_FIX_DO_ANNEX_NO_STOP_AFTER_CAPITAL_ANNEX
	#define AUI_PLAYERAI_DO_ANNEX_MORE_AGGRESSIVE
	/// do_annex will no longer consider whether or not the player is going for a cultural victory (holdover from pre-BNW)
	#define AUI_PLAYERAI_DO_ANNEX_IGNORES_CULTURAL_STRATEGY
	/// do_annex's resistance check will occur before a city is qualified, not after
	#define AUI_PLAYERAI_FIX_DO_ANNEX_CHECK_FOR_RESISTANCE
	/// Requires the AI to be influential with more civs before concert tour is prioritized before creating a great work
	#define AUI_PLAYERAI_GREAT_MUSICIAN_DIRECTIVE_HIGHER_INFLUENTIALS_REQUIRED_BEFORE_CONCERT_TOUR_PRIORITY
#endif

//_________________________________________________
//				POLICIES ATTRIBUTES
//_________________________________________________
#define AMB_POLICY_PROPHETSPAWNBONUSPERFOLLOWER //bonus when prophet spawn policy reformation
#define AMB_POLICY_EXTRATRADEROUTES //policy adds a trade route (maximum)
#define AMB_POLICY_EXTRAHAPPINESSPERFOLLOWINGCITY
#define AMB_POLICY_MANDATEOFHEAVEN_PROPHETCOST
#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS
//cases
#if defined(AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS)
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_SPECIALIST
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_BUILDINGS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_WONDERS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_GROWTH
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_HAPPINESS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_MAXYIELDFOLLOWERS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_FAITHUNITS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_FAITHBUILDINGS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_YIELDS
	#define AMB_POLICY_SECONDARYRELIGIONFOLLOWERBELIEFS_HERMITAGE
#endif
//Patronage
#define AMB_POLICY_FIXEDSCHOLASTICISM
#define AMB_POLICY_YIELDCHANGEPERMINORTRADEROUTE
#define AMB_POLICY_ADDITIONALPERSONALQUEST
#define AMB_POLICY_FASTERPERSONALQUEST
#define AMB_POLICY_BONUSMINORYIELD

//Aesthetics
#define AMB_POLICY_BUILDINGCHANGETOURISMCHANGES //based on BuildingClassCultureChanges
#define AMB_POLICY_GREATWORKTOURISMCHANGE

//Commerce
#define AMB_POLICY_BUILDINGGOLDTOCULTURE

//Exploration
#define AMB_POLICY_YIELDCHANGEPERSEAINTERNATIONALTRADEROUTE

#define AMB_POLICY_IDEOLOGIES

//Free defense buildings //save game influence
#define AMB_POLICY_FREEDEFENSE

//_________________________________________________
//				MISC
//_________________________________________________
//Sea trade route give 150% bonus rather than 200%
#define AMB_WEAKER_SEA_TRADE_ROUTES
//Fixes the bulb value of great writers
#define AMB_FIXED_GW_BULB // save game influence
//Fixes the bulb value of scientists
#define AMB_FIXED_GS_BULB // save game influence
//Reduce the additional science and culture to 1 turn instead of 3 when no previous data
#define AMB_FIX_ONE_TURN
//There is a pre-BNW checker for cultureGS in the PolicyAI valuation, removed it
#define AMB_AI_POLICY_REMOVED_ECULTUREGS_CHECKER
//Tech Penalties overhaul
#define AMB_TECH_PENALTY_OVERHAUL
//Compensates a bit for weaker cities to diminish early game bully power
#define AMB_HARDER_BULLY


//_________________________________________________
//				Whoward imported PNM mods
//_________________________________________________
#define MOD_API_UNIFIED_YIELDS_TOURISM (true)
#ifdef MOD_API_UNIFIED_YIELDS_TOURISM
	#define AMB_API_UNIFIED_YIELDS_TOURISM_NO_TRADE_ROUTE_TOURISM
#endif
#define MOD_BUGFIX_CITY_CENTRE_WORKING
#define MOD_GLOBAL_BREAK_CIVILIAN_1UPT              GD_INT_GET(MOD_STACKCIVILIAN)  
#if defined(MOD_GLOBAL_BREAK_CIVILIAN_1UPT)
	#define MOD_GLOBAL_BREAK_CIVILIAN_RESTRICTIONS      GD_INT_GET(MOD_STACKCIVILIAN)
#endif

//Wrapers
// GlobalDefines (GD) wrappers
// INT
#define GD_INT_DECL(name)       int m_i##name
#define GD_INT_DEF(name)        inline int get##name() { return m_i##name; }
#define GD_INT_INIT(name, def)  m_i##name(def)
#define GD_INT_CACHE(name)      m_i##name = getDefineINT(#name)
#define GD_INT_GET(name)        GC.get##name()
// FLOAT
#define GD_FLOAT_DECL(name)       float m_f##name
#define GD_FLOAT_DEF(name)        inline float get##name() { return m_f##name; }
#define GD_FLOAT_INIT(name, def)  m_f##name(def)
#define GD_FLOAT_CACHE(name)      m_f##name = getDefineFLOAT(#name)
#define GD_FLOAT_GET(name)        GC.get##name()
// DOUBLE (high precision, but much slower than float)
#ifdef AUI_CACHE_DOUBLE
#define GD_DOUBLE_DECL(name)       double m_d##name
#define GD_DOUBLE_DEF(name)        inline double get##name() { return m_d##name; }
#define GD_DOUBLE_INIT(name, def)  m_d##name(def)
#define GD_DOUBLE_CACHE(name)      m_d##name = getDefineDOUBLE(#name)
#define GD_DOUBLE_GET(name)        GC.get##name()
#endif

//Extra stuff Artificial Unintelligence
#define AUI_MODS_H
#define M_E			2.71828182845904523536
#define fM_E		2.718281828f		//!< e (float)
#define M_SQRT2		1.41421356237309504880
#define fM_SQRT2	1.414213562f		//!< sqrt(2) (float)
#define M_SQRT3		1.73205080756887729353
#define fM_SQRT3	1.732050808f		//!< sqrt(3) (float)
#define M_LN2		0.693147180559945309417
#define fM_LN2		0.6931471806f		//!< ln(2) (float)
#define M_GLDNRT	1.61803398874989484820
#define fM_GLDNRT	1.618033989f		//!< (1 + sqrt(5))/2 (float), aka The Golden Ratio

#ifdef AUI_FAST_COMP
// Avoids Visual Studio's compiler from generating inefficient code
// FastMax() and FastMin() taken from https://randomascii.wordpress.com/2013/11/24/stdmin-causing-three-times-slowdown-on-vc/
template<class T> inline T FastMax(const T& _Left, const T& _Right) { return (_DEBUG_LT(_Left, _Right) ? _Right : _Left); }
template<class T> inline T FastMin(const T& _Left, const T& _Right) { return (_DEBUG_LT(_Right, _Left) ? _Right : _Left); }
#define FASTMAX(a, b) FastMax(a, b)
#define FASTMIN(a, b) FastMin(a, b)
#endif // AUI_FAST_COMP

#endif