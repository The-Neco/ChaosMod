Citizen.CreateThread(function()
  ChaosMod.Modules.new("teleportLSIA", "TP LSIA", "Teleports the player to LSIA.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, -1388.6, -3111.61, 13.94)
      else
        SetEntityCoords(MyPed, -1388.6, -3111.61, 13.94)
      end
      Citizen.Wait(200)
    end
  end)

  ChaosMod.Modules.new("teleportMaze", "TP Maze Tower", "Teleports the player to Maze Tower.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, -75.7, -818.62, 326.16)
      else
        SetEntityCoords(MyPed, -75.7, -818.62, 326.16)
      end
      Citizen.Wait(200)
    end
  end)

  ChaosMod.Modules.new("teleportFort", "TP Fort Zancudo", "Teleports the player to Fort Zancudo.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, -2360.3, 3244.83, 92.9)
      else
        SetEntityCoords(MyPed, -2360.3, 3244.83, 92.9)
      end
      Citizen.Wait(200)
    end
  end)

  ChaosMod.Modules.new("teleportChilliad", "TP Mount Chilliad", "Teleports the player to Mount Chilliad.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, 501.77, 5604.85, 797.91)
      else
        SetEntityCoords(MyPed, 501.77, 5604.85, 797.91)
      end
      Citizen.Wait(200)
    end
  end)

  ChaosMod.Modules.new("teleportSky", "TP Heaven", "Teleports the player to Heaven.", nil, function()
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, 935.0, 3800.0, 2300.0)
      else
        SetEntityCoords(MyPed, 935.0, 3800.0, 2300.0)
      end
      Citizen.Wait(200)
    end
  end)

  local tpLocations = {
    vec3(-1388.6, -3111.61, 13.94), -- LSIA
    vec3(-75.7, -818.62, 326.16),-- Maze Tower
    vec3(-2267.89, 3121.04, 32.5),-- Fort Zancudo
    vec3(503.33, 5531.91, 777.45),-- Mount Chilliad
    vec3(935.0, 3800.0, 2300.0),-- Heaven
  }

  ChaosMod.Modules.new("teleportFake", "Fake TP", "Teleports the player to a random spot and back.", nil, function()
    local OldCoords = {}
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      OldCoords[PlayerID] = GetEntityCoords(MyPed)
      math.randomseed(os.clock())
      local randomLocation = math.random(1, #tpLocations)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, tpLocations[randomLocation])
      else
        SetEntityCoords(MyPed, tpLocations[randomLocation])
      end
      Citizen.Wait(200)
    end
    Citizen.Wait(math.random(3500, 6000))
    for PlayerID, OldCoords in pairs(OldCoords) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyVeh = GetVehiclePedIsIn(MyPed, false)
      if MyVeh ~= 0 then
        SetEntityCoords(MyVeh, OldCoords)
      else
        SetEntityCoords(MyPed, OldCoords)
      end
      Citizen.Wait(200)
    end
  end)

end)
