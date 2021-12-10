Citizen.CreateThread(function()
  local effects = {"scr_firework_indep_ring_burst_rwb", "scr_firework_indep_spiral_burst_rwb"}
  ChaosMod.Modules.new("miscFireworks", "Fireworks", "Launches fireworks around player.", function()
    local fireworks = true
    RequestNamedPtfxAsset("proj_indep_firework_v2")
    while not HasNamedPtfxAssetLoaded("proj_indep_firework_v2") do
      Citizen.Wait(0)
    end
    UseParticleFxAsset("proj_indep_firework_v2")
    Citizen.CreateThread(function()
      while fireworks do
        Citizen.Wait(1000)
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local x, y, z = myCoords.x + math.random(-220, 220), myCoords.y + math.random(-220, 220), myCoords.z + math.random(50, 150)
        StartParticleFxNonLoopedAtCoord(effects[math.random(1, #effects)], x, y, z, 0.0, 0.0, 0.0, 2.0, true, true, true)
        AddExplosion(x, y, z, 38, 1.0, true, false, 1.0)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    fireworks = false
  end, nil)
end)
