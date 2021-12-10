Citizen.CreateThread(function()
  ChaosMod.Modules.new("popVehicleTyres", "Pop current vehicle tyres", "Pops the tyres of your current vehicle.", function()
    local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    for TyreIndex = 0, 7 do
      SetVehicleTyreBurst(Vehicle, TyreIndex, true)
    end
  end, nil)
end)
