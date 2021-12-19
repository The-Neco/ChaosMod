Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscXMarksTheSpot", "X Marks The Spot", "Back so soon?", function()
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        local oldHeading = GetEntityHeading(myPed)
        local _, groundZ = GetGroundZFor_3dCoord(oldCoords.x, oldCoords.y, oldCoords.z, false)
        local xMark = true
        Citizen.CreateThread(function()
            while xMark do
                Citizen.Wait(0)
                DrawMarker(27, oldCoords.xy, groundZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 255, false, false, false)
            end
            if IsPedInAnyVehicle(myPed) then
                local myVeh = GetVehiclePedIsIn(myPed)
                SetEntityCoords(myVeh, oldCoords)
                SetEntityHeading(myVeh, oldHeading)
            else
                SetEntityCoords(myPed, oldCoords)
                SetEntityHeading(myPed, oldHeading)
            end
        end)
        Citizen.Wait(10000)
        xMark = false
    end, nil)
  end)
  