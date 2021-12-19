Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscTotalChaos", "Total Chaos", "What the actual f**k?", function()
        setWeather("THUNDER")
        local totalChaos = true
        local lastTick = GetGameTimer()
        local timeUntilSteer = GetGameTimer()
        local enableDrunkSteering = false
        local steering = 0
        Citizen.CreateThread(function()
            while totalChaos do
                Citizen.Wait(0)
                local myPed = PlayerPedId()
                local myVeh = GetVehiclePedIsIn(myPed)

                for vehicle in EnumerateVehicles() do
                    if DoesEntityExist(vehicle) and vehicle ~= myVeh then
                        ApplyForceToEntity(vehicle, 3, 10.9, 0.1, 0.1, 0, 0, 0, 0, true, true, true, false, true)
                    end
                end

                local currentTick = GetGameTimer()
                if lastTick < currentTick - 100 then
                    lastTick = currentTick
                    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1)
                end 

                if myVeh and myVeh ~= 0 then
                    if GetPedInVehicleSeat(myVeh, -1) == myPed then
                        if enableDrunkSteering then
                            SetVehicleSteerBias(myVeh, steering)
                        end

                        if timeUntilSteer < currentTick then
                            timeUntilSteer = currentTick
                            if enableDrunkSteering then
                                timeUntilSteer = timeUntilSteer + math.random(50, 250)
                            else
                                steering = GetRandomFloatInRange(-0.7, 0.7)
                                timeUntilSteer = timeUntilSteer + math.random(50, 300)
                            end
                            enableDrunkSteering = not enableDrunkSteering
                        end
                    end
                end
            end
        end)
        Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
        totalChaos = false
    end, nil)
  end)
  