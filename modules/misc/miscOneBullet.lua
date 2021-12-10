Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscOneBullet", "One Shot", "You've only got one shot.", function()
    local oneShot = true
    Citizen.CreateThread(function()
      while oneShot do
        Citizen.Wait(0)
        local myPed = PlayerPedId()
        if IsPedArmed(myPed, 7) then
          local currentWeapon = GetCurrentPedWeapon(myPed, 1)
          local ammo = GetAmmoInClip(myPed, currentWeapon)
          if ammo > 1 then
            local diff = ammo - 1
            AddAmmoToPed(myPed, currentWeapon, diff)
            SetAmmoInClip(myPed, currentWeapon, 1)
          end
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    oneShot = false
  end, nil)
end)
