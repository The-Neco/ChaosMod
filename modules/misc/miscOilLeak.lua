Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscOilLeak", "Oil Leak", "Causes the players vehicle to leak oil.", function()
    local oilLeak = true
    Citizen.CreateThread(function()
      while oilLeak do
        Citizen.Wait(1000)
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local myVeh = GetVehiclePedIsIn(myPed, false)
        if myVeh ~= 0 then
          if GetPedInVehicleSeat(myVeh, -1) == myPed then
            local found, groundZ = GetGroundZFor_3dCoord(myCoords.x, myCoords.y, myCoords.z, false)
            if found then
              AddPetrolDecal(myCoords.x, myCoords.y, groundZ, 2, 2, 1)
            end
          end
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    oilLeak = false
  end, nil)
end)
