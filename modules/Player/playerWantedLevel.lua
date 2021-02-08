Citizen.CreateThread(function()
  ChaosMod.Modules.new("fiveStars", "5 Stars", "Sets player to 5 star wanted level.", function()
    local MyID = PlayerId()
    SetPlayerWantedLevel(MyID, 5, false)
    SetPlayerWantedLevelNow(MyID, false)
  end, nil)

  ChaosMod.Modules.new("addTwoStars", "+2 Stars", "Adds 2 stars to the current wanted level.", function()
    local MyID = PlayerId()
    SetPlayerWantedLevel(MyID, GetPlayerWantedLevel(MyID) + 2, false)
    SetPlayerWantedLevelNow(MyID, false)
  end, nil)

  ChaosMod.Modules.new("neverWanted", "Never Wanted", "Makes player never wanted.", function()
    local neverWanted = true
    Citizen.CreateThread(function()
      while neverWanted do
        Citizen.Wait(0)
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), true)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    neverWanted = false
  end, nil)

end)
