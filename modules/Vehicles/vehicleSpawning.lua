local CreateAutomobile = GetHashKey("CREATE_AUTOMOBILE")

function trySetPedIntoVehicle(ped, veh)
  Citizen.CreateThread(function()
    local tries = 0
    while tries < 10 and GetVehiclePedIsIn(ped) ~= veh do
      Citizen.Wait(100)
      tries = tries + 1
      SetPedIntoVehicle(ped, veh, -1)
    end
  end)
end

Citizen.CreateThread(function()
  ChaosMod.Modules.new("spawnAdder", "Spawn Adder", "Spawns an adder at your current location.", nil, function()
    local model = `adder`
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyCoords = GetEntityCoords(MyPed)
      local veh = Citizen.InvokeNative(CreateAutomobile, model, MyCoords)
      Citizen.Wait(10)
      trySetPedIntoVehicle(MyPed, veh)
    end
  end)

  ChaosMod.Modules.new("spawnBus", "Spawn Bus", "Spawns an bus at your current location.", nil, function()
    local model = `bus`
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyCoords = GetEntityCoords(MyPed)
      local veh = Citizen.InvokeNative(CreateAutomobile, model, MyCoords)
      Citizen.Wait(10)
      trySetPedIntoVehicle(MyPed, veh)
    end
  end)

  ChaosMod.Modules.new("spawnTug", "Spawn Tug", "Spawns an tug at your current location.", nil, function()
    local model = `tug`
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyCoords = GetEntityCoords(MyPed)
      local veh = Citizen.InvokeNative(CreateAutomobile, model, MyCoords)
      Citizen.Wait(10)
      trySetPedIntoVehicle(MyPed, veh)
    end
  end)

  ChaosMod.Modules.new("spawnLuxor", "Spawn Luxor", "Spawns an luxor at your current location.", nil, function()
    local model = `luxor`
    for _, PlayerID in pairs(GetPlayers()) do
      local MyPed = GetPlayerPed(PlayerID)
      local MyCoords = GetEntityCoords(MyPed)
      local veh = Citizen.InvokeNative(CreateAutomobile, model, MyCoords)
      Citizen.Wait(10)
      trySetPedIntoVehicle(MyPed, veh)
    end
  end)
end)
