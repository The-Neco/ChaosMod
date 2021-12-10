Citizen.CreateThread(function()
  ChaosMod.Modules.new("vehicle30Max", "30MPH max speed", "Forces player vehicle to 30MPH.", function()
    local is30Limit = true
    Citizen.CreateThread(function()
      while is30Limit do
        Citizen.Wait(0)
        local MyPed = PlayerPedId()
        local MyVeh = GetVehiclePedIsIn(MyPed, false)
        SetVehicleMaxSpeed(MyVeh, 13.41)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-200)
    is30Limit = false
    Citizen.Wait(200)
    SetVehicleMaxSpeed(MyVeh, GetVehicleModelMaxSpeed(GetEntityModel(MyVeh)))
  end, nil)
end)
