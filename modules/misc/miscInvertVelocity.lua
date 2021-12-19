Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscInvertVelocity", "Invert Velocity", "Every reaction has an equal and opposite reaction.", function()
      for vehicle in EnumerateVehicles() do
        if DoesEntityExist(vehicle) then
          local vel = GetEntityVelocity(vehicle)
          SetEntityVelocity(vehicle, -vel.x, -vel.y, -vel.z)
        end
      end

      for ped in EnumeratePeds() do
        if DoesEntityExist(ped) then
          local vel = GetEntityVelocity(ped)
          SetEntityVelocity(ped, -vel.x, -vel.y, -vel.z)
        end
      end
    end, nil)
  end)
  