--[[Citizen.CreateThread(function()
  ChaosMod.Modules.new("teleportLSIA", "TP LSIA", "Teleports the player to LSIA.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      for _, VehicleHandle in pairs(GetAllVehicles()) do
        local CurrentDriver = GetPedInVehicleSeat(VehicleHandle, -1)
        if not IsPedAPlayer(CurrentDriver) then
          ClearPedTasksImmediately(CurrentDriver)
          if math.random(0, 10) >= 5 then
            SetPedIntoVehicle(MyPed, VehicleHandle, -1)
          end
        end
      end
    end
  end)
end)
]]
