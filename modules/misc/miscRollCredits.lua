Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscRollCredits", "Roll Credits", "100% baby.", function()
    RequestAdditionalText("CREDIT", 0)
    while not HasAdditionalTextLoaded(0) do
      Citizen.Wait(0)
    end
    PlayEndCreditsMusic(true)
    SetCreditsActive(true)
    SetMobilePhoneRadioState(true)
    SetRadioToStationName("RADIO_16_SILVERLAKE")
    local song = math.random(1,2)
    if song == 1 then
      SetCustomRadioTrackList("RADIO_16_SILVERLAKE", "END_CREDITS_SAVE_MICHAEL_TREVOR", 1)
    elseif song == 2 then
      SetCustomRadioTrackList("RADIO_16_SILVERLAKE", "END_CREDITS_KILL_MICHAEL", 1)
    end
    local rollCredits = true
    local m_alpha = 0
    Citizen.CreateThread(function()
      while rollCredits do
        Citizen.Wait(0)
        SetEntityInvincible(PlayerPedId(), true)
        DisableAllControlActions(0)
        SetRadioToStationName("RADIO_16_SILVERLAKE")
        DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, m_alpha, false)
        if m_alpha < 255 then
          m_alpha = m_alpha + 1
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-500)
    rollCredits = false
    Citizen.Wait(500)
    SetEntityInvincible(PlayerPedId(), false)
    SetCreditsActive(false)
    PlayEndCreditsMusic(false)
    SetMobilePhoneRadioState(false)
  end, nil)
end)
