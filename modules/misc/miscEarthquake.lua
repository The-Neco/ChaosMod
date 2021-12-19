Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscEarthquake", "Earthquake", "Shaky Shaky", function()
    local earthquake = true
    local myPed = PlayerPedId()
    Citizen.CreateThread(function()
      while earthquake do
        Citizen.Wait(500)
        local shook = GetRandomFloatInRange(-9.0, 7.0)
        ShakeGameplayCam("LARGE_EXPLOSION_SHAKE", 0.05)
        for vehicle in EnumerateVehicles() do
          if DoesEntityExist(vehicle) then
            ApplyForceToEntity(vehicle, 1, 0, 0, shook, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
          end
        end

        for ped in EnumeratePeds() do
          if DoesEntityExist(ped) and ped ~= myPed then
            SetPedToRagdoll(ped, 10000, 10000, 0, true, true, false)
            SetEntityVelocity(ped, 0.0, 0.0, 1.0)
          end
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    earthquake = false
  end, nil)
end)
