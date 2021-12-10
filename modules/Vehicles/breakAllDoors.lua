Citizen.CreateThread(function()
  ChaosMod.Modules.new("vehicleBreakDoors", "Break doors", "Breaks all doors of current vehicle.", function()
    local MyPed = PlayerPedId()
    local MyVeh = GetVehiclePedIsIn(MyPed, false)
    if GetPedInVehicleSeat(MyVeh, -1) ~= MyPed then return end
    for i = 0, 6 do
      SetVehicleDoorBroken(MyVeh, i, false)
    end
  end, nil)
end)
