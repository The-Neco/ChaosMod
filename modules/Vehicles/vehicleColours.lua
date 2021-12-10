Citizen.CreateThread(function()
  ChaosMod.Modules.new("goldenTraffic", "Golden Traffic", "Makes all traffic golden.", nil, function()
    local vehColours = true
    Citizen.CreateThread(function()
      while vehColours do
        Citizen.Wait(1000)
        for _, VehicleHandle in pairs(GetAllVehicles()) do
          SetVehicleColours(VehicleHandle, 99, 99)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    vehColours = false
  end)

  ChaosMod.Modules.new("greenTraffic", "Green Traffic", "Makes all traffic green.", nil, function()
    local vehColours = true
    Citizen.CreateThread(function()
      while vehColours do
        Citizen.Wait(1000)
        for _, VehicleHandle in pairs(GetAllVehicles()) do
          SetVehicleColours(VehicleHandle, 50, 50)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    vehColours = false
  end)

  ChaosMod.Modules.new("orangeTraffic", "Orange Traffic", "Makes all traffic orange.", nil, function()
    local vehColours = true
    Citizen.CreateThread(function()
      while vehColours do
        Citizen.Wait(1000)
        for _, VehicleHandle in pairs(GetAllVehicles()) do
          SetVehicleColours(VehicleHandle, 41, 41)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    vehColours = false
  end)

  ChaosMod.Modules.new("chromeTraffic", "Chrome Traffic", "Makes all traffic chrome.", nil, function()
    local vehColours = true
    Citizen.CreateThread(function()
      while vehColours do
        Citizen.Wait(1000)
        for _, VehicleHandle in pairs(GetAllVehicles()) do
          SetVehicleColours(VehicleHandle, 120, 120)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    vehColours = false
  end)

  ChaosMod.Modules.new("redTraffic", "Red Traffic", "Makes all traffic red.", nil, function()
    local vehColours = true
    Citizen.CreateThread(function()
      while vehColours do
        Citizen.Wait(1000)
        for _, VehicleHandle in pairs(GetAllVehicles()) do
          SetVehicleColours(VehicleHandle, 27, 27)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    vehColours = false
  end)
end)
