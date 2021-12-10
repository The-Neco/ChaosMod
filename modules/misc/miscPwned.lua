Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscPwned", "PWNED", "PWN the player.", function()
    local sf = RequestScaleformMovie("HACKING_MESSAGE")
    --while not HasScaleformMovieLoaded("HACKING_MESSAGE") do
    --  Citizen.Wait(0)
    --end
    BeginScaleformMovieMethod(sf, "SET_DISPLAY")
    ScaleformMovieMethodAddParamInt(5)
    ScaleformMovieMethodAddParamPlayerNameString("C H A O S   M O D")
    ScaleformMovieMethodAddParamPlayerNameString("")
    ScaleformMovieMethodAddParamInt(45)
    ScaleformMovieMethodAddParamInt(203)
    ScaleformMovieMethodAddParamInt(134)
    ScaleformMovieMethodAddParamBool(false)
    EndScaleformMovieMethod()
    local pwned = true
    Citizen.CreateThread(function()
      while pwned do
        Citizen.Wait(0)
        HideHudAndRadarThisFrame()
        DrawScaleformMovieFullscreen(sf, 100, 100, 100, 255, 0)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    pwned = false
  end, nil)
end)
