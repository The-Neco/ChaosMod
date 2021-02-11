Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerSwap", "Swap positions", "Swap positions with another player.", nil, function()
    local Players = GetPlayers()
    for _, PlayerID in pairs(Players) do
      local myPed = GetPlayerPed(PlayerID)
      local myVeh = GetVehiclePedIsIn(MyPed, false)
      local myCoords = GetEntityCoords(myPed)
      local playerToSwap = Players[math.random(1, #Players)]
      local otherPed = GetPlayerPed(playerToSwap)
      local otherVeh = GetVehiclePedIsIn(otherPed, false)
      local otherCoords = GetEntityCoords(otherPed)
      if MyVeh ~= 0 then
        SetEntityCoords(myVeh, otherCoords)
      else
        SetEntityCoords(myPed, otherCoords)
      end
      if otherVeh ~= 0 then
        SetEntityCoords(otherPed, myCoords)
      else
        SetEntityCoords(otherPed, myCoords)
      end
      Citizen.Wait(200)
    end
  end)
end)
