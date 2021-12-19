Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscGetTowed", "Get Towed", "Need a ride?", function()
        local tonyaHash = `ig_tonya`
        local towTruckHash = `towtruck`
        local _, relationshipGroup = AddRelationshipGroup("_TOW_TRUCK_TONYA")
        SetRelationshipBetweenGroups(0, relationshipGroup, `PLAYER`)
        RequestModel(tonyaHash)
        RequestModel(towTruckHash)
        while not HasModelLoaded(tonyaHash) and not HasModelLoaded(towTruckHash) do
            Citizen.Wait(0)
        end

        local rearBottomLeft, frontTopRight = GetModelDimensions(towTruckHash)

        local towLength = frontTopRight.y - rearBottomLeft.y
    
        local player = PlayerPedId()
        local playerVeh = nil
        local spawnOffset = towLength / 2
        if IsPedInAnyVehicle(player, false) then
            playerVeh = GetVehiclePedIsIn(player, false)
            local vehMod = GetEntityModel(playerVeh)
            rearBottomLeft, frontTopRight = GetModelDimensions(vehMod)
            local playerVehLength = frontTopRight.y - rearBottomLeft.y;
            spawnOffset = (towLength / 2) + (playerVehLength / 2) + 1
        end

        local spawnPoint = GetOffsetFromEntityInWorldCoords(player, 0, spawnOffset, 0)
        local towTruck = CreateVehicle(towTruckHash, spawnPoint, GetEntityHeading(player))
        SetVehicleEngineOn(towTruck)
        SetVehicleForwardSpeed(towTruck, GetEntitySpeed(player))
        SetVehicleOnGroundProperly(towTruck)

        local tries = 0
        while not DoesEntityExist(towTruck) do
            Citizen.Wait(100)
            if tries >= 10 then return end
        end

        local tonyaPed = CreatePed(0, tonyaHash, spawnPoint, GetEntityHeading(player), true, true)
        SetPedIntoVehicle(tonyaPed, towTruck, -1)
        SetPedRelationshipGroupHash(tonyaPed, relationshipGroup)

        if playerVeh then
            AttachVehicleToTowTruck(towTruck, playerVeh, true, 0, 0, 0)
            SetVehicleTowTruckArmPosition(towTruck, 1.0)
        else
            SetPedIntoVehicle(player, towTruck, 0)
        end
        TaskVehicleDriveToCoordLongrange(tonyaPed, towTruck, 404.0, -1530.0, 29.0, 9999.0, 899, 0.0)
    end, nil)
  end)
  