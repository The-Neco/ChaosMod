Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerKeepWalking", "Stuck W Key", "Makes the players W key stuck.", function()
    local stuckKey = true
    Citizen.CreateThread(function()
      while stuckKey do
        Citizen.Wait(0)

        SimulatePlayerInputGait(PlayerId(), 5.0, 100, 1.0, true, false)
        SetControlNormal(0, 32, 1)
        SetControlNormal(0, 71, 1)
        SetControlNormal(0, 77, 1)
        SetControlNormal(0, 87, 1)
        SetControlNormal(0, 129, 1)
        SetControlNormal(0, 136, 1)
        SetControlNormal(0, 150, 1)
        SetControlNormal(0, 232, 1)
        SetControlNormal(0, 280, 1)

        DisableControlAction(0, 72, true)
      	DisableControlAction(0, 76, true)
      	DisableControlAction(0, 88, true)
      	DisableControlAction(0, 138, true)
      	DisableControlAction(0, 139, true)
      	DisableControlAction(0, 152, true)
      	DisableControlAction(0, 153, true)
        DisableControlAction(0, 25, true)
      	DisableControlAction(0, 44, true)
      	DisableControlAction(0, 50, true)
      	DisableControlAction(0, 68, true)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    stuckKey = false
  end, nil)
end)
