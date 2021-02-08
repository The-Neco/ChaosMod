Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerDrunk", "Drunk", "Makes your player drunk.", function()
    local isDrunk = true
    Citizen.CreateThread(function()
      while isDrunk do
        Citizen.Wait(0)
        local MyPed = PlayerPedId()
        local MyVeh = GetVehiclePedIsIn(MyPed, false)
        if not IsGameplayCamShaking() then
          ShakeGameplayCam("DRUNK_SHAKE", 2.0)
        end

        SetPedIsDrunk(MyPed, true)

        RequestClipSet("MOVE_M@DRUNK@VERYDRUNK")
        SetPedMovementClipset(MyPed, "MOVE_M@DRUNK@VERYDRUNK", 1.0)

        SetAudioSpecialEffectMode(2)

      	-- No idea what these do, but game scripts also call these so just blindly follow
        Citizen.InvokeNative(0x487A82C650EB7799, 1.0)
        Citizen.InvokeNative(0x0225778816FDC28C, 1.0)

        if MyVeh ~= 0 then
          if GetPedInVehicleSeat(MyVeh, -1) == MyPed then
            local timeUntilSteer = GetGameTimer()
            local enableDrunkSteering = false
            local steering = 0.0

            if enableDrunkSteering then
              SetVehicleSteerBias(MyVeh, steering)
            end
            local curTick = GetGameTimer()
            if timeUntilSteer < curTick then
              timeUntilSteer = GetGameTimer()

              if enableDrunkSteering then
                timeUntilSteer = timeUntilSteer + math.random(100,500)
              else
                steering = GetRandomFloatInRange(-0.5, 0.5)
                timeUntilSteer = timeUntilSteer + math.random(50, 300)
              end

              enableDrunkSteering = not enableDrunkSteering
            end
          end
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-1000)
    isDrunk = false
    Citizen.Wait(1000)
    local MyPed = PlayerPedId()
    local MyVeh = GetVehiclePedIsIn(MyPed, false)
    SetPedIsDrunk(MyPed, false)
    ResetPedMovementClipset(MyPed, 0.0)
    RemoveClipSet("MOVE_M@DRUNK@VERYDRUNK")
    StopGameplayCamShaking(true)
    Citizen.InvokeNative(0x487A82C650EB7799, 0.0)
    Citizen.InvokeNative(0x0225778816FDC28C, 0.0)
  end, nil)

end)
