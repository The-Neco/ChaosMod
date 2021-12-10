Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscWhaleRain", "Whale Rain", "It's raining whales!.", function()
    local whaleRain = true
    local maxWhales = 20
    local whaleModel = `a_c_humpback`
    local whales = {}
    RequestModel(whaleModel)
    while not HasModelLoaded(whaleModel) do
      Citizen.Wait(0)
    end
    Citizen.CreateThread(function()
      while whaleRain do
        Citizen.Wait(math.random(1000,2000))
        if #whales < maxWhales then
          local myPed = PlayerPedId()
          local myCoords = GetEntityCoords(myPed)
          local spawnPos = vec3(myCoords.x + math.random(-100, 100), myCoords.y + math.random(-100, 100), myCoords.z + math.random(25, 50))
          local whale = CreatePed(28, whaleModel, spawnPos, math.random(0,360), true, false)
          SetEntityHealth(whale, 0)
          ApplyForceToEntityCenterOfMass(whale, 0, 0.0, 0.0, -10000, false, true, true, false)
          whales[#whales+1] = whale
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    SetModelAsNoLongerNeeded(whaleModel)
    whaleRain = false
    for _, whale in pairs(whales) do
      DeleteEntity(whale)
    end
  end, nil)
end)
