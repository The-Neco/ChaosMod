Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscMidasTouch", "Midas Touch", "Turns everything to gold.", function()
    local midasTouch = true
    local model = `prop_money_bag_01`
    RequestModel(model)
    Citizen.CreateThread(function()
      while midasTouch do
        Citizen.Wait(0)
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local myVeh = GetVehiclePedIsIn(myPed, false)
        if myVeh ~= 0 then
          SetVehicleColours(myVeh, 158, 158)
        end
        for vehicle in EnumerateVehicles() do
          if IsEntityTouchingEntity(myPed, vehicle) then
            SetVehicleColours(vehicle, 158, 158)
          end
        end
        if IsPedArmed(myPed, 7) then
          local currentWeapon = GetCurrentPedWeapon(myPed, false)
          SetPedWeaponTintIndex(myPed, currentWeapon, 2)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    midasTouch = false
    SetModelAsNoLongerNeeded(model)
  end, nil)
end)
