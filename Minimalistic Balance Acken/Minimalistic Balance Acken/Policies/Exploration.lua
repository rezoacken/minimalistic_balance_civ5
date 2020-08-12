-- Lua Script1
-- Author: Necka
-- DateCreated: 5/15/2016 4:32:18 PM
--------------------------------------------------------------
-- Add Governor's Mansion to newly founded cities
-- This code was made by Fruitstrike for the NQMOD
function Exploration_Colonies_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if (player:HasPolicy(GameInfo.Policies["POLICY_NAVIGATION_SCHOOL"].ID)) then
		for loopCity in player:Cities() do
			if (loopCity:GetX() == iCityX) then
				if (loopCity:GetY() == iCityY) then
					loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_GOVERNORS_MANSION"], 1)
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Exploration_Colonies_OnFoundCity)

function addTreasureFleetsBuilding(player, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	local cCity = plot:GetPlotCity();
	cCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TREASURE_FLEETS"], 1)
end

function Exploration_TreasureFleets_OnCityCaptureComplete(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if (player:IsEverAlive()) then
		if (player:HasPolicy(GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID)) then
			addTreasureFleetsBuilding(player, iX, iY)
		end
	end
end
GameEvents.CityCaptureComplete.Add(Exploration_TreasureFleets_OnCityCaptureComplete)

function Exploration_TreasureFleets_OnFoundCity(iPlayer, iX, iY)
	local player = Players[iPlayer]
	if (player:IsEverAlive()) then
		if (player:HasPolicy(GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID)) then
			addTreasureFleetsBuilding(player, iX, iY)
		end
	end
end
GameEvents.PlayerCityFounded.Add(Exploration_TreasureFleets_OnFoundCity)

function Exploration_OnPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	if (policyID == GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID) then
		for loopCity in player:Cities() do
			loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TREASURE_FLEETS"], 1)
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(Exploration_OnPolicyAdopted)