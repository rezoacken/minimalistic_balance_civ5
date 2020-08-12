/*	-------------------------------------------------------------------------------------------------------
	� 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */
#include "CvGameCoreDLLPCH.h"
#include "ICvDLLUserInterface.h"
#include "CvGameCoreUtils.h"
#include "CvCitySpecializationAI.h"
#include "CvEconomicAI.h"
#include "CvGrandStrategyAI.h"
#include "CvDllInterfaces.h"
#include "CvInfosSerializationHelper.h"
#include "cvStopWatch.h"

// must be included after all other headers
#include "LintFree.h"


//=====================================
// CvCityCitizens
//=====================================

/// Constructor
CvCityCitizens::CvCityCitizens()
{
	m_aiSpecialistCounts = NULL;
	m_aiSpecialistGreatPersonProgressTimes100 = NULL;
	m_aiNumSpecialistsInBuilding = NULL;
	m_aiNumForcedSpecialistsInBuilding = NULL;
	m_piBuildingGreatPeopleRateChanges = NULL;
}

/// Destructor
CvCityCitizens::~CvCityCitizens()
{
	Uninit();
}

/// Initialize
void CvCityCitizens::Init(CvCity* pCity)
{
	m_pCity = pCity;

	// Clear variables
	Reset();

	m_bInited = true;
}

/// Deallocate memory created in initialize
void CvCityCitizens::Uninit()
{
	if(m_bInited)
	{
		SAFE_DELETE_ARRAY(m_aiSpecialistCounts);
		SAFE_DELETE_ARRAY(m_aiSpecialistGreatPersonProgressTimes100);
		SAFE_DELETE_ARRAY(m_aiNumSpecialistsInBuilding);
		SAFE_DELETE_ARRAY(m_aiNumForcedSpecialistsInBuilding);
		SAFE_DELETE_ARRAY(m_piBuildingGreatPeopleRateChanges);
	}
	m_bInited = false;
}

/// Reset member variables
void CvCityCitizens::Reset()
{
	m_bAutomated = false;
	m_bNoAutoAssignSpecialists = false;
	m_iNumUnassignedCitizens = 0;
	m_iNumCitizensWorkingPlots = 0;
	m_iNumForcedWorkingPlots = 0;

	m_eCityAIFocusTypes = NO_CITY_AI_FOCUS_TYPE;

	int iI;

	CvAssertMsg((0 < NUM_CITY_PLOTS),  "NUM_CITY_PLOTS is not greater than zero but an array is being allocated in CvCityCitizens::reset");
	for(iI = 0; iI < NUM_CITY_PLOTS; iI++)
	{
		m_pabWorkingPlot[iI] = false;
		m_pabForcedWorkingPlot[iI] = false;
	}

	m_iNumDefaultSpecialists = 0;
	m_iNumForcedDefaultSpecialists = 0;

	CvAssertMsg(m_aiSpecialistCounts==NULL, "about to leak memory, CvCityCitizens::m_aiSpecialistCounts");
	m_aiSpecialistCounts = FNEW(int[GC.getNumSpecialistInfos()], c_eCiv5GameplayDLL, 0);
	for(iI = 0; iI < GC.getNumSpecialistInfos(); iI++)
	{
		m_aiSpecialistCounts[iI] = 0;
	}

	CvAssertMsg(m_aiSpecialistGreatPersonProgressTimes100==NULL, "about to leak memory, CvCityCitizens::m_aiSpecialistGreatPersonProgressTimes100");
	m_aiSpecialistGreatPersonProgressTimes100 = FNEW(int[GC.getNumSpecialistInfos()], c_eCiv5GameplayDLL, 0);
	for(iI = 0; iI < GC.getNumSpecialistInfos(); iI++)
	{
		m_aiSpecialistGreatPersonProgressTimes100[iI] = 0;
	}

	CvAssertMsg(m_aiNumSpecialistsInBuilding==NULL, "about to leak memory, CvCityCitizens::m_aiNumSpecialistsInBuilding");
	m_aiNumSpecialistsInBuilding = FNEW(int[GC.getNumBuildingInfos()], c_eCiv5GameplayDLL, 0);
	for(iI = 0; iI < GC.getNumBuildingInfos(); iI++)
	{
		m_aiNumSpecialistsInBuilding[iI] = 0;
	}

	CvAssertMsg(m_aiNumForcedSpecialistsInBuilding==NULL, "about to leak memory, CvCityCitizens::m_aiNumForcedSpecialistsInBuilding");
	m_aiNumForcedSpecialistsInBuilding = FNEW(int[GC.getNumBuildingInfos()], c_eCiv5GameplayDLL, 0);
	for(iI = 0; iI < GC.getNumBuildingInfos(); iI++)
	{
		m_aiNumForcedSpecialistsInBuilding[iI] = 0;
	}

	CvAssertMsg(m_piBuildingGreatPeopleRateChanges==NULL, "about to leak memory, CvCityCitizens::m_piBuildingGreatPeopleRateChanges");
	m_piBuildingGreatPeopleRateChanges = FNEW(int[GC.getNumSpecialistInfos()], c_eCiv5GameplayDLL, 0);
	for(iI = 0; iI < GC.getNumSpecialistInfos(); iI++)
	{
		m_piBuildingGreatPeopleRateChanges[iI] = 0;
	}

	m_bForceAvoidGrowth = false;
}

/// Serialization read
void CvCityCitizens::Read(FDataStream& kStream)
{
	// Version number to maintain backwards compatibility
	uint uiVersion;
	kStream >> uiVersion;

	kStream >> m_bAutomated;
	kStream >> m_bNoAutoAssignSpecialists;
	kStream >> m_iNumUnassignedCitizens;
	kStream >> m_iNumCitizensWorkingPlots;
	kStream >> m_iNumForcedWorkingPlots;

	kStream >> m_eCityAIFocusTypes;

	kStream >> 	m_bForceAvoidGrowth;

	kStream >> m_pabWorkingPlot;
	kStream >> m_pabForcedWorkingPlot;

	kStream >> m_iNumDefaultSpecialists;
	kStream >> m_iNumForcedDefaultSpecialists;

	CvInfosSerializationHelper::ReadHashedDataArray(kStream, m_aiSpecialistCounts, GC.getNumSpecialistInfos());
	CvInfosSerializationHelper::ReadHashedDataArray(kStream, m_aiSpecialistGreatPersonProgressTimes100, GC.getNumSpecialistInfos());

	BuildingArrayHelpers::Read(kStream, m_aiNumSpecialistsInBuilding);
	BuildingArrayHelpers::Read(kStream, m_aiNumForcedSpecialistsInBuilding);

	CvInfosSerializationHelper::ReadHashedDataArray(kStream, m_piBuildingGreatPeopleRateChanges, GC.getNumSpecialistInfos());
}

/// Serialization write
void CvCityCitizens::Write(FDataStream& kStream)
{
	// Current version number
	uint uiVersion = 1;
	kStream << uiVersion;

	kStream << m_bAutomated;
	kStream << m_bNoAutoAssignSpecialists;
	kStream << m_iNumUnassignedCitizens;
	kStream << m_iNumCitizensWorkingPlots;
	kStream << m_iNumForcedWorkingPlots;

	kStream << m_eCityAIFocusTypes;

	kStream << 	m_bForceAvoidGrowth;

	kStream << m_pabWorkingPlot;
	kStream << m_pabForcedWorkingPlot;

	kStream << m_iNumDefaultSpecialists;
	kStream << m_iNumForcedDefaultSpecialists;

	CvInfosSerializationHelper::WriteHashedDataArray<SpecialistTypes, int>(kStream, m_aiSpecialistCounts, GC.getNumSpecialistInfos());
	CvInfosSerializationHelper::WriteHashedDataArray<SpecialistTypes, int>(kStream, m_aiSpecialistGreatPersonProgressTimes100, GC.getNumSpecialistInfos());

	BuildingArrayHelpers::Write(kStream, m_aiNumSpecialistsInBuilding, GC.getNumBuildingInfos());
	BuildingArrayHelpers::Write(kStream, m_aiNumForcedSpecialistsInBuilding, GC.getNumBuildingInfos());

	CvInfosSerializationHelper::WriteHashedDataArray<SpecialistTypes, int>(kStream, m_piBuildingGreatPeopleRateChanges, GC.getNumSpecialistInfos());
}

/// Returns the City object this set of Citizens is associated with
CvCity* CvCityCitizens::GetCity()
{
	return m_pCity;
}

/// Returns the Player object this City belongs to
CvPlayer* CvCityCitizens::GetPlayer()
{
	return &GET_PLAYER(GetOwner());
}

/// Helper function to return Player owner of our City
PlayerTypes CvCityCitizens::GetOwner() const
{
	return m_pCity->getOwner();
}

/// Helper function to return Team owner of our City
TeamTypes CvCityCitizens::GetTeam() const
{
	return m_pCity->getTeam();
}

/// What happens when a City is first founded?
void CvCityCitizens::DoFoundCity()
{
	// always work the home plot (center)
	CvPlot* pHomePlot = GetCityPlotFromIndex(CITY_HOME_PLOT);
	if(pHomePlot != NULL)
	{
		bool bWorkPlot = IsCanWork(pHomePlot);
		SetWorkingPlot(pHomePlot, bWorkPlot, /*bUseUnassignedPool*/ false);
	}
}

/// Processed every turn
void CvCityCitizens::DoTurn()
{
	AI_PERF_FORMAT("City-AI-perf.csv", ("CvCityCitizens::DoTurn, Turn %03d, %s, %s", GC.getGame().getElapsedGameTurns(), m_pCity->GetPlayer()->getCivilizationShortDescription(), m_pCity->getName().c_str()) );
	DoVerifyWorkingPlots();

	CvPlayerAI& thisPlayer = GET_PLAYER(GetOwner());

	if(m_pCity->IsPuppet())
	{
		SetFocusType(CITY_AI_FOCUS_TYPE_GOLD);
		SetNoAutoAssignSpecialists(false);
		SetForcedAvoidGrowth(false);
		int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
		if(iExcessFoodTimes100 < 0)
		{
			SetFocusType(NO_CITY_AI_FOCUS_TYPE);
			//SetNoAutoAssignSpecialists(true);
			SetForcedAvoidGrowth(false);
		}
	}
	else if(!thisPlayer.isHuman())
	{
		CitySpecializationTypes eWonderSpecializationType = thisPlayer.GetCitySpecializationAI()->GetWonderSpecialization();

		if(GC.getGame().getGameTurn() % 8 == 0)
		{
			SetFocusType(CITY_AI_FOCUS_TYPE_GOLD_GROWTH);
			SetNoAutoAssignSpecialists(true);
			SetForcedAvoidGrowth(false);
			int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
			if(iExcessFoodTimes100 < 200)
			{
				SetFocusType(NO_CITY_AI_FOCUS_TYPE);
				//SetNoAutoAssignSpecialists(true);
			}
		}
		if(m_pCity->isCapital() && !thisPlayer.isMinorCiv() && m_pCity->GetCityStrategyAI()->GetSpecialization() != eWonderSpecializationType)
		{
			SetFocusType(NO_CITY_AI_FOCUS_TYPE);
			SetNoAutoAssignSpecialists(false);
			SetForcedAvoidGrowth(false);
			int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
			if(iExcessFoodTimes100 < 400)
			{
				SetFocusType(CITY_AI_FOCUS_TYPE_FOOD);
				//SetNoAutoAssignSpecialists(true);
			}
		}
		else if(m_pCity->GetCityStrategyAI()->GetSpecialization() == eWonderSpecializationType)
		{
			SetFocusType(CITY_AI_FOCUS_TYPE_PRODUCTION);
			SetNoAutoAssignSpecialists(false);
			//SetForcedAvoidGrowth(true);
			int iExcessFoodTimes100;// = m_pCity->getYieldRateTimes100(YIELD_FOOD) - (m_pCity->foodConsumption() * 100);
			//if (iExcessFoodTimes100 < 200)
			//{
			SetForcedAvoidGrowth(false);
			//}
			iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
			if(iExcessFoodTimes100 < 200)
			{
				SetFocusType(CITY_AI_FOCUS_TYPE_PROD_GROWTH);
				//SetNoAutoAssignSpecialists(true);
				SetForcedAvoidGrowth(false);
			}
			iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
			if(iExcessFoodTimes100 < 200)
			{
				SetFocusType(NO_CITY_AI_FOCUS_TYPE);
				//SetNoAutoAssignSpecialists(true);
				SetForcedAvoidGrowth(false);
			}
		}
		else if(m_pCity->getPopulation() < 5)  // we want a balanced growth
		{
			SetFocusType(NO_CITY_AI_FOCUS_TYPE);
			//SetNoAutoAssignSpecialists(true);
			SetForcedAvoidGrowth(false);
		}
		else
		{
			// Are we running at a deficit?
			EconomicAIStrategyTypes eStrategyLosingMoney = (EconomicAIStrategyTypes) GC.getInfoTypeForString("ECONOMICAISTRATEGY_LOSING_MONEY", true);
			bool bInDeficit = false;
			if (eStrategyLosingMoney != NO_ECONOMICAISTRATEGY)
			{
				bInDeficit = thisPlayer.GetEconomicAI()->IsUsingStrategy(eStrategyLosingMoney);
			}

			if(bInDeficit)
			{
				SetFocusType(CITY_AI_FOCUS_TYPE_GOLD_GROWTH);
				SetNoAutoAssignSpecialists(false);
				SetForcedAvoidGrowth(false);
				int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
				if(iExcessFoodTimes100 < 200)
				{
					SetFocusType(NO_CITY_AI_FOCUS_TYPE);
					//SetNoAutoAssignSpecialists(true);
				}
			}
			else if(GC.getGame().getGameTurn() % 3 == 0 && thisPlayer.GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes) GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"))
			{
				SetFocusType(CITY_AI_FOCUS_TYPE_CULTURE);
				SetNoAutoAssignSpecialists(true);
				SetForcedAvoidGrowth(false);
				int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);
				if(iExcessFoodTimes100 < 200)
				{
					SetFocusType(NO_CITY_AI_FOCUS_TYPE);
					//SetNoAutoAssignSpecialists(true);
				}
			}
			else // we aren't a small city, building a wonder, or going broke
			{
				SetNoAutoAssignSpecialists(false);
				SetForcedAvoidGrowth(false);
				CitySpecializationTypes eSpecialization = m_pCity->GetCityStrategyAI()->GetSpecialization();
				if(eSpecialization != -1)
				{
					CvCitySpecializationXMLEntry* pCitySpecializationEntry =  GC.getCitySpecializationInfo(eSpecialization);
					if(pCitySpecializationEntry)
					{
						YieldTypes eYield = pCitySpecializationEntry->GetYieldType();
						if(eYield == YIELD_FOOD)
						{
							SetFocusType(CITY_AI_FOCUS_TYPE_FOOD);
						}
						else if(eYield == YIELD_PRODUCTION)
						{
							SetFocusType(CITY_AI_FOCUS_TYPE_PROD_GROWTH);
						}
						else if(eYield == YIELD_GOLD)
						{
							SetFocusType(CITY_AI_FOCUS_TYPE_GOLD);
						}
						else if(eYield == YIELD_SCIENCE)
						{
							SetFocusType(CITY_AI_FOCUS_TYPE_SCIENCE);
						}
						else
						{
							SetFocusType(NO_CITY_AI_FOCUS_TYPE);
						}
					}
					else
					{
						SetFocusType(NO_CITY_AI_FOCUS_TYPE);
					}
				}
				else
				{
					SetFocusType(NO_CITY_AI_FOCUS_TYPE);
				}
			}
		}
#ifdef AUI_CITIZENS_DO_TURN_NO_FOOD_FOCUS_IF_UNHAPPY
		if (thisPlayer.IsEmpireUnhappy())
		{
			CityAIFocusTypes eCurrentFocus = GetFocusType();
			if (eCurrentFocus == CITY_AI_FOCUS_TYPE_FOOD)
				SetFocusType(NO_CITY_AI_FOCUS_TYPE);
			else if (eCurrentFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
				SetFocusType(CITY_AI_FOCUS_TYPE_PRODUCTION);
			else if (eCurrentFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
				SetFocusType(CITY_AI_FOCUS_TYPE_GOLD);
		}
#endif // AUI_CITIZENS_DO_TURN_NO_FOOD_FOCUS_IF_UNHAPPY
	}

	CvAssertMsg((GetNumCitizensWorkingPlots() + GetTotalSpecialistCount() + GetNumUnassignedCitizens()) <= GetCity()->getPopulation(), "Gameplay: More workers than population in the city.");
	DoReallocateCitizens();
	CvAssertMsg((GetNumCitizensWorkingPlots() + GetTotalSpecialistCount() + GetNumUnassignedCitizens()) <= GetCity()->getPopulation(), "Gameplay: More workers than population in the city.");
	DoSpecialists();

	CvAssertMsg((GetNumCitizensWorkingPlots() + GetTotalSpecialistCount() + GetNumUnassignedCitizens()) <= GetCity()->getPopulation(), "Gameplay: More workers than population in the city.");
}

/// What is the overall value of the current Plot?
int CvCityCitizens::GetPlotValue(CvPlot* pPlot, bool bUseAllowGrowthFlag)
{
	int iValue = 0;

	// Yield Values
	int iFoodYieldValue = (/*12*/ GC.getAI_CITIZEN_VALUE_FOOD() * pPlot->getYield(YIELD_FOOD));
	int iProductionYieldValue = (/*8*/ GC.getAI_CITIZEN_VALUE_PRODUCTION() * pPlot->getYield(YIELD_PRODUCTION));
	int iGoldYieldValue = (/*10*/ GC.getAI_CITIZEN_VALUE_GOLD() * pPlot->getYield(YIELD_GOLD));
	int iScienceYieldValue = (/*6*/ GC.getAI_CITIZEN_VALUE_SCIENCE() * pPlot->getYield(YIELD_SCIENCE));
	int iCultureYieldValue = (GC.getAI_CITIZEN_VALUE_CULTURE() * pPlot->getYield(YIELD_CULTURE));
	int iFaithYieldValue = (GC.getAI_CITIZEN_VALUE_FAITH() * pPlot->getYield(YIELD_FAITH));

	// How much surplus food are we making?
	int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);

	bool bAvoidGrowth = IsAvoidGrowth();

	// City Focus
	CityAIFocusTypes eFocus = GetFocusType();
#ifdef AMB_AI_SPECIALIST_FOCUS
	if(GET_PLAYER(GetOwner()).isHuman())
	{
		if(eFocus == CITY_AI_FOCUS_TYPE_FOOD)
			iFoodYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_PRODUCTION)
			iProductionYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD)
			iGoldYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_SCIENCE)
			iScienceYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_CULTURE)
			iCultureYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
		{
			iFoodYieldValue *= 2;
			iGoldYieldValue *= 2;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
		{
			iFoodYieldValue *= 2;
			iProductionYieldValue *= 2;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_FAITH)
		{
		iFaithYieldValue *= 3;
		}

		// Food can be worth less if we don't want to grow
		if(bUseAllowGrowthFlag && iExcessFoodTimes100 >= 0 && bAvoidGrowth)
		{
			// If we at least have enough Food to feed everyone, zero out the value of additional food
			iFoodYieldValue = 0;
		}
		// We want to grow here
		else
		{
			// If we have a non-default and non-food focus, only worry about getting to 0 food
			if(eFocus != NO_CITY_AI_FOCUS_TYPE && eFocus != CITY_AI_FOCUS_TYPE_FOOD && eFocus != CITY_AI_FOCUS_TYPE_PROD_GROWTH && eFocus != CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
			{
				int iFoodT100NeededFor0 = -iExcessFoodTimes100;

				if(iFoodT100NeededFor0 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else
				{
					iFoodYieldValue /= 2;
				}
			}
			// If our surplus is not at least 2, really emphasize food plots
			else if(!bAvoidGrowth)
			{
				int iFoodT100NeededFor2 = 200 - iExcessFoodTimes100;
				if(iFoodT100NeededFor2 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else if (eFocus != CITY_AI_FOCUS_TYPE_FOOD)
				{
					iFoodYieldValue /= 2;
				}
			}
		}
	}
	else
	{
		if(eFocus == CITY_AI_FOCUS_TYPE_FOOD)
		{
			iFoodYieldValue *= 4;
			iFoodYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_PRODUCTION)
		{
			iProductionYieldValue *= 4;
			iProductionYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD)
		{
			iGoldYieldValue *= 4;
			iGoldYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_SCIENCE)
		{
			iScienceYieldValue *= 4;
			iScienceYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_CULTURE)
		{
			iCultureYieldValue *= 4;
			iCultureYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
		{
			iFoodYieldValue *= 6;
			iFoodYieldValue /= 5;
			iGoldYieldValue *= 6;
			iGoldYieldValue /= 5;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
		{
			iFoodYieldValue *= 6;
			iFoodYieldValue /= 5;
			iProductionYieldValue *= 6;
			iProductionYieldValue /= 5;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_FAITH)
		{
			iFaithYieldValue *= 3;
		}
		// Food can be worth less if we don't want to grow
		if(bUseAllowGrowthFlag && iExcessFoodTimes100 >= 0 && bAvoidGrowth)
		{
			// If we at least have enough Food to feed everyone, zero out the value of additional food
			iFoodYieldValue = 0;
		}
		// We want to grow here
		else
		{
			// If we have a non-default and non-food focus, only worry about getting to 0 food
			if(bAvoidGrowth) //no stagnation on other focus
			{
				int iFoodT100NeededFor0 = -iExcessFoodTimes100;

				if(iFoodT100NeededFor0 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else
				{
					iFoodYieldValue /= 2;
				}
			}
			// If our surplus is not at least 2, really emphasize food plots
			else if(!bAvoidGrowth)
			{
				int iFoodT100NeededFor2 = 200 - iExcessFoodTimes100;
				if(iFoodT100NeededFor2 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else if (eFocus != CITY_AI_FOCUS_TYPE_FOOD)
				{
					iFoodYieldValue /= 2;
				}
			}
		}
	}
#else
	if(eFocus == CITY_AI_FOCUS_TYPE_FOOD)
		iFoodYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_PRODUCTION)
		iProductionYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD)
		iGoldYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_SCIENCE)
		iScienceYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_CULTURE)
		iCultureYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
	{
		iFoodYieldValue *= 2;
		iGoldYieldValue *= 2;
	}
	else if(eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
	{
		iFoodYieldValue *= 2;
		iProductionYieldValue *= 2;
	}
	else if(eFocus == CITY_AI_FOCUS_TYPE_FAITH)
	{
	iFaithYieldValue *= 3;
	}

	// Food can be worth less if we don't want to grow
	if(bUseAllowGrowthFlag && iExcessFoodTimes100 >= 0 && bAvoidGrowth)
	{
		// If we at least have enough Food to feed everyone, zero out the value of additional food
		iFoodYieldValue = 0;
	}
	// We want to grow here
	else
	{
		// If we have a non-default and non-food focus, only worry about getting to 0 food
		if(eFocus != NO_CITY_AI_FOCUS_TYPE && eFocus != CITY_AI_FOCUS_TYPE_FOOD && eFocus != CITY_AI_FOCUS_TYPE_PROD_GROWTH && eFocus != CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
		{
			int iFoodT100NeededFor0 = -iExcessFoodTimes100;

			if(iFoodT100NeededFor0 > 0)
			{
				iFoodYieldValue *= 8;
			}
			else
			{
				iFoodYieldValue /= 2;
			}
		}
		// If our surplus is not at least 2, really emphasize food plots
		else if(!bAvoidGrowth)
		{
			int iFoodT100NeededFor2 = 200 - iExcessFoodTimes100;
			if(iFoodT100NeededFor2 > 0)
			{
				iFoodYieldValue *= 8;
			}
			else if (eFocus != CITY_AI_FOCUS_TYPE_FOOD)
			{
				iFoodYieldValue /= 2;
			}
		}
	}
#endif
	if((eFocus == NO_CITY_AI_FOCUS_TYPE || eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH || eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH) && !bAvoidGrowth && m_pCity->getPopulation() < 5)
	{
		iFoodYieldValue *= 4;
	}

	iValue += iFoodYieldValue;
	iValue += iProductionYieldValue;
	iValue += iGoldYieldValue;
	iValue += iScienceYieldValue;
	iValue += iCultureYieldValue;
	iValue += iFaithYieldValue;

	return iValue;
}

/// Are this City's Citizens under automation?
bool CvCityCitizens::IsAutomated() const
{
	return m_bAutomated;
}

/// Sets this City's Citizens to be under automation
void CvCityCitizens::SetAutomated(bool bValue)
{
	m_bAutomated = bValue;
}

/// Are this City's Specialists under automation?
bool CvCityCitizens::IsNoAutoAssignSpecialists() const
{
	return m_bNoAutoAssignSpecialists;
}

/// Sets this City's Specialists to be under automation
void CvCityCitizens::SetNoAutoAssignSpecialists(bool bValue)
{
	if(m_bNoAutoAssignSpecialists != bValue)
	{
		m_bNoAutoAssignSpecialists = bValue;

		// If we're giving the AI control clear all manually assigned Specialists
		if(!bValue)
		{
			DoClearForcedSpecialists();
		}

		DoReallocateCitizens();
	}
}

/// Is this City avoiding growth?
bool CvCityCitizens::IsAvoidGrowth()
{
	if(GC.getGame().isOption(GAMEOPTION_NO_HAPPINESS))
	{
		return false;
	}

	if(GetPlayer()->GetExcessHappiness() < 0)
	{
		return true;
	}

	return IsForcedAvoidGrowth();
}

bool CvCityCitizens::IsForcedAvoidGrowth()
{
	return m_bForceAvoidGrowth;
}

void CvCityCitizens::SetForcedAvoidGrowth(bool bAvoidGrowth)
{
	if(m_bForceAvoidGrowth != bAvoidGrowth)
	{
		m_bForceAvoidGrowth = bAvoidGrowth;
		DoReallocateCitizens();
	}
}

/// What is this city focusing on?
CityAIFocusTypes CvCityCitizens::GetFocusType() const
{
	return m_eCityAIFocusTypes;
}

/// What is this city focusing on?
void CvCityCitizens::SetFocusType(CityAIFocusTypes eFocus)
{
	FAssert(eFocus >= NO_CITY_AI_FOCUS_TYPE);
	FAssert(eFocus < NUM_CITY_AI_FOCUS_TYPES);

	if(eFocus != m_eCityAIFocusTypes)
	{
		m_eCityAIFocusTypes = eFocus;
		// Reallocate with our new focus
		DoReallocateCitizens();
	}
}

/// Does the AI want a Specialist?
bool CvCityCitizens::IsAIWantSpecialistRightNow()
{
	int iWeight = 100;

	// If the City is Size 1 or 2 then we probably don't want Specialists
	if(m_pCity->getPopulation() < 3)
	{
		iWeight /= 2;
	}

	int iFoodPerTurn = m_pCity->getYieldRate(YIELD_FOOD, false);
	int iFoodEatenPerTurn = m_pCity->foodConsumption();
	int iSurplusFood = iFoodPerTurn - iFoodEatenPerTurn;

	CityAIFocusTypes eFocusType = GetFocusType();

	// Don't want specialists until we've met our food needs
	if(iSurplusFood < 0)
	{
		return false;
	}
	else if(IsAvoidGrowth() && (eFocusType == NO_CITY_AI_FOCUS_TYPE || eFocusType == CITY_AI_FOCUS_TYPE_GREAT_PEOPLE))
	{
		iWeight *= 2;
	}
	else if(iSurplusFood <= 2)
	{
		iWeight /= 2;
	}
	else if(iSurplusFood > 2)
	{
		if(eFocusType == NO_CITY_AI_FOCUS_TYPE || eFocusType == CITY_AI_FOCUS_TYPE_GREAT_PEOPLE || eFocusType == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
		{
			iWeight *= 100 + (20 * (iSurplusFood - 4));
			iWeight /= 100;
		}
	}

	// If we're deficient in Production then we're less likely to want Specialists
	if(m_pCity->GetCityStrategyAI()->IsYieldDeficient(YIELD_PRODUCTION))
	{
		iWeight *= 50;
		iWeight /= 100;
	}
	// if we've got some slackers in town (since they provide Production)
	else if(GetNumDefaultSpecialists() > 0 && eFocusType != CITY_AI_FOCUS_TYPE_PRODUCTION && eFocusType != CITY_AI_FOCUS_TYPE_PROD_GROWTH)
	{
		iWeight *= 150;
		iWeight /= 100;
	}

	// Someone told this AI it should be focused on something that is usually gotten from specialists
	if(eFocusType == CITY_AI_FOCUS_TYPE_GREAT_PEOPLE)
	{
		// Loop through all Buildings
		BuildingTypes eBuilding;
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			eBuilding = (BuildingTypes) iBuildingLoop;

			// Have this Building in the City?
			if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
			{
				// Can't add more than the max
				if(IsCanAddSpecialistToBuilding(eBuilding))
				{
					iWeight *= 3;
					break;
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_CULTURE)
	{
		// Loop through all Buildings
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			const BuildingTypes eBuilding = static_cast<BuildingTypes>(iBuildingLoop);
			CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
			if(pkBuildingInfo)
			{
				// Have this Building in the City?
				if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
				{
					// Can't add more than the max
					if(IsCanAddSpecialistToBuilding(eBuilding))
					{
						const SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
						CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
						if(pSpecialistInfo && pSpecialistInfo->getCulturePerTurn() > 0)
						{
							iWeight *= 3;
							break;
						}
					}
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_SCIENCE)
	{
		// Loop through all Buildings
		BuildingTypes eBuilding;
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			eBuilding = (BuildingTypes) iBuildingLoop;

			// Have this Building in the City?
			if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
			{
				// Can't add more than the max
				if(IsCanAddSpecialistToBuilding(eBuilding))
				{
					SpecialistTypes eSpecialist = (SpecialistTypes) GC.getBuildingInfo(eBuilding)->GetSpecialistType();
					CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
					if(pSpecialistInfo && pSpecialistInfo->getYieldChange(YIELD_SCIENCE) > 0)
					{
						iWeight *= 3;
					}

					if(GetPlayer()->getSpecialistExtraYield(YIELD_SCIENCE) > 0)
					{
						iWeight *= 3;
					}

					if(GetPlayer()->GetPlayerTraits()->GetSpecialistYieldChange(eSpecialist, YIELD_SCIENCE) > 0)
					{
						iWeight *= 3;
					}
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_PRODUCTION)
	{
		// Loop through all Buildings
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			const BuildingTypes eBuilding = static_cast<BuildingTypes>(iBuildingLoop);
			CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
			if(pkBuildingInfo)
			{
				// Have this Building in the City?
				if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
				{
					// Can't add more than the max
					if(IsCanAddSpecialistToBuilding(eBuilding))
					{
						SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
						CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
						if(NULL != pSpecialistInfo && pSpecialistInfo->getYieldChange(YIELD_PRODUCTION) > 0)
						{
							iWeight *= 150;
							iWeight /= 100;
						}

						if(GetPlayer()->getSpecialistExtraYield(YIELD_PRODUCTION) > 0)
						{
							iWeight *= 2;
						}

						if(GetPlayer()->GetPlayerTraits()->GetSpecialistYieldChange(eSpecialist, YIELD_PRODUCTION) > 0)
						{
							iWeight *= 2;
						}
					}
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_GOLD)
	{
		// Loop through all Buildings
		BuildingTypes eBuilding;
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			eBuilding = (BuildingTypes) iBuildingLoop;

			// Have this Building in the City?
			if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
			{
				// Can't add more than the max
				if(IsCanAddSpecialistToBuilding(eBuilding))
				{
					SpecialistTypes eSpecialist = (SpecialistTypes) GC.getBuildingInfo(eBuilding)->GetSpecialistType();
					CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
					if(pSpecialistInfo && pSpecialistInfo->getYieldChange(YIELD_GOLD) > 0)
					{
						iWeight *= 150;
						iWeight /= 100;
						break;
					}
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_FOOD)
	{
		iWeight *= 50;
		iWeight /= 100;
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
	{
		// Loop through all Buildings
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			const BuildingTypes eBuilding = static_cast<BuildingTypes>(iBuildingLoop);
			CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
			if(pkBuildingInfo)
			{
				// Have this Building in the City?
				if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
				{
					// Can't add more than the max
					if(IsCanAddSpecialistToBuilding(eBuilding))
					{
						SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
						CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
						if(pSpecialistInfo && pSpecialistInfo->getYieldChange(YIELD_PRODUCTION) > 0)
						{
							iWeight *= 150;
							iWeight /= 100;
							break;
						}
					}
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
	{
		// Loop through all Buildings
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			const BuildingTypes eBuilding = static_cast<BuildingTypes>(iBuildingLoop);
			CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
			if(pkBuildingInfo)
			{
				// Have this Building in the City?
				if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
				{
					// Can't add more than the max
					if(IsCanAddSpecialistToBuilding(eBuilding))
					{
						SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
						CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
						if(pSpecialistInfo && pSpecialistInfo->getYieldChange(YIELD_GOLD) > 0)
						{
							iWeight *= 150;
							iWeight /= 100;
						}

						if(GetPlayer()->getSpecialistExtraYield(YIELD_GOLD) > 0)
						{
							iWeight *= 2;
						}

						if(GetPlayer()->GetPlayerTraits()->GetSpecialistYieldChange(eSpecialist, YIELD_GOLD) > 0)
						{
							iWeight *= 2;
						}
					}
				}
			}
		}
	}
	else if(eFocusType == CITY_AI_FOCUS_TYPE_FAITH)
	{
		// Loop through all Buildings
		for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
		{
			const BuildingTypes eBuilding = (BuildingTypes) iBuildingLoop;
			CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
			if(pkBuildingInfo)
			{
				// Have this Building in the City?
				if(m_pCity->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
				{
					// Can't add more than the max
					if(IsCanAddSpecialistToBuilding(eBuilding))
					{
						const SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
						CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
						if(pSpecialistInfo && pSpecialistInfo->getYieldChange(YIELD_FAITH) > 0)
						{
							iWeight *= 3;
							break;
						}
					}
				}
			}
		}
	}

	// specialists are cheaper somehow
	if (m_pCity->GetPlayer()->isHalfSpecialistUnhappiness() || m_pCity->GetPlayer()->isHalfSpecialistFood())
	{
		iWeight *= 150;
		iWeight /= 100;
	}

	// Does the AI want it enough?
	if(iWeight >= 150)
	{
		return true;
	}

	return false;
}

/// What is the Building Type the AI likes the Specialist of most right now?
BuildingTypes CvCityCitizens::GetAIBestSpecialistBuilding(int& iSpecialistValue)
{
	BuildingTypes eBestBuilding = NO_BUILDING;
	int iBestSpecialistValue = -1;
	int iBestUnmodifiedSpecialistValue = -1;

	SpecialistTypes eSpecialist;
	int iValue;

	// Loop through all Buildings
	for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
	{
		const BuildingTypes eBuilding = static_cast<BuildingTypes>(iBuildingLoop);
		CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);

		if(pkBuildingInfo)
		{
			// Have this Building in the City?
			if(GetCity()->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
			{
				// Can't add more than the max
				if(IsCanAddSpecialistToBuilding(eBuilding))
				{
					eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();

					iValue = GetSpecialistValue(eSpecialist);

					// Add a bit more weight to a Building if it has more slots (10% per).  This will bias the AI to fill a single building over spreading Specialists out
					int iTemp = ((GetNumSpecialistsAllowedByBuilding(*pkBuildingInfo) - 1) * iValue * 10);
					iTemp /= 100;
					iValue += iTemp;

					if(iValue > iBestSpecialistValue)
					{
						eBestBuilding = eBuilding;
						iBestSpecialistValue = iValue;
						iBestUnmodifiedSpecialistValue = iValue - iTemp;
					}
				}
			}
		}
	}

	iSpecialistValue = iBestUnmodifiedSpecialistValue;
	return eBestBuilding;
}

/// How valuable is eSpecialist?
int CvCityCitizens::GetSpecialistValue(SpecialistTypes eSpecialist)
{

	CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
	if (pSpecialistInfo == NULL)
	{
		//This function should NEVER be called with an invalid specialist info type.
		CvAssert(pSpecialistInfo);
		return 0;
	}

	int iValue = 0;

	CvPlayer* pPlayer = m_pCity->GetPlayer();

	// factor in the fact that specialists may need less food
#ifdef AUI_CITIZENS_FIX_SPECIALIST_VALUE_HALF_FOOD_CONSUMPTION
	int iFoodConsumptionBonus = (pPlayer->isHalfSpecialistFood()) ? GC.getFOOD_CONSUMPTION_PER_POPULATION() / 2 : 0;
#else
	int iFoodConsumptionBonus = (pPlayer->isHalfSpecialistFood()) ? 1 : 0;
#endif // AUI_CITIZENS_FIX_SPECIALIST_VALUE_HALF_FOOD_CONSUMPTION

	// Yield Values
	int iFoodYieldValue = (GC.getAI_CITIZEN_VALUE_FOOD() * (pPlayer->specialistYield(eSpecialist, YIELD_FOOD) + iFoodConsumptionBonus));
	int iProductionYieldValue = (GC.getAI_CITIZEN_VALUE_PRODUCTION() * pPlayer->specialistYield(eSpecialist, YIELD_PRODUCTION));
	int iGoldYieldValue = (GC.getAI_CITIZEN_VALUE_GOLD() * pPlayer->specialistYield(eSpecialist, YIELD_GOLD));
	int iScienceYieldValue = (GC.getAI_CITIZEN_VALUE_SCIENCE() * pPlayer->specialistYield(eSpecialist, YIELD_SCIENCE));
	int iCultureYieldValue = (GC.getAI_CITIZEN_VALUE_CULTURE() * m_pCity->GetCultureFromSpecialist(eSpecialist)); 
	int iFaithYieldValue = (GC.getAI_CITIZEN_VALUE_FAITH() * pPlayer->specialistYield(eSpecialist, YIELD_FAITH));
#if defined(MOD_API_UNIFIED_YIELDS_TOURISM)
	int iTourismYieldValue = (GC.getAI_CITIZEN_VALUE_CULTURE() * pPlayer->specialistYield(eSpecialist, YIELD_TOURISM));
#endif
#ifndef AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_GREAT_PERSON_POINTS
#ifdef AMB_AI_SPECIALIST_FOCUS
	int iGPPYieldValue = pSpecialistInfo->getGreatPeopleRateChange() * 5;
#else
	int iGPPYieldValue = pSpecialistInfo->getGreatPeopleRateChange() * 3; // TODO: un-hardcode this
#endif
#endif // AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_GREAT_PERSON_POINTS
#ifndef AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_HAPPINESS
	int iHappinessYieldValue = (m_pCity->GetPlayer()->isHalfSpecialistUnhappiness()) ? 5 : 0; // TODO: un-hardcode this
	iHappinessYieldValue = m_pCity->GetPlayer()->IsEmpireUnhappy() ? iHappinessYieldValue * 2 : iHappinessYieldValue; // TODO: un-hardcode this
#endif // AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_HAPPINESS

	// How much surplus food are we making?
	int iExcessFoodTimes100 = m_pCity->getYieldRateTimes100(YIELD_FOOD, false) - (m_pCity->foodConsumption() * 100);

#ifdef AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_GREAT_PERSON_POINTS
	int iGPPYieldValue = pSpecialistInfo->getGreatPeopleRateChange() * AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_GREAT_PERSON_POINTS;
	UnitClassTypes eGPUnitClass = (UnitClassTypes)pSpecialistInfo->getGreatPeopleUnitClass();
	if (eGPUnitClass != NO_UNITCLASS)
	{
		// Multiplier based on flavor
		double dFlavorMod = 1.0;
		// Doubles GPP value if the great person we'd generate is unique to our civ
		CvUnitClassInfo* pGPUnitClassInfo = GC.getUnitClassInfo(eGPUnitClass);
		if (pGPUnitClassInfo)
		{
			UnitTypes eGPUnitType = (UnitTypes)pPlayer->getCivilizationInfo().getCivilizationUnits(eGPUnitClass);
			UnitTypes eDefault = (UnitTypes)pGPUnitClassInfo->getDefaultUnitIndex();
			if (eGPUnitType != eDefault)
			{
				iGPPYieldValue *= 2;
				// Venice compensation (since their unique merchant is only special in that it can acquire minors, so the AI no longer wants minors, boost is deactivated)
				if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_MERCHANT", true) && GET_PLAYER(m_pCity->getOwner()).GreatMerchantWantsCash())
				{
					iGPPYieldValue /= 2;
				}
			}
			CvUnitEntry *pkGPEntry = GC.GetGameUnits()->GetEntry(eGPUnitType);
			if (pkGPEntry)
			{
				int iBestFlavor = 0;
				for (int iFlavorLoop = 0; iFlavorLoop < GC.getNumFlavorTypes(); iFlavorLoop++)
				{
					if (pkGPEntry->GetFlavorValue(iFlavorLoop) > 0)
					{
						iBestFlavor = MAX(iBestFlavor, pPlayer->GetGrandStrategyAI()->GetPersonalityAndGrandStrategy((FlavorTypes)iFlavorLoop));
					}
				}
				if (iBestFlavor > 0)
				{
					dFlavorMod += log10((double)iBestFlavor);
				}
				else
				{
					dFlavorMod += log10((double)GC.getDEFAULT_FLAVOR_VALUE());
				}
			}
		}
		// Tweaking based on actual GP bonues and penalties
		int iGPPModifier = pPlayer->getGreatPeopleRateModifier() + GetCity()->getGreatPeopleRateModifier();
		// Multiplier based on how many of this unit do we already have
		double dAlreadyHaveCountMod = 3.0;
		// Tweaking based on grand strategy (ranges from 1 to 2)
		double dGrandStrategyGPPMod = 1.0;
		if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_WRITER", true))
		{
			iGPPModifier += pPlayer->getGreatWriterRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_WRITER));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"));
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_ARTIST", true))
		{
			iGPPModifier += pPlayer->getGreatArtistRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_ARTIST));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"));
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_MUSICIAN", true))
		{
			iGPPModifier += pPlayer->getGreatMusicianRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_MUSICIAN));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"));
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_SCIENTIST", true))
		{
			iGPPModifier += pPlayer->getGreatScientistRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_SCIENTIST));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_SPACESHIP"));
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_SPACESHIP"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
#ifdef AUI_GS_SCIENCE_FLAVOR_BOOST
			if (pPlayer->GetGrandStrategyAI()->ScienceFlavorBoost() >= AUI_GS_SCIENCE_FLAVOR_BOOST)
				dGrandStrategyGPPMod *= 2;
#endif // AUI_GS_SCIENCE_FLAVOR_BOOST
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_MERCHANT", true))
		{
			iGPPModifier += pPlayer->getGreatMerchantRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_MERCHANT));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pow((1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE")))
				* (1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_UNITED_NATIONS")))
				* (1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_SPACESHIP")))
				* (1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CONQUEST"))) / 2.0, 1.0/3.0);
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_UNITED_NATIONS"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
			if (pPlayer->GetTreasury()->AverageIncome(1) < 0)
				dGrandStrategyGPPMod *= 2;
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_ENGINEER", true))
		{
			iGPPModifier += pPlayer->getGreatEngineerRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_ENGINEER));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pow((1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CULTURE")))
				* (1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_UNITED_NATIONS")))
				* (1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_SPACESHIP")))
				* (1.0 + pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CONQUEST"))) / 2.0, 1.0 / 3.0);
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_SPACESHIP"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_GREAT_GENERAL", true))
		{
			iGPPModifier += pPlayer->getGreatAdmiralRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_GENERAL));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CONQUEST"));
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CONQUEST"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
		}
		else if (eGPUnitClass == (UnitClassTypes)GC.getInfoTypeForString("UNITCLASS_GREAT_ADMIRAL", true))
		{
			iGPPModifier += pPlayer->getGreatGeneralRateModifier();
			dAlreadyHaveCountMod /= (dAlreadyHaveCountMod + pPlayer->GetNumUnitsWithUnitAI(UNITAI_ADMIRAL));
#ifdef AUI_GS_PRIORITY_RATIO
			dGrandStrategyGPPMod += pPlayer->GetGrandStrategyAI()->GetGrandStrategyPriorityRatio((AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CONQUEST"));
#else
			if (pPlayer->GetGrandStrategyAI()->GetActiveGrandStrategy() == (AIGrandStrategyTypes)GC.getInfoTypeForString("AIGRANDSTRATEGY_CONQUEST"))
			{
				fGrandStrategyGPPMod += 1.0f;
			}
#endif // AUI_GS_PRIORITY_RATIO
		}

		iGPPYieldValue = int(iGPPYieldValue * dGrandStrategyGPPMod * dAlreadyHaveCountMod * dFlavorMod * log(MAX(100.0 + iGPPModifier, 1.0)) / log(100.0) + 0.5);
	}
#endif // AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_GREAT_PERSON_POINTS
#ifdef AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_HAPPINESS
	int iHappinessYieldValue = 0;
	if (pPlayer->isHalfSpecialistUnhappiness())
	{
		iHappinessYieldValue = GC.getUNHAPPINESS_PER_POPULATION() * 50 * AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_HAPPINESS;
		if (pPlayer->GetCapitalUnhappinessMod() != 0 && m_pCity->isCapital())
		{
			iHappinessYieldValue *= 100;
			iHappinessYieldValue /= (100 + pPlayer->GetCapitalUnhappinessMod());
		}
		iHappinessYieldValue *= 100;
		iHappinessYieldValue /= (100 + pPlayer->GetUnhappinessMod());
		iHappinessYieldValue *= 100;
		iHappinessYieldValue /= (100 + pPlayer->GetPlayerTraits()->GetPopulationUnhappinessModifier());
		// Handicap mod
		iHappinessYieldValue *= 100;
		iHappinessYieldValue /= pPlayer->getHandicapInfo().getPopulationUnhappinessMod();

		if (pPlayer->IsEmpireUnhappy())
		{
			iHappinessYieldValue = int(iHappinessYieldValue * pow(2.0, 1.0 - (double)pPlayer->GetExcessHappiness() / 10.0) + 0.5);
		}

		// For the initial *50
		iHappinessYieldValue /= 100;
	}
#endif // AUI_CITIZENS_UNHARDCODE_SPECIALIST_VALUE_HAPPINESS
	bool bAvoidGrowth = IsAvoidGrowth();

	// City Focus
	CityAIFocusTypes eFocus = GetFocusType();
#ifdef AMB_AI_SPECIALIST_FOCUS
	if(GET_PLAYER(GetOwner()).isHuman())
	{
		if(eFocus == CITY_AI_FOCUS_TYPE_FOOD)
			iFoodYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_PRODUCTION)
			iProductionYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD)
			iGoldYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_SCIENCE)
			iScienceYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_CULTURE)
			iCultureYieldValue *= 3;
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
		{
			iFoodYieldValue *= 2;
			iGoldYieldValue *= 2;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
		{
			iFoodYieldValue *= 2;
			iProductionYieldValue *= 2;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_FAITH)
		{
		iFaithYieldValue *= 3;
		}

		// Food can be worth less if we don't want to grow
		if(iExcessFoodTimes100 >= 0 && bAvoidGrowth)
		{
			// If we at least have enough Food to feed everyone, zero out the value of additional food
			iFoodYieldValue = 0;
		}
		// We want to grow here
		else
		{
			// If we have a non-default and non-food focus, only worry about getting to 0 food
			if(eFocus != NO_CITY_AI_FOCUS_TYPE && eFocus != CITY_AI_FOCUS_TYPE_FOOD && eFocus != CITY_AI_FOCUS_TYPE_PROD_GROWTH && eFocus != CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
			{
				int iFoodT100NeededFor0 = -iExcessFoodTimes100;

				if(iFoodT100NeededFor0 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else
				{
					iFoodYieldValue /= 2;
				}
			}
			// If our surplus is not at least 2, really emphasize food plots
			else if(!bAvoidGrowth)
			{
				int iFoodT100NeededFor2 = 200 - iExcessFoodTimes100;
				if(iFoodT100NeededFor2 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else if (eFocus != CITY_AI_FOCUS_TYPE_FOOD)
				{
					iFoodYieldValue /= 2;
				}
			}
		}
	}
	else
	{
		if(eFocus == CITY_AI_FOCUS_TYPE_FOOD)
		{
			iFoodYieldValue *= 4;
			iFoodYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_PRODUCTION)
		{
			iProductionYieldValue *= 4;
			iProductionYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD)
		{
			iGoldYieldValue *= 4;
			iGoldYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_SCIENCE)
		{
			iScienceYieldValue *= 4;
			iScienceYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_CULTURE)
		{
			iCultureYieldValue *= 4;
			iCultureYieldValue /= 3;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
		{
			iFoodYieldValue *= 6;
			iFoodYieldValue /= 5;
			iGoldYieldValue *= 6;
			iGoldYieldValue /= 5;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
		{
			iFoodYieldValue *= 6;
			iFoodYieldValue /= 5;
			iProductionYieldValue *= 6;
			iProductionYieldValue /= 5;
		}
		else if(eFocus == CITY_AI_FOCUS_TYPE_FAITH)
		{
			iFaithYieldValue *= 3;
		}
		// Food can be worth less if we don't want to grow
		if(iExcessFoodTimes100 >= 0 && bAvoidGrowth)
		{
			// If we at least have enough Food to feed everyone, zero out the value of additional food
			iFoodYieldValue = 0;
		}
		// We want to grow here
		else
		{
			// If we have a non-default and non-food focus, only worry about getting to 0 food
			if(bAvoidGrowth) //no stagnation on other focus
			{
				int iFoodT100NeededFor0 = -iExcessFoodTimes100;

				if(iFoodT100NeededFor0 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else
				{
					iFoodYieldValue /= 2;
				}
			}
			// If our surplus is not at least 2, really emphasize food plots
			else if(!bAvoidGrowth)
			{
				int iFoodT100NeededFor2 = 200 - iExcessFoodTimes100;
				if(iFoodT100NeededFor2 > 0)
				{
					iFoodYieldValue *= 8;
				}
				else if (eFocus != CITY_AI_FOCUS_TYPE_FOOD)
				{
					iFoodYieldValue /= 2;
				}
			}
		}
	}
#else
	if(eFocus == CITY_AI_FOCUS_TYPE_FOOD)
		iFoodYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_PRODUCTION)
		iProductionYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD)
		iGoldYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_SCIENCE)
		iScienceYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_CULTURE)
		iCultureYieldValue *= 3;
	else if(eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
	{
		iFoodYieldValue *= 2;
		iGoldYieldValue *= 2;
	}
	else if(eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH)
	{
		iFoodYieldValue *= 2;
		iProductionYieldValue *= 2;
	}
	else if(eFocus == CITY_AI_FOCUS_TYPE_FAITH)
	{
	iFaithYieldValue *= 3;
	}

	// Food can be worth less if we don't want to grow
	if(bUseAllowGrowthFlag && iExcessFoodTimes100 >= 0 && bAvoidGrowth)
	{
		// If we at least have enough Food to feed everyone, zero out the value of additional food
		iFoodYieldValue = 0;
	}
	// We want to grow here
	else
	{
		// If we have a non-default and non-food focus, only worry about getting to 0 food
		if(eFocus != NO_CITY_AI_FOCUS_TYPE && eFocus != CITY_AI_FOCUS_TYPE_FOOD && eFocus != CITY_AI_FOCUS_TYPE_PROD_GROWTH && eFocus != CITY_AI_FOCUS_TYPE_GOLD_GROWTH)
		{
			int iFoodT100NeededFor0 = -iExcessFoodTimes100;

			if(iFoodT100NeededFor0 > 0)
			{
				iFoodYieldValue *= 8;
			}
			else
			{
				iFoodYieldValue /= 2;
			}
		}
		// If our surplus is not at least 2, really emphasize food plots
		else if(!bAvoidGrowth)
		{
			int iFoodT100NeededFor2 = 200 - iExcessFoodTimes100;
			if(iFoodT100NeededFor2 > 0)
			{
				iFoodYieldValue *= 8;
			}
			else if (eFocus != CITY_AI_FOCUS_TYPE_FOOD)
			{
				iFoodYieldValue /= 2;
			}
		}
	}
#endif
	if((eFocus == NO_CITY_AI_FOCUS_TYPE || eFocus == CITY_AI_FOCUS_TYPE_PROD_GROWTH || eFocus == CITY_AI_FOCUS_TYPE_GOLD_GROWTH) && !bAvoidGrowth && m_pCity->getPopulation() < 5)
	{
		iFoodYieldValue *= 4;
	}

	iValue += iFoodYieldValue;
	iValue += iProductionYieldValue;
	iValue += iGoldYieldValue;
	iValue += iScienceYieldValue;
	iValue += iCultureYieldValue;
	iValue += iFaithYieldValue;
#if defined(MOD_API_UNIFIED_YIELDS_TOURISM)
	iValue += iTourismYieldValue;
#endif
	iValue += iGPPYieldValue;
	iValue += iHappinessYieldValue;

	return iValue;
}

/// Determine if eSpecialist is preferable to a default specialist, based on our focus
bool CvCityCitizens::IsBetterThanDefaultSpecialist(SpecialistTypes eSpecialist)
{
	CvSpecialistInfo* pSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
	CvAssertMsg(pSpecialistInfo, "Invalid specialist type when assigning citizens. Please send Anton your save file and version.");
	if(!pSpecialistInfo) return false; // Assumes that default specialist will work out

	SpecialistTypes eDefaultSpecialist = (SpecialistTypes) GC.getDEFAULT_SPECIALIST();
	CvSpecialistInfo* pDefaultSpecialistInfo = GC.getSpecialistInfo(eDefaultSpecialist);
	CvAssertMsg(pDefaultSpecialistInfo, "Invalid default specialist type when assigning citizens. Please send Anton your save file and version.");
	if(!pDefaultSpecialistInfo) return false;

#ifdef AMB_AI_SPECIALIST_FOCUS
	int iDefault = GetSpecialistValue((SpecialistTypes)GC.getDEFAULT_SPECIALIST());
	int iSpecialist = GetSpecialistValue(eSpecialist);

	if(iDefault <= iSpecialist)
	{
		return true;
	}

	return false;
#else
	//antonjs: consider: deficient yield
	CityAIFocusTypes eFocus = GetFocusType();
	YieldTypes eYield = NO_YIELD;
	switch (eFocus)
	{
	case CITY_AI_FOCUS_TYPE_FOOD:
		eYield = YIELD_FOOD;
		break;
	case CITY_AI_FOCUS_TYPE_PRODUCTION:
		eYield = YIELD_PRODUCTION;
		break;
	case CITY_AI_FOCUS_TYPE_GOLD:
		eYield = YIELD_GOLD;
		break;
	case CITY_AI_FOCUS_TYPE_GREAT_PEOPLE:
		eYield = NO_YIELD;
		break;
	case CITY_AI_FOCUS_TYPE_SCIENCE:
		eYield = YIELD_SCIENCE;
		break;
	case CITY_AI_FOCUS_TYPE_CULTURE:
		eYield = YIELD_CULTURE;
		break;
	case CITY_AI_FOCUS_TYPE_PROD_GROWTH:
	case CITY_AI_FOCUS_TYPE_GOLD_GROWTH:
		eYield = YIELD_FOOD;
		break;
	case CITY_AI_FOCUS_TYPE_FAITH:
		eYield = YIELD_FAITH;
		break;
	default:
		eYield = NO_YIELD;
		break;
	}

	if (eYield == NO_YIELD)
		return true;

	//NoteAcken If I'm in focus production the science/culture specialist get no value ??

	int iSpecialistYield = pSpecialistInfo->getYieldChange(eYield);
	int iDefaultSpecialistYield = pDefaultSpecialistInfo->getYieldChange(eYield);

	if (m_pCity->GetPlayer()->isHalfSpecialistUnhappiness() || m_pCity->GetPlayer()->isHalfSpecialistFood())
	{
		iSpecialistYield *= 2;
	}

	return (iSpecialistYield >= iDefaultSpecialistYield); // Unless default Specialist has strictly more, this Specialist is better
#endif
}

/// How many Citizens need to be given a job?
int CvCityCitizens::GetNumUnassignedCitizens() const
{
	return m_iNumUnassignedCitizens;
}

/// Changes how many Citizens need to be given a job
void CvCityCitizens::ChangeNumUnassignedCitizens(int iChange)
{
	m_iNumUnassignedCitizens += iChange;
	CvAssert(m_iNumUnassignedCitizens >= 0);
}

/// How many Citizens are working Plots?
int CvCityCitizens::GetNumCitizensWorkingPlots() const
{
	return m_iNumCitizensWorkingPlots;
}

/// Changes how many Citizens are working Plots
void CvCityCitizens::ChangeNumCitizensWorkingPlots(int iChange)
{
	m_iNumCitizensWorkingPlots += iChange;
}

/// Pick the best Plot to work from one of our unassigned pool
bool CvCityCitizens::DoAddBestCitizenFromUnassigned()
{
	// We only assign the unassigned here, folks
	if (GetNumUnassignedCitizens() == 0)
	{
		return false;
	}

	// First Specialist Pass
	int iSpecialistValue = 0;
	BuildingTypes eBestSpecialistBuilding = NO_BUILDING;
	if (!IsNoAutoAssignSpecialists())
	{
		eBestSpecialistBuilding = GetAIBestSpecialistBuilding(iSpecialistValue);
	}
#ifdef AMB_AI_SPECIALIST_FOCUS
	bool bSmallCity = true;
	if(GetCity()->getPopulation()>=7)
	{
		bSmallCity = false;
	}
#endif
	bool bBetterThanSlacker = false;
	if (eBestSpecialistBuilding != NO_BUILDING)
	{
		CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBestSpecialistBuilding);
		if(pkBuildingInfo)
		{
			SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
			// Must not be worse than a default Specialist for our focus!
			if (IsBetterThanDefaultSpecialist(eSpecialist))
			{
				bBetterThanSlacker = true;
			}
		}
	}

	int iBestPlotValue = 0;
	CvPlot* pBestPlot = GetBestCityPlotWithValue(iBestPlotValue, /*bBest*/ true, /*bWorked*/ false);

	bool bSpecialistBetterThanPlot = (eBestSpecialistBuilding != NO_BUILDING && iSpecialistValue >= iBestPlotValue);

	// Is there a Specialist we can assign?
#ifdef AMB_AI_SPECIALIST_FOCUS
	if (!bSmallCity && bSpecialistBetterThanPlot && bBetterThanSlacker)
#else
	if (bSpecialistBetterThanPlot && bBetterThanSlacker)
#endif
	{
		DoAddSpecialistToBuilding(eBestSpecialistBuilding, /*bForced*/ false);
		return true;
	}
	// Found a Valid Plot to place a guy?
#ifdef AUI_CITIZENS_IS_PLOT_BETTER_THAN_DEFAULT_SPECIALIST
	else if (pBestPlot != NULL && iBestPlotValue >= GetSpecialistValue((SpecialistTypes)GC.getDEFAULT_SPECIALIST()))
#else
	else if (!bSpecialistBetterThanPlot && pBestPlot != NULL)
#endif // AUI_CITIZENS_IS_PLOT_BETTER_THAN_DEFAULT_SPECIALIST
	{
		// Now assign the guy to the best possible Plot
		SetWorkingPlot(pBestPlot, true);
		return true;
	}
	// No Valid Plots left - and no good specialists
	else
	{
		CvPlayer* pOwner = &GET_PLAYER(GetOwner());
		CvAssertMsg(pOwner, "Could not find owner of city when assigning citizens. Please send Anton your save file and version.");

		// Assign a cool Specialist! Only do this for AI players, or humans who do not have manual specialist control set
		if (pOwner)
		{
			if (!GET_PLAYER(GetOwner()).isHuman() || !IsNoAutoAssignSpecialists())
			{
				BuildingTypes eBestBuilding = GetAIBestSpecialistBuilding(iSpecialistValue);
				if(eBestBuilding != NO_BUILDING)
				{
					CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBestBuilding);
					if(pkBuildingInfo)
					{
						SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
						// Must not be worse than a default Specialist for our focus!
						if (IsBetterThanDefaultSpecialist(eSpecialist))
						{
							DoAddSpecialistToBuilding(eBestBuilding, false);
							return true;
						}
					}
				}
			}
		}

		// Default Specialist if we can't do anything else
		ChangeNumDefaultSpecialists(1);
	}

	return false;
}

/// Pick the worst Plot to stop working
bool CvCityCitizens::DoRemoveWorstCitizen(bool bRemoveForcedStatus, SpecialistTypes eDontChangeSpecialist, int iCurrentCityPopulation)
{
	if (iCurrentCityPopulation == -1)
	{
		iCurrentCityPopulation = GetCity()->getPopulation();
	}

	// Are all of our guys already not working Plots?
	if(GetNumUnassignedCitizens() == GetCity()->getPopulation())
	{
		return false;
	}

	// Find default Specialist to pull off, if there is one
	if(GetNumDefaultSpecialists() > 0)
	{
		// Do we either have unforced default specialists we can remove?
		if(GetNumDefaultSpecialists() > GetNumForcedDefaultSpecialists())
		{
			ChangeNumDefaultSpecialists(-1);
			return true;
		}
		if(GetNumDefaultSpecialists() > iCurrentCityPopulation)
		{
			ChangeNumForcedDefaultSpecialists(-1);
			ChangeNumDefaultSpecialists(-1);
			return true;
		}
	}

	// No Default Specialists, remove a working Pop, if there is one
	int iWorstPlotValue = 0;
	CvPlot* pWorstPlot = GetBestCityPlotWithValue(iWorstPlotValue, /*bBest*/ false, /*bWorked*/ true);

	if(pWorstPlot != NULL)
	{
		SetWorkingPlot(pWorstPlot, false);

		// If we were force-working this Plot, turn it off
		if(bRemoveForcedStatus)
		{
			if(IsForcedWorkingPlot(pWorstPlot))
			{
				SetForcedWorkingPlot(pWorstPlot, false);
			}
		}

		return true;
	}
	// Have to resort to pulling away a good Specialist
	else
	{
		if(DoRemoveWorstSpecialist(eDontChangeSpecialist))
		{
			return true;
		}
	}

	return false;
}

/// Find a Plot the City is either working or not, and the best/worst value for it - this function does "double duty" depending on what the user wants to find
CvPlot* CvCityCitizens::GetBestCityPlotWithValue(int& iValue, bool bWantBest, bool bWantWorked)
{
	bool bPlotForceWorked;

	int iBestPlotValue = -1;
	int iBestPlotID = -1;

	CvPlot* pLoopPlot;

	// Look at all workable Plots
	for(int iPlotLoop = 0; iPlotLoop < NUM_CITY_PLOTS; iPlotLoop++)
	{
		if(iPlotLoop != CITY_HOME_PLOT)
		{
			pLoopPlot = GetCityPlotFromIndex(iPlotLoop);

			if(pLoopPlot != NULL)
			{
				// Is this a Plot this City controls?
				if(pLoopPlot->getWorkingCity() != NULL && pLoopPlot->getWorkingCity()->GetID() == GetCity()->GetID())
				{
					// Working the Plot and wanting to work it, or Not working it and wanting to find one to work?
					if((IsWorkingPlot(pLoopPlot) && bWantWorked) ||
					        (!IsWorkingPlot(pLoopPlot) && !bWantWorked))
					{
						// Working the Plot or CAN work the Plot?
						if(bWantWorked || IsCanWork(pLoopPlot))
						{
							iValue = GetPlotValue(pLoopPlot, bWantBest);

							bPlotForceWorked = IsForcedWorkingPlot(pLoopPlot);

							if(bPlotForceWorked)
							{
								// Looking for best, unworked Plot: Forced plots are FIRST to be picked
								if(bWantBest && !bWantWorked)
								{
									iValue += 10000;
								}
								// Looking for worst, worked Plot: Forced plots are LAST to be picked, so make it's value incredibly high
								if(!bWantBest && bWantWorked)
								{
									iValue += 10000;
								}
							}

							if(iBestPlotValue == -1 ||							// First Plot?
							        (bWantBest && iValue > iBestPlotValue) ||		// Best Plot so far?
							        (!bWantBest && iValue < iBestPlotValue))			// Worst Plot so far?
							{
								iBestPlotValue = iValue;
								iBestPlotID = iPlotLoop;
							}
						}
					}
				}
			}
		}
	}

	// Passed in by reference
	iValue = iBestPlotValue;

	if(iBestPlotID == -1)
	{
		return NULL;
	}

	return GetCityPlotFromIndex(iBestPlotID);
}

/// Optimize our Citizen Placement
void CvCityCitizens::DoReallocateCitizens()
{
	// Make sure we don't have more forced working plots than we have citizens working.  If so, clean it up before reallocating
	DoValidateForcedWorkingPlots();

	// Remove all of the allocated guys
	int iNumCitizensToRemove = GetNumCitizensWorkingPlots();
	for(int iWorkerLoop = 0; iWorkerLoop < iNumCitizensToRemove; iWorkerLoop++)
	{
		DoRemoveWorstCitizen();
	}

	int iSpecialistLoop;

	// Remove Non-Forced Specialists in Buildings
	int iNumSpecialistsToRemove;
	BuildingTypes eBuilding;
	for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
	{
		eBuilding = (BuildingTypes) iBuildingLoop;

		// Have this Building in the City?
		if(GetCity()->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
		{
			iNumSpecialistsToRemove = GetNumSpecialistsInBuilding(eBuilding) - GetNumForcedSpecialistsInBuilding(eBuilding);	// Don't include Forced guys

			// Loop through guys to remove (if there are any)
			for(iSpecialistLoop = 0; iSpecialistLoop < iNumSpecialistsToRemove; iSpecialistLoop++)
			{
				DoRemoveSpecialistFromBuilding(eBuilding, /*bForced*/ false);
			}
		}
	}

	// Remove Default Specialists
	int iNumDefaultsToRemove = GetNumDefaultSpecialists() - GetNumForcedDefaultSpecialists();
	for(iSpecialistLoop = 0; iSpecialistLoop < iNumDefaultsToRemove; iSpecialistLoop++)
	{
		ChangeNumDefaultSpecialists(-1);
	}

	// Now put all of the unallocated guys back
	int iNumToAllocate = GetNumUnassignedCitizens();
	for(int iUnallocatedLoop = 0; iUnallocatedLoop < iNumToAllocate; iUnallocatedLoop++)
	{
		DoAddBestCitizenFromUnassigned();
	}
}



///////////////////////////////////////////////////
// Worked Plots
///////////////////////////////////////////////////



/// Is our City working a CvPlot?
bool CvCityCitizens::IsWorkingPlot(const CvPlot* pPlot) const
{
	int iIndex;

	iIndex = GetCityIndexFromPlot(pPlot);

	if(iIndex != -1)
	{
		return m_pabWorkingPlot[iIndex];
	}

	return false;
}

/// Tell a City to start or stop working a Plot.  Citizens will go to/from the Unassigned Pool if the 3rd argument is true
void CvCityCitizens::SetWorkingPlot(CvPlot* pPlot, bool bNewValue, bool bUseUnassignedPool)
{
	int iI;

	int iIndex = GetCityIndexFromPlot(pPlot);

	CvAssertMsg(iIndex >= 0, "iIndex expected to be >= 0");
	CvAssertMsg(iIndex < NUM_CITY_PLOTS, "iIndex expected to be < NUM_CITY_PLOTS");

	if(IsWorkingPlot(pPlot) != bNewValue && iIndex >= 0 && iIndex < NUM_CITY_PLOTS)
	{
		m_pabWorkingPlot[iIndex] = bNewValue;

		// Don't look at the center Plot of a City, because we always work it for free
		if(iIndex != CITY_HOME_PLOT)
		{
			// Alter the count of Plots being worked by Citizens
			if(bNewValue)
			{
				ChangeNumCitizensWorkingPlots(1);

				if(bUseUnassignedPool)
				{
					ChangeNumUnassignedCitizens(-1);
				}
			}
			else
			{
				ChangeNumCitizensWorkingPlots(-1);

				if(bUseUnassignedPool)
				{
					ChangeNumUnassignedCitizens(1);
				}
			}
		}

		if(pPlot != NULL)
		{
			// investigate later
			//CvAssertMsg(pPlot->getWorkingCity() == GetCity(), "WorkingCity is expected to be this");

			// Now working pPlot
			if(IsWorkingPlot(pPlot))
			{
				//if (iIndex != CITY_HOME_PLOT)
				//{
				//	GetCity()->changeWorkingPopulation(1);
				//}

				for(iI = 0; iI < NUM_YIELD_TYPES; iI++)
				{
					GetCity()->ChangeBaseYieldRateFromTerrain(((YieldTypes)iI), pPlot->getYield((YieldTypes)iI));
				}
			}
			// No longer working pPlot
			else
			{
				//if (iIndex != CITY_HOME_PLOT)
				//{
				//	GetCity()->changeWorkingPopulation(-1);
				//}

				for(iI = 0; iI < NUM_YIELD_TYPES; iI++)
				{
					GetCity()->ChangeBaseYieldRateFromTerrain(((YieldTypes)iI), -pPlot->getYield((YieldTypes)iI));
				}
			}
		}

		if(GetCity()->isCitySelected())
		{
			GC.GetEngineUserInterface()->setDirty(CityInfo_DIRTY_BIT, true);
			//GC.GetEngineUserInterface()->setDirty(InfoPane_DIRTY_BIT, true );
			GC.GetEngineUserInterface()->setDirty(CityScreen_DIRTY_BIT, true);
			GC.GetEngineUserInterface()->setDirty(ColoredPlots_DIRTY_BIT, true);
		}

		GC.GetEngineUserInterface()->setDirty(CityInfo_DIRTY_BIT, true);
	}
}

/// Tell City to work a Plot, pulling a Citizen from the worst location we can
void CvCityCitizens::DoAlterWorkingPlot(int iIndex)
{
	CvAssertMsg(iIndex >= 0, "iIndex expected to be >= 0");
	CvAssertMsg(iIndex < NUM_CITY_PLOTS, "iIndex expected to be < NUM_CITY_PLOTS");

	// Clicking ON the city "resets" it to default setup
	if(iIndex == CITY_HOME_PLOT)
	{
		CvPlot* pLoopPlot;

		// If we've forced any plots to be worked, reset them to the normal state
		for(int iPlotLoop = 0; iPlotLoop < NUM_CITY_PLOTS; iPlotLoop++)
		{
			if(iPlotLoop != CITY_HOME_PLOT)
			{
				pLoopPlot = GetCityPlotFromIndex(iPlotLoop);

				if(pLoopPlot != NULL)
				{
					if(IsForcedWorkingPlot(pLoopPlot))
					{
						SetForcedWorkingPlot(pLoopPlot, false);
					}
				}
			}
		}

		// Reset Forced Default Specialists
		ChangeNumForcedDefaultSpecialists(-GetNumForcedDefaultSpecialists());

		DoReallocateCitizens();
	}
	else
	{
		CvPlot* pPlot = GetCityPlotFromIndex(iIndex);

		if(pPlot != NULL)
		{
			if(IsCanWork(pPlot))
			{
//				GetCity()->setCitizensAutomated(false);

				// If we're already working the Plot, then take the guy off and turn him into a Default Specialist
				if(IsWorkingPlot(pPlot))
				{
					SetWorkingPlot(pPlot, false);
					SetForcedWorkingPlot(pPlot, false);
					ChangeNumDefaultSpecialists(1);
					ChangeNumForcedDefaultSpecialists(1);
				}
				// Player picked a new Plot to work
				else
				{
					// Pull from the Default Specialist pool, if possible
					if(GetNumDefaultSpecialists() > 0)
					{
						ChangeNumDefaultSpecialists(-1);
						// Player is forcibly telling city to work a plot, so reduce count of forced default specialists
						if(GetNumForcedDefaultSpecialists() > 0)
							ChangeNumForcedDefaultSpecialists(-1);

						SetWorkingPlot(pPlot, true);
						SetForcedWorkingPlot(pPlot, true);
					}
					// No Default Specialists, so grab a better allocated guy
					else
					{
						// Working Plot
						if(DoRemoveWorstCitizen(true))
						{
							SetWorkingPlot(pPlot, true);
							SetForcedWorkingPlot(pPlot, true);
							//ChangeNumUnassignedCitizens(-1);
						}
						// Good Specialist
						else
						{
							CvAssert(false);
						}
					}
					//if ((GetCity()->extraSpecialists() > 0) || GetCity()->AI_removeWorstCitizen())
					//{
					//	SetWorkingPlot(pPlot, true);
					//}
				}
			}
			// JON: Need to update this block to work with new system
			else if(pPlot->getOwner() == GetOwner())
			{
				// Can't take away forced plots from puppet Cities
				if(pPlot->getWorkingCityOverride() != NULL)
				{
					if(pPlot->getWorkingCityOverride()->IsPuppet())
					{
						return;
					}
				}

				pPlot->setWorkingCityOverride(GetCity());
			}
		}
	}
}



/// Has our City been told it MUST a particular CvPlot?
bool CvCityCitizens::IsForcedWorkingPlot(const CvPlot* pPlot) const
{
	int iIndex;

	iIndex = GetCityIndexFromPlot(pPlot);

	if(iIndex != -1)
	{
		return m_pabForcedWorkingPlot[iIndex];
	}

	return false;
}

/// Tell our City it MUST work a particular CvPlot
void CvCityCitizens::SetForcedWorkingPlot(CvPlot* pPlot, bool bNewValue)
{
	int iIndex = GetCityIndexFromPlot(pPlot);

	CvAssertMsg(iIndex >= 0, "iIndex expected to be >= 0");
	CvAssertMsg(iIndex < NUM_CITY_PLOTS, "iIndex expected to be < NUM_CITY_PLOTS");

	if(IsForcedWorkingPlot(pPlot) != bNewValue && iIndex >= 0 && iIndex < NUM_CITY_PLOTS)
	{
		m_pabForcedWorkingPlot[iIndex] = bNewValue;

		// Change the count of how many are forced
		if(bNewValue)
		{
			ChangeNumForcedWorkingPlots(1);

			// More forced plots than we have citizens working?  If so, then pick someone to lose their forced status
			if(GetNumForcedWorkingPlots() > GetNumCitizensWorkingPlots())
			{
				DoValidateForcedWorkingPlots();
			}
		}
		else
		{
			ChangeNumForcedWorkingPlots(-1);
		}
	}
}

/// Make sure we don't have more forced working plots than we have citizens to work
void CvCityCitizens::DoValidateForcedWorkingPlots()
{
	int iNumForcedWorkingPlotsToDemote = GetNumForcedWorkingPlots() - GetNumCitizensWorkingPlots();

	if(iNumForcedWorkingPlotsToDemote > 0)
	{
		for(int iLoop = 0; iLoop < iNumForcedWorkingPlotsToDemote; iLoop++)
		{
			DoDemoteWorstForcedWorkingPlot();
		}
	}
}

/// Remove the Forced status from the worst ForcedWorking plot
void CvCityCitizens::DoDemoteWorstForcedWorkingPlot()
{
	int iValue;

	int iBestPlotValue = -1;
	int iBestPlotID = -1;

	CvPlot* pLoopPlot;

	// Look at all workable Plots
	for(int iPlotLoop = 0; iPlotLoop < NUM_CITY_PLOTS; iPlotLoop++)
	{
		if(iPlotLoop != CITY_HOME_PLOT)
		{
			pLoopPlot = GetCityPlotFromIndex(iPlotLoop);

			if(pLoopPlot != NULL)
			{
				if(IsForcedWorkingPlot(pLoopPlot))
				{
					iValue = GetPlotValue(pLoopPlot, false);

					// First, or worst yet?
					if(iBestPlotValue == -1 || iValue < iBestPlotValue)
					{
						iBestPlotValue = iValue;
						iBestPlotID = iPlotLoop;
					}
				}
			}
		}
	}

	if(iBestPlotID > -1)
	{
		pLoopPlot = GetCityPlotFromIndex(iBestPlotID);
		SetForcedWorkingPlot(pLoopPlot, false);
	}
}

/// How many plots have we forced to be worked?
int CvCityCitizens::GetNumForcedWorkingPlots() const
{
	return m_iNumForcedWorkingPlots;
}

/// Changes how many plots we have forced to be worked
void CvCityCitizens::ChangeNumForcedWorkingPlots(int iChange)
{
	if(iChange != 0)
	{
		m_iNumForcedWorkingPlots += iChange;
	}
}

/// Can our City work a particular CvPlot?
bool CvCityCitizens::IsCanWork(CvPlot* pPlot) const
{
	if(pPlot->getWorkingCity() != m_pCity)
	{
		return false;
	}

	CvAssertMsg(GetCityIndexFromPlot(pPlot) != -1, "GetCityIndexFromPlot(pPlot) is expected to be assigned (not -1)");

	if(pPlot->plotCheck(PUF_canSiege, GetOwner()) != NULL)
	{
		return false;
	}

	if(pPlot->isWater())
	{
		if(!(GET_TEAM(GetTeam()).isWaterWork()))
		{
			return false;
		}

	}

	if(!pPlot->hasYield())
	{
		return false;
	}

	if(IsPlotBlockaded(pPlot))
	{
		return false;
	}

	return true;
}

// Is there a naval blockade on this water tile?
bool CvCityCitizens::IsPlotBlockaded(CvPlot* pPlot) const
{
	// See if there are any enemy boats near us that are blockading this plot
	int iBlockadeDistance = /*2*/ GC.getNAVAL_PLOT_BLOCKADE_RANGE();
	int iDX, iDY;
	CvPlot* pNearbyPlot;

	PlayerTypes ePlayer = m_pCity->getOwner();

	// Might be a better way to do this that'd be slightly less CPU-intensive








	for(iDX = -(iBlockadeDistance); iDX <= iBlockadeDistance; iDX++)
	{
		for(iDY = -(iBlockadeDistance); iDY <= iBlockadeDistance; iDY++)
		{

			pNearbyPlot = plotXY(pPlot->getX(), pPlot->getY(), iDX, iDY);

			if(pNearbyPlot != NULL)
			{
				// Must be water in the same Area
				if(pNearbyPlot->isWater() && pNearbyPlot->getArea() == pPlot->getArea())
				{
#ifdef AUI_FIX_HEX_DISTANCE_INSTEAD_OF_PLOT_DISTANCE
					if(hexDistance(iDX, iDY) <= iBlockadeDistance)
#else
					if(plotDistance(pNearbyPlot->getX(), pNearbyPlot->getY(), pPlot->getX(), pPlot->getY()) <= iBlockadeDistance)
#endif // AUI_FIX_HEX_DISTANCE_INSTEAD_OF_PLOT_DISTANCE
					{
						// Enemy boat within range to blockade our plot?
						if(pNearbyPlot->IsActualEnemyUnit(ePlayer))
						{
							return true;
						}
					}
				}
			}
		}
	}

	return false;
}

// Is there a naval blockade on any of this city's water tiles?
bool CvCityCitizens::IsAnyPlotBlockaded() const
{
	CvPlot* pLoopPlot;

	// Look at all workable Plots
	for(int iPlotLoop = 0; iPlotLoop < NUM_CITY_PLOTS; iPlotLoop++)
	{
		if(iPlotLoop != CITY_HOME_PLOT)
		{
			pLoopPlot = GetCityPlotFromIndex(iPlotLoop);

			if(pLoopPlot != NULL)
			{
				if(IsPlotBlockaded(pLoopPlot))
				{
					return true;
				}
			}
		}
	}

	return false;
}

/// If we're working this plot make sure we're allowed, and if we're not then correct the situation
void CvCityCitizens::DoVerifyWorkingPlot(CvPlot* pPlot)
{
	if(pPlot != NULL)
	{
		if(IsWorkingPlot(pPlot))
		{
			if(!IsCanWork(pPlot))
			{
				SetWorkingPlot(pPlot, false);
				DoAddBestCitizenFromUnassigned();
			}
		}
	}
}

/// Check all Plots by this City to see if we can actually be working them (if we are)
void CvCityCitizens::DoVerifyWorkingPlots()
{
	int iI;
	CvPlot* pPlot;

	for(iI = 0; iI < NUM_CITY_PLOTS; iI++)
	{
		pPlot = GetCityPlotFromIndex(iI);

		DoVerifyWorkingPlot(pPlot);
	}
}




///////////////////////////////////////////////////
// Helpful Stuff
///////////////////////////////////////////////////




/// Returns the Plot Index from a CvPlot
int CvCityCitizens::GetCityIndexFromPlot(const CvPlot* pPlot) const
{
	return plotCityXY(m_pCity, pPlot);
}


/// Returns the CvPlot from a Plot Index
CvPlot* CvCityCitizens::GetCityPlotFromIndex(int iIndex) const
{
	return plotCity(m_pCity->getX(), m_pCity->getY(), iIndex);
}




///////////////////////////////////////////////////
// Specialists
///////////////////////////////////////////////////



/// Called at the end of every turn: Looks at the specialists in this City and levels them up
void CvCityCitizens::DoSpecialists()
{
	int iGPPChange;
	int iCount;
	int iMod;
	for(int iSpecialistLoop = 0; iSpecialistLoop < GC.getNumSpecialistInfos(); iSpecialistLoop++)
	{
		const SpecialistTypes eSpecialist = static_cast<SpecialistTypes>(iSpecialistLoop);
		CvSpecialistInfo* pkSpecialistInfo = GC.getSpecialistInfo(eSpecialist);
		if(pkSpecialistInfo)
		{
			int iGPThreshold = GetSpecialistUpgradeThreshold((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass());

			// Does this Specialist spawn a GP?
			if(pkSpecialistInfo->getGreatPeopleUnitClass() != NO_UNITCLASS)
			{
				iCount = GetSpecialistCount(eSpecialist);

				// GPP from Specialists
				iGPPChange = pkSpecialistInfo->getGreatPeopleRateChange() * iCount * 100;

				// GPP from Buildings
				iGPPChange += GetBuildingGreatPeopleRateChanges(eSpecialist) * 100;

				if(iGPPChange > 0)
				{
					iMod = 0;

					// City mod
					iMod += GetCity()->getGreatPeopleRateModifier();

					// Player mod
					iMod += GetPlayer()->getGreatPeopleRateModifier();

					// Player and Golden Age mods to this specific class
					if((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass() == GC.getInfoTypeForString("UNITCLASS_SCIENTIST"))
					{
						iMod += GetPlayer()->getGreatScientistRateModifier();
					}
					else if((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass() == GC.getInfoTypeForString("UNITCLASS_WRITER"))
					{ 
						if (GetPlayer()->isGoldenAge())
						{
							iMod += GetPlayer()->GetPlayerTraits()->GetGoldenAgeGreatWriterRateModifier();
						}
						iMod += GetPlayer()->getGreatWriterRateModifier();
					}
					else if((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass() == GC.getInfoTypeForString("UNITCLASS_ARTIST"))
					{
						if (GetPlayer()->isGoldenAge())
						{
							iMod += GetPlayer()->GetPlayerTraits()->GetGoldenAgeGreatArtistRateModifier();
						}
						iMod += GetPlayer()->getGreatArtistRateModifier();
					}
					else if((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass() == GC.getInfoTypeForString("UNITCLASS_MUSICIAN"))
					{
						if (GetPlayer()->isGoldenAge())
						{
							iMod += GetPlayer()->GetPlayerTraits()->GetGoldenAgeGreatMusicianRateModifier();
						}
						iMod += GetPlayer()->getGreatMusicianRateModifier();
					}
					else if((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass() == GC.getInfoTypeForString("UNITCLASS_MERCHANT"))
					{
						iMod += GetPlayer()->getGreatMerchantRateModifier();
					}
					else if((UnitClassTypes)pkSpecialistInfo->getGreatPeopleUnitClass() == GC.getInfoTypeForString("UNITCLASS_ENGINEER"))
					{
						iMod += GetPlayer()->getGreatEngineerRateModifier();
					}

					// Apply mod
					iGPPChange *= (100 + iMod);
					iGPPChange /= 100;

					ChangeSpecialistGreatPersonProgressTimes100(eSpecialist, iGPPChange);
				}

				// Enough to spawn a GP?
				if(GetSpecialistGreatPersonProgress(eSpecialist) >= iGPThreshold)
				{
					// No Minors
					if(!GET_PLAYER(GetCity()->getOwner()).isMinorCiv())
					{
						// Reset progress on this Specialist
						DoResetSpecialistGreatPersonProgressTimes100(eSpecialist);

						// Now... actually create the GP!
						const UnitClassTypes eUnitClass = (UnitClassTypes) pkSpecialistInfo->getGreatPeopleUnitClass();
						const CivilizationTypes eCivilization = GetCity()->getCivilizationType();
						CvCivilizationInfo* pCivilizationInfo = GC.getCivilizationInfo(eCivilization);
						if(pCivilizationInfo != NULL)
						{
							UnitTypes eUnit = (UnitTypes) pCivilizationInfo->getCivilizationUnits(eUnitClass);

							DoSpawnGreatPerson(eUnit, true, false);
						}
					}
				}
			}
		}
	}
}

/// How many Specialists are assigned to this Building Type?
int CvCityCitizens::GetNumSpecialistsAllowedByBuilding(const CvBuildingEntry& kBuilding)
{
	return kBuilding.GetSpecialistCount();
}

/// Are we in the position to add another Specialist to eBuilding?
bool CvCityCitizens::IsCanAddSpecialistToBuilding(BuildingTypes eBuilding)
{
	CvAssert(eBuilding > -1);
	CvAssert(eBuilding < GC.getNumBuildingInfos());

	int iNumSpecialistsAssigned = GetNumSpecialistsInBuilding(eBuilding);

	if(iNumSpecialistsAssigned < GetCity()->getPopulation() &&	// Limit based on Pop of City
	        iNumSpecialistsAssigned < GC.getBuildingInfo(eBuilding)->GetSpecialistCount() &&				// Limit for this particular Building
	        iNumSpecialistsAssigned < GC.getMAX_SPECIALISTS_FROM_BUILDING())	// Overall Limit
	{
		return true;
	}

	return false;
}

/// Adds and initializes a Specialist for this building
void CvCityCitizens::DoAddSpecialistToBuilding(BuildingTypes eBuilding, bool bForced)
{
	CvAssert(eBuilding > -1);
	CvAssert(eBuilding < GC.getNumBuildingInfos());

	CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
	if(pkBuildingInfo == NULL)
	{
		return;
	}

	SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();

	// Can't add more than the max
	if(IsCanAddSpecialistToBuilding(eBuilding))
	{
		// If we're force-assigning a specialist, then we can reduce the count on forced default specialists
		if(bForced)
		{
			if(GetNumForcedDefaultSpecialists() > 0)
				ChangeNumForcedDefaultSpecialists(-1);
		}

		// If we don't already have an Unassigned Citizen to turn into a Specialist, find one from somewhere
		if(GetNumUnassignedCitizens() == 0)
		{
			DoRemoveWorstCitizen(true, /*Don't remove this type*/ eSpecialist);
			if(GetNumUnassignedCitizens() == 0)
			{
				// Still nobody, all the citizens may be assigned to the eSpecialist we are looking for, try again
				if(!DoRemoveWorstSpecialist(NO_SPECIALIST, eBuilding))
				{
					return; // For some reason we can't do this, we must exit, else we will be going over the population count
				}
			}
		}

		// Increase count for the whole city
		m_aiSpecialistCounts[eSpecialist]++;
		m_aiNumSpecialistsInBuilding[eBuilding]++;

		if(bForced)
		{
			m_aiNumForcedSpecialistsInBuilding[eBuilding]++;
		}

		GetCity()->processSpecialist(eSpecialist, 1);
		GetCity()->UpdateReligion(GetCity()->GetCityReligions()->GetReligiousMajority());

		ChangeNumUnassignedCitizens(-1);

		ICvUserInterface2* pkIFace = GC.GetEngineUserInterface();
		pkIFace->setDirty(GameData_DIRTY_BIT, true);
		pkIFace->setDirty(CityInfo_DIRTY_BIT, true);
		//pkIFace->setDirty(InfoPane_DIRTY_BIT, true );
		pkIFace->setDirty(CityScreen_DIRTY_BIT, true);
		pkIFace->setDirty(ColoredPlots_DIRTY_BIT, true);

		CvCity* pkCity = GetCity();
		auto_ptr<ICvCity1> pCity = GC.WrapCityPointer(pkCity);

		pkIFace->SetSpecificCityInfoDirty(pCity.get(), CITY_UPDATE_TYPE_SPECIALISTS);
	}
}

/// Removes and uninitializes a Specialist for this building
void CvCityCitizens::DoRemoveSpecialistFromBuilding(BuildingTypes eBuilding, bool bForced, bool bEliminatePopulation)
{
	CvAssert(eBuilding > -1);
	CvAssert(eBuilding < GC.getNumBuildingInfos());

	CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
	if(pkBuildingInfo == NULL)
	{
		return;
	}

	SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();

	int iNumSpecialistsAssigned = GetNumSpecialistsInBuilding(eBuilding);

	// Need at least 1 assigned to remove
	if(iNumSpecialistsAssigned > 0)
	{
		// Decrease count for the whole city
		m_aiSpecialistCounts[eSpecialist]--;
		m_aiNumSpecialistsInBuilding[eBuilding]--;

		if(bForced)
		{
			m_aiNumForcedSpecialistsInBuilding[eBuilding]--;
		}

		GetCity()->processSpecialist(eSpecialist, -1);
		GetCity()->UpdateReligion(GetCity()->GetCityReligions()->GetReligiousMajority());

		// Do we kill this population or reassign him?
		if(bEliminatePopulation)
		{
			GetCity()->changePopulation(-1, /*bReassignPop*/ false);
		}
		else
		{
			ChangeNumUnassignedCitizens(1);
		}

		GC.GetEngineUserInterface()->setDirty(GameData_DIRTY_BIT, true);
		GC.GetEngineUserInterface()->setDirty(CityInfo_DIRTY_BIT, true);
		//GC.GetEngineUserInterface()->setDirty(InfoPane_DIRTY_BIT, true );
		GC.GetEngineUserInterface()->setDirty(CityScreen_DIRTY_BIT, true);
		GC.GetEngineUserInterface()->setDirty(ColoredPlots_DIRTY_BIT, true);

		auto_ptr<ICvCity1> pCity = GC.WrapCityPointer(GetCity());

		GC.GetEngineUserInterface()->SetSpecificCityInfoDirty(pCity.get(), CITY_UPDATE_TYPE_SPECIALISTS);
	}
}

//	----------------------------------------------------------------------------
/// Clear EVERYONE from this Building
/// Any one in the building will be put in the unassigned citizens list.
/// It is up to the caller to reassign population.
void CvCityCitizens::DoRemoveAllSpecialistsFromBuilding(BuildingTypes eBuilding, bool bEliminatePopulation)
{
	CvAssert(eBuilding > -1);
	CvAssert(eBuilding < GC.getNumBuildingInfos());

	CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
	if(pkBuildingInfo == NULL)
	{
		return;
	}

	SpecialistTypes eSpecialist = (SpecialistTypes) pkBuildingInfo->GetSpecialistType();
	int iNumSpecialists = GetNumSpecialistsInBuilding(eBuilding);

	m_aiNumForcedSpecialistsInBuilding[eBuilding] = 0;

	// Pick the worst to remove
	for(int iAssignedLoop = 0; iAssignedLoop < iNumSpecialists; iAssignedLoop++)
	{
		// Decrease count for the whole city
		m_aiSpecialistCounts[eSpecialist]--;
		m_aiNumSpecialistsInBuilding[eBuilding]--;
		GetCity()->processSpecialist(eSpecialist, -1);

		// Do we kill this population or reassign him?
		if(bEliminatePopulation)
		{
			GetCity()->changePopulation(-1, /*bReassignPop*/ false);
		}
		else
		{
			ChangeNumUnassignedCitizens(1);
		}

		GC.GetEngineUserInterface()->setDirty(CityInfo_DIRTY_BIT, true);
		//GC.GetEngineUserInterface()->setDirty(InfoPane_DIRTY_BIT, true );
		GC.GetEngineUserInterface()->setDirty(CityScreen_DIRTY_BIT, true);
		GC.GetEngineUserInterface()->setDirty(ColoredPlots_DIRTY_BIT, true);

		auto_ptr<ICvCity1> pCity = GC.WrapCityPointer(GetCity());
		GC.GetEngineUserInterface()->SetSpecificCityInfoDirty(pCity.get(), CITY_UPDATE_TYPE_SPECIALISTS);
	}
}


/// Find the worst Specialist and remove him from duty
bool CvCityCitizens::DoRemoveWorstSpecialist(SpecialistTypes eDontChangeSpecialist, const BuildingTypes eDontRemoveFromBuilding /* = NO_BUILDING */)
{
	for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
	{
		const BuildingTypes eBuilding = static_cast<BuildingTypes>(iBuildingLoop);

		if(eBuilding == eDontRemoveFromBuilding)
		{
			continue;
		}

		CvBuildingEntry* pkBuildingInfo = GC.getBuildingInfo(eBuilding);
		if(pkBuildingInfo == NULL)
		{
			continue;
		}

		// We might not be allowed to change this Building's Specialists
		if(eDontChangeSpecialist == pkBuildingInfo->GetSpecialistType())
		{
			continue;
		}

		if(GetNumSpecialistsInBuilding(eBuilding) > 0)
		{
			DoRemoveSpecialistFromBuilding(eBuilding, true);

			return true;
		}
	}

	return false;
}

/// How many Default Specialists are assigned in this City?
int CvCityCitizens::GetNumDefaultSpecialists() const
{
	return m_iNumDefaultSpecialists;
}

/// Changes how many Default Specialists are assigned in this City
void CvCityCitizens::ChangeNumDefaultSpecialists(int iChange)
{
	m_iNumDefaultSpecialists += iChange;

	SpecialistTypes eSpecialist = (SpecialistTypes) GC.getDEFAULT_SPECIALIST();
	m_aiSpecialistCounts[eSpecialist] += iChange;

	GetCity()->processSpecialist(eSpecialist, iChange);

	ChangeNumUnassignedCitizens(-iChange);
}

/// How many Default Specialists have been forced assigned in this City?
int CvCityCitizens::GetNumForcedDefaultSpecialists() const
{
	return m_iNumForcedDefaultSpecialists;
}

/// How many Default Specialists have been forced assigned in this City?
void CvCityCitizens::ChangeNumForcedDefaultSpecialists(int iChange)
{
	m_iNumForcedDefaultSpecialists += iChange;
}

/// How many Specialists do we have assigned of this type in our City?
int CvCityCitizens::GetSpecialistCount(SpecialistTypes eIndex) const
{
	CvAssert(eIndex > -1);
	CvAssert(eIndex < GC.getNumSpecialistInfos());

	return m_aiSpecialistCounts[eIndex];
}

/// Count up all the Specialists we have here
int CvCityCitizens::GetTotalSpecialistCount() const
{
	int iNumSpecialists = 0;
	SpecialistTypes eSpecialist;

	for(int iSpecialistLoop = 0; iSpecialistLoop < GC.getNumSpecialistInfos(); iSpecialistLoop++)
	{
		eSpecialist = (SpecialistTypes) iSpecialistLoop;

		if (eSpecialist != (SpecialistTypes) GC.getDEFAULT_SPECIALIST())
		{
			iNumSpecialists += GetSpecialistCount(eSpecialist);
		}
	}

	return iNumSpecialists;
}

/// GPP changes from Buildings
int CvCityCitizens::GetBuildingGreatPeopleRateChanges(SpecialistTypes eSpecialist) const
{
	CvAssert(eSpecialist > -1);
	CvAssert(eSpecialist < GC.getNumSpecialistInfos());

	return m_piBuildingGreatPeopleRateChanges[eSpecialist];
}

/// Change GPP from Buildings
void CvCityCitizens::ChangeBuildingGreatPeopleRateChanges(SpecialistTypes eSpecialist, int iChange)
{
	CvAssert(eSpecialist > -1);
	CvAssert(eSpecialist < GC.getNumSpecialistInfos());

	m_piBuildingGreatPeopleRateChanges[eSpecialist] += iChange;
}

/// How much progress does this City have towards a Great Person from eIndex?
int CvCityCitizens::GetSpecialistGreatPersonProgress(SpecialistTypes eIndex) const
{
	CvAssert(eIndex > -1);
	CvAssert(eIndex < GC.getNumSpecialistInfos());

	return GetSpecialistGreatPersonProgressTimes100(eIndex) / 100;
}

/// How much progress does this City have towards a Great Person from eIndex? (in hundreds)
int CvCityCitizens::GetSpecialistGreatPersonProgressTimes100(SpecialistTypes eIndex) const
{
	CvAssert(eIndex > -1);
	CvAssert(eIndex < GC.getNumSpecialistInfos());

	return m_aiSpecialistGreatPersonProgressTimes100[eIndex];
}

/// How much progress does this City have towards a Great Person from eIndex?
void CvCityCitizens::ChangeSpecialistGreatPersonProgressTimes100(SpecialistTypes eIndex, int iChange)
{
	CvAssert(eIndex > -1);
	CvAssert(eIndex < GC.getNumSpecialistInfos());

	m_aiSpecialistGreatPersonProgressTimes100[eIndex] += iChange;
}

/// Reset Specialist progress
void CvCityCitizens::DoResetSpecialistGreatPersonProgressTimes100(SpecialistTypes eIndex)
{
	CvAssert(eIndex > -1);
	CvAssert(eIndex < GC.getNumSpecialistInfos());

	m_aiSpecialistGreatPersonProgressTimes100[eIndex] = 0;
}

/// How many Specialists are assigned to eBuilding?
int CvCityCitizens::GetNumSpecialistsInBuilding(BuildingTypes eBuilding) const
{
	CvAssert(eBuilding > -1);
	CvAssert(eBuilding < GC.getNumBuildingInfos());

	return m_aiNumSpecialistsInBuilding[eBuilding];
}

/// How many Forced Specialists are assigned to eBuilding?
int CvCityCitizens::GetNumForcedSpecialistsInBuilding(BuildingTypes eBuilding) const
{
	CvAssert(eBuilding > -1);
	CvAssert(eBuilding < GC.getNumBuildingInfos());

	return m_aiNumForcedSpecialistsInBuilding[eBuilding];
}

/// Remove forced status from all Specialists
void CvCityCitizens::DoClearForcedSpecialists()
{
	// Loop through all Buildings
	BuildingTypes eBuilding;
	for(int iBuildingLoop = 0; iBuildingLoop < GC.getNumBuildingInfos(); iBuildingLoop++)
	{
		eBuilding = (BuildingTypes) iBuildingLoop;

		// Have this Building in the City?
		if(GetCity()->GetCityBuildings()->GetNumBuilding(eBuilding) > 0)
		{
			m_aiNumForcedSpecialistsInBuilding[eBuilding] = 0;
		}
	}
}

/// What upgrade progress does a Specialist need to level up?
int CvCityCitizens::GetSpecialistUpgradeThreshold(UnitClassTypes eUnitClass)
{
#ifdef AMB_PARTIAL_GP_COUNTERS
	int iThreshold = /*100*/ GC.getGREAT_PERSON_THRESHOLD_BASE();
	int iNumCreated;

	if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_WRITER", true))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatWritersCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_ARTIST", true))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatArtistsCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_MUSICIAN", true))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatMusiciansCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_SCIENTIST"))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatScientistCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatMerchantCreated();
		iThreshold += (AMB_PARTIAL_GP_COUNTERS*iNumCreated);
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatEngineerCreated();
		iThreshold += (AMB_PARTIAL_GP_COUNTERS*iNumCreated);
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_ENGINEER"))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatEngineerCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatMerchantCreated();
		iThreshold += (AMB_PARTIAL_GP_COUNTERS*iNumCreated);
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatScientistCreated();
		iThreshold += (AMB_PARTIAL_GP_COUNTERS*iNumCreated);
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_MERCHANT"))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatMerchantCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatScientistCreated();
		iThreshold += (AMB_PARTIAL_GP_COUNTERS*iNumCreated);
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatEngineerCreated();
		iThreshold += (AMB_PARTIAL_GP_COUNTERS*iNumCreated);
	}
	else
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatPeopleCreated();
		iThreshold += (GC.getGREAT_PERSON_THRESHOLD_INCREASE()*iNumCreated);
	}
#else
	int iThreshold = /*100*/ GC.getGREAT_PERSON_THRESHOLD_BASE();
	int iNumCreated;

	if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_WRITER", true))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatWritersCreated();
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_ARTIST", true))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatArtistsCreated();
	}
	else if (eUnitClass == GC.getInfoTypeForString("UNITCLASS_MUSICIAN", true))
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatMusiciansCreated();
	}
		else
	{
		iNumCreated = GET_PLAYER(GetCity()->getOwner()).getGreatPeopleCreated();
	}

	// Increase threshold based on how many GP have already been spawned
	iThreshold += (/*100*/ GC.getGREAT_PERSON_THRESHOLD_INCREASE() * iNumCreated);
#endif

	// Game Speed mod
	iThreshold *= GC.getGame().getGameSpeedInfo().getGreatPeoplePercent();
	iThreshold /= 100;

	// Start era mod
	iThreshold *= GC.getGame().getStartEraInfo().getGreatPeoplePercent();
	iThreshold /= 100;

	return iThreshold;
}

/// Create a GP!
#ifdef AMB_POLICY_FREEGP_LIBERTY
void CvCityCitizens::DoSpawnGreatPerson(UnitTypes eUnit, bool bIncrementCount, bool bCountAsProphet, bool bDontCountProphet)
#else
void CvCityCitizens::DoSpawnGreatPerson(UnitTypes eUnit, bool bIncrementCount, bool bCountAsProphet)
#endif
{
	CvAssert(eUnit != NO_UNIT);

	if (eUnit == NO_UNIT)
		return;	// Better than crashing.

	// If it's the active player then show the popup
	if(GetCity()->getOwner() == GC.getGame().getActivePlayer())
	{
		// Don't show in MP
		if(!GC.getGame().isNetworkMultiPlayer())	// KWG: Candidate for !GC.getGame().IsOption(GAMEOPTION_SIMULTANEOUS_TURNS)
		{
			CvPopupInfo kPopupInfo(BUTTONPOPUP_GREAT_PERSON_REWARD, eUnit, GetCity()->GetID());
			GC.GetEngineUserInterface()->AddPopup(kPopupInfo);
		}
	}

	CvPlayer& kPlayer = GET_PLAYER(GetCity()->getOwner());
	CvUnit* newUnit = kPlayer.initUnit(eUnit, GetCity()->getX(), GetCity()->getY());

	// Bump up the count
	if(bIncrementCount && !bCountAsProphet)
	{
		if(newUnit->IsGreatGeneral())
		{
			kPlayer.incrementGreatGeneralsCreated();
		}
		else if(newUnit->IsGreatAdmiral())
		{
			kPlayer.incrementGreatAdmiralsCreated();
			CvPlot *pSpawnPlot = kPlayer.GetGreatAdmiralSpawnPlot(newUnit);
			if (newUnit->plot() != pSpawnPlot)
			{
				newUnit->setXY(pSpawnPlot->getX(), pSpawnPlot->getY());
			}
		}
		else if (newUnit->getUnitInfo().GetUnitClassType() == GC.getInfoTypeForString("UNITCLASS_WRITER"))
		{
			kPlayer.incrementGreatWritersCreated();
		}							
		else if (newUnit->getUnitInfo().GetUnitClassType() == GC.getInfoTypeForString("UNITCLASS_ARTIST"))
		{
			kPlayer.incrementGreatArtistsCreated();
		}							
		else if (newUnit->getUnitInfo().GetUnitClassType() == GC.getInfoTypeForString("UNITCLASS_MUSICIAN"))
		{
			kPlayer.incrementGreatMusiciansCreated();
		}
#ifdef AMB_PARTIAL_GP_COUNTERS
		else if (newUnit->getUnitInfo().GetUnitClassType() == GC.getInfoTypeForString("UNITCLASS_SCIENTIST"))
		{
			kPlayer.incrementGreatScientistCreated();
		}
		else if (newUnit->getUnitInfo().GetUnitClassType() == GC.getInfoTypeForString("UNITCLASS_ENGINEER"))
		{
			kPlayer.incrementGreatEngineerCreated();
		}
		else if (newUnit->getUnitInfo().GetUnitClassType() == GC.getInfoTypeForString("UNITCLASS_MERCHANT"))
		{
			kPlayer.incrementGreatMerchantCreated();
		}
#endif	
		else
		{
			kPlayer.incrementGreatPeopleCreated();
		}
	}
#ifdef AMB_POLICY_FREEGP_LIBERTY
	if(!bDontCountProphet)
	{
		if(bCountAsProphet || newUnit->getUnitInfo().IsFoundReligion())
		{
			kPlayer.GetReligions()->ChangeNumProphetsSpawned(1);
		}
	}
#else
	if(bCountAsProphet || newUnit->getUnitInfo().IsFoundReligion())
	{
		kPlayer.GetReligions()->ChangeNumProphetsSpawned(1);
	}
#endif

	// Setup prophet properly
	if(newUnit->getUnitInfo().IsFoundReligion())
	{
		ReligionTypes eReligion = kPlayer.GetReligions()->GetReligionCreatedByPlayer();
		int iReligionSpreads = newUnit->getUnitInfo().GetReligionSpreads();
		int iReligiousStrength = newUnit->getUnitInfo().GetReligiousStrength();
		if(iReligionSpreads > 0 && eReligion > RELIGION_PANTHEON)
		{
			newUnit->GetReligionData()->SetSpreadsLeft(iReligionSpreads);
			newUnit->GetReligionData()->SetReligiousStrength(iReligiousStrength);
			newUnit->GetReligionData()->SetReligion(eReligion);
		}

		//modAcken This gives a bonus to the capital city when spawning a prophet if the player has the right policies
#if defined(AMB_POLICY_PROPHETSPAWNBONUSPERFOLLOWER)
		if(eReligion > RELIGION_PANTHEON && kPlayer.GetPlayerPolicies()->GetTotalProphetSpawnProductionBonusPerFollower()>0)
		{
			//number of followers total for our religion
			int iBonus = GC.getGame().GetGameReligions()->GetNumFollowers(kPlayer.GetReligions()->GetReligionCreatedByPlayer());
			iBonus *= kPlayer.GetPlayerPolicies()->GetTotalProphetSpawnProductionBonusPerFollower();
			iBonus = min(iBonus,100);
			iBonus *= GC.getGame().getGameSpeedInfo().getConstructPercent()/100;
			//Increase city production
			if(kPlayer.getCapitalCity()->isProduction())
			{
				kPlayer.getCapitalCity()->changeProduction(iBonus);
			}
			//unless nothing is in production
			else
			{
				kPlayer.getCapitalCity()->setOverflowProduction(kPlayer.getCapitalCity()->getOverflowProduction()+iBonus);
			}
			if (kPlayer.getCapitalCity()->plot() && kPlayer.getCapitalCity()->plot()->GetActiveFogOfWarMode() == FOGOFWARMODE_OFF)
			{
				char text[256] = {0};
				sprintf_s(text, "[COLOR_YELLOW]+%d[ENDCOLOR][ICON_PRODUCTION]", iBonus);
				float fDelay = GC.getPOST_COMBAT_TEXT_DELAY() * 1.0f;
				DLLUI->AddPopupText(kPlayer.getCapitalCity()->getX(), kPlayer.getCapitalCity()->getY(), text, fDelay);
			}
		}
		if(eReligion > RELIGION_PANTHEON && kPlayer.GetPlayerPolicies()->GetTotalProphetSpawnGoldBonusPerFollower()>0)
		{
			//number of followers total for our religion
			int iBonus = GC.getGame().GetGameReligions()->GetNumFollowers(kPlayer.GetReligions()->GetReligionCreatedByPlayer());
			iBonus *= kPlayer.GetPlayerPolicies()->GetTotalProphetSpawnProductionBonusPerFollower();
			iBonus = min(iBonus,100);
			iBonus *= GC.getGame().getGameSpeedInfo().getConstructPercent()/100;
			//Increase gold 
			kPlayer.GetTreasury()->SetGold(kPlayer.GetTreasury()->GetGold()+iBonus);
			if (kPlayer.getCapitalCity()->plot() && kPlayer.getCapitalCity()->plot()->GetActiveFogOfWarMode() == FOGOFWARMODE_OFF)
			{
				char text[256] = {0};
				sprintf_s(text, "[COLOR_YELLOW]+%d[ENDCOLOR][ICON_GOLD]", iBonus);
				float fDelay = GC.getPOST_COMBAT_TEXT_DELAY() * 1.5f;
				DLLUI->AddPopupText(kPlayer.getCapitalCity()->getX(), kPlayer.getCapitalCity()->getY(), text, fDelay);
			}
		}
		if(eReligion > RELIGION_PANTHEON && kPlayer.GetPlayerPolicies()->GetTotalProphetSpawnGoldenAgeBonusPerFollower()>0)
		{
			//number of followers total for our religion
			int iBonus = GC.getGame().GetGameReligions()->GetNumFollowers(kPlayer.GetReligions()->GetReligionCreatedByPlayer());
			iBonus *= kPlayer.GetPlayerPolicies()->GetTotalProphetSpawnProductionBonusPerFollower();
			iBonus = min(iBonus,100);
			iBonus *= GC.getGame().getGameSpeedInfo().getConstructPercent()/100;
			//Increase goldenagepoints
			kPlayer.ChangeGoldenAgeProgressMeter(iBonus);
			if (kPlayer.getCapitalCity()->plot() && kPlayer.getCapitalCity()->plot()->GetActiveFogOfWarMode() == FOGOFWARMODE_OFF)
			{
				char text[256] = {0};
				sprintf_s(text, "[COLOR_WHITE]+%d[ENDCOLOR][ICON_GOLDEN_AGE]", iBonus);
				float fDelay = GC.getPOST_COMBAT_TEXT_DELAY() * 2.0f;
				DLLUI->AddPopupText(kPlayer.getCapitalCity()->getX(), kPlayer.getCapitalCity()->getY(), text, fDelay);
			}
		}
#endif
	}

	if (newUnit->getUnitInfo().GetOneShotTourism() > 0)
	{
		newUnit->SetTourismBlastStrength(kPlayer.GetCulture()->GetTourismBlastStrength(newUnit->getUnitInfo().GetOneShotTourism()));
	}

	// Notification
	if(GET_PLAYER(GetOwner()).GetNotifications())
	{
		Localization::String strText = Localization::Lookup("TXT_KEY_NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER");
		Localization::String strSummary = Localization::Lookup("TXT_KEY_NOTIFICATION_SUMMARY_GREAT_PERSON");
		GET_PLAYER(GetOwner()).GetNotifications()->Add(NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, strText.toUTF8(), strSummary.toUTF8(), GetCity()->getX(), GetCity()->getY(), eUnit);
	}
}