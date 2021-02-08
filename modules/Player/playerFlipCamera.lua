Citizen.CreateThread(function()
  ChaosMod.Modules.new("flipCamera", "Turtle mode", "Flips the player camera.", function()
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    RenderScriptCams(true, true, 700, 1, 1, 1)
    local renderCam = true
    Citizen.CreateThread(function()
      while renderCam do
        Citizen.Wait(0)
        SetCamActive(cam, true)
        local coords = GetGameplayCamCoord()
        local rot = GetGameplayCamRot(2)
        local fov = GetGameplayCamFov()
        SetCamParams(cam, coords, rot.x, 180.0, rot.z, fov, 0, 1, 1, 2)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    renderCam = false
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 700, 1, 1, 1)
    DestroyCam(cam, true)
  end, nil)
end)
