Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerIgnite", "Ignite Player", "Sets the player on fire.", function()
    local MyPed = PlayerPedId()
    local MyVeh = GetVehiclePedIsIn(MyPed, false)
    if MyVeh ~= 0 then
      SetVehicleEngineHealth(MyVeh, -1.0)
      SetVehiclePetrolTankHealth(MyVeh, -1.0)
      SetVehicleBodyHealth(MyVeh, -1.0)
    else
      StartEntityFire(MyPed)
    end
  end, nil)
end)
