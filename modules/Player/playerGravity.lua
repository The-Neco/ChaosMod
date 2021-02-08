Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerGravity", "Player no gravity", "Disables gravity for the player.", function()
    local gravity = true
    Citizen.CreateThread(function()
      while gravity do
        Citizen.Wait(0)
        SetGravityLevel(1)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000) - 500)
    gravity = false
    Citizen.Wait(500)
    SetGravityLevel(0)
  end, nil)
end)
