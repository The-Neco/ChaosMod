Citizen.CreateThread(function()

  local propNames = { `prop_asteroid_01`, `prop_test_boulder_01`, `prop_test_boulder_02`, `prop_test_boulder_03`, `prop_test_boulder_04` }
  local maxMeteors = 20
  local meteors = {}
  ChaosMod.Modules.new("miscMeteorRain", "Meteor Rain", "Starts a meteor shower.", function()
    local meteorShower = true
    Citizen.CreateThread(function()
      while meteorShower do
        Citizen.Wait(math.random(1000,2000))
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local objectHash = propNames[math.random(1, #propNames)]
        local coords = vec3(myCoords.x + math.random(-100, 100), myCoords.y + math.random(-100, 100), myCoords.z + math.random(25, 50))
        if #meteors < maxMeteors then
          local meteor = CreateObject(objectHash, coords, true, false, false)
          SetObjectPhysicsParams(meteor, 100000.0, 1.0, 1.0, 0.0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0)
          ApplyForceToEntityCenterOfMass(meteor, 0, 50.0, 0, -10000.0, true, false, true, true)
          SetObjectAsNoLongerNeeded(meteor)
          meteors[#meteors + 1] = meteor
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    meteorShower = false
    for _, meteor in pairs(meteors) do
      if DoesEntityExist(meteor) then
        DeleteEntity(meteor)
      end
    end
  end, nil)
end)
