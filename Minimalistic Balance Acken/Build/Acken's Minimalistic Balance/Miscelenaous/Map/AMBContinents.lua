------------------------------------------------------------------------------
--	FILE:	 Continents.lua
--	AUTHOR:  Bob Thomas
--	PURPOSE: Global map script - Produces widely varied continents.
--           This is one of Civ5's featured map scripts.
------------------------------------------------------------------------------
--	Copyright (c) 2010 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------

include("MapGenerator");
include("FractalWorld");
include("FeatureGenerator");
include("TerrainGenerator");

------------------------------------------------------------------------------
-- This script has seen a major renovation since Civ4.
------------------------------------------------------------------------------
function GetMapScriptInfo()
	local world_age, temperature, rainfall, sea_level, resources = GetCoreMapOptions()
	return {
		Name = "AMBalance Continents v1",
		Description = "Balance mod Continents map built upon NQContinents",
		IsAdvancedMap = 0,
		IconIndex = 1,
		SortIndex = 1,
	CustomOptions = {
			{
				Name = "TXT_KEY_MAP_OPTION_WORLD_AGE", -- 1
				Values = {
					"TXT_KEY_MAP_OPTION_THREE_BILLION_YEARS",
					"TXT_KEY_MAP_OPTION_FOUR_BILLION_YEARS",
					"TXT_KEY_MAP_OPTION_FIVE_BILLION_YEARS",
					"TXT_KEY_MAP_OPTION_RANDOM",
				},
				DefaultValue = 2,
				SortPriority = -99,
			},
		{
				Name = "TXT_KEY_MAP_OPTION_TEMPERATURE",	-- 2 add temperature defaults to random
				Values = {
					"TXT_KEY_MAP_OPTION_COOL",
					"TXT_KEY_MAP_OPTION_TEMPERATE",
					"TXT_KEY_MAP_OPTION_HOT",
					"TXT_KEY_MAP_OPTION_RANDOM",
				},
				DefaultValue = 2,
				SortPriority = -98,
			},
		{
				Name = "TXT_KEY_MAP_OPTION_RAINFALL",	-- 3 add rainfall defaults to random
				Values = {
					"TXT_KEY_MAP_OPTION_ARID",
					"TXT_KEY_MAP_OPTION_NORMAL",
					"TXT_KEY_MAP_OPTION_WET",
					"TXT_KEY_MAP_OPTION_RANDOM",
				},
				DefaultValue = 2,
				SortPriority = -97,
			},
		{
				Name = "TXT_KEY_MAP_OPTION_SEA_LEVEL",	-- 4 add sea level defaults to random.
				Values = {
					"TXT_KEY_MAP_OPTION_LOW",
					"TXT_KEY_MAP_OPTION_MEDIUM",
					"TXT_KEY_MAP_OPTION_HIGH",
					"TXT_KEY_MAP_OPTION_RANDOM",
				},
				DefaultValue = 2,
				SortPriority = -96,
			},
		{
				Name = "TXT_KEY_MAP_OPTION_RESOURCES",	-- 5 add resources defaults to random
				Values = {
					"TXT_KEY_MAP_OPTION_SPARSE",
					"TXT_KEY_MAP_OPTION_STANDARD",
					"TXT_KEY_MAP_OPTION_ABUNDANT",
					"Legendary Start - Strat Balance",
					"TXT_KEY_MAP_OPTION_STRATEGIC_BALANCE",
					"TXT_KEY_MAP_OPTION_RANDOM",
				},
				DefaultValue = 5,
				SortPriority = -95,
			},

		{
				Name = "Smoothness",
				Values = {
					"High",
					"Low",
				},
				DefaultValue = 1,
				SortPriority = -94,
			},
		{
				Name = "Islands",
				Values = {
					"Many",
					"Standard",
					"Few",
				},
				DefaultValue = 2,
				SortPriority = -93,
			},
		{
				Name = "Islands size",
				Values = {
					"Big",
					"Standard",
					"Small",
				},
				DefaultValue = 2,
				SortPriority = -93,
			},
		},
	};
end
------------------------------------------------------------------------------

------------------------------------------------------------------------------
------------------------------------------------------------------------------
ContinentsFractalWorld = {};
------------------------------------------------------------------------------
function ContinentsFractalWorld.Create(fracXExp, fracYExp)
	local gridWidth, gridHeight = Map.GetGridSize();
	
	local data = {
		InitFractal = FractalWorld.InitFractal,
		ShiftPlotTypes = FractalWorld.ShiftPlotTypes,
		ShiftPlotTypesBy = FractalWorld.ShiftPlotTypesBy,
		DetermineXShift = FractalWorld.DetermineXShift,
		DetermineYShift = FractalWorld.DetermineYShift,
		GenerateCenterRift = FractalWorld.GenerateCenterRift,
		GeneratePlotTypes = ContinentsFractalWorld.GeneratePlotTypes,	-- Custom method
		
		iFlags = Map.GetFractalFlags(),
		
		fracXExp = fracXExp,
		fracYExp = fracYExp,
		
		iNumPlotsX = gridWidth,
		iNumPlotsY = gridHeight,
		plotTypes = table.fill(PlotTypes.PLOT_OCEAN, gridWidth * gridHeight)
	};
		
	return data;
end	
------------------------------------------------------------------------------
function ContinentsFractalWorld:GeneratePlotTypes(args)
	if(args == nil) then args = {}; end
	
	local sea_level_low = 62;
	local sea_level_normal = 66;
	local sea_level_high = 72;
	local world_age_old = 2;
	local world_age_normal = 4;
	local world_age_new = 9;
	local smoothness_grain = 1;
	--
	local extra_mountains = 20;
	local grain_amount = 0;
	local adjust_plates = 1.3;
	local shift_plot_types = true;
	local tectonic_islands = false;
	local hills_ridge_flags = self.iFlags;
	local peaks_ridge_flags = self.iFlags;
	local adjadj = 1.4;
	local xshift = 0;
	local yshift = 0;
	local yshiftamt = 0;
	local xshiftamt = 0;
	local xstart, xend = 0,0;
	local ystart, yend = 0,0;
	local has_center_rift = true;
	
	local sea_level = Map.GetCustomOption(4)
	if sea_level == 4 then
		sea_level = 1 + Map.Rand(3, "Random Sea Level - Lua");
	end
	local world_age = Map.GetCustomOption(1)
	if world_age == 4 then
		world_age = 1 + Map.Rand(3, "Random World Age - Lua");
	end

	-- Set Sea Level according to user selection.
	local water_percent = sea_level_normal;
	if sea_level == 1 then -- Low Sea Level
		water_percent = sea_level_low
	elseif sea_level == 3 then -- High Sea Level
		water_percent = sea_level_high
	else -- Normal Sea Level
	end

	local smoothness = Map.GetCustomOption(6)
	if smoothness == 2 then
		smoothness_grain = 3;
	end
	local island_option = Map.GetCustomOption(7);
	local island_number = 12;
	if island_option == 1 then
		island_number = 18;
	elseif island_option == 3 then
		island_number = 6;
	end
	local island_option2 = Map.GetCustomOption(8);
	local island_size = 20;
	if island_option2 == 1 then
		island_size = 40;
	elseif island_option2 == 3 then
		island_size = 10;
	end
	-- Set values for hills and mountains according to World Age chosen by user.
	local adjustment = world_age_normal;
	if world_age == 3 then -- 5 Billion Years
		adjustment = world_age_old;
		adjust_plates = adjust_plates * 0.5;
	elseif world_age == 1 then -- 3 Billion Years
		adjustment = world_age_new;
		adjust_plates = adjust_plates * 1;
	else -- 4 Billion Years
	end
	-- Apply adjustment to hills and peaks settings.
	local hillsBottom1 = 28 - (adjustment * adjadj);
	local hillsTop1 = 28 + (adjustment * adjadj);
	local hillsBottom2 = 72 - (adjustment * adjadj);
	local hillsTop2 = 72 + (adjustment * adjadj);
	local hillsClumps = 1 + (adjustment * adjadj);
	local hillsNearMountains = 120 - (adjustment * 2) - extra_mountains;
	local mountains = 100 - adjustment - extra_mountains;

	-- Hills and Mountains handled differently according to map size
	local WorldSizeTypes = {};
	for row in GameInfo.Worlds() do
		WorldSizeTypes[row.Type] = row.ID;
	end
	local sizekey = Map.GetWorldSize();
	-- Fractal Grains
	local sizevalues = {
		[WorldSizeTypes.WORLDSIZE_DUEL]     = 3,
		[WorldSizeTypes.WORLDSIZE_TINY]     = 3,
		[WorldSizeTypes.WORLDSIZE_SMALL]    = 3,
		[WorldSizeTypes.WORLDSIZE_STANDARD] = 3,
		[WorldSizeTypes.WORLDSIZE_LARGE]    = 4,
		[WorldSizeTypes.WORLDSIZE_HUGE]		= 4
	};
	local grain = sizevalues[sizekey] or 3;
	-- Tectonics Plate Counts
	local platevalues = {
		[WorldSizeTypes.WORLDSIZE_DUEL]		= 100,
		[WorldSizeTypes.WORLDSIZE_TINY]     = 100,
		[WorldSizeTypes.WORLDSIZE_SMALL]    = 100,
		[WorldSizeTypes.WORLDSIZE_STANDARD] = 100,
		[WorldSizeTypes.WORLDSIZE_LARGE]    = 100,
		[WorldSizeTypes.WORLDSIZE_HUGE]     = 100
	};
	local numPlates = platevalues[sizekey] or 5;
	-- Add in any plate count modifications passed in from the map script.
	numPlates = numPlates * adjust_plates;

	-- Generate continental fractal layer and examine the largest landmass. Reject
	-- the result until the largest landmass occupies 58% or less of the total land.
	local done = false;
	local iAttempts = 0;
	local iWaterThreshold, biggest_area, iNumTotalLandTiles, iNumBiggestAreaTiles, iBiggestID;
	while done == false do
		local grain_dice = Map.Rand(7, "Continental Grain roll - LUA Continents");
		if grain_dice < 4 then
			grain_dice = 2;
		else
			grain_dice = 1;
		end
		local rift_dice = Map.Rand(3, "Rift Grain roll - LUA Continents");
		if rift_dice < 1 then
			rift_dice = -1;
		end

		rift_dice = -1;
		grain_dice = smoothness_grain;
		
		self.continentsFrac = nil;
		self:InitFractal{continent_grain = grain_dice, rift_grain = rift_dice};
		iWaterThreshold = self.continentsFrac:GetHeight(water_percent);
		
		iNumTotalLandTiles = 0;
		for x = 0, self.iNumPlotsX - 1 do
			for y = 0, self.iNumPlotsY - 1 do
				local i = y * self.iNumPlotsX + x;
				local val = self.continentsFrac:GetHeight(x, y);
				if(val <= iWaterThreshold) then
					self.plotTypes[i] = PlotTypes.PLOT_OCEAN;
				else
					self.plotTypes[i] = PlotTypes.PLOT_LAND;
					iNumTotalLandTiles = iNumTotalLandTiles + 1;
				end
			end
		end

		self:ShiftPlotTypes();
		self:GenerateCenterRift()

		SetPlotTypes(self.plotTypes);
		Map.RecalculateAreas();
		
		biggest_area = Map.FindBiggestArea(false);
		iNumBiggestAreaTiles = biggest_area:GetNumTiles();
		-- Now test the biggest landmass to see if it is large enough.
		if iNumBiggestAreaTiles <= iNumTotalLandTiles * 0.58 then
			done = true;
			iBiggestID = biggest_area:GetID();
		end
		iAttempts = iAttempts + 1;
		
		--[[ Printout for debug use only
		print("-"); print("--- Continents landmass generation, Attempt#", iAttempts, "---");
		print("- This attempt successful: ", done);
		print("- Total Land Plots in world:", iNumTotalLandTiles);
		print("- Land Plots belonging to biggest landmass:", iNumBiggestAreaTiles);
		print("- Percentage of land belonging to biggest: ", 100 * iNumBiggestAreaTiles / iNumTotalLandTiles);
		print("- Continent Grain for this attempt: ", grain_dice);
		print("- Rift Grain for this attempt: ", rift_dice);
		print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
		print(".");
		]]--
	end
	
	-- Generate fractals to govern hills and mountains
	self.hillsFrac = Fractal.Create(self.iNumPlotsX, self.iNumPlotsY, grain, self.iFlags, self.fracXExp, self.fracYExp);
	self.mountainsFrac = Fractal.Create(self.iNumPlotsX, self.iNumPlotsY, grain, self.iFlags, self.fracXExp, self.fracYExp);
	self.hillsFrac:BuildRidges(numPlates, hills_ridge_flags, 2, 1);
	self.mountainsFrac:BuildRidges((numPlates * 2) / 3, peaks_ridge_flags, 4, 1);
	-- Get height values
	local iHillsBottom1 = self.hillsFrac:GetHeight(hillsBottom1);
	local iHillsTop1 = self.hillsFrac:GetHeight(hillsTop1);
	local iHillsBottom2 = self.hillsFrac:GetHeight(hillsBottom2);
	local iHillsTop2 = self.hillsFrac:GetHeight(hillsTop2);
	local iHillsClumps = self.mountainsFrac:GetHeight(hillsClumps);
	local iHillsNearMountains = self.mountainsFrac:GetHeight(hillsNearMountains);
	local iMountainThreshold = self.mountainsFrac:GetHeight(mountains);
	local iPassThreshold = self.hillsFrac:GetHeight(hillsNearMountains);
	
	-- Create islands. Try to make more useful islands than the default code.
	-- pick a random tile and check if it is ocean, if it is check tiles around it
	-- to see how big an island we can make, then make an island from size 1 up to the biggest we can make

	-- Hex Adjustment tables. These tables direct plot by plot scans in a radius 
	-- around a center hex, starting to Northeast, moving clockwise.
	local firstRingYIsEven = {{0, 1}, {1, 0}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}};

	local secondRingYIsEven = {
	{1, 2}, {1, 1}, {2, 0}, {1, -1}, {1, -2}, {0, -2},
	{-1, -2}, {-2, -1}, {-2, 0}, {-2, 1}, {-1, 2}, {0, 2}
	};

	local thirdRingYIsEven = {
	{1, 3}, {2, 2}, {2, 1}, {3, 0}, {2, -1}, {2, -2},
	{1, -3}, {0, -3}, {-1, -3}, {-2, -3}, {-2, -2}, {-3, -1},
	{-3, 0}, {-3, 1}, {-2, 2}, {-2, 3}, {-1, 3}, {0, 3}
	};

	local firstRingYIsOdd = {{1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, 0}, {0, 1}};

	local secondRingYIsOdd = {		
	{1, 2}, {2, 1}, {2, 0}, {2, -1}, {1, -2}, {0, -2},
	{-1, -2}, {-1, -1}, {-2, 0}, {-1, 1}, {-1, 2}, {0, 2}
	};

	local thirdRingYIsOdd = {		
	{2, 3}, {2, 2}, {3, 1}, {3, 0}, {3, -1}, {2, -2},
	{2, -3}, {1, -3}, {0, -3}, {-1, -3}, {-2, -2}, {-2, -1},
	{-3, 0}, {-2, 1}, {-2, 2}, {-1, 3}, {0, 3}, {1, 3}
	};

	-- Direction types table, another method of handling hex adjustments, in combination with Map.PlotDirection()
	local direction_types = {
		DirectionTypes.DIRECTION_NORTHEAST,
		DirectionTypes.DIRECTION_EAST,
		DirectionTypes.DIRECTION_SOUTHEAST,
		DirectionTypes.DIRECTION_SOUTHWEST,
		DirectionTypes.DIRECTION_WEST,
		DirectionTypes.DIRECTION_NORTHWEST
		};

	local iW, iH = Map.GetGridSize();
	local islMax = island_number;
	local iLandSize = 2.0;
	local mapSize = iW * iH;
	local islCount = 0;
	local islLandInRing = 0;
	local goodX = 0;
	local goodY = 0;

	local wrapX = Map:IsWrapX();
	local wrapY = Map:IsWrapY();
	local nextX, nextY, plot_adjustments;
	local odd = firstRingYIsOdd;
	local even = firstRingYIsEven;
	print("######### Creating Islands #########");

	islCount = islMax;
		
	local attempt = 0;
	while islCount > 0 do
		local islLandInRing = 0;
		--pick random location
		local x = Map.Rand(iW, "");
		local y = 6 + Map.Rand((iH-12), "");	
		local plotIndex = y * iW + x;
		local radius = 2 + math.floor(Map.Rand((islCount/iLandSize), ""));
		--print("Count: ", islCount);
		--print ("Radius: ", radius);
		--print("X=", x);
		--print("Y=", y);		
		
		--print("--------");
		--print("Random Plot Is: ", plotIndex);

		--check if random location is ocean
		if self.plotTypes[plotIndex] == PlotTypes.PLOT_OCEAN then
		
			print("Location is Ocean");

			for ripple_radius = 1, radius do
				local ripple_value = radius - ripple_radius + 1;
				local currentX = x - ripple_radius;
				local currentY = y;
				for direction_index = 1, 6 do
					for plot_to_handle = 1, ripple_radius do
				 		if currentY / 2 > math.floor(currentY / 2) then
							plot_adjustments = odd[direction_index];
						else
							plot_adjustments = even[direction_index];
						end
						nextX = currentX + plot_adjustments[1];
						nextY = currentY + plot_adjustments[2];
						if wrapX == false and (nextX < 0 or nextX >= iW) then
							-- X is out of bounds.
						elseif wrapY == false and (nextY < 0 or nextY >= iH) then
							-- Y is out of bounds.
						else
							local realX = nextX;
							local realY = nextY;
							if wrapX then
								realX = realX % iW;
							end
							if wrapY then
								realY = realY % iH;
							end
							-- We've arrived at the correct x and y for the current plot.
							local plot = Map.GetPlot(realX, realY);
							local plotIndex = realY * iW + realX + 1;
	
							--print("--------");
							--print("Plot Is: ", plotIndex);
	
							-- Check this plot for land.

							if self.plotTypes[plotIndex] == PlotTypes.PLOT_LAND then
								islLandInRing = ripple_radius;
								break;
							end

							currentX, currentY = nextX, nextY;
						end
					end

					if islLandInRing ~= 0 then
						break;
					end
				end
	
				if islLandInRing ~= 0 then
					break;
				end

			end

			if islLandInRing == 0 then
			
				local actradius = radius - 1;
				local thisislandvar = Map.Rand(40, "") + island_size;

				plotIndex = y * iW + x+1;
				print("---------PlotIndex: ", plotIndex);
				print("---------");
				print("Island Location Found At X=", x, ", Y=",y);
				print("Island Size: ", actradius);
				
					self.plotTypes[plotIndex] = PlotTypes.PLOT_LAND;

					for ripple_radius = 1, actradius do
						local ripple_value = actradius - ripple_radius + 1;
						local currentX = x - ripple_radius;
						local currentY = y;
						for direction_index = 1, 6 do
							for plot_to_handle = 1, ripple_radius do
					 			if currentY / 2 > math.floor(currentY / 2) then
									plot_adjustments = odd[direction_index];
								else
									plot_adjustments = even[direction_index];
								end
								nextX = currentX + plot_adjustments[1];
								nextY = currentY + plot_adjustments[2];
								if wrapX == false and (nextX < 0 or nextX >= iW) then
									-- X is out of bounds.
								elseif wrapY == false and (nextY < 0 or nextY >= iH) then
									-- Y is out of bounds.
								else
									local realX = nextX;
									local realY = nextY;
									if wrapX then
										realX = realX % iW;
									end
									if wrapY then
										realY = realY % iH;
									end
									-- We've arrived at the correct x and y for the current plot.
									local plot = Map.GetPlot(realX, realY);
									local plotIndex = realY * iW + realX + 1;
		
									--print("--------");
									--print("Plot Is: ", plotIndex);
		
									-- closer we get to outer edge increase chance of ocean.
									if ripple_radius == 1  then --100%
										islThresh = Map.Rand(27, "") + thisislandvar;
									elseif ripple_radius == 2 then -- 57% to 74%
										islThresh = Map.Rand(32, "") + (thisislandvar / 1.25);
									elseif ripple_radius == 3 then --40% to 57%
										islThresh = Map.Rand(25, "") + (thisislandvar / 1.5);
									else --30% to 50%
										islThresh = Map.Rand(20, "") + (thisislandvar / 2);
									end

									local islRand = Map.Rand(100, "");
									local islHill = Map.Rand(100, "");

									--print("Rand: ", islRand, "Thresh: ", islThresh);

									if islRand > islThresh then
										self.plotTypes[plotIndex] = PlotTypes.PLOT_OCEAN
									else
										if islHill <= 30 then
											self.plotTypes[plotIndex] = PlotTypes.PLOT_LAND
										else
											self.plotTypes[plotIndex] = PlotTypes.PLOT_HILLS
										end
									end

									currentX, currentY = nextX, nextY;
								end
							end
						end
	
					end
			
				islCount = islCount - 1;
				attempt = 0;
			else
				
				--print("---------");
				print("Land In Ring: ", islLandInRing);
				attempt = attempt + 1;
				if attempt > 50 then
					attempt = 0;
					print("Skip too much attempts");
					islCount = islCount - 1;
				end
			end
		end
	end

	SetPlotTypes(self.plotTypes);

	print("######### Finished Islands #########");

	-- Set Hills and Mountains
	for x = 0, self.iNumPlotsX - 1 do
		for y = 0, self.iNumPlotsY - 1 do
			local plot = Map.GetPlot(x, y);
			local mountainVal = self.mountainsFrac:GetHeight(x, y);
			local hillVal = self.hillsFrac:GetHeight(x, y);
	
			if plot:GetPlotType() ~= PlotTypes.PLOT_OCEAN then
				if (mountainVal >= iMountainThreshold) then
					if (hillVal >= iPassThreshold) then -- Mountain Pass though the ridgeline
						plot:SetPlotType(PlotTypes.PLOT_HILLS, false, false);
					else -- Mountain
						-- set some randomness to moutains next to each other
						local iIsMount = Map.Rand(100, "Mountain Spwan Chance");
						--print("-"); print("Mountain Spawn Chance: ", iIsMount);
						local iIsMountAdj = 86 - adjustment;
						if iIsMount >= iIsMountAdj then
							plot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false);
						else
							-- set some randomness to hills or flat land next to the mountain
							local iIsHill = Map.Rand(100, "Hill Spwan Chance");
							--print("-"); print("Mountain Spawn Chance: ", iIsMount);
							local iIsHillAdj = 53 - adjustment;
							if iIsHillAdj >= iIsHill then
								plot:SetPlotType(PlotTypes.PLOT_HILLS, false, false);
							else
								plot:SetPlotType(PlotTypes.PLOT_LAND, false, false);
							end
						end
					end
				elseif (mountainVal >= iHillsNearMountains) then
					plot:SetPlotType(PlotTypes.PLOT_HILLS, false, false);
				else
					if ((hillVal >= iHillsBottom1 and hillVal <= iHillsTop1) or (hillVal >= iHillsBottom2 and hillVal <= iHillsTop2)) then
						plot:SetPlotType(PlotTypes.PLOT_HILLS, false, false);
					else
						plot:SetPlotType(PlotTypes.PLOT_LAND, false, false);
					end
				end
			end
		end
	end

end
------------------------------------------------------------------------------

------------------------------------------------------------------------------
function GeneratePlotTypes()
	-- Customized plot generation to ensure avoiding "near Pangaea" conditions.
	print("Generating Plot Types (Lua Continents) ...");
	
	local fractal_world = ContinentsFractalWorld.Create();
	fractal_world:GeneratePlotTypes();
	
	GenerateCoasts();
end
------------------------------------------------------------------------------
function GenerateTerrain()
	print("Generating Terrain (Lua Continents) ...");
	
	-- Get Temperature setting input by user.
	local temp = Map.GetCustomOption(2)
	if temp == 4 then
		temp = 1 + Map.Rand(3, "Random Temperature - Lua");
	end

	local args = {temperature = temp};
	local terraingen = TerrainGenerator.Create(args);

	terrainTypes = terraingen:GenerateTerrain();
	
	SetTerrainTypes(terrainTypes);
end
------------------------------------------------------------------------------
function AddFeatures()
	print("Adding Features (Lua Continents) ...");

	-- Get Rainfall setting input by user.
	local rain = Map.GetCustomOption(3)
	if rain == 4 then
		rain = 1 + Map.Rand(3, "Random Rainfall - Lua");
	end
	
	local args = {rainfall = rain}
	local featuregen = FeatureGenerator.Create(args);

	featuregen:AddFeatures();
end
------------------------------------------------------------------------------

------------------------------------------------------------------------------
function StartPlotSystem()
	-- Get Resources setting input by user.
	local res = Map.GetCustomOption(5)
	if res == 6 then
		res = 1 + Map.Rand(3, "Random Resources Option - Lua");
	end

	print("Creating start plot database.");
	local start_plot_database = AssignStartingPlots.Create()
	
	print("Dividing the map in to Regions.");
	-- Regional Division Method 2: Continental
	local args = {
		method = 2,
		resources = res,
		};
	start_plot_database:GenerateRegions(args)

	print("Choosing start locations for civilizations.");
	start_plot_database:ChooseLocations()
	
	print("Normalizing start locations and assigning them to Players.");
	start_plot_database:BalanceAndAssign()

	print("Placing Natural Wonders.");
	start_plot_database:PlaceNaturalWonders()

	print("Placing Resources and City States.");
	start_plot_database:PlaceResourcesAndCityStates()
end
------------------------------------------------------------------------------
