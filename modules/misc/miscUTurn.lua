Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscUTurn", "U-Turn", "Wrong way dumbass.", function()

        for vehicle in EnumerateVehicles() do
            if DoesEntityExist(vehicle) then
                local rot = GetEntityRotation(vehicle, 2)
                local vel = GetEntityVelocity(vehicle)

                SetEntityRotation(vehicle, -rot.x, -rot.y, rot.z + 180.0, 2, true)
                SetEntityVelocity(vehicle, -vel.x, -vel.y, -vel.z)
            end
        end

        for ped in EnumeratePeds() do
            if DoesEntityExist(ped) then
                local rot = GetEntityRotation(ped, 2)
                local vel = GetEntityVelocity(ped)

                SetEntityRotation(ped, -rot.x, -rot.y, rot.z + 180.0, 2, true)
                SetEntityVelocity(ped, -vel.x, -vel.y, -vel.z)
            end
        end

    end, nil)
  end)
  